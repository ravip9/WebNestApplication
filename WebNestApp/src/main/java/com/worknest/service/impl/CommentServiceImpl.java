// service/impl/CommentServiceImpl.java
package com.worknest.service.impl;

import com.worknest.dao.CommentDao;
import com.worknest.model.Comment;
import com.worknest.service.CommentService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

import javax.transaction.Transactional;

@Service @Transactional
public class CommentServiceImpl implements CommentService {
  @Autowired private CommentDao commentDAO;

  @Override public void add(Comment c){ commentDAO.save(c); }

  @Override public List<Comment> forTask(Long taskId){ return commentDAO.forTask(taskId); }
}
