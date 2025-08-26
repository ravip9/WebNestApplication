// service/TaskService.java
package com.worknest.service;
import com.worknest.model.Task;
import com.worknest.model.Status;
import java.util.List;

public interface TaskService {
  Task save(Task t);
  void delete(Long id);
  Task find(Long id);
  List<Task> all();
  List<Task> byAssignee(Long userId);
  List<Task> byStatus(Status st);
  void autoUpdateDelay(Task t); // compute DELAYED if overdue and not completed
}
