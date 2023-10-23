<%@ page import="projectmju.model.Driver" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2566
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>editDriver</title>

  <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">

  <style>
    .edit{
      background: #7DA17D;
      margin: 0 auto;
      padding: 2rem;
      width: 650px;
      border-radius: 30px;
    }
    .icon{
      width: 35px;
      height: 35px;
    }
    .pedit{
      margin: 0 auto;
      background: #ffa500;
      text-align: center;
      padding: 10px;
      width: 35%;
      font-size: 18px;
      font-weight: 500;
      border-radius: 30px;
    }
    .Dsub{
      align-items: center;
      text-align: center;
      padding: 15px;
    }
    .sub{
      padding: 10px;
      font-size: 18px;
      border-radius: 20px;
      cursor: pointer;
      background: #ffa500;
      margin:  0 auto;
      align-items: center;
    }
    .sub:hover{
      background-color: #fffb00; /* Green */
      color: rgb(0, 0, 0);
      transition-duration: 0.4s;
    }
    .ip {
      width: 220px;
      text-align: center;
      font-size: 18px;
      border-radius: 15px;
      margin-bottom: 5px;
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

<jsp:include page="/WEB-INF/view/admin/nav-admin.jsp"/>
<!-- Navbar -->

<%--  AddDriver --%>
<section class="CssSection">

  <%Driver driver = (Driver) request.getAttribute("driver");%>
<form:form action="${pageContext.request.contextPath}/updateDriver/${driver.id_driver}" modelAttribute="driver" method="POST" name="formUpdateDriver">
  <div class="edit">
    <p class="pedit">แก้ไขข้อมูลคนขับรถ</p>
    <br>
    <table style="margin: 0 auto">
                        <tr>
          <td>รหัส</td>
          <td><input type="text" id="id_driver" name="id_driver" readonly="true" value="<%=driver.getId_driver()%>" Class="ip"/></td>
                        </tr>
      <tr>
        <td>ชื่อ</td>
        <td><input type="text" id="name_driver" name="name_driver" value="<%=driver.getName_driver()%>" Class="ip"/></td>

        <td>นามสกุล</td>
        <td><input type="text" is="sername_driver" name="sername_driver" value="<%=driver.getSername_driver()%>" Class="ip"/></td>
      </tr>
      <tr>
        <td>เบอร์โทร</td>
        <td><input type="text" id="tel_driver" name="tel_driver" value="<%=driver.getTel_driver()%>" Class="ip"/></td>
        <td>อีเมล</td>
        <td><input type="text" id="email_driver" name="email_driver" value="<%=driver.getEmail_driver()%>" Class="ip"/></td>
      </tr>
    </table>
  </div>

  <div class="Dsub">
    <button type="submit" class="sub">ยืนยันการแก้ไข</button>
    <a href="${pageContext.request.contextPath}/driver-list"><button type="button" class="sub">ยกเลิก</button></a>
  </div>

</form:form>
</section>


<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
