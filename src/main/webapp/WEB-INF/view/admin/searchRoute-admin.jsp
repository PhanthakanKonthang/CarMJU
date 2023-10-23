<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="projectmju.model.Routetimetable" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="projectmju.model.Busstop" %>
<%@ page import="java.text.SimpleDateFormat" %>
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

    <title>searchRoute</title>

    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .select {
            width: 350px;
            text-align: center;
            align-items: center;
            padding: 7px;
            border-radius: 20px;
        }

        .showData {
            margin: 0 auto;
            align-items: center;
            text-align: center;
        }

        .tRoure {
            margin: 0 auto;
        }

        .tBusStop {
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

        .blockDataRoute:nth-child(even) {
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

<section class="search">
    <form method="GET" action="${pageContext.request.contextPath}/searchRoute-admin">
        <%--<c:forEach var="route" items="${route}">--%>
        <table style="margin: auto">
            <tr>
                <td>
                    <select class="select" name="id_route">
                        <option>กรุณาเลือกเส้นทาง</option>

                            <option value=""></option>

                    </select>

                </td>
                <td style="padding-left: 10px">
                    <button type="submit"
                            style="width: 45px; height: 45px; line-height: 45px; align-items: center; background-color: black; border-radius: 50px; border: 3px solid orange">
                        <i class="fa fa-search" style="color: white; font-size: 25px; cursor:pointer;"></i>
                    </button>
                </td>
            </tr>
        </table>
        <%--</c:forEach>--%>
    </form>


    <%
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");

        List<Routetimetable> routetimetables = (List<Routetimetable>) request.getAttribute("routeTimeTable");
        List<Busstop> busstops = (List<Busstop>) request.getAttribute("busstop");

        Date roundOne = routetimetables.get(0).getStart_time();
        Date roundTwo = routetimetables.get(1).getStart_time();
        Date roundThree = routetimetables.get(2).getStart_time();

        Calendar calendar1 = Calendar.getInstance();
        Calendar calendar2 = Calendar.getInstance();
        Calendar calendar3 = Calendar.getInstance();


    %>

    <table class="tBusStop">
        <thead>
        <th>1</th>
        <th>2</th>
        <th>3</th>
        </thead>
        <tbody>
        <% for (int i = 0; i < busstops.size(); i++) {%>

        <tr>
            <% calendar1.setTime(roundOne);
                calendar1.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());
                roundOne = calendar1.getTime();
            %>
            <td> <%=dateFormat.format(roundOne) %> </td>

            <% calendar2.setTime(roundTwo);
                calendar2.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());
                roundTwo = calendar2.getTime();
            %>
            <td> <%=dateFormat.format(roundTwo) %> </td>

            <% calendar3.setTime(roundThree);
                calendar3.add(Calendar.MINUTE, busstops.get(i).getSpendingtime());
                roundThree = calendar3.getTime();
            %>
            <td> <%=dateFormat.format(roundThree) %></td>
        </tr>

        <%}%>
        </tbody>
    </table>


    <%--    <c:if test="${not empty busstop}">--%>
    <%--        <div class="bBusStop">--%>
    <%--    <table class="tBusStop">--%>
    <%--        <tr>--%>
    <%--            <th class="th">จุดจอด</th>--%>
    <%--            <th class="th">เวลา</th>--%>
    <%--            <th class="th">เวลา</th>--%>
    <%--            <th class="th">เวลา</th>--%>

    <%--        </tr>--%>
    <%--<c:forEach var="busStop" items="${busstop}">--%>
    <%--                <tr class="blockDataRoute">--%>
    <%--                    <td class="td">${busStop.name_busstop}</td>--%>
    <%--                    <td class="td">${busStop.spendingtime}</td>--%>
    <%--                    <td class="td">${busStop.spendingtime}</td>--%>
    <%--                    <td class="td">${busStop.spendingtime}</td>--%>

    <%--                </tr>--%>
    <%--</c:forEach>--%>
    <%--    </table>--%>
    <%--    </div></c:if>--%>

</section>
<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
