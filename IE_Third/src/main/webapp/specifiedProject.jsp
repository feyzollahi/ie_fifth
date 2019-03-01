<%@ page import="model.Project.Project" %>
<%@ page import="model.Repo.GetRepo" %>
<%@ page import="model.Repo.UsersRepo" %><%--
  Created by IntelliJ IDEA.
  User: mahdi
  Date: 3/1/19
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Project</title>
</head>
<body>
<form action="showAllUsersCtrl" method="GET">
    <button>مشاهده تمام کاربران</button>
</form>
<form action="showAllProjects" method="GET">
    <button>مشاهده تمام پروژه ها</button>
</form>
<form action="homeServlet" method="GET">
    <button>مشاهده صفحه اول</button>
</form>
<%String projectId = request.getParameter("projectId");
    GetRepo.print("specifiedProject.jsp");
Project project = (Project) request.getAttribute("project");
String userId = (String) request.getAttribute("userId");%>
<ul>
    <li>id: <%=project.getId()%></li>
    <li>title: <%=project.getTitle()%></li>
    <li>description: <%=project.getDescription()%></li>
    <li>imageUrl: <img src="<%=project.getImageUrlText()%>" style="width: 50px; height: 50px;"></li>
    <li>budget: <%=project.getBudget()%></li>
</ul>
<!-- display form if user has not bidded before -->
<%if(!project.userHasBid(userId)){%>
    <form action="userBidProjectCtrl" method="GET">
        <label for="bidAmount">Bid Amount:</label>
        <input type="number" id="bidAmount" name="bidAmount"/>
        <input type="hidden" name="projectId" value="<%=project.getId()%>"/>
        <button>Submit</button>
    </form>
<%}%>
</body>
</html>
