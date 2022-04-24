package com.rusanov.emerald.service;

import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;


@Service
public class MyDateService {

    private static final int EXPIRATION = 60 * 24;

    public Date calculateExpiryDate(){

        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(new Date().getTime());
        cal.add(Calendar.MINUTE, MyDateService.EXPIRATION);

        return new Date(cal.getTime().getTime());
    }
}
