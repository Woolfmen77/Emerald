package com.rusanov.emerald.service;

import com.rusanov.emerald.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

public interface UserService {

    List<User> getUsers();

    Optional<User> findByUsername(String username);

    User findByEmail(String email);

    User getUserByToken(String token);

    void saveUser(User user, String email, HttpServletRequest request);

    void delete(Long theId);

    void confirmRegistration(String token);

    User update(Long theId);

    void edit(User user, HttpServletRequest request);

    void adminEdit(User user);

    List<User> getUserFilter(String filter);

    List<User> getUserEnabled(Boolean enabled);
}
