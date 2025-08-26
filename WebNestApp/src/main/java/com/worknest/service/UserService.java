// service/UserService.java
package com.worknest.service;
import com.worknest.model.User;
import java.util.List;

public interface UserService {
  User register(User u);
  User login(String email, String password);
  User find(Long id);
  List<User> all();
  void delete(Long id);
  void save(User u);
}
