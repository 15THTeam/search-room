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

    private String uploadFile(HttpServletRequest request) throws SQLException {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        CommonsMultipartFile multipartFile;

        Iterator<String> iterator = multipartRequest.getFileNames();
        String fileName = "";
        while (iterator.hasNext()) {
            String key = iterator.next();
            multipartFile = (CommonsMultipartFile) multipartRequest.getFile(key);
            fileName = multipartFile.getOriginalFilename();

            createUserImagesDirIfNeeded();
            createImage(fileName, multipartFile);
        }
        return fileName;
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

    private void deleteImage(String name) {
        try {
            File image = new File(USER_IMAGES_DIR_ABSOLUTE_PATH + name);
            if (image.delete()) {
                System.out.println(image.getName() + " is deleted!");
            } else {
                System.out.println("Delete operator is failed");
            }
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

        String fileName = this.uploadFile(request);
        Resource resource = new Resource(fileName, roomInfoId);
        resourceRepository.addResource(resource);
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

        this.deleteImage(resourceRepository.getImageNameById(resourceId));

        resourceRepository.deleteResource(resourceId);
        roomPostRepository.deleteRoomPost(postId);
        roomInfoRepository.deleteRoomInfo(infoId);
        addressRepository.deleteAddress(addressId);
    }

}
