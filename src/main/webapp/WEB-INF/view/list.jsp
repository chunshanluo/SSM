<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/7/10
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>员工信息</title>
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <div class="row">
        <h1><p class="text-center text-info">员工列表</p></h1>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>员工id</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门名</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.empId}</td>
                        <td>${emp.empName}</td>
                        <td>${emp.gender}</td>
                        <td>${emp.email}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button type="button" class="btn btn-danger">编辑</button>
                            <button type="button" class="btn btn-primary">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

<%--    分页条信息--%>
    <div class="row">
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，共${pageInfo.total}条记录
        </div>

        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH }/emps/1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH }/emps/${pageInfo.pageNum - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                        <c:if test="${num == pageInfo.pageNum}">
                            <li class="active">
                                <span> ${num}<span class="sr-only">(current)</span></span>
                            </li>
                        </c:if>
                        <c:if test="${num != pageInfo.pageNum}">
                            <li><a href="${APP_PATH }/emps/${num}">${num}</a></li>
                        </c:if>

                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH }/emps/${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${APP_PATH }/emps/${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>

</body>
</html>
