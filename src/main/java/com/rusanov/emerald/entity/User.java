package com.rusanov.emerald.entity;

import com.rusanov.emerald.entity.enums.RoleEnum;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.*;

@Entity
@Table(name = "user")
public class User extends Model {

//    @Column(unique=true)
//    @Email(message="errors.invalid_email")
    @Column
    @Email
    private String email;

    @Column
    private String password;

    @Column(unique=true)
    private String username;

    @Column
    private Long phone;

    @Column
    private Boolean enabled;

    @Column
    private Date created;

    @Column
    private String token;

    @Column
    private Date expiryDate;

    @Column
    @Transient
    private String confirmPassword;

    @Column
    @Enumerated(EnumType.STRING)
    private RoleEnum role;

    @OneToMany(mappedBy = "user")
    private Set<Property> property;

    public User() {
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public RoleEnum getRole() {
        return role;
    }

    public void setRole(RoleEnum role) {
        this.role = role;
    }

    public Set<Property> getProperty() {
        return property;
    }

    public void setProperty(Set<Property> property) {
        this.property = property;
    }

    @Override
    public String toString() {
        return "?token=" + token;
    }

}
