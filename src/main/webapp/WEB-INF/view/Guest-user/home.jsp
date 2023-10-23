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
    <title>Home-index</title>

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

        /* สไตล์สำหรับปุ่ม Popup */
        .popup-button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        /* สไตล์สำหรับหน้าต่าง Popup */
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .popup-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
            <button type="submit" class="button"><img src="${pageContext.request.contextPath}/assets/img/SearchView.png" class="ICsearch">ค้นหา</button>
            <button type="reset" class="button">ยกเลิก</button>
        </center>
    </div>

</section>


<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

</html>

