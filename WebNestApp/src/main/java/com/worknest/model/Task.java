package com.worknest.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.*;

@Entity @Table(name="tasks")
public class Task {
  @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
  private Long id;

  @Column(nullable=false)
  private String title;

  @Column(length=2000)
  private String description;

  private LocalDate startDate;
  private LocalDate dueDate;

  @Enumerated(EnumType.STRING)
  private Status status = Status.PENDING;

  @ManyToOne(fetch=FetchType.LAZY)
  @JoinColumn(name="assigned_to_id")
  private User assignedTo;

  @OneToMany(mappedBy="task", cascade=CascadeType.ALL, orphanRemoval=true)
  private List<Comment> comments = new ArrayList<>();

  // getters/setters
  public Long getId() { return id; }
  public void setId(Long id) { this.id = id; }
  public String getTitle() { return title; }
  public void setTitle(String title) { this.title = title; }
  public String getDescription() { return description; }
  public void setDescription(String description) { this.description = description; }
  public LocalDate getStartDate() { return startDate; }
  public void setStartDate(LocalDate startDate) { this.startDate = startDate; }
  public LocalDate getDueDate() { return dueDate; }
  public void setDueDate(LocalDate dueDate) { this.dueDate = dueDate; }
  public Status getStatus() { return status; }
  public void setStatus(Status status) { this.status = status; }
  public User getAssignedTo() { return assignedTo; }
  public void setAssignedTo(User assignedTo) { this.assignedTo = assignedTo; }
  public List<Comment> getComments() { return comments; }
  public void setComments(List<Comment> comments) { this.comments = comments; }
}
