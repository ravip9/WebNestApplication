<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>WorkNest - Register</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
</head>
<body>

<jsp:include page="_header.jsp"/>

<div class="container" style="max-width: 600px;">
    
    <h2 style="color:#008080; text-align:center; margin-bottom:20px;">Create Your Account</h2>

    <!-- Error message -->
    <c:if test="${not empty error}">
        <div class="alert">${error}</div>
    </c:if>

    <!-- Registration Form -->
    <form method="post" action="register">
        <div class="row" style="display:flex; gap:20px; margin-bottom:15px;">
            <div style="flex:1;">
                <label for="name">Full Name</label>
                <input id="name" type="text" name="name" placeholder="Enter your full name" required/>
            </div>
            <div style="flex:1;">
                <label for="email">Email</label>
                <input id="email" type="email" name="email" placeholder="Enter your email" required/>
            </div>
        </div>

        <div class="row" style="display:flex; gap:20px; margin-bottom:15px;">
            <div style="flex:1;">
                <label for="password">Password</label>
                <input id="password" type="password" name="password" placeholder="Enter a password" required/>
            </div>
            <div style="flex:1;">
                <label for="role">Role</label>
                <select id="role" name="role">
                    <option value="USER">User</option>
                    <option value="ADMIN">Admin</option>
                </select>
            </div>
        </div>

        <button class="btn" type="submit" style="width:100%;">Create Account</button>
    </form>

    <p style="margin-top:15px; text-align:center; font-size:14px;">
        Already have an account? 
        <a href="<c:url value='/login'/>" style="color:#008080; font-weight:600;">Login here</a>
    </p>
</div>

<jsp:include page="_footer.jsp"/>

</body>
</html>
