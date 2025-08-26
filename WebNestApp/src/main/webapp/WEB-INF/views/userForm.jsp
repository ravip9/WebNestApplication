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
<h2>User</h2>
<form action="<c:url value='/admin/users/save'/>" method="post">
  <input type="hidden" name="id" value="${user.id}"/>
  <label>Name</label><input type="text" name="name" value="${user.name}" required />
  <label>Email</label><input type="email" name="email" value="${user.email}" required />
  <label>Password</label><input type="text" name="password" value="${user.password}" required />
  <label>Role</label>
  <select name="role">
    <option ${user.role=='ADMIN'?'selected':''}>ADMIN</option>
    <option ${user.role=='USER'?'selected':''}>USER</option>
  </select>
  <button type="submit">Save</button>
</form>
<jsp:include page="fragments/footer.jsp"/>

</body>
</html>