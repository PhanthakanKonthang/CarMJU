<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2566
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home-index</title>

    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">

    <style>
        .p{
            font-size: 18px;
            text-align: center;
            align-items: center;
        }
        .choose{
            width: 250px;
            height: 30px;
            border-radius: 13px;
            text-align: center;
            align-items: center;
            font-size: 18px;
        }
        .ICsearch{
            width: 20px;
            height: 20px;
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
<jsp:include page="/WEB-INF/view/Guest-user/nav.jsp"/>
<!-- Navbar -->

<section class="main">
    <div class="plan">
        <table style="margin: auto">
            <tr>
                <td>
                    <p style="font-size: 30px">วางแผนการเดินทาง</p>
                </td>
            </tr>
        </table>
        <form action="${pageContext.request.contextPath}/search-result" method="POST">
        <table style="margin: auto;  margin-top: 30px;">
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/location.png" width="40px" height="40px"></td>
                <td style="width: 200px"> <p class="p">ระบุสถานีต้นทาง</p> </td>
                <td></td>
                <td>

                    <select class="choose" name="start_point">
                        <c:forEach items="${busStop}" var="busStops">
                        <option> ${busStops}</option>
                        </c:forEach>
                    </select>

                </td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/building.png" width="40px" height="40px"></td>
                <td style="width: 200px"> <p class="p">ระบุสถานีปลายทาง</p> </td>
                <td></td>
                <td>

                    <select class="choose" name="destination">
                        <c:forEach items="${busStop}" var="busStops">
                        <option>${busStops}</option>
                        </c:forEach>
                    </select>

                </td>
            </tr>
        </table>
            <br><br>
            <center>
                <button type="submit" class="button"><img src="${pageContext.request.contextPath}/assets/img/SearchView.png" class="ICsearch">ค้นหา</button>
                <button type="reset" class="button">ยกเลิก</button>
            </center>
        </form>

    </div>

</section>

<div>
    <c:forEach items="${routes}" var="route">

        <h1>${route.name_route}</h1>

        <c:forEach items="${route.cars}" var="car">
            <h2>${car.driver.name_driver}</h2>
            <h2>${car.regplate_no}</h2>
        </c:forEach>

        <c:forEach items="${route.routetimetable}" var="routetimetable">
            <h2>${routetimetable.start_time}</h2>
        </c:forEach>

        <c:forEach items="${route.busstops}" var="busstop">

            <c:if test="${busstop.name_busstop.equals(start_point_name)}">
                <h4>Start Point : ${busstop.name_busstop}</h4>
            </c:if>

            <c:if test="${busstop.name_busstop.equals(destination_name)}">
                <h4>Destination : ${busstop.name_busstop}</h4>
            </c:if>

        </c:forEach>

        <h4>ใช่เวลา ${intervals.get(route.name_route)} นาที</h4>
    </c:forEach>
</div>

<%--    <div>--%>
<%--        <c:forEach items="${routes}" var="route">--%>

<%--            <h1>${route.name_route}</h1>--%>

<%--            <c:forEach items="${route.cars}" var="car">--%>
<%--                <h2>${car.driver.name_driver}</h2>--%>
<%--                <h2>${car.regplate_no}</h2>--%>
<%--            </c:forEach>--%>

<%--            <c:forEach items="${route.routetimetable}" var="routetimetable">--%>
<%--                <h2>${routetimetable.start_time}</h2>--%>
<%--            </c:forEach>--%>

<%--            <c:forEach items="${route.busstops}" var="busstop">--%>
<%--                <c:if test="${busstop.name_busstop.equals(start_point_name)}">--%>
<%--                    <h4>Start Point : ${busstop.name_busstop}</h4>--%>
<%--                </c:if>--%>
<%--                <c:if test="${busstop.name_busstop.equals(destination_name)}">--%>
<%--                    <h4>Destination : ${busstop.name_busstop}</h4>--%>
<%--                </c:if>--%>

<%--            </c:forEach>--%>
<%--            <h4>ใช่เวลา ${intervals.get(route.name_route)} นาที</h4>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>


<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>

