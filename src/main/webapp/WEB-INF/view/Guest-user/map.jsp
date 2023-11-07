<%@ page import="org.springframework.ui.Model" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2566
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>map</title>

    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">

    <style>

        .dImg {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* ความสูงเท่ากับความสูงของหน้าเว็บ */

        }

        .mapImg {
            width: 1200px;
            height: 700px;
            border-radius: 15px;
            border: 10px solid #000;
        }
        /*.mapImg{*/
        /*    width: 1200px;*/
        /*    height: 700px;*/
        /*    border-radius: 15px;*/
        /*}*/
        /*.dImg{*/
        /*    align-items: center;*/
        /*    margin: 0 auto;*/
        /*}*/

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
<%--<nav>--%>
<jsp:include page="/WEB-INF/view/Guest-user/nav.jsp"/>
<!-- Navbar -->

<section class="main">
    <div class="dImg">
        <center>
            <img src="${pageContext.request.contextPath}/assets/img/map.jpg" class="mapImg">
        </center>
    </div>
</section>

<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>



</html>
