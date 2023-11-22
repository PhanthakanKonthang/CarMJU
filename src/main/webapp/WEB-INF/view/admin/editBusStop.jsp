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
        .ipTime{
            width: 80px;
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

    <%--  <%Busstop busstop = (Busstop) request.getAttribute("busstop");%>--%>
    <%--  <%Route route = (Route) request.getAttribute("route");%>--%>

        <%Busstop busstop = (Busstop) request.getAttribute("busStop");%>
    <form action="${pageContext.request.contextPath}/${busStop.id_busstop}/updateBusStop"  method="POST"
          name="editBusStop" onsubmit="return validateForm();">
        <div class="add">
            <p class="pAdd">แก้ไขจุดจอดรถ</p>

            <br>
            <table style="margin: 0 auto">

                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/bus-stop.png" class="icon"></td>
                    <td> ชื่อจุดจอด </td>
                    <td><input type="text" name="nameBussTop" id="nameBussTop"  class="ip" value="${busStop.name_busstop}"/></td>
                    <td style="width: 30px"></td>
                    <td><img src="${pageContext.request.contextPath}/assets/img/clock.png" class="icon"></td>
                    <td> ระยะเวลา </td>
                    <td><input type="text" name="spendingTime" id="spendingTime"  class="ipTime" value="${busStop.spendingtime}"/></td>
                    <td> นาที </td>
                </tr>

            </table>
        </div>

        <div class="Dsub">
            <button type="submit" class="sub">ยืนยันการแก้ไข</button>
            <a href="${pageContext.request.contextPath}/viewBusStopRoute/${busStop.route.id_route}"><button type="button" class="sub">ยกเลิก</button></a>
        </div>

    </form>
</section>


<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

<SCRIPT>
    // เช็ค nameBussTop
    // document.getElementById('nameBussTop').addEventListener('input', function() {
    //   let nameBussTop = this.value;
    //
    //   // 1. ห้ามเป็นค่าว่าง
    //   if (nameBussTop.trim() === '') {
    //     this.setCustomValidity('กรุณากรอกข้อมูล');
    //
    //   // 2. สามารถเป็น อักขระภาษาไทย ภาษาอังกฤษ และตัวเลขได้ทุกตัว
    //   } else if (/^[a-zA-Z0-9ก-๏\s]+$/.test(nameBussTop)){
    //     this.setCustomValidity('กรุณากรอกข้อมูลให็ที่ถูกต้อง');
    //
    //   //  3. มีจำนวนอักขระไม่น้อยกว่า 1 และไม่เกิน 100 ตัวอักษร
    //   } else if (nameBussTop.length < 1 || nameBussTop.length > 100){
    //     this.setCustomValidity('กรุณากรอกข้อมูลที่มีความยาวระหว่าง 1 ถึง 100 ตัวอักษร');
    //   }else {
    //     this.setCustomValidity('');
    //
    //   }
    // });

    document.getElementById('nameBussTop').addEventListener('input', function() {
        let nameBussTop = this.value;

        // 1. ห้ามเป็นค่าว่าง
        if (nameBussTop.trim() === '') {
            this.setCustomValidity('กรุณากรอกข้อมูล');
        } else {
            this.setCustomValidity('');

            // 2. สามารถเป็น อักขระภาษาไทย ภาษาอังกฤษ และตัวเลขได้ทุกตัว
            // const pattern = /^[a-zA-Z0-9ก-๏\s]+$/;
            const pattern = /^[a-zA-Z0-9ก-๏\s!@#$%^&*()+=_\-[\]{};':"\\|,.<>/?]+$/;
            if (!pattern.test(nameBussTop)) {
                this.setCustomValidity('กรุณากรอกอักขระที่ถูกต้อง');
            } else {
                this.setCustomValidity('');

                // 3. มีจำนวนอักขระไม่น้อยกว่า 1 และไม่เกิน 100 ตัวอักษร
                if (nameBussTop.length < 1 || nameBussTop.length > 100) {
                    this.setCustomValidity('กรุณากรอกข้อมูลที่มีความยาวระหว่าง 1 ถึง 100 ตัวอักษร');
                } else {
                    this.setCustomValidity('');

                }
            }
        }
    });

    document.getElementById('spendingTime').addEventListener('input', function() {
        let spendingTime = this.value;

        // 1. เช็คว่าเป็นตัวเลขเท่านั้น
        if (!/^\d+$/.test(spendingTime)) {
            this.setCustomValidity('กรุณากรอกข้อมูลเป็นตัวเลขเท่านั้น');
        } else {
            // ตรวจสอบขนาด 1-2 ตัวเท่านั้น
            if (spendingTime.length < 1 || spendingTime.length > 2) {
                this.setCustomValidity('กรุณาต้องกรอกข้อมูล ไม่เกิน 2 ตัว');
            } else {
                // 3. ล้างข้อความข้อผิดพลาดในกรณีที่ถูกต้อง
                this.setCustomValidity('');
            }

            // 4. ตรวจสอบห้ามเป็นค่าว่าง
            if (spendingTime.trim() === '') {
                this.setCustomValidity('กรุณากรอกข้อมูล');
            }
        }
    });

    function validateForm() {
        const nameBussTop = document.getElementById("nameBussTop").value;
        const spendingTime = document.getElementById("spendingTime").value;


        if (nameBussTop === "" || spendingTime === "" ) {
            alert("กรุณากรอกข้อมูลให้ครบ");
            return false; // ยกเลิกการส่งข้อมูล
        }
        return true; // ส่งข้อมูลเมื่อข้อมูลถูกต้อง
    }



</SCRIPT>

</html>
