<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2566
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>listAssign</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">


    <style>
        .listHead {
            background: #ffa500;
            margin: 0 auto 35px;
            padding: 10px;
            text-align: center;
            font-size: 20px;
            font-weight: 600;
            width: 20%;
            border-radius: 30px;
        }

        table {
            border-collapse: collapse;
            margin: 0 auto;
            width: 90%;
        }

        .th, .td {
            text-align: left;
            padding: 8px;
        }

        .th {
            background-color: #7DA17D;
            color: white;
        }

        .blockDataDriver:nth-child(even) {
            background-color: rgba(125, 161, 125, 0.18);
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

<%--  ListDriver --%>
<section class="driverList">
    <div class="listHead">
        <p>รายการมอบหมายหน้าที่คนขับ</p>
    </div>
    <div>
        <table>
            <tr>
                <th class="th">รหัสคนขับรถ</th>
                <th class="th">ชื่อ</th>
                <th class="th">นามสกุล</th>

                <th class="th">ทะเบียนรถ</th>
                <th class="th">เส้นทาง</th>

                <th class="th">แก้ไขหน้าที่คนขับ</th>
            </tr>
            <c:forEach var="car" items="${carListDriver}">
                <tr class="blockDataDriver">
                    <td class="td">${car.driver.id_driver}</td>
<%--                    <td class="td">${car.driver}</td>--%>
<%--                    <td class="td">${car.driver.sername_driver}</td>--%>
<%--                    <td class="td">${car.regplate_no}</td>--%>
<%--                    <td class="td">${car.route.name_route}</td>--%>
<%--                    <td class="td"><a href="${pageContext.request.contextPath}/carRoute/${car.driver.id_driver}"><img src="${pageContext.request.contextPath}/assets/img/addBus.png" style="width: 20px"></a></td>--%>

                </tr>
            </c:forEach>
        </table>
    </div>
</section>
<%--  ListDriver --%>


</body>
<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</html>
