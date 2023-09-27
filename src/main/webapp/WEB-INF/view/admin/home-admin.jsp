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
    <title>home-admin</title>

    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">

    <style>
        .p{
            font-size: 18px;
            text-align: center;
            align-items: center;
            width: 130px;
        }
        .choose{
            width: 260px;
            height: 30px;
            border-radius: 13px;
            text-align: center;
            align-items: center;
            font-size: 18px;
        }
        .ICsearch{
            width: 20px;
            height: 20px;
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

<section class="main">
    <div class="plan">
        <table style="margin: auto">
            <tr>
                <td>
                    <p style="font-size: 30px">วางแผนการเดินทาง</p>
                </td>
            </tr>
        </table>

        <table style="margin: auto;  margin-top: 30px;">
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/location.png" width="40px" height="40px"></td>
                <td> <p class="p">ต้นทาง</p> </td>
                <td></td>
                <td>
                    <select class="choose">
                        <option>โรงเทิดกสิกร</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/building.png" width="40px" height="40px"></td>
                <td> <p class="p">ปลายทาง</p> </td>
                <td></td>
                <td>
                    <select class="choose">
                        <option>คณะบริหารธุระกิจ</option>
                    </select>
                </td>
            </tr>
        </table>
        <br><br>
        <center>
            <button type="submit" class="button"><img src="${pageContext.request.contextPath}/assets/img/Search.png" class="ICsearch">ค้นหา</button>
            <button type="reset" class="button">ยกเลิก</button>
        </center>
    </div>
</section>


<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>

