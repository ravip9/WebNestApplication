// service/CommentService.java
package com.worknest.service;
import com.worknest.model.Comment;
import java.util.List;

public interface CommentService {
  void add(Comment c);
  List<Comment> forTask(Long taskId);
}
