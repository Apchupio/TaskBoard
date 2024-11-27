package com.example.TaskBoard.controller;

import com.example.TaskBoard.models.User;
import com.example.TaskBoard.services.UserServices;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserServices userServices;

    @GetMapping("/admin")
    public String showUser(@RequestParam(name = "department", required = false) String department, Model model) {
        model.addAttribute("userList", userServices.userList(department));
        return "admin";
    }

    @PostMapping("/admin/create")
    public String createUser (@ModelAttribute User user) {
        userServices.addUser(user);
        return "redirect:/admin";
    }

    @PostMapping("/create")
    public String regUser (@ModelAttribute User user) {
        if (userServices.addUser(user)) {
            if (user.getDepartment().equalsIgnoreCase("Руководство")) {
                return "redirect:/director";
            } else if (user.getDepartment().equalsIgnoreCase("Админ")) {
                return "redirect:/admin";
            } else return "redirect:/user";
        }
        else return  "redirect:/main";
    }

    @PostMapping("/login")
    public String loginUSer (User user){
        if(user.getDepartment().equals("Руководство")){
            return "redirect:/director";
        } else if (user.getDepartment().equals("Админ")) {
            return "redirect:/admin";
        } else return "redirect:/user";
    }

    @GetMapping("/admin/userinfo/{id}")
    public String taskInfo (@PathVariable long id, org.springframework.ui.Model model) {
        model.addAttribute("userList", userServices.userById(id));
        return "user-info";
    }

    @GetMapping("/admin/delete/{id}")
    public String deleteUser(@PathVariable long id) {
        userServices.deleteUser(id);
        return "redirect:/admin";
    }
}
