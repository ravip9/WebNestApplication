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
<h2>Login</h2>
<c:if test="${not empty error}"><div class="alert">${error}</div></c:if>
<form action="<c:url value='/login'/>" method="post">
  <label>Email</label><input type="email" name="email" required />
  <label>Password</label><input type="password" name="password" required />
  <button type="submit">Login</button>
</form>
<p>No account? <a href="<c:url value='/register'/>">Register</a></p>
<jsp:include page="fragments/footer.jsp"/>

</body>
</html>