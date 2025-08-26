// dao/impl/CommentDaoImpl.java
package com.worknest.dao.impl;
import com.worknest.dao.CommentDao;
import com.worknest.model.Comment;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Session;
import java.util.List;

@Repository
public class CommentDaoImpl implements CommentDao {
  @Autowired private SessionFactory sf;
  private Session s(){ return sf.getCurrentSession(); }

  @Override public void save(Comment c){ s().save(c); }

  @Override public List<Comment> forTask(Long taskId){
    return s().createQuery("from Comment c where c.task.id=:tid order by c.createdAt desc", Comment.class)
              .setParameter("tid", taskId).list();
  }
}
