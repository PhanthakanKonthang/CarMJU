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

        .AddRoute{
            text-align: center;
            height: auto;
        }
         .AddRoute button{
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
         .AddRoute button:hover {
            background-color: #fffb00; /* Green */
            color: rgb(0, 0, 0);
        }
         .goAssign{
             text-align: center;
             height: auto;
         }
        .goAssign button{
            width: 215px;
            height: 55px;
            background: #ffa500;
            border-radius: 20px;
            font-size: 16px;
            float: right;
            margin-right: 95px;
            margin-top: 20px;
            transition-duration: 0.4s;
        }
        .goAssign button:hover {
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


    <div class="AddRoute">
        <a href="${pageContext.request.contextPath}/addRoute">
            <button>
                        <img src="${pageContext.request.contextPath}/assets/img/Adds.png" style="width: 30px; ">
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
            <th class="th">มอบหมายหย้าที่คนขับ</th>
        </tr>
        <c:forEach var="route" items="${routespack}">
            <tr class="blockDataRoute" >
                <td class="td">${route.id_route}</td>
                <td class="td">${route.name_route}</td>


                <td class="td"><a href="${pageContext.request.contextPath}/route/${route.id_route}"><img src="${pageContext.request.contextPath}/assets/img/edit.png" style="width: 20px"></a></td>


                <td class="td"><a href="${pageContext.request.contextPath}/deleteRoute/${route.id_route}"
                                  onclick="if(!(confirm('ต้องการลบข้อมูลของ'+ ' ' +  '${route.name_route}' + ' ' +'ใช่หรือไม่'))) return false">
                    <img src="${pageContext.request.contextPath}/assets/img/trash.png" style="width: 20px"></a></td>


                <td class="td"><a href="${pageContext.request.contextPath}/viewBusStopRoute/${route.id_route}"><img src="${pageContext.request.contextPath}/assets/img/file.png" style="width: 20px"></a></td>
                <td class="td"><a href="${pageContext.request.contextPath}/viewRouteTime/${route.id_route}"><img src="${pageContext.request.contextPath}/assets/img/file.png" style="width: 20px"></a></td>


                <td class="td">
                    <a href="${pageContext.request.contextPath}/assignDriver/${route.id_route}">
                    <img src="${pageContext.request.contextPath}/assets/img/addBus.png" style="width: 20px">
                    </a>
                ${route.cars}
<%--                    <c:forEach items="${carByIdRoute}" var="car">--%>
<%--                        ${car.regplate_no}--%>
<%--                    </c:forEach>--%>

                </td>

            </tr>
        </c:forEach>
    </table>

<%--    <div class="goAssign">--%>
<%--        <a href="${pageContext.request.contextPath}/list-assign">--%>
<%--            <button>--%>
<%--                <table>--%>
<%--                    <tr>--%>
<%--                        <td>รายการหน้าที่คนขับ</td>--%>
<%--                        <td style="width: 15px"></td>--%>
<%--                        <td><img src="${pageContext.request.contextPath}/assets/img/right-arrow.png" style="width: 30px; "></td>--%>
<%--                    </tr>--%>
<%--                </table>--%>

<%--            </button>--%>
<%--        </a>--%>
<%--    </div>--%>


</section>
<%--  ListRoute --%>

<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
