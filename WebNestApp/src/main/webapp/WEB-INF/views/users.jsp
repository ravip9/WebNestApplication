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
<h2>Users</h2>
<p><a class="btn" href="<c:url value='/admin/users/new'/>">Add User</a> 
   <a class="btn" href="<c:url value='/admin/dashboard'/>">Back</a></p>
<table class="tbl">
  <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Actions</th></tr></thead>
  <tbody>
    <c:forEach var="u" items="${users}">
      <tr>
        <td>${u.id}</td><td>${u.name}</td><td>${u.email}</td><td>${u.role}</td>
        <td>
          <a href="<c:url value='/admin/users/edit/${u.id}'/>">Edit</a> |
          <a href="<c:url value='/admin/users/delete/${u.id}'/>" onclick="return confirm('Delete user?')">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>
<jsp:include page="fragments/footer.jsp"/>

</body>
</html>