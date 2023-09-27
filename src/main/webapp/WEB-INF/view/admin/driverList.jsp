<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2566
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>listDriver</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">


    <style>
        .listHead{
            background: #ffa500;
            margin: 0 auto;
            padding: 10px;
            text-align: center;
            font-size: 20px;
            font-weight: 600;
            width: 20%;
            border-radius: 30px;
        }

        .addButton{
            text-align: center;
        }

        .addButton .AddBusStop{
            width: 200px;
            background: #ffa500;
            border-radius: 20px;
            font-size: 16px;
            float: right;
            margin-right: 80px;
            margin-bottom: 10px;
            transition-duration: 0.5s;
        }

        .addButton .AddBusStop:hover{
            background-color: #fffb00;
            color: rgb(0, 0, 0);
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
        <p>รายการข้อมูลคนขับรถ</p>
    </div>

<%--    <div>--%>
<%--        <a href="${pageContext.request.contextPath}/addDriver"><button style="width: 80px; float: right; margin-right: 80px; background-color: #FFFFFF;margin-bottom: 10px">--%>
<%--            <img src="${pageContext.request.contextPath}/assets/img/add.png" style="width: 30px; ">เพิ่มข้อมูลคนขับรถ</button></a>--%>
<%--    </div>--%>
    <div class="addButton">
        <a href="${pageContext.request.contextPath}/addDriver">
            <button type="button" class="AddBusStop">
                <table>
                    <tr>
                        <td><img src="${pageContext.request.contextPath}/assets/img/add.png" style="width: 30px;"></td>
                        <td>เพิ่มข้อมูลคนขับรถ</td>
                    </tr>
                </table>
            </button>
        </a>
    </div>

                <table >
                    <tr>
                        <th class="th">รหัสคนขับรถ</th>
                        <th class="th">ชื่อ</th>
                        <th class="th">นามสกุล</th>
                        <th class="th">เบอรโทร</th>
                        <th class="th">อีเมล</th>
                        <th class="th">แก้ไข</th>
                        <th class="th">ลบ</th>
                    </tr>
                    <c:forEach var="driver" items="${driversPack}">
                        <tr class="blockDataDriver" >
                            <td class="td">${driver.id_driver}</td>
                            <td class="td">${driver.name_driver}</td>
                            <td class="td">${driver.sername_driver}</td>
                            <td class="td">${driver.tel_driver}</td>
                            <td class="td">${driver.email_driver}</td>

                            <td class="td"><a href="${pageContext.request.contextPath}/driver/${driver.id_driver}"><img src="${pageContext.request.contextPath}/assets/img/edit.png" style="width: 20px"></a></td>
                            <td class="td"><a href="${pageContext.request.contextPath}/deleteDv/${driver.id_driver}"><img src="${pageContext.request.contextPath}/assets/img/trash.png" style="width: 20px"></a></td>
                        </tr>
                    </c:forEach>
                </table>

</section>
<%--  ListDriver --%>


</body>
<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</html>
