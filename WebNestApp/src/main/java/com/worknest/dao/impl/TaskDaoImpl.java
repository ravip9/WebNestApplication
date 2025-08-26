// dao/impl/TaskDAOImpl.java
package com.worknest.dao.impl;
import com.worknest.dao.TaskDao;
import com.worknest.model.Task;
import com.worknest.model.Status;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Session;
import java.util.List;

@Repository
public class TaskDaoImpl implements TaskDao {
  @Autowired private SessionFactory sf;
  private Session s(){ return sf.getCurrentSession(); }

  @Override public Task findById(Long id){ return s().get(Task.class, id); }

  @Override public void save(Task t){ s().saveOrUpdate(t); }

  @Override public void delete(Long id){
    Task t = findById(id);
    if(t!=null) s().delete(t);
  }

  @Override public List<Task> findAll(){
    return s().createQuery("from Task t left join fetch t.assignedTo", Task.class).list();
  }

  @Override public List<Task> findByAssignee(Long userId){
    return s().createQuery("from Task t where t.assignedTo.id=:uid", Task.class)
              .setParameter("uid", userId).list();
  }

  @Override public List<Task> findByStatus(Status status){
    return s().createQuery("from Task t where t.status=:st", Task.class)
              .setParameter("st", status).list();
  }
}
