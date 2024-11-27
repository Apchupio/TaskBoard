package com.example.TaskBoard.services;

import com.example.TaskBoard.models.User;
import com.example.TaskBoard.models.enums.Role;
import com.example.TaskBoard.repositoryes.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserServices {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
   public List<User> userList ( @Nullable String department) {
      return userRepository.findAll();
   }

    public List<User> showUser () {
        return userRepository.findAll();
    }

    public boolean addUser (User user) {
       String email = user.getEmail();
        if (userRepository.findByEmail(user.getEmail()) != null) {
            System.out.println("rgijisjv");
            return false;
        }
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        log.info("Saving new user with login: {}", email);
        userRepository.save(user);
        return true;
    }

    public void deleteUser (long id){
       userRepository.deleteById(id);
    }

    public User userById(long id) {
        return userRepository.findById(id).orElse(null);
    }
}
