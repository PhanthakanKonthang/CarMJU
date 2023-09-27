<%@ page import="projectmju.model.Route" %>
<%@ page import="projectmju.model.Busstop" %><%--
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
    <title>editBusstop</title>

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
            width: 250px;
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

    <%--  <%Busstop busstop = (Busstop) request.getAttribute("busstop");%>--%>
    <%--  <%Route route = (Route) request.getAttribute("route");%>--%>

        <%Busstop busstop = (Busstop) request.getAttribute("busStop");%>
    <form action="${pageContext.request.contextPath}/${busStop.id_busstop}/updateBusStop"  method="POST" >
        <div class="add">
            <p class="pAdd">เพิ่มจุดจอดรถ</p>

            <br>
            <table style="margin: 0 auto">

                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/bus-stop.png" class="icon"></td>
                    <td><input type="text" name="nameBussTop" id="nameBussTop"  class="ip" value="${busStop.name_busstop}"/></td>
                    <td><img src="${pageContext.request.contextPath}/assets/img/clock.png" class="icon"></td>
                    <td><input type="text" name="spendingTime" id="spendingTime"  class="ip" value="${busStop.spendingtime}"/></td>
                </tr>

            </table>
        </div>

        <div class="Dsub">
            <button type="submit" class="sub">ยืนยันการเพิ่ม</button>
            <a href="${pageContext.request.contextPath}/viewBusStopRoute/${busStop.route.id_route}"><button type="button" class="sub">ยกเลิก</button></a>
        </div>

    </form>
</section>


<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
