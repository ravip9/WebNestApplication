// service/impl/UserServiceImpl.java
package com.worknest.service.impl;

import com.worknest.dao.UserDao;
import com.worknest.model.Role;
import com.worknest.model.User;
import com.worknest.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import javax.transaction.Transactional;

@Service @Transactional
public class UserServiceImpl implements UserService {
  @Autowired private UserDao userDAO;

  @Override public User register(User u) {
    if(u.getRole()==null) u.setRole(Role.USER);
    userDAO.save(u); return u;
  }

  @Override public User login(String email, String password) {
    User u = userDAO.findByEmail(email);
    return (u!=null && u.getPassword().equals(password)) ? u : null;
  }

  @Override public User find(Long id){ return userDAO.findById(id); }

  @Override public List<User> all(){ return userDAO.findAll(); }

  @Override public void delete(Long id){ userDAO.delete(id); }

  @Override public void save(User u){ userDAO.save(u); }
}
