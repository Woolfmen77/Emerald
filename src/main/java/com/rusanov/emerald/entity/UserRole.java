package com.rusanov.emerald.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "role_id", nullable = false)
    private  Role role;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserRole userRole = (UserRole) o;
        return Objects.equals(id, userRole.id) && Objects.equals(user, userRole.user) && Objects.equals(role, userRole.role);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, user, role);
    }

    @Override
    public String toString() {
        return "\nUserRole{" +
                "id=" + id +
                ", user=" + user +
                ", role=" + role +
                '}';
    }
}
