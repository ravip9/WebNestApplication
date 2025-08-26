// controller/AuthController.java
package com.worknest.controller;

import com.worknest.model.Role;
import com.worknest.model.User;
import com.worknest.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.*;

@Controller
public class AuthController {

  private final UserService userService;
  public AuthController(UserService userService){ this.userService = userService; }

  @GetMapping("/login")
  public String loginPage(){ return "login"; }

  @PostMapping("/login")
  public String doLogin(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session, Model model) {
    User u = userService.login(email, password);
    if(u==null) { model.addAttribute("error","Invalid credentials"); return "login"; }
    session.setAttribute("user", u);
    return (u.getRole()== Role.ADMIN) ? "redirect:/admin/dashboard" : "redirect:/user/tasks";
  }

  @GetMapping("/register")
  public String registerPage(Model m){ m.addAttribute("user", new User()); return "register"; }

  @PostMapping("/register")
  public String doRegister(@ModelAttribute User user, Model m) {
    userService.register(user);
    m.addAttribute("msg","Registration successful. Please login.");
    return "login";
  }

  @GetMapping("/logout")
  public String logout(HttpSession session){
    session.invalidate(); return "redirect:/login";
  }
}
