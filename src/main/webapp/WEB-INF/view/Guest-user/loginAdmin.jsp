<%@ page import="org.springframework.ui.Model" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2566
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>loginAdmin</title>

  <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">

  <style>
    .login{
      max-width: 500px;
      background: #7DA17D;
      text-align: center;
      padding: 2rem;
      margin: 0 auto;
      border-radius: 20px;
    }
    .pHead{
      color: white;
      font-size: 35px;
      font-weight: 600;
    }
    .profile{
      width: 35px;
      height: 35px;
    }
    .padlock{
      width: 35px;
      height: 35px;
    }
    .log,.pass{
      width: 300px;
      text-align: center;
      height: 35px;
      border-radius: 25px;
    }
    .sub{
      padding: 5px;
      border-radius: 20px;
      cursor: pointer;
      background: #ffa500;
    }
  </style>

</head>

<body>
<header>
  <div class="header">
    <div class="logo1"><img src="${pageContext.request.contextPath}/assets/img/LogoMJU.png" alt=""></div>
    <div class="logo2"><img src="${pageContext.request.contextPath}/assets/img/LogoMJU.png" alt=""></div>
    <p class="text">รถเขียว M J U</p>
  </div>
</header>
<!-- Navbar -->
<%--<nav>--%>
<%--  <ul>--%>
<%--    <li><a href="home.jsp">หน้าหลัก</a></li>--%>
<%--    <li><a href="viewRoute.jsp">เส้นทางเดินรถ</a></li>--%>
<jsp:include page="/WEB-INF/view/Guest-user/nav.jsp"/>
<%--  </ul>--%>
<%--</nav>--%>

  <c:set var="loginStatus" scope="session" value="${loginFailed}"/>
  <c:if test="${loginStatus == true && loginStatus != null}">
    <center>
      <p>Login Failed!<p>
      <p>กรุณากรอกชื่อผู้ใช้งานและรหัสผ่านให้ถูกต้อง<p>
    </center>
  </c:if>
  <!-- Navbar -->

<%-- Login --%>
<section class="Login">
  <div class="login">
    <p class="pHead">เข้าสู่ระบบ</p>
    <br>
    <form action="${pageContext.request.contextPath}/doLogin" method="POST">
      <table style="margin: 0 auto">
        <tr>
          <td><img class="profile" src="${pageContext.request.contextPath}/assets/img/profile.png"></td>
          <td style="padding-left: 10px"><input type="text" name="username" id="username" placeholder="Username" required class="log"></td>
        </tr>
        <tr>
          <td><img class="padlock" src="${pageContext.request.contextPath}/assets/img/padlock.png"></td>
          <td style="padding-left: 10px"><input type="text" name="password" id="password" placeholder="Password" required class="pass"></td>
        </tr>
      </table>
      <br>
      <input type="submit" value="เข้าสู่ระบบ" class="sub">
      <input type="reset" value="ยกเลิก" class="sub">
    </form>
  </div>
</section>

<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
