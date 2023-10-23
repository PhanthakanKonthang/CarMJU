<%@ page import="projectmju.model.Route" %>
<%@ page import="org.springframework.web.bind.annotation.GetMapping" %>
<%@ page import="java.util.List" %>
<%@ page import="projectmju.model.Busstop" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>

    <title>listRoute</title>

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
            width: 23%;
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

        .blockDataRoute:nth-child(even) {
            background-color: rgba(125, 161, 125, 0.18);
        }

        .addButton{
            text-align: center;
            height: auto;
        }
         .addButton button{
            width: 65px;
             height: 55px;
            background: #ffa500;
            border-radius: 20px;
            font-size: 16px;
            float: right;
            margin-right: 95px;
            margin-bottom: 10px;
            transition-duration: 0.4s;

        }
         .addButton button:hover {
            background-color: #fffb00; /* Green */
            color: rgb(0, 0, 0);
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
    <div class="listHead">
        <p>รายการข้อมูลเส้นทางการเดินรถ</p>
    </div>


    <div class="addButton">
        <a href="${pageContext.request.contextPath}/addRoute">
            <button>
                        <img src="${pageContext.request.contextPath}/assets/img/Adds.png" style="width: 30px; ">
                </table>


            </button>
        </a>
    </div>


    <table >
        <tr>
            <th class="th">รหัสเส้นทางการเดินรถ</th>
            <th class="th">ชื่อเส้นทางการเดินรถ</th>
            <th class="th">แก้ไขชื่อเส้นทาง</th>
            <th class="th">ลบเส้นทาง</th>
            <th class="th">รายละเอียดจุดจอด</th>
            <th class="th">รายละเอียดเวลาเดินรถ</th>
        </tr>
        <c:forEach var="route" items="${routespack}">
            <tr class="blockDataRoute" >
                <td class="td">${route.id_route}</td>
                <td class="td">${route.name_route}</td>
<%--                <td class="td">${driver.sername_driver}</td>--%>
<%--                <td class="td">${driver.tel_driver}</td>--%>
<%--                <td class="td">${driver.email_driver}</td>--%>

                <td class="td"><a href="${pageContext.request.contextPath}/route/${route.id_route}"><img src="${pageContext.request.contextPath}/assets/img/edit.png" style="width: 20px"></a></td>
                <td class="td"><a href="${pageContext.request.contextPath}/deleteRoute/${route.id_route}"><img src="${pageContext.request.contextPath}/assets/img/trash.png" style="width: 20px"></a></td>
                <td class="td"><a href="${pageContext.request.contextPath}/viewBusStopRoute/${route.id_route}"><img src="${pageContext.request.contextPath}/assets/img/file.png" style="width: 20px"></a></td>
                <td class="td"><a href="${pageContext.request.contextPath}/viewRouteTime/${route.id_route}"><img src="${pageContext.request.contextPath}/assets/img/file.png" style="width: 20px"></a></td>
            </tr>
        </c:forEach>
    </table>


</section>
<%--  ListRoute --%>

<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
