<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>WorkNest - Admin Dashboard</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
</head>
<body>

<jsp:include page="_header.jsp"/>

<div class="container">

    <h2 style="color:#008080; text-align:center; margin-bottom:25px;">Admin Dashboard</h2>

    <!-- Users Section -->
    <section class="card">
        <h3 style="color:#006666;">Users</h3>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.name}</td>
                        <td>${u.email}</td>
                        <td>${u.role}</td>
                        <td>
                            <form method="post" action="<c:url value='/admin/users/delete'/>" style="display:inline;">
                                <input type="hidden" name="userId" value="${u.id}"/>
                                <button class="btn danger" type="submit" onclick="return confirm('Delete this user?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>

    <!-- Allocate Task Section -->
    <section class="card">
        <h3 style="color:#006666;">Allocate Task</h3>
        <form method="post" action="<c:url value='/admin/tasks/allocate'/>" class="form-grid">
            <div>
                <label>Title</label>
                <input name="title" required/>
            </div>
            <div>
                <label>Description</label>
                <textarea name="description"></textarea>
            </div>
            <div class="row">
                <div>
                    <label>Start Date</label>
                    <input type="date" name="startDate"/>
                </div>
                <div>
                    <label>Due Date</label>
                    <input type="date" name="dueDate"/>
                </div>
            </div>
            <div>
                <label>Assign To (User ID)</label>
                <input type="number" name="userId" required/>
            </div>
            <button class="btn" type="submit">Allocate Task</button>
        </form>
    </section>

    <!-- All Tasks Section -->
    <section class="card">
        <h3 style="color:#006666;">All Tasks</h3>
        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th><th>Title</th><th>Assignee</th><th>Status</th><th>Due</th><th>Actions / Comments</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="t" items="${tasks}">
                    <tr>
                        <td>${t.id}</td>
                        <td>${t.title}</td>
                        <td><c:out value='${t.user != null ? t.user.name : "Unassigned"}'/></td>
                        <td>${t.status}</td>
                        <td>${t.dueDate}</td>
                        <td>
                            <!-- Edit Task -->
                            <a href="<c:url value='/admin/tasks/edit?taskId=${t.id}'/>" class="btn small">Edit</a>

                            <!-- Delete Task -->
                            <form method="post" action="<c:url value='/admin/tasks/delete'/>" style="display:inline;">
                                <input type="hidden" name="taskId" value="${t.id}"/>
                                <button class="btn danger small" type="submit" onclick="return confirm('Delete this task?')">Delete</button>
                            </form>

                            <!-- Comments -->
                            <c:forEach var="c" items="${taskComments[t.id]}">
                                <div class="comment">
                                    <strong>${c.user.name}:</strong> ${c.content}
                                    <br/><small>${c.createdAt}</small>
                                </div>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>

</div>

<jsp:include page="_footer.jsp"/>

</body>
</html>
