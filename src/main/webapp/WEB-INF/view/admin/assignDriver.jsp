<%@ page import="projectmju.model.Car" %><%--
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
    <title>assignDriver</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">


    <style>
        .listHead {
            background: #ffa500;
            margin: 0 auto;
            padding: 10px;
            text-align: center;
            font-size: 20px;
            font-weight: 600;
            width: 23%;
            border-radius: 30px;
        }
        .dRoute{
            width: 500px;
            background: #7DA17D;
            margin: 20px auto;
            padding: 2rem;
            border-radius: 25px;
            text-align: center;
            align-items: center;
        }
        .tRoure{
            margin: 0 auto;
        }
        .data {
            width: 200px;
            background: white;
            border-radius: 15px;
            text-align: center;
        }
        .icon {
            width: 30px;
            height: 30px;
        }

        .selectCarRoute{
            width: 350px;
            text-align: center;
            align-items: center;
            padding: 7px;
            border-radius: 20px;
            margin-top: 25px;
        }
        .selectDriver{
            width: 350px;
            text-align: center;
            align-items: center;
            padding: 7px;
            border-radius: 20px;
            margin-top: 15px;
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
        .sub:hover {
            background-color: #fffb00; /* Green */
            color: rgb(0, 0, 0);
            transition-duration: 0.4s;
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


<section class="routeList">

    <%--    <%Route route = (Route) request.getAttribute("route");%>--%>

    <form action="${pageContext.request.contextPath}/saveCarRoute/${route.id_route}/update" method="post" name="carRoute">

        <div class="listHead">
            <p>เพิ่มรถและคนขับประจำสาย</p>
        </div>

        <div class="dRoute">
            <table class="tRoure">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/id.png" class="icon"></td>
                    <td>รหัส</td>
                    <td class="data">${route.id_route}</td>
                </tr>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/bus.png" class="icon"></td>
                    <td>ชื่อเส้นทาง</td>
                    <td class="data">${route.name_route}</td>
                </tr>
            </table>

            <%Car car = (Car) request.getAttribute("car");%>
            <select class="selectCarRoute" name="selectCarRoute">
                <option value="0">กรุณาเลือกรถประจำเส้นทาง</option>
                <c:forEach var="car" items="${carList}">
                    <option value="${car.regplate_no}" name="regplate_no">${car.regplate_no}</option>
                </c:forEach>
            </select>

            <select class="selectDriver" name="selectDriver">
                <option value="0">กรุณาเลือกคนขับรถประจำเส้นทาง</option>
                <c:forEach var="driver" items="${driverList}">
                    <option value="${driver.id_driver}" name="id_driver">${driver.name_driver} ${driver.sername_driver}</option>
                </c:forEach>
            </select>


<%--            <%Car car = (Car) request.getAttribute("car");%>--%>
<%--            <select class="selectCarRoute" name="selectCarRoute">--%>
<%--                <option value="0">กรุณาเลือกรถประจำเส้นทาง</option>--%>
<%--                <c:forEach var="car" items="${carList}">--%>
<%--                    <option value="${car.regplate_no}" name="regplate_no">${car.regplate_no}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>
        </div>


<div class="Dsub">
    <button type="submit" class="sub">ยืนยันการเพิ่ม</button>
    <a href="${pageContext.request.contextPath}/list-route"><button type="button" class="sub">ยกเลิก</button></a>
</div>

</form>
</section>



</body>
<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</html>
