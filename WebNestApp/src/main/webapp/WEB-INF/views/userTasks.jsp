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
<h2>My Tasks</h2>
<table class="tbl">
  <thead><tr><th>Title</th><th>Due</th><th>Status</th><th>Update</th><th>Comment</th></tr></thead>
  <tbody>
    <c:forEach var="t" items="${tasks}">
      <tr>
        <td>${t.title}</td>
        <td>${t.dueDate}</td>
        <td>${t.status}</td>
        <td>
          <form action="<c:url value='/user/tasks/${t.id}/status'/>" method="post" style="display:inline;">
            <select name="status">
              <option value="IN_PROGRESS" ${t.status=='IN_PROGRESS'?'selected':''}>In Progress</option>
              <option value="COMPLETED" ${t.status=='COMPLETED'?'selected':''}>Completed</option>
            </select>
            <button type="submit">Update</button>
          </form>
        </td>
        <td>
          <form action="<c:url value='/user/tasks/${t.id}/comment'/>" method="post" style="display:inline;">
            <input type="text" name="text" placeholder="Add comment" required />
            <button type="submit">Post</button>
          </form>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>
<jsp:include page="fragments/footer.jsp"/>

</body>
</html>