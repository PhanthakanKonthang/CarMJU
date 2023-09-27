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
        .grid{
            position: relative;
            justify-content: space-around;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
        }
        .listName{
            width: 650px;
            background: #7DA17D;
            margin: 30px auto;
            padding: 2rem;
            border-radius: 25px;

        }
        .data{
            width: 150px;
            background: white;
            border-radius: 15px;
            text-align: center;
        }
        .icon{
            width: 35px;
            height: 35px;
        }
        /*button{*/
        /*    !*margin: auto;*!*/
        /*    width: 70px;*/
        /*}*/
        .addDv{
            margin: 0 auto;
            text-align: center;
        }
        .addDv button{
            width: 200px;
            background: #ffa500;
            border-radius: 20px;
            font-size: 20px;
            transition-duration: 0.4s;
        }
        .addDv button:hover {
            background-color: #fffb00; /* Green */
            color: rgb(0, 0, 0);
        }
        .iconAdd{
            width: 40px;
            height: 40px;
            margin: 0 auto;
        }

        .fbutton{
            height: 35px;
            width: 80px;
            list-style: none;
            border-radius: 15px;
        }
        .fbutton:hover{
            background-color: #ffa500; /* Green */
            color: rgb(0, 0, 0);
            transition-duration: 0.5s;
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
<%

%>
<%--  ListRoute --%>
<section class="routeList">
    <div class="listHead">
        <p>รายการข้อมูลเส้นทางการเดินรถ</p>
    </div>

    <% List<Route> routes = (List<Route>) request.getAttribute("routes"); %>
    <% List<Busstop> busstops = (List<Busstop>) request.getAttribute("busstops"); %>

    <% for (int i = 0; i < routes.size(); i++) { %>
    <div id="route<%=routes.get(i).getId_route()%>" class="listName"> <!-- ให้ div มี id ตรงกับรหัสเส้นทาง -->
        <table>
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/id.png" class="icon"></td>
                <td>รหัส</td>
                <td class="data"><%=routes.get(i).getId_route()%></td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/bus.png" class="icon"></td>
                <td>ชื่อเส้นทาง</td>
                <td class="data"><%=routes.get(i).getName_route()%></td>
                <td></td>
                <td><a href="${pageContext.request.contextPath}/route/<%=routes.get(i).getId_route()%>" ><button>แก้ไขชื่อเส้นทาง</button></a>
                    <a  href="${pageContext.request.contextPath}/deleteRoute/<%=routes.get(i).getId_route()%>"><button>ลบ</button></a></td>

            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><a href="${pageContext.request.contextPath}/addBusstop/<%=routes.get(i).getId_route()%>"/><button>เพิ่มจุดจอดรถ</button></td>
            </tr>

            <% for (int j = 0; j < busstops.size(); j++) { %>
            <% if (routes.get(i).getId_route() == busstops.get(j).getRoute().getId_route()) { %>
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/bus-stop.png" class="icon"></td>
                <td>จุดจอด</td>
                <td class="data"><%=busstops.get(j).getName_busstop()%></td>
                <td><img src="${pageContext.request.contextPath}/assets/img/clock.png" class="icon"></td>
                <td class="data"><%=busstops.get(j).getSpendingtime()%></td>
            </tr>
            <% } %>
            <% } %>
        </table>
    </div>
    <% } %>


    <div class="addDv">
        <a href="${pageContext.request.contextPath}/addRoute">
            <button><i class="fa fa-plus" style="color: black; font-size: 30px; cursor:pointer;" ></i>  เพิ่มชื่อเส้นทางการเดินรถ</button>
        </a>
    </div>
</section>
<%--  ListRoute --%>

<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
