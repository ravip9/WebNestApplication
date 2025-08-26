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
<h2>Task Details</h2>
<p><b>${task.title}</b> — ${task.status}<br/>
Assignee: <c:out value="${task.assignedTo != null ? task.assignedTo.name : 'Unassigned'}"/></p>
<p>Due: ${task.dueDate}</p>
<p>${task.description}</p>

<h3>Comments</h3>
<ul>
  <c:forEach var="cmt" items="${comments}">
    <li><b>${cmt.user.name}</b> at ${cmt.createdAt}: ${cmt.text}</li>
  </c:forEach>
</ul>
<p><a class="btn" href="<c:url value='/admin/dashboard'/>">Back</a></p>
<jsp:include page="fragments/footer.jsp"/>

</body>
</html>