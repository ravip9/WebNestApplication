<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="fragments/header.jsp"/>
<h2>Task</h2>
<form action="<c:url value='/admin/tasks/save'/>" method="post">
  <input type="hidden" name="id" value="${task.id}"/>
  <label>Title</label><input type="text" name="title" value="${task.title}" required />
  <label>Description</label><textarea name="description">${task.description}</textarea>
  <label>Start Date</label><input type="date" name="startDate" value="${task.startDate}"/>
  <label>Due Date</label><input type="date" name="dueDate" value="${task.dueDate}"/>

  <label>Assignee</label>
  <select name="assigneeId">
    <c:forEach var="u" items="${users}">
      <option value="${u.id}" ${task.assignedTo!=null && task.assignedTo.id==u.id ? 'selected' : ''}>${u.name} (${u.email})</option>
    </c:forEach>
  </select>

  <label>Status</label>
  <select name="status">
    <c:forEach var="st" items="${statuses}">
      <option value="${st}" ${task.status==st?'selected':''}>${st}</option>
    </c:forEach>
  </select>

  <button type="submit">Save</button>
  <a class="btn" href="<c:url value='/admin/dashboard'/>">Cancel</a>
</form>
<jsp:include page="fragments/footer.jsp"/>

</body>
</html>