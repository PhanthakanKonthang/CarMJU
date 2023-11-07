<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<form:form action="${pageContext.request.contextPath}/logout" method="POST" name="frmLogout"></form:form>--%>

<nav>
    <ul>
            <li><a href="${pageContext.request.contextPath}/">หน้าหลัก</a></li>
<%--        <security:authorize access="hasRole('MANAGER')">--%>
            <li><a href="${pageContext.request.contextPath}/searchRoute2">เส้นทางการเดินรถ</a></li>
<%--        </security:authorize>--%>
            <li><a href="${pageContext.request.contextPath}/map">แผนที่</a></li>
<%--        <security:authorize access="!isAuthenticated()">--%>
            <li><a href="${pageContext.request.contextPath}/login">ลงชื่อเข้าสู่ระบบ</a></li>
<%--        </security:authorize>--%>


<%--        <security:authorize access="isAuthenticated()">--%>
<%--            <li>--%>
<%--                User: <security:authentication property="principal.username" />--%>
<%--                Role (s): <security:authentication property="principal.authorities" />--%>
<%--            </li>--%>
<%--            <li><a href="#" onclick="javascript: frmLogout.submit();">ลงชื่อออกจากระบบ</a></li>--%>
<%--        </security:authorize>--%>

    </ul>
</nav>
<hr>
