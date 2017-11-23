package com.searchroom.service.impl;

import com.searchroom.repository.RoomPostRepository;
import com.searchroom.service.PaginationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaginationServiceImpl implements PaginationService {

    @Autowired
    private RoomPostRepository roomPostRepository;

    @Override
    public double calculatePageAmount(int roomPerPage) {
        return Math.ceil(roomPostRepository.getPostAmount() * 1.0 / roomPerPage);
    }

    @Override
    public double calculatePageCustomerPost(int customerId, int roomPerPage) {
        return Math.ceil(roomPostRepository.getPostAmountByCustomer(customerId) * 1.0 / roomPerPage);
    }

}
