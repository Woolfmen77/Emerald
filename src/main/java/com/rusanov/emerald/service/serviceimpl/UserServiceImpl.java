package com.rusanov.emerald.service.serviceimpl;

import com.rusanov.emerald.entity.ReCaptchaResponse;
import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.entity.enums.RoleEnum;
import com.rusanov.emerald.repository.UserRepository;

import com.rusanov.emerald.service.MyDateService;
import com.rusanov.emerald.service.SendEmailService;
import com.rusanov.emerald.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static org.springframework.http.HttpMethod.POST;

@Service
@Transactional
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
    @Transactional
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Override
    @Transactional
    public void confirmRegistration(String token){
        User user = userRepository.getUserByToken(token);
        user.setEnabled(true);
        userRepository.save(user);
    }

    @Override
    @Transactional
    public String loginUser(String name, String response) {
        List<User> userList = userRepository.findAll();

        for (User user : userList){
            if (user.getUsername().equals(name)){
                String url = "https://www.google.com/recaptcha/api/siteverify?secret=6LcQYIgfAAAAAFJIRNoL9TuHz9I0uvbL3ETw5-Qg&response=" + response;

                ReCaptchaResponse reCaptchaResponse = restTemplate.exchange(url, POST, null, ReCaptchaResponse.class).getBody();

                assert reCaptchaResponse != null;
                if (reCaptchaResponse.isSuccess()) {
                    return "owner";
                } else {
                    return "login";
                }
            }
        }
        return "errorUser";
    }

    @Override
    @Transactional
    public User update(Long theId) {
      return userRepository.getById(theId);
    }

    @Override
    @Transactional
    public void edit(User user){
        User user1 = userRepository.getById(user.getId());
        user1.setEmail(user.getEmail());
        user1.setUsername(user.getUsername());
        user1.setPhone(user.getPhone());

        userRepository.save(user1);
    }




    @Override
    @Transactional
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    @Transactional
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    @Transactional
    public void saveUser(User user,  HttpServletRequest request) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(RoleEnum.OWNER);
        user.setExpiryDate(new MyDateService().calculateExpiryDate());
        user.setEnabled(false);
        String token = UUID.randomUUID().toString();
        user.setToken(token);
        userRepository.save(user);
        String appUrl ="http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/regConfirm" + user;
        sendEmail.sendMail(appUrl);
    }



    @Override
    @Transactional
    public void delete(Long theId) {
        userRepository.deleteById(theId);
    }

    @Override
    @Transactional
    public User getUserByToken(String token) {
        return userRepository.getUserByToken(token);
    }
}
