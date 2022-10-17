package com.rusanov.emerald.repository;

import com.rusanov.emerald.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findOneByUsername(String username);

    User findByUsername(String username);

    User findByEmail(String email);

    User getUserByToken(String token);

    @Query("select  a from User a where " +
            "CONCAT(a.email, ' ', a.username, ' ', a.role, ' ', a.phone, ' ', a.name) " +
            "LIKE %?1%")
    List<User> getUserFilter(@Param("userFilter") String filter);

    @Query("select en from User  en where en.enabled = :enabled")
    List<User> getByEnabled(@Param("enabled") Boolean enabled);
}