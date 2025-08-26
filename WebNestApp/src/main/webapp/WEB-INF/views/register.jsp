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
<h2>Register</h2>
<form action="<c:url value='/register'/>" method="post">
  <label>Name</label><input type="text" name="name" required />
  <label>Email</label><input type="email" name="email" required />
  <label>Password</label><input type="password" name="password" required />
  <button type="submit">Create Account</button>
</form>
<jsp:include page="fragments/footer.jsp"/>

</body>
</html>