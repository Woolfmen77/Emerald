package com.rusanov.emerald.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String role;

    @OneToMany(fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL, mappedBy = "user")
    private Set<UserRole> userRoles = new HashSet<UserRole>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Set<UserRole> getUserRoles() {
        return userRoles;
    }

    public void setUserRoles(Set<UserRole> userRoles) {
        this.userRoles = userRoles;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Role role1 = (Role) o;
        return Objects.equals(id, role1.id) && Objects.equals(role, role1.role) && Objects.equals(userRoles, role1.userRoles);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, role, userRoles);
    }

    @Override
    public String toString() {
        return "\nRole{" +
                "id=" + id +
                ", role='" + role + '\'' +
                ", userRoles=" + userRoles +
                '}';
    }
}
