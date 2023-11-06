<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="projectmju.model.Route" %>
<%@ page import="java.util.List" %>
<%@ page import="projectmju.model.Busstop" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/5/2023
  Time: 2:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ViewBusStopRoute</title>

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

        .dRoute {
            width: 400px;
            background: #7DA17D;
            margin: 20px auto;
            padding: 2rem;
            border-radius: 25px;
        }

        .tRoure {
            margin: 0 auto;
        }


        .taBusStopRoute {
            border-collapse: collapse;
            margin: 0 auto;
            width: 90%;
        }

        .thDataBusStopRoute, .tdDataBusStopRoute {
            text-align: left;
            padding: 8px;
        }

        .thDataBusStopRoute {
            background-color: #7DA17D;
            color: white;
        }

        .blockDataBusStopRoute:nth-child(even) {
            background-color: rgba(125, 161, 125, 0.18);
        }

        .data {
            width: 150px;
            background: white;
            border-radius: 15px;
            text-align: center;
        }

        .icon {
            width: 25px;
            height: 25px;
        }

        .addButton {
            text-align: center;
        }

        .addButton .AddBusStop {
            width: 65px;
            height: 55px;
            background: #ffa500;
            border-radius: 20px;
            font-size: 16px;
            float: right;
            margin-right: 95px;
            margin-bottom: 10px;
            transition-duration: 0.5s;
        }

        .addButton .AddBusStop:hover {
            background-color: #fffb00;
            color: rgb(0, 0, 0);
        }

        .backTo {
            width: 110px;
            height: 30px;
            background: #ffa500;
            border-radius: 20px;
            font-size: 16px;
            margin-top: 5%;
            transition-duration: 0.5s;
        }

        .backTo:hover {
            background-color: #fffb00;
            color: rgb(0, 0, 0);
        }

        footer{
            color: white;
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

<%--  ListRoute --%>
<section class="routeList">

    <%Route route = (Route) request.getAttribute("route");%>
    <%Busstop busstop = (Busstop) request.getAttribute("busStop");%>

    <form action="${pageContext.request.contextPath}/viewBusStopRoute/${route.id_route}" modelAttribute="route"
          method="get" name="formViewBusStopRoute">

        <div class="listHead">
            <p>รายละเอียดจุดจอดรถ</p>
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
        </div>

        <div class="addButton">
            <a href="${pageContext.request.contextPath}/addBusStop/${route.id_route}">
                <button type="button" class="AddBusStop">
                    <img src="${pageContext.request.contextPath}/assets/img/locationAdd.png" style="width: 35px;">
                </button>
            </a>
        </div>


        <div class="divBusStopRoute">
            <table class="taBusStopRoute">
                <tr>
                    <th class="thDataBusStopRoute">ลำดับจุดจอด</th>
                    <th class="thDataBusStopRoute">ชื่อจุดจอด</th>
                    <th class="thDataBusStopRoute"><img src="${pageContext.request.contextPath}/assets/img/clock.png" class="icon">
                        ระยะเวลา
                    </th>
                    <th class="thDataBusStopRoute">แก้ไข</th>
                    <th class="thDataBusStopRoute">ลบ</th>
                </tr>

                <!-- สร้างตัวแปรเพื่อเก็บค่าลำดับจุดจอด -->
                <c:set var="busStopCounter" value="0" scope="page"/>

                <c:forEach var="busStop" items="${busStops}">
                    <c:if test="${route.id_route == busStop.route.id_route}">
                        <!-- เพิ่มค่าลำดับจุดจอดขึ้นที่ละ 1 -->
                        <c:set var="busStopCounter" value="${busStopCounter + 1}" scope="page"/>
                        <tr class="blockDataBusStopRoute">
                            <!-- แสดงลำดับจุดจอดที่ -->
                            <td class="tdDataBusStopRoute">
                                <img src="${pageContext.request.contextPath}/assets/img/bus-stop.png" class="icon">
                                จุดจอดที่ ${busStopCounter}
                            </td>

                            <!-- แสดงข้อมูลจุดจอดอื่น ๆ -->
                            <td class="tdDataBusStopRoute">${busStop.name_busstop}</td>
                            <td class="tdDataBusStopRoute">${busStop.spendingtime} นาที</td>
                            <td class="tdDataBusStopRoute"><a
                                    href="${pageContext.request.contextPath}/eDitBusStop/${busStop.id_busstop}"><img
                                    src="${pageContext.request.contextPath}/assets/img/edit.png"
                                    style="width: 20px"></a></td>

                            <td class="tdDataBusStopRoute">
                                <a href="${pageContext.request.contextPath}/${busStop.id_busstop}/deleteBusStop"
                                   onclick="if(!(confirm('ต้องการลบจุดจอด'+ ' ' +'${busStop.name_busstop}' + ' ' + 'ของ'+ ' ' + '${busStop.route.name_route}' +' ' +'ใช่หรือไม่'))) return false">
                                <img src="${pageContext.request.contextPath}/assets/img/trash.png" style="width: 20px">
                                </a>
                            </td>
                        </tr>
                        </c:if>
                </c:forEach>

            </table>
        </div>

        <div style="text-align: center;">
            <a href="${pageContext.request.contextPath}/list-route">
                <button type="button" class="backTo">ย้อนกลับ</button>
            </a>
        </div>

    </form>
</section>
<%--  ListRoute --%>

<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>
</html>
