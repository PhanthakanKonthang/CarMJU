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
        .select{
            width: 350px;
            text-align: center;
            align-items: center;
            padding: 7px;
            border-radius: 20px;
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

<section class="search">
    <table style="margin: auto" >
        <tr>
            <td>
                <select class="select">
                    <option value="0">กรุณาเลือกเส้นทางเดินรถ</option>
                    <option value="1">สีเขียว</option>
                    <option value="2">สีแดง</option>
                    <option value="3">สีฟ้า</option>
                </select>
            </td>
            <td  style="padding-left: 10px">
                <button type="button" style="width: 45px; height: 45px; line-height: 45px; align-items: center; background-color: black; border-radius: 50px; border: 3px solid orange">
                    <i class="fa fa-search" style="color: white; font-size: 25px; cursor:pointer;" ></i>
                </button>
            </td>
        </tr>
    </table>

</section>



<!-- footer -->
<footer>
    <div class="footer">
        <table>
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/facebook.png" alt="" width="50px" height="50px"></td>
                <td><img src="${pageContext.request.contextPath}/assets/img/mail.png" alt="" width="50px" height="50px"></td>
                <td><img src="${pageContext.request.contextPath}/assets/img/telephone.png" alt="" width="50px" height="50px"></td>
            </tr>
            <tr>
                <td><p>Maejo University</p></td>
                <td><p>Maejo@mju.ac.th</p> </td>
                <td><p>053-873000</p></td>
            </tr>
        </table>
    </div>
</footer>
<!-- footer -->
</body>

</html>
