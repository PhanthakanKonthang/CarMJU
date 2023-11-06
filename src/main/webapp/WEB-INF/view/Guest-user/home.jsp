<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- แปลงจาก HH:mm:ss == HH:mm -->

<%@ page import="java.util.Collections" %>
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
        .main9 .resultSearch{
            background: rgba(125, 161, 125, 0.62);
            width: 560px;
            border-radius: 13px;
            align-items: center;
            text-align: center;
            padding: 2rem;
            margin-bottom: 15px;
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

<section class="main9">
    <c:forEach items="${routes}" var="route">
    <div class="resultSearch">
        <div>

                <%--                        ชื่อเส้นทาง--%>
            <h1>${route.name_route}</h1>

            <c:forEach items="${route.cars}" var="car">
                <table>
                    <tr>
                        <td><h3>คนขับรถ : ${car.driver.name_driver} ${car.driver.sername_driver}</h3></td>
                        <td style="width: 25px"></td>
                        <td><h3>ทะเบียนรถ : ${car.regplate_no}</h3></td>
                    </tr>
                </table>
            </c:forEach>
        </div>

        <div>
            <table>
                <tr>
                    <c:forEach items="${route.routetimetable}" var="routetimetable">
                        <%--            <td>--%>
                        <%--                <h3>รอบ : ${routetimetable.start_time}</h3>--%>
                        <%--            </td>--%>
                        <td>
                            <h3>รอบ : <fmt:formatDate value="${routetimetable.start_time}" pattern="HH:mm" /> น.</h3>
                        </td>
                        <td style="width: 20px">
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </div>

        <div>
            <c:forEach items="${route.busstops}" var="busstop">
                <table>
                    <tr>
                        <td>
                            <c:if test="${busstop.name_busstop.equals(start_point_name)}">
                                <h3>ต้นทาง : ${busstop.name_busstop}</h3>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${busstop.name_busstop.equals(destination_name)}">
                                <h3>ปลายทาง : ${busstop.name_busstop}</h3>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </c:forEach>
        </div>

        <div style="background: rgba(255,165,0,0.75); width: 170px; border-radius: 15px">
            <h4>ใช้เวลา : ${intervals.get(route.name_route)} นาที</h4>
        </div>

    </div>
    </c:forEach>
</section>



<%--<c:forEach items="${routeTime}" var="route">--%>
<%--    <div>--%>
<%--            &lt;%&ndash;                        ชื่อเส้นทาง&ndash;%&gt;--%>
<%--        <h1>${route.route.name_route}</h1>--%>

<%--        <c:forEach items="${route.route.cars}" var="car">--%>
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <td><h3>คนขับรถ : ${car.driver.name_driver} ${car.driver.sername_driver}</h3></td>--%>
<%--                    <td style="width: 25px"></td>--%>
<%--                    <td><h3>ทะเบียนรถ : ${car.regplate_no}</h3></td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>

<%--    <div>--%>
<%--        <c:forEach items="${route.route.routetimetable}" var="routetimetable">--%>
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <td><h2>${routetimetable.start_time}</h2></td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <c:forEach items="${route.route.busstops}" var="busstop">--%>
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <td>--%>
<%--                        <c:if test="${busstop.name_busstop.equals(start_point_name)}">--%>
<%--                            <h3>ต้นทาง : ${busstop.name_busstop}</h3>--%>
<%--                        </c:if>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <c:if test="${busstop.name_busstop.equals(destination_name)}">--%>
<%--                            <h3>ปลายทาง : ${busstop.name_busstop}</h3>--%>
<%--                        </c:if>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
<%--    <h4>ใช้เวลา : ${intervals.get(route.route)} นาที</h4>--%>
<%--    </div>--%>
<%--</c:forEach>--%>



<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>

