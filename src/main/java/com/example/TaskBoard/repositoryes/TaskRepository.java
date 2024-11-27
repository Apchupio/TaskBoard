package com.example.TaskBoard.repositoryes;

import com.example.TaskBoard.models.Task;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

public interface TaskRepository extends JpaRepository<com.example.TaskBoard.models.Task, Long> {
    List<Task> findByDepartment(String department);
}
