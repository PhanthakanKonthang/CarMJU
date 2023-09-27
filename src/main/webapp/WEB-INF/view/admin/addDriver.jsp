<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2566
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>addDriver</title>

    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">

    <style>
        .add{
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
        .pAdd{
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
<%--<nav>--%>
<%--    <ul>--%>
<%--        <li><a href="home.jsp">หน้าหลัก</a></li>--%>
<%--        <li><a href="viewRoute.jsp">เส้นทางเดินรถ</a></li>--%>
<%--    </ul>--%>
<%--</nav>--%>
<jsp:include page="/WEB-INF/view/admin/nav-admin.jsp"/>
<!-- Navbar -->

<%--  AddDriver --%>
<section class="addDriver">

    <form:form action="${pageContext.request.contextPath}/saveDriver" modelAttribute="driver" method="POST" name="formAddDriver">
    <div class="add">
        <p class="pAdd">เพิ่มข้อมูลคนขับรถ</p>
        <br>
        <table style="margin: 0 auto">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/id.png" class="icon"></td>
                    <td>รหัส</td>
                    <td><form:input path="id_driver" cssClass="ip"/></td>
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
                    <td>เบอร์โทร</td>
                    <td><form:input path="tel_driver" cssClass="ip"/></td>
                </tr>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/email.png" class="icon"></td>
                    <td>อีเมล</td>
                    <td><form:input path="email_driver" cssClass="ip"/></td>
                </tr>
        </table>
    </div>

    <div class="Dsub">
        <button type="submit" class="sub">ยืนยันการเพิ่ม</button>
        <a href="${pageContext.request.contextPath}/driver-list"><button type="button" class="sub">ยกเลิก</button></a>

    </div>

</form:form>
</section>


<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
