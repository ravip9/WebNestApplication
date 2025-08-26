// controller/AdminController.java
package com.worknest.controller;

import com.worknest.model.*;
import com.worknest.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
  private final UserService userService;
  private final TaskService taskService;
  private final CommentService commentService;

  public AdminController(UserService userService, TaskService taskService, CommentService commentService) {
    this.userService = userService; this.taskService = taskService; this.commentService = commentService;
  }

  private boolean guardAdmin(HttpSession s){ 
    Object o = s.getAttribute("user");
    return (o instanceof User) && ((User)o).getRole()==Role.ADMIN;
  }

  @GetMapping("/dashboard")
  public String dashboard(HttpSession s, Model m){
    if(!guardAdmin(s)) return "redirect:/login";
    m.addAttribute("all", taskService.all());
    m.addAttribute("pending", taskService.byStatus(Status.PENDING));
    m.addAttribute("inProgress", taskService.byStatus(Status.IN_PROGRESS));
    m.addAttribute("completed", taskService.byStatus(Status.COMPLETED));
    m.addAttribute("delayed", taskService.byStatus(Status.DELAYED));
    return "adminDashboard";
  }

  // Users list
  @GetMapping("/users")
  public String users(HttpSession s, Model m){
    if(!guardAdmin(s)) return "redirect:/login";
    m.addAttribute("users", userService.all());
    return "users";
  }

  @GetMapping("/users/new")
  public String newUser(HttpSession s, Model m){
    if(!guardAdmin(s)) return "redirect:/login";
    m.addAttribute("user", new User()); return "userForm";
  }

  @PostMapping("/users/save")
  public String saveUser(HttpSession s, @ModelAttribute User u){
    if(!guardAdmin(s)) return "redirect:/login";
    if(u.getRole()==null) u.setRole(Role.USER);
    userService.save(u); return "redirect:/admin/users";
  }

  @GetMapping("/users/edit/{id}")
  public String editUser(HttpSession s, @PathVariable Long id, Model m){
    if(!guardAdmin(s)) return "redirect:/login";
    m.addAttribute("user", userService.find(id)); return "userForm";
  }

  @GetMapping("/users/delete/{id}")
  public String deleteUser(HttpSession s, @PathVariable Long id){
    if(!guardAdmin(s)) return "redirect:/login";
    userService.delete(id); return "redirect:/admin/users";
  }

  // Tasks
  @GetMapping("/tasks/new")
  public String newTask(HttpSession s, Model m){
    if(!guardAdmin(s)) return "redirect:/login";
    m.addAttribute("task", new Task());
    m.addAttribute("users", userService.all());
    m.addAttribute("statuses", Status.values());
    return "taskForm";
  }

  @PostMapping("/tasks/save")
  public String saveTask(HttpSession s, @ModelAttribute Task t, @RequestParam Long assigneeId, @RequestParam String status){
    if(!guardAdmin(s)) return "redirect:/login";
    User assignee = userService.find(assigneeId);
    t.setAssignedTo(assignee);
    t.setStatus(Status.valueOf(status));
    taskService.save(t);
    return "redirect:/admin/dashboard";
  }

  @GetMapping("/tasks/edit/{id}")
  public String editTask(HttpSession s, @PathVariable Long id, Model m){
    if(!guardAdmin(s)) return "redirect:/login";
    m.addAttribute("task", taskService.find(id));
    m.addAttribute("users", userService.all());
    m.addAttribute("statuses", Status.values());
    return "taskForm";
  }

  @GetMapping("/tasks/delete/{id}")
  public String deleteTask(HttpSession s, @PathVariable Long id){
    if(!guardAdmin(s)) return "redirect:/login";
    taskService.delete(id); return "redirect:/admin/dashboard";
  }

  // View comments on a task
  @GetMapping("/tasks/{id}")
  public String taskDetails(HttpSession s, @PathVariable Long id, Model m){
    if(!guardAdmin(s)) return "redirect:/login";
    m.addAttribute("task", taskService.find(id));
    m.addAttribute("comments", commentService.forTask(id));
    return "taskDetails";
  }
}
