package com.rusanov.emerald.service;

import com.rusanov.emerald.entity.User;
import org.springframework.validation.BindingResult;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserService {

    public List<User> getUsers();

    public User findByUsername (String username);

    public User findByEmail(String email);

    public void saveUser(User user, HttpServletRequest request);

    public  void  delete(Long theId);

    public User getUserByToken(String token);

    public void confirmRegistration(String token);

    public String loginUser(String name, String response);

    public User update(Long theId);

    public void edit(User user);
}
