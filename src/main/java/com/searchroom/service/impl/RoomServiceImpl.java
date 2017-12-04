package com.searchroom.service.impl;

import com.searchroom.model.entities.*;
import com.searchroom.model.join.NewPost;
import com.searchroom.repository.*;
import com.searchroom.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.Iterator;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private ResourceRepository resourceRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private RoomInfoRepository roomInfoRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private RoomPostRepository roomPostRepository;

    private static final String USER_IMAGES = "images";
    private static final String TOMCAT_HOME_PROPERTY = "catalina.home";
    private static final String TOMCAT_HOME_PATH = System.getProperty(TOMCAT_HOME_PROPERTY);
    private static final String USER_IMAGES_PATH = TOMCAT_HOME_PATH + File.separator + USER_IMAGES;

    private static final File USER_IMAGES_DIR = new File(USER_IMAGES_PATH);
    private static final String USER_IMAGES_DIR_ABSOLUTE_PATH = USER_IMAGES_DIR.getAbsolutePath() + File.separator;

    public void uploadFile(HttpServletRequest request, int roomInfoId) throws SQLException {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        CommonsMultipartFile multipartFile;

        Iterator<String> iterator = multipartRequest.getFileNames();
        while (iterator.hasNext()) {
            String key = iterator.next();
            multipartFile = (CommonsMultipartFile) multipartRequest.getFile(key);
            String fileName = multipartFile.getOriginalFilename();

            Resource resource = new Resource(fileName, roomInfoId);
            resourceRepository.addResource(resource);

            createUserImagesDirIfNeeded();
            createImage(fileName, multipartFile);
        }
    }

    private void createUserImagesDirIfNeeded() {
        if (!USER_IMAGES_DIR.exists()) {
            USER_IMAGES_DIR.mkdirs();
        }
    }

    private void createImage(String name, MultipartFile file) {
        try {
            File image = new File(USER_IMAGES_DIR_ABSOLUTE_PATH + name);
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(image));
            stream.write(file.getBytes());
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public byte[] getImage(String imageName) throws IOException {
        createUserImagesDirIfNeeded();
        File serverFile = new File(USER_IMAGES_DIR_ABSOLUTE_PATH + imageName);
        return Files.readAllBytes(serverFile.toPath());
    }

    @Override
    public void addRoom(NewPost newPost, HttpServletRequest request, Address address) throws SQLException {
        int addressId = addressRepository.addAddress(address);

        RoomInfo roomInfo = new RoomInfo(newPost.getTitle(), newPost.getArea(), newPost.getPrice(),
                newPost.getDescription(), addressId, newPost.getTypeId());
        int roomInfoId = roomInfoRepository.addRoomInfo(roomInfo);

        Account loggedInUser = (Account) request.getSession().getAttribute("LOGGED_IN_USER");
        Customer customer = customerRepository.getCustomerByUsername(loggedInUser.getUsername());
        RoomPost roomPost = new RoomPost(customer.getId(), roomInfoId);
        roomPostRepository.addRoomPost(roomPost);

        this.uploadFile(request, roomInfoId);
    }

    @Override
    public void updateRoom(NewPost newPost, Address address) {
        int roomInfoId = roomPostRepository.getInfoId(newPost.getPostId());
        RoomInfo info = new RoomInfo(roomInfoId, newPost.getTitle(), newPost.getArea(), newPost.getPrice(),
                newPost.getDescription(), newPost.getTypeId());
        roomInfoRepository.updateRoomInfo(info);

        address.setId(roomInfoRepository.getAddressId(roomInfoId));
        addressRepository.updateAddress(address);
    }

    @Override
    public void deleteRoomPost(int postId) throws Exception {
        int infoId = roomPostRepository.getInfoId(postId);
        int resourceId = resourceRepository.getId(infoId);
        int addressId = roomInfoRepository.getAddressId(infoId);

        resourceRepository.deleteResource(resourceId);
        roomPostRepository.deleteRoomPost(postId);
        roomInfoRepository.deleteRoomInfo(infoId);
        addressRepository.deleteAddress(addressId);
    }

}
