package com.searchroom.service;

public interface PaginationService {

    int calculatePageAmount(int roomPerPage);
    int calculatePageCustomerPost(int customerId, int roomPerPage);

}
