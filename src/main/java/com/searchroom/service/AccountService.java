package com.searchroom.service;

import org.springframework.validation.Errors;

public interface AccountService {

    void validate(Object target, Errors errors);
    String md5Hash(String input);

}
