package com.rusanov.emerald.service;

import com.rusanov.emerald.entity.User;
import com.rusanov.emerald.repository.UserRepository;
import com.rusanov.emerald.service.serviceimpl.MyUserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    @Qualifier("userRepository")
    public UserRepository userRepository;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> user = userRepository.findOneByUsername(username);
        if (user.isPresent()) {
            return new MyUserDetailsImpl(user.get());
        } else throw new IllegalArgumentException("User not found");
    }
}