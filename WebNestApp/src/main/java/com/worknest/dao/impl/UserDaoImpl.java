// dao/impl/UserDAOImpl.java
package com.worknest.dao.impl;
import com.worknest.dao.UserDao;
import com.worknest.model.User;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Session;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
  @Autowired private SessionFactory sf;

  private Session s(){ return sf.getCurrentSession(); }

  @Override public User findById(Long id){ return s().get(User.class, id); }

  @Override public User findByEmail(String email){
    return s().createQuery("from User u where u.email=:e", User.class)
              .setParameter("e", email).uniqueResult();
  }

  @Override public void save(User u){ s().saveOrUpdate(u); }

  @Override public void delete(Long id){
    User u = findById(id);
    if(u!=null) s().delete(u);
  }

  @Override public List<User> findAll(){
    return s().createQuery("from User", User.class).list();
  }
}
