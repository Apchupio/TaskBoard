package com.example.TaskBoard.controller;

import com.example.TaskBoard.models.Task;
import com.example.TaskBoard.services.TaskServices;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class TaskController {

    private final TaskServices taskServices;


    @GetMapping("/director")
    public String showTask(@RequestParam(name = "department", required = false) String department, Model model) {
        model.addAttribute("taskList", taskServices.taskList(department));
        return "director";
    }


    @GetMapping("/")
    public String getMain(){
        return "main";
    }


    @PostMapping("/task/create")
    public String createTask(@ModelAttribute Task task, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // Логирование ошибок
            bindingResult.getAllErrors().forEach(error -> {
                System.out.println(error.getDefaultMessage());
            });
            return "errorPage"; // Перенаправление на страницу с ошибкой
        }
        taskServices.saveTask(task);
        return "redirect:/director";
    }

    @GetMapping("task/{id}")
    public String taskInfo(@PathVariable int id, Model model) {
        model.addAttribute("taskList", taskServices.taskById(id));
        return "task-info";
    }

    @PostMapping("task/delete/{id}")
    public String deleteTask(@PathVariable int id){
        taskServices.deleteTask(id);
        return "redirect:/director";
    }
}
