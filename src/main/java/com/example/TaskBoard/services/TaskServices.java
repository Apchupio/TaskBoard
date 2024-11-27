package com.example.TaskBoard.services;

import com.example.TaskBoard.models.Task;
import com.example.TaskBoard.repositoryes.TaskRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TaskServices {
    private final TaskRepository taskRepository;

   public List<Task> taskList (String department) {
       if (department != null) return taskRepository.findByDepartment(department);
       else return taskRepository.findAll();

   }

    public List<Task> showTasks () {
        return taskRepository.findAll();
    }

    public void saveTask (Task task) {
        log.info("Saving new {}", task);
        task.setStatus(false);
        task.setDateOfDelivery(null);
        taskRepository.save(task);

    }

    public void deleteTask (long id){
        taskRepository.deleteById(id);
    }

    public Task taskById(long id) {
        return taskRepository.findById(id).orElse(null);
    }
}
