<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>WorkNest - Login</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
</head>
<body>

<jsp:include page="_header.jsp"/>

<div class="container" style="max-width: 420px; text-align: center;">
    
    <h2 style="color:#008080; margin-bottom:20px;">Sign In</h2>

    <!-- Error message -->
    <c:if test="${not empty error}">
        <div class="alert">${error}</div>
    </c:if>

    <!-- Login Form -->
    <form method="post" action="login">
        <div class="form-group">
            <label for="email">Email Address</label>
            <input id="email" type="email" name="email" placeholder="Enter your email" required/>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" type="password" name="password" placeholder="Enter your password" required/>
        </div>

        <button class="btn" type="submit" style="width:100%; margin-top:10px;">Login</button>
    </form>

    <p style="margin-top:15px; font-size:14px;">
        Don’t have an account? 
        <a href="<c:url value='/register'/>" style="color:#008080; font-weight:600;">Register here</a>
    </p>
</div>

<jsp:include page="_footer.jsp"/>

</body>
</html>
