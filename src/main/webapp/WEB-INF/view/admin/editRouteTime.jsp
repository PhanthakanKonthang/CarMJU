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
    <title>editRouteTime</title>

    <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">

    <style>
        .add {
            background: #7DA17D;
            margin: 0 auto;
            padding: 2rem;
            width: 650px;
            border-radius: 30px;
        }

        .icon {
            width: 35px;
            height: 35px;
        }

        .pAdd {
            margin: 0 auto;
            background: #ffa500;
            text-align: center;
            padding: 10px;
            width: 250px;
            font-size: 18px;
            font-weight: 500;
            border-radius: 30px;
        }

        .Dsub {
            align-items: center;
            text-align: center;
            padding: 15px;
        }

        .sub {
            padding: 10px;
            font-size: 18px;
            border-radius: 20px;
            cursor: pointer;
            background: #ffa500;
            margin: 0 auto;
            align-items: center;
        }

        .sub:hover {
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
        .ipStartTime{
            width: 150px;
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
<section class="CssSection">


    <%Busstop busstop = (Busstop) request.getAttribute("busstop");%>
    <%Route route = (Route) request.getAttribute("route");%>

    <form action="${pageContext.request.contextPath}/${routeTime.round_no}/updateRouteTime" method="POST"
          onsubmit="return validateForm()">
        <%--  <form action="${pageContext.request.contextPath}/saveRouteTime/${id_route}"  method="POST">--%>
        <div class="add">
            <p class="pAdd">แก้ไขเวลาเริ่มเดินรถ</p>
            <br>
            <table style="margin: 0 auto">

    <tr>
        <td><img src="${pageContext.request.contextPath}/assets/img/clock.png" class="icon"></td>
        <td>เวลาเริ่ม</td>
        <td><input type="time" name="startTime" id="startTime" class="ipStartTime" value="${routeTime.start_time}"/></td>
        <td style="width: 30px"></td>
        <td>สถานะ</td>
        <td>
            <select class="ip" id="status" name="status" >
                <option value="เปิดใช้งาน">เปิดใช้งาน</option>
                <option value="ปิดใช้งาน">ปิดใช้งาน</option>
            </select>
        </td>
    </tr>

            </table>
        </div>

        <div class="Dsub">
            <button type="submit" class="sub">ยืนยันการเพิ่ม</button>
            <a href="${pageContext.request.contextPath}/viewRouteTime/${routeTime.route.id_route}">
                <button type="button" class="sub">ยกเลิก</button>
            </a>
        </div>
    </form>

    <%--    <form action="${pageContext.request.contextPath}/saveRouteTime/${id_route}" method="POST" onsubmit="return validateForm()">--%>
    <%--      <div class="add">--%>
    <%--        <p class="pAdd"></p>--%>
    <%--        <br>--%>
    <%--        <table style="margin: 0 auto">--%>
    <%--          <tr>--%>
    <%--            <td><img src="${pageContext.request.contextPath}/assets/img/bus-stop.png" class="icon"></td>--%>
    <%--            <td><input type="text" name="startTime" id="startTime" placeholder="HH:mm:ss" class="ip" /></td>--%>
    <%--            <td><img src="${pageContext.request.contextPath}/assets/img/clock.png" class="icon"></td>--%>
    <%--            <td><input type="text" name="status" id="status" class="ip" /></td>--%>
    <%--          </tr>--%>
    <%--        </table>--%>
    <%--      </div>--%>
    <%--      <div class="Dsub">--%>
    <%--        <button type="submit" class="sub">ยืนยันการเพิ่ม</button>--%>
    <%--        <a href="${pageContext.request.contextPath}/viewRouteTime/${id_route}"><button type="button" class="sub">ยกเลิก</button></a>--%>
    <%--      </div>--%>
    <%--    </form>--%>

    <%--    <!-- JavaScript Validation -->--%>
    <%--    <script>--%>
    <%--      function validateForm() {--%>
    <%--        var startTimeInput = document.getElementById("startTime").value;--%>
    <%--        var statusInput = document.getElementById("status").value;--%>
    <%--        var timePattern = /^([01]\d|2[0-3]):([0-5]\d):([0-5]\d)$/;--%>

    <%--        if (!timePattern.test(startTimeInput)) {--%>
    <%--          alert("รูปแบบเวลาไม่ถูกต้อง โปรดใส่เวลาในรูปแบบ HH:mm:ss");--%>
    <%--          return false;--%>
    <%--        }--%>

    <%--        // ตรวจสอบเงื่อนไขอื่น ๆ ที่คุณต้องการ--%>
    <%--        // เช่น การตรวจสอบความถูกต้องของ statusInput--%>

    <%--        return true;--%>
    <%--      }--%>
    <%--    </script>--%>

</section>

<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

<script>

    //เช็ค startTime
    document.getElementById('startTime').addEventListener('input', function() {
        let startTime = this.value;

        if (startTime === '') {
            // 1. ห้ามเป็นค่าว่าง
            this.setCustomValidity('กรุณากรอกเวลา');
        } else if (!isValidTime(startTime)) {
            // 2. อยู่ในรูปแบบของเวลา type="time" เท่านั้น
            this.setCustomValidity('กรุณากรอกเวลาให้ถูกต้องและต้องอยู่ในช่วง 08:00 น. ถึง 16:00 น.');
        } else {
            this.setCustomValidity('');
        }
    });

    function isValidTime(time) {
        // ตรวจสอบว่าเวลาถูกต้องตามรูปแบบ type="time" (HH:MM)
        const timePattern = /^(0[8-9]|1[0-5]):[0-5][0-9]$/;
        return timePattern.test(time);
    }
    // function isValidTime(time) {
    //     // ตรวจสอบว่าเวลาถูกต้องตามรูปแบบ type="time" (HH:MM)
    //     const timePattern = /^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/;
    //     return timePattern.test(time);
    // }
    //เช็ค startTime

    //เช็ค status
    document.getElementById('status').addEventListener('input', function() {
        let status = this.value;

        if (status === '') {
            // ห้ามเป็นค่าว่าง
            this.setCustomValidity('กรุณาเลือกสถานะ');
        } else {
            this.setCustomValidity('');
        }
    });


    function validateForm() {
        var startTime = document.getElementById("startTime").value;
        var status = document.getElementById("status").value;

        if (startTime === "" || status === "") {
            alert("กรุณากรอกข้อมูลให้ครบทุกช่อง");
            return false; // ไม่ส่งฟอร์มไปยังเซิร์ฟเวอร์
        }
        // ถ้าข้อมูลถูกต้อง ส่งฟอร์มไปยังเซิร์ฟเวอร์
        return true;
    }
</script>

</html>

