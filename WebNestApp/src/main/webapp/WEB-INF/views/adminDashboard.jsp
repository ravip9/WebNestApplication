<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
</head>
<body>

<jsp:include page="fragments/header.jsp"/>

<h2>Admin Dashboard</h2>

<div class="grid">
    <div class="card">Pending: <b>${fn:length(pending)}</b></div>
    <div class="card">In Progress: <b>${fn:length(inProgress)}</b></div>
    <div class="card">Completed: <b>${fn:length(completed)}</b></div>
    <div class="card">Delayed: <b>${fn:length(delayed)}</b></div>
</div>

<p>
    <a class="btn" href="<c:url value='/admin/users'/>">Manage Users</a>
    <a class="btn" href="<c:url value='/admin/tasks/new'/>">New Task</a>
</p>

<table class="tbl">
    <thead>
        <tr>
            <th>Title</th>
            <th>Assignee</th>
            <th>Due</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="t" items="${all}">
            <tr>
                <td><a href="<c:url value='/admin/tasks/${t.id}'/>"><c:out value="${t.title}"/></a></td>
                <td><c:out value="${t.assignedTo != null ? t.assignedTo.name : 'Unassigned'}"/></td>
                <td><c:out value="${t.dueDate}"/></td>
                <td><c:out value="${t.status}"/></td>
                <td>
                    <a href="<c:url value='/admin/tasks/edit/${t.id}'/>">Edit</a> |
                    <a href="<c:url value='/admin/tasks/delete/${t.id}'/>" onclick="return confirm('Delete task?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<jsp:include page="fragments/footer.jsp"/>

</body>
</html>