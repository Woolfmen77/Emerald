package com.rusanov.emerald.entity;

import com.rusanov.emerald.entity.enums.RoleEnum;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "user")
public class User extends Model {

    @Column
    private String email;

    @Column
    private String password;

    @Column(name = "login")
    private String username;

    @Column
    private String name;

    @Column
    private Long phone;

    @Column
    private Boolean enabled;

    @Column
    private Date created;

    @Column
    private String token;

    @Column(name = "expiry_date")
    private Date expiryDate;

    @Column
    @Transient
    private String confirmPassword;

    @Column
    @Enumerated(EnumType.STRING)
    private RoleEnum role;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
    private List<Property> property = new ArrayList<>();

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public List<Property> getProperty() {
        return property;
    }

    public void setProperty(List<Property> property) {
        this.property = property;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(email, user.email) && Objects.equals(password, user.password) && Objects.equals(username, user.username) && Objects.equals(phone, user.phone) && Objects.equals(enabled, user.enabled) && Objects.equals(created, user.created) && Objects.equals(token, user.token) && Objects.equals(expiryDate, user.expiryDate) && Objects.equals(confirmPassword, user.confirmPassword) && role == user.role && Objects.equals(property, user.property);
    }

    @Override
    public int hashCode() {
        return Objects.hash(email, password, username, phone, enabled, created, token, expiryDate, confirmPassword, role, property);
    }

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                ", phone=" + phone +
                ", enabled=" + enabled +
                ", created=" + created +
                ", token='" + token + '\'' +
                ", expiryDate=" + expiryDate +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", role=" + role +
                ", property=" + property +
                '}';
    }
}