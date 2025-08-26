// controller/UserController.java
package com.worknest.controller;

import com.worknest.model.*;
import com.worknest.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
  private final TaskService taskService;
  private final CommentService commentService;

  public UserController(TaskService ts, CommentService cs){ this.taskService = ts; this.commentService = cs; }

  private User current(HttpSession s){ Object u = s.getAttribute("user"); return (u instanceof User)? (User)u : null; }

  @GetMapping("/tasks")
  public String myTasks(HttpSession s, Model m){
    User u = current(s); if(u==null) return "redirect:/login";
    m.addAttribute("tasks", taskService.byAssignee(u.getId()));
    return "userTasks";
  }

  @PostMapping("/tasks/{id}/status")
  public String updateStatus(HttpSession s, @PathVariable Long id, @RequestParam String status){
    User u = current(s); if(u==null) return "redirect:/login";
    Task t = taskService.find(id);
    if(t != null && t.getAssignedTo()!=null && t.getAssignedTo().getId().equals(u.getId())){
      t.setStatus(Status.valueOf(status));
      taskService.save(t);
    }
    return "redirect:/user/tasks";
  }

  @PostMapping("/tasks/{id}/comment")
  public String addComment(HttpSession s, @PathVariable Long id, @RequestParam String text){
    User u = current(s); if(u==null) return "redirect:/login";
    Task t = taskService.find(id);
    if(t != null){
      Comment c = new Comment();
      c.setText(text);
      c.setTask(t);
      c.setUser(u);
      commentService.add(c);
    }
    return "redirect:/user/tasks";
  }
}
