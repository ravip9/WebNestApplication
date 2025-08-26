// dao/UserDAO.java
package com.worknest.dao;
import com.worknest.model.User;
import java.util.List;
public interface UserDao {
  User findById(Long id);
  User findByEmail(String email);
  void save(User u);
  void delete(Long id);
  List<User> findAll();
}
