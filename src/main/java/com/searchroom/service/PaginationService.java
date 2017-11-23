package com.searchroom.service;

public interface PaginationService {

    double calculatePageAmount(int roomPerPage);
    double calculatePageCustomerPost(int customerId, int roomPerPage);

}
