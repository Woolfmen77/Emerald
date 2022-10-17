package com.rusanov.emerald.service.serviceimpl;

import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.repository.UserRepository;
import com.rusanov.emerald.service.MyDateService;
import com.rusanov.emerald.service.SendEmailService;
import com.rusanov.emerald.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    RestTemplate restTemplate;

    @Autowired
    SendEmailService sendEmail;

    @Autowired
    @Qualifier("PasswordEncoder")
    private PasswordEncoder passwordEncoder;

    @Qualifier("userRepository")
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Override
    public void confirmRegistration(String token) {
        User user = userRepository.getUserByToken(token);
        user.setEnabled(true);
        userRepository.save(user);
    }

    @Override
    public User update(Long theId) {
        return userRepository.getById(theId);
    }

    @Override
    public void edit(User user, HttpServletRequest request) {
        User user1 = userRepository.getById(user.getId());
        if (!user1.getEmail().equals(user.getEmail())) {
            user1.setEmail(user.getEmail());
            user1.setEnabled(false);
            String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/regConfirm?token=" + user1.getToken();
            sendEmail.sendMail(appUrl, user.getEmail());
        }
        user1.setUsername(user.getUsername());
        user1.setName(user.getName());
        user1.setPhone(user.getPhone());
        userRepository.save(user1);
    }

    @Override
    public void adminEdit(User user) {
        User newUser = userRepository.getById(user.getId());
        newUser.setEnabled(user.getEnabled());
        newUser.setRole(user.getRole());
        userRepository.save(newUser);
    }

    @Override
    public List<User> getUserFilter(String filter) {
        return userRepository.getUserFilter(filter);
    }

    @Override
    public List<User> getUserEnabled(Boolean enabled) {
        return userRepository.getByEnabled(enabled);
    }

    @Override
    public Optional<User> findByUsername(String username) {
        return userRepository.findOneByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user, String email, HttpServletRequest request) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(user.getRole());
        user.setCreated(new Date());
        user.setExpiryDate(new MyDateService().calculateExpiryDate());
        user.setEnabled(false);
        String token = UUID.randomUUID().toString();
        user.setToken(token);
        userRepository.save(user);
        String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/regConfirm?token=" + user.getToken();
        sendEmail.sendMail(appUrl, email);
    }

    @Override
    public void delete(Long theId) {
        userRepository.deleteById(theId);
    }

    @Override
    public User getUserByToken(String token) {
        return userRepository.getUserByToken(token);
    }
}