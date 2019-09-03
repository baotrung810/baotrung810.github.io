/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.model;

import com.mycompany.project_final.enums.Gender;
import java.util.Date;

/**
 *
 * @author OS
 */
public class UserInput {
    private String fullName;
    private String email;
    private String password;
//    private String reapeatPassword;
//    private Date birthDate;
    private String phoneNumber;
    private Gender gender;
    private int role;

    public UserInput() {
    }
    
    
    
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

//    public String getReapeatPassword() {
//        return reapeatPassword;
//    }
//
//    public void setReapeatPassword(String reapeatPassword) {
//        this.reapeatPassword = reapeatPassword;
//    }
//
//    public Date getBirthDate() {
//        return birthDate;
//    }
//
//    public void setBirthDate(Date birthDate) {
//        this.birthDate = birthDate;
//    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

   
}
