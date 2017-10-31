package com.searchroom.service.impl;

import com.searchroom.model.entities.Account;
import com.searchroom.repository.AccountRepository;
import com.searchroom.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public void validate(Object target, Errors errors) {
        Account account = (Account) target;

        if ("".equals(account.getConfirmPassword()) || account.getConfirmPassword() == null) {
            errors.rejectValue("confirmPassword",
                    "emptyConfirm.account.password",
                    "This field is required");
        }

        if (!(account.getPassword()).equals(account.getConfirmPassword())) {
            errors.rejectValue("confirmPassword",
                    "matchingPassword.account.password",
                    "Confirm password not match");
        }
    }

    public String md5Hash(String input) {
        String result = "";
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("MD5");
            digest.update(input.getBytes());
            BigInteger bigInteger = new BigInteger(1, digest.digest());
            result = bigInteger.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }

}
