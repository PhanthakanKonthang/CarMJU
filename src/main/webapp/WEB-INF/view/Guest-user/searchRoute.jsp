<%-- Import Java classes and set date format --%>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="projectmju.model.Routetimetable" %>
<%@ page import="projectmju.model.Busstop" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="projectmju.model.Route" %>
<%@ page import="java.util.*" %><%--
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

    <title>searchRoute</title>

    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .searchBox{
            margin: 0 auto 20px;
        }
        .select{
            width: 350px;
            text-align: center;
            align-items: center;
            padding: 7px;
            border-radius: 20px;
        }

        .dataBusAndRoute, .thData, .tdData{ /* ใส่เส้นตาราง*/
            border: 1px solid black;


        }
        .thData, .tdData {
            text-align: left;
            padding: 8px;
        }

        .thData {
            background-color: ${primaryColorCode};
            color: white;
            text-align: center;
        }
        .blockDataRoute:nth-child(even) {
            background-color: ${secondaryColorCode};
        }
        .dataBusAndRoute {
            border-collapse: collapse;
            margin: 0 auto;
            width: 80%;
        }
        .showRouteName{
        text-align: center;
        width: 350px;
        background: ${primaryColorCode};;
        margin: 20px auto;
        padding: 10px;
        border-radius: 25px;
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

<section class="search">
    <form method="GET" action="${pageContext.request.contextPath}/searchRoute">
        <table class="searchBox">
            <tr>
                <td>

                    <select class="select" name="id_route" onchange="submitForm()">
                        <option>กรุณาเลือกเส้นทาง</option>
                        <c:forEach var="routes" items="${route}">
                            <option value="${routes.id_route}">${routes.name_route}</option>
                        </c:forEach>
                    </select>

                </td>
            </tr>
        </table>
    </form>

<%--    <%--%>
<%--        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");--%>

<%--        List<Routetimetable> routetimetables = (List<Routetimetable>) request.getAttribute("routeTimeTable");--%>
<%--        List<Busstop> busstops = (List<Busstop>) request.getAttribute("busstop");--%>
<%--        List<Route> routes = (List<Route>) request.getAttribute("route");--%>

<%--        Date roundOne = routetimetables.get(0).getStart_time();--%>
<%--        Date roundTwo = routetimetables.get(1).getStart_time();--%>
<%--        Date roundThree = routetimetables.get(2).getStart_time();--%>

<%--        Calendar calendar1 = Calendar.getInstance();--%>
<%--        Calendar calendar2 = Calendar.getInstance();--%>
<%--        Calendar calendar3 = Calendar.getInstance();--%>

<%--        System.out.println(routetimetables.size());--%>

<%--    %>--%>

<%--    <table class="dataBusAndRoute">--%>
<%--        <thead>--%>
<%--        <th class="thData" style="width: 130px">ลำดับจุดจอด</th>--%>
<%--        <th class="thData">ชื่อจุดจอด</th>--%>
<%--        <th class="thData">รอบที่ 1</th>--%>
<%--        <th class="thData">รอบที่ 2</th>--%>
<%--        <th class="thData">รอบที่ 3</th>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:set var="busStopCounter" value="0" scope="page"/>--%>
<%--        <% for (int i = 0; i < busstops.size(); i++) {--%>
<%--            Busstop busStop = busstops.get(i);%>--%>


<%--        <c:set var="busStopCounter" value="${busStopCounter + 1}" scope="page"/>--%>

<%--        <tr class="blockDataRoute">--%>

<%--            <td class="tdData">ลำดับ ${busStopCounter} </td>--%>
<%--            <td class="tdData"><%= busStop.getName_busstop()%></td>--%>
<%--            <% calendar1.setTime(roundOne);--%>
<%--                calendar1.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());--%>
<%--                roundOne = calendar1.getTime();--%>
<%--            %>--%>
<%--            <td class="tdData"> <%=dateFormat.format(roundOne) %> </td>--%>

<%--            <% calendar2.setTime(roundTwo);--%>
<%--                calendar2.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());--%>
<%--                roundTwo = calendar2.getTime();--%>
<%--            %>--%>
<%--            <td class="tdData"> <%=dateFormat.format(roundTwo) %> </td>--%>

<%--            <% calendar3.setTime(roundThree);--%>
<%--                calendar3.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());--%>
<%--                roundThree = calendar3.getTime();--%>
<%--            %>--%>
<%--            <td class="tdData"> <%=dateFormat.format(roundThree) %></td>--%>
<%--        </tr>--%>
<%--        <%}%>--%>
<%--        </tbody>--%>
<%--    </table>--%>



    <%
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");

        List<Routetimetable> routetimetables = (List<Routetimetable>) request.getAttribute("routeTimeTable");
        List<Busstop> busstops = (List<Busstop>) request.getAttribute("busstop");
        List<Route> routes = (List<Route>) request.getAttribute("route");

        // Check if routetimetables is not empty
        if (routetimetables != null && !routetimetables.isEmpty()) {
            int numberOfRounds = routetimetables.size();

            Calendar[] calendars = new Calendar[numberOfRounds];
            Date[] rounds = new Date[numberOfRounds];

            // Initialize calendars and rounds
            for (int i = 0; i < numberOfRounds; i++) {
                calendars[i] = Calendar.getInstance();
                rounds[i] = routetimetables.get(i).getStart_time();
            }

    %>

    <%--    แสดงชื่อเส้นทางที่เลือก     --%>
    <div class="showRouteName">
        <h3>
        ชื่อเส้นทาง:
        <c:choose>
            <c:when test="${not empty param.id_route}">
                <c:forEach var="route" items="${route}">
                    <c:if test="${param.id_route eq route.id_route}">
                        ${route.name_route}
                    </c:if>
                </c:forEach>
            </c:when>
            <c:otherwise>
                เลือกเส้นทาง
            </c:otherwise>
        </c:choose>
        </h3>
    </div>

<%--    แสดงชื่อเส้นทางที่เลือก     --%>

    <c:if test="${routeTimeTable != null}">
        <table class="dataBusAndRoute">
            <thead>
            <th class="thData" style="width: 130px">ลำดับจุดจอด</th>
            <th class="thData">ชื่อจุดจอด</th>
            <% for (int i = 0; i < numberOfRounds; i++) { %>
            <th class="thData">รอบที่ <%= i + 1 %></th>
            <% } %>
            </thead>
            <tbody>
            <c:set var="busStopCounter" value="0" scope="page"/>
            <%
                for (int i = 0; i < busstops.size(); i++) {
                    Busstop busStop = busstops.get(i);
            %>

            <c:set var="busStopCounter" value="${busStopCounter + 1}" scope="page"/>

            <tr class="blockDataRoute">
                <td class="tdData">ลำดับ ${busStopCounter} </td>
                <td class="tdData"><%= busStop.getName_busstop() %></td>
                <% for (int round = 0; round < numberOfRounds; round++) {
                    calendars[round].setTime(rounds[round]);
                    calendars[round].add(Calendar.MINUTE, busstops.get(i).getSpendingtime());
                    rounds[round] = calendars[round].getTime();
                %>
                <td class="tdData"> <%= dateFormat.format(rounds[round]) %> </td>
                <% } // End of round loop
                %>
            </tr>
            <%
                } // End of bus stop loop
            %>
            </tbody>
        </table>
    </c:if>

    <%
        } else {
            // Handle the case where routetimetables is empty
            System.out.println("No route timetables available.");
        }
    %>


</section>

<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->

<script>
    function submitForm () {
        document.forms[0].submit();
    }
</script>
</body>

</html>