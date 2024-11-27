package com.example.TaskBoard.repositoryes;


import com.example.TaskBoard.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String login);
}
