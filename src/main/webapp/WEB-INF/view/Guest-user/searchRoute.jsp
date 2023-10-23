<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="projectmju.model.Routetimetable" %>
<%@ page import="projectmju.model.Busstop" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="projectmju.model.Route" %><%--
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
            background-color: #7DA17D;
            color: white;
            text-align: center;
        }

        .blockDataRoute:nth-child(even) {
            background-color: rgba(125, 161, 125, 0.18);
        }

        .dataBusAndRoute {
            border-collapse: collapse;
            margin: 0 auto;
            width: 80%;
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
        <%--<c:forEach var="route" items="${route}">--%>
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
<%--                <td style="padding-left: 10px">--%>
<%--                    <button type="submit"--%>
<%--                            style="width: 45px; height: 45px; line-height: 45px; align-items: center; background-color: black; border-radius: 50px; border: 3px solid orange">--%>
<%--                        <i class="fa fa-search" style="color: white; font-size: 25px; cursor:pointer;"></i>--%>
<%--                    </button>--%>
<%--                </td>--%>
            </tr>
        </table>
        <%--</c:forEach>--%>
    </form>


    <%
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");

        List<Routetimetable> routetimetables = (List<Routetimetable>) request.getAttribute("routeTimeTable");
        List<Busstop> busstops = (List<Busstop>) request.getAttribute("busstop");
        List<Route> routes = (List<Route>) request.getAttribute("route");

        Date roundOne = routetimetables.get(0).getStart_time();
        Date roundTwo = routetimetables.get(1).getStart_time();
        Date roundThree = routetimetables.get(2).getStart_time();

        Calendar calendar1 = Calendar.getInstance();
        Calendar calendar2 = Calendar.getInstance();
        Calendar calendar3 = Calendar.getInstance();

        System.out.println(routetimetables.size());

    %>


    <table class="dataBusAndRoute">
        <thead>
        <th class="thData" style="width: 130px">ลำดับจุดจอด</th>
        <th class="thData">ชื่อจุดจอด</th>
        <th class="thData">รอบที่ 1</th>
        <th class="thData">รอบที่ 2</th>
        <th class="thData">รอบที่ 3</th>
        </thead>
        <tbody>
        <c:set var="busStopCounter" value="0" scope="page"/>
        <% for (int i = 0; i < busstops.size(); i++) {
            Busstop busStop = busstops.get(i);%>

        <c:set var="busStopCounter" value="${busStopCounter + 1}" scope="page"/>

        <tr class="blockDataRoute">

            <td class="tdData">ลำดับ ${busStopCounter} </td>
            <td class="tdData"><%= busStop.getName_busstop()%></td>
            <% calendar1.setTime(roundOne);
                calendar1.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());
                roundOne = calendar1.getTime();
            %>
            <td class="tdData"> <%=dateFormat.format(roundOne) %> </td>

            <% calendar2.setTime(roundTwo);
                calendar2.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());
                roundTwo = calendar2.getTime();
            %>
            <td class="tdData"> <%=dateFormat.format(roundTwo) %> </td>

            <% calendar3.setTime(roundThree);
                calendar3.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());
                roundThree = calendar3.getTime();
            %>
            <td class="tdData"> <%=dateFormat.format(roundThree) %></td>
        </tr>

        <%}%>
        </tbody>
    </table>
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
