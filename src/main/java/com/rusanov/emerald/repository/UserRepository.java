package com.rusanov.emerald.repository;

import com.rusanov.emerald.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;




@Repository("userRepository")
@Component
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);

    User findByEmail(String email);

    User getUserByToken(String token);

}

