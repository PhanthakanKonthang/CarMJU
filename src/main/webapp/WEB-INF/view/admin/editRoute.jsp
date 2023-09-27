<%@ page import="projectmju.model.Route" %><%--
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
    <title>editRoute</title>

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
            width: 35%;
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
<jsp:include page="/WEB-INF/view/admin/nav-admin.jsp"/>
<!-- Navbar -->

<%--  AddDriver --%>
<section class="addDriver">


    <%Route route = (Route) request.getAttribute("route");%>
    <form action="${pageContext.request.contextPath}/updateRoute/${route.id_route}" modelAttribute="route" method="POST" name="formUpdateRoute">
        <div class="add">
            <p class="pAdd">แก้ไขข้อมูลเส้นทางการเดินรถ</p>
            <br>
            <table style="margin: 0 auto">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/id.png" class="icon"></td>
                    <td>รหัส</td>
                    <td><input  readonly="true"  value="<%=route.getId_route()%>" class="ip"/></td>
                </tr>

                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/bus.png" class="icon"></td>
                    <td>เส้นทางการเดินรถ</td>
                    <td><input type="text"  value="<%=route.getName_route()%> " id="nameRoute" name="nameRoute" class="ip"/></td>
                </tr>

            </table>
        </div>

        <div class="Dsub">
            <button type="submit" class="sub">ยืนยันการแก้ไข</button>
            <a href="${pageContext.request.contextPath}/list-route"><button type="button" class="sub">ยกเลิก</button></a>
            <%--        <button type="submit" class="sub">ยืนยันการเพิ่ม</button>--%>
            <%--        <button type="reset" class="sub">ยกเลิก</button>--%>
            <%--        <input type="submit" value="ยืนยันการเพิ่ม" class="sub">--%>
            <%--        <input type="reset" value="ยกเลิก" class="sub">--%>
        </div>

    </form>
</section>


<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>
