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
<section class="editDriver">

  <%Driver driver = (Driver) request.getAttribute("driver");%>
<form:form action="${pageContext.request.contextPath}/updateDv" modelAttribute="driver" method="POST" name="formUpdateDriver">
  <div class="edit">
    <p class="pedit">แก้ไขข้อมูลคนขับรถ</p>
    <br>
    <table style="margin: 0 auto">
      <tr>
        <td><img src="${pageContext.request.contextPath}/assets/img/id.png" class="icon"></td>
        <td>รหัส</td>
        <td><form:input path="id_driver" readonly="true" cssClass="ip"/></td>
      </tr>
      <tr>
        <td><img src="${pageContext.request.contextPath}/assets/img/card.png" class="icon"></td>
        <td>ชื่อ</td>
        <td><form:input path="name_driver" cssClass="ip"/></td>
        <td>นามสกุล</td>
        <td><form:input path="sername_driver" cssClass="ip"/></td>
      </tr>
      <tr>
        <td><img src="${pageContext.request.contextPath}/assets/img/call.png" class="icon"></td>
        <td></td>
        <td><form:input path="tel_driver" cssClass="ip"/></td>
      </tr>
      <tr>
        <td><img src="${pageContext.request.contextPath}/assets/img/email.png" class="icon"></td>
        <td></td>
        <td><form:input path="email_driver" cssClass="ip" /></td>
      </tr>
    </table>
  </div>

  <div class="Dsub">
    <button type="submit" class="sub">ยืนยันการแก้ไข</button>
    <a href="${pageContext.request.contextPath}/driver-list"><button type="button" class="sub">ยกเลิก</button></a>
<%--    <a href="${pageContext.request.contextPath}/deleteDv/${driver.id_driver}">ลบ</a>--%>
    <%--        <input type="submit" value="ยืนยันการเพิ่ม" class="sub">--%>
    <%--        <input type="reset" value="ยกเลิก" class="sub">--%>
  </div>

</form:form>
</section>


<!-- footer -->
<footer>
  <div class="footer">
    <table>
      <tr>
        <td><img src="${pageContext.request.contextPath}/assets/img/facebook.png" alt="" width="50px" height="50px"></td>
        <td><img src="${pageContext.request.contextPath}/assets/img/mail.png" alt="" width="50px" height="50px"></td>
        <td><img src="${pageContext.request.contextPath}/assets/img/telephone.png" alt="" width="50px" height="50px"></td>
      </tr>
      <tr>
        <td><p>Maejo University</p></td>
        <td><p>Maejo@mju.ac.th</p> </td>
        <td><p>053-873000</p></td>
      </tr>
    </table>
  </div>
</footer>
<!-- footer -->
</body>

</html>
