// dao/TaskDAO.java
package com.worknest.dao;
import com.worknest.model.Task;
import com.worknest.model.Status;
import java.util.List;
public interface TaskDao {
  Task findById(Long id);
  void save(Task t);
  void delete(Long id);
  List<Task> findAll();
  List<Task> findByAssignee(Long userId);
  List<Task> findByStatus(Status status);
}
