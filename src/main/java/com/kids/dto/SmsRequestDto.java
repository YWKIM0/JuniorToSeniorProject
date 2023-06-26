package com.kids.dto;

import java.io.Serializable;

public class SmsRequestDto implements Serializable {
    private String phoneNumber;

    public SmsRequestDto() {
    }

    public SmsRequestDto(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
