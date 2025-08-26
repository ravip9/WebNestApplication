// service/impl/TaskServiceImpl.java
package com.worknest.service.impl;

import com.worknest.dao.TaskDao;
import com.worknest.model.Status;
import com.worknest.model.Task;
import com.worknest.service.TaskService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

@Service @Transactional
public class TaskServiceImpl implements TaskService {
  @Autowired private TaskDao taskDAO;

  @Override public Task save(Task t) {
    autoUpdateDelay(t);
    taskDAO.save(t); return t;
  }

  @Override public void delete(Long id){ taskDAO.delete(id); }

  @Override public Task find(Long id){
    Task t = taskDAO.findById(id);
    if(t!=null){ autoUpdateDelay(t); }
    return t;
  }

  @Override public List<Task> all(){ return taskDAO.findAll(); }

  @Override public List<Task> byAssignee(Long userId){ return taskDAO.findByAssignee(userId); }

  @Override public List<Task> byStatus(Status st){ return taskDAO.findByStatus(st); }

  @Override public void autoUpdateDelay(Task t) {
    if(t.getStatus()!=Status.COMPLETED && t.getDueDate()!=null) {
      if(LocalDate.now().isAfter(t.getDueDate())) {
        t.setStatus(Status.DELAYED);
      } else if(t.getStatus()==null) {
        t.setStatus(Status.PENDING);
      }
    }
  }
}
