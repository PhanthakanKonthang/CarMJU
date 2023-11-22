<%@ page import="projectmju.model.Driver" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/6/2566
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>editDriver</title>

  <link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">

  <style>
    .edit{
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
    .pedit{
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
      margin-bottom: 5px;
    }
    .alertText{
      align-items: center;
      margin: 10px auto;
      text-align: center;
      padding: 10px;
      border-radius: 10px;
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

<c:if test="${not empty Error}">
  <div class="alertText" style="background-color: red; color: white;">
    <strong>แก้ไขข้อมูลไม่สำเร็จ:</strong> ${Error}
  </div>
  <script>
    // Remove the error message after 3 seconds
    setTimeout(function () {
      document.querySelector('.alert').style.display = 'none';
    }, 10000);
  </script>
</c:if>

<%--  AddDriver --%>
<section class="CssSection">

  <%Driver driver = (Driver) request.getAttribute("driver");%>
<form:form action="${pageContext.request.contextPath}/updateDriver/${driver.id_driver}" modelAttribute="driver" method="POST" name="formUpdateDriver" onsubmit="return validateForm();">
  <div class="edit">
    <p class="pedit">แก้ไขข้อมูลคนขับรถ</p>
    <br>
    <table style="margin: 0 auto">
                        <tr>
          <td>รหัส</td>
          <td><input type="text" id="id_driver" name="id_driver" readonly="true" value="<%=driver.getId_driver()%>" Class="ip"/></td>
                        </tr>
      <tr>
        <td>ชื่อ</td>
        <td><input type="text" id="name_driver" name="name_driver" value="<%=driver.getName_driver()%>" Class="ip"/></td>

        <td>นามสกุล</td>
        <td><input type="text" id="sername_driver" name="sername_driver" value="<%=driver.getSername_driver()%>" Class="ip"/></td>
      </tr>
      <tr>
        <td>เบอร์โทร</td>
        <td><input type="text" id="tel_driver" name="tel_driver" value="<%=driver.getTel_driver()%>" Class="ip"/></td>
        <td>อีเมล</td>
        <td><input type="text" id="email_driver" name="email_driver" value="<%=driver.getEmail_driver()%>" Class="ip"/></td>
      </tr>
    </table>
  </div>

  <div class="Dsub">
    <button type="submit" class="sub">ยืนยันการแก้ไข</button>
    <a href="${pageContext.request.contextPath}/driver-list"><button type="button" class="sub">ยกเลิก</button></a>
  </div>

</form:form>
</section>
<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

<script>

  // เช็ค input name
  document.getElementById('name_driver').addEventListener('input', function() {
    let name_driver = this.value;

    // ตรวจสอบว่าข้อมูลไม่เป็นค่าว่าง
    if (name_driver.trim() === '') {
      this.setCustomValidity('กรุณากรอกข้อมูล');
    } else if (!/^[ก-๏\s]+$/.test(name_driver)) {
      // ตรวจสอบว่าประกอบด้วยตัวอักษรภาษาไทยเท่านั้น
      this.setCustomValidity('กรุณากรอกตัวอักษรภาษาไทยเท่านั้น');
    } else if (name_driver.length < 2 || name_driver.length > 100) {
      // ตรวจสอบว่ามีอักขระเป็นจำนวนไม่น้อยกว่า 2 และไม่เกิน 100
      this.setCustomValidity('จำนวนตัวอักษรต้องไม่น้อยกว่า 2 และไม่เกิน 100');
    } else if (name_driver.includes(' ')) {
      // ตรวจสอบว่าไม่มีช่องว่างระหว่างตัวอักษร
      this.setCustomValidity('ไม่สามารถมีช่องว่างระหว่างตัวอักษรได้');
    } else {
      // ตรวจสอบผ่านทั้งหมด
      this.setCustomValidity('');
    }
  });



  // เช็ค input sername_driver
  document.getElementById('sername_driver').addEventListener('input', function() {
    let sername_driver = this.value;

    // ตรวจสอบว่าข้อมูลไม่เป็นค่าว่าง
    if (sername_driver.trim() === '') {
      this.setCustomValidity('กรุณากรอกข้อมูล');
    } else if (!/^[ก-๏\s]+$/.test(sername_driver)) {
      // ตรวจสอบว่าประกอบด้วยตัวอักษรภาษาไทยเท่านั้น
      this.setCustomValidity('กรุณากรอกตัวอักษรภาษาไทยเท่านั้น');
    } else if (sername_driver.length < 2 || sername_driver.length > 100) {
      // ตรวจสอบว่ามีอักขระเป็นจำนวนไม่น้อยกว่า 2 และไม่เกิน 100
      this.setCustomValidity('จำนวนตัวอักษรต้องไม่น้อยกว่า 2 และไม่เกิน 100');
    } else if (sername_driver.includes(' ')) {
      // ตรวจสอบว่าไม่มีช่องว่างระหว่างตัวอักษร
      this.setCustomValidity('ไม่สามารถมีช่องว่างระหว่างตัวอักษรได้');
    } else {
      // ตรวจสอบผ่านทั้งหมด
      this.setCustomValidity('');
    }
  });

  //เช็ค tel_driver
  document.getElementById('tel_driver').addEventListener('input', function () {
    let tel_driver = this.value;

    // ตรวจสอบว่าเป็นตัวเลขเท่านั้น
    if (!/^\d+$/.test(tel_driver)) {
      this.setCustomValidity('กรุณาใส่เฉพาะตัวเลข');
    } else if (!/^(06|08|09)/.test(tel_driver)) {
      this.setCustomValidity('เบอร์โทรศัพท์ต้องขึ้นต้นด้วย 06, 08, หรือ 09');
    } else if (tel_driver.length !== 10) {
      this.setCustomValidity('เบอร์โทรศัพท์ต้องมี 10 ตัว');
    } else if (/\s/.test(tel_driver)) {
      this.setCustomValidity('ไม่ควรมีช่องว่างในเบอร์โทรศัพท์');
    } else if (tel_driver.trim() === '') {
      this.setCustomValidity('กรุณากรอกข้อมูล');
    } else
      this.setCustomValidity(''); // ล้างข้อความข้อผิดพลาด

  });


  //เช็ค email_driver
  document.getElementById('email_driver').addEventListener('input', function () {
    let email_driver = this.value;

    // เช็คว่า email ประกอบด้วยตัวอักษรภาษาอังกฤษ (A-Z , a-z) และอักษรพิเศษ (@, -, _, . ) เท่านั้น
    const validCharacters = /^[A-Za-z0-9@\-_\.]+$/;

    // เช็คว่ามี @ ได้แค่ 1 ตัว
    const atSymbolCount = (email_driver.match(/@/g) || []).length;

    // เช็คว่ามีอักขระเป็นจำนวนไม่น้อยกว่า 3 และไม่เกิน 100
    const lengthCheck = email_driver.length >= 3 && email_driver.length <= 100;

    // เช็คว่า email อยู่ในรูปแบบ @gmail.com , @hotmail.com , @mju.ac.th
    const validDomains = /@(gmail\.com|hotmail\.com|mju\.ac\.th)$/;

    // เช็คว่าไม่มีช่องว่างระหว่างตัวอักษร
    const noSpaces = !/\s/.test(email_driver);

    // ห้ามเป็นค่าว่าง
    const notEmpty = email_driver.trim() !== '';

    // ตรวจสอบทุกเงื่อนไข
    if (
            validCharacters.test(email_driver) &&
            atSymbolCount === 1 &&
            lengthCheck &&
            validDomains.test(email_driver) &&
            noSpaces &&
            notEmpty
    ) {
      // อีเมลถูกต้อง
      this.setCustomValidity('');
    } else {
      // อีเมลไม่ถูกต้อง
      this.setCustomValidity('รูปแบบอีเมลไม่ถูกต้อง');
    }
  });

  function validateForm() {
    const name = document.getElementById("name_driver").value;
    const sername = document.getElementById("sername_driver").value;
    const tel = document.getElementById("tel_driver").value;
    const email = document.getElementById("email_driver").value;

    if (name === "" || sername === "" || tel === "" || email === "") {
      alert("กรุณากรอกข้อมูลให้ครบ");
      return false; // ยกเลิกการส่งข้อมูล
    }
    return true; // ส่งข้อมูลเมื่อข้อมูลถูกต้อง
  }


</script>

</html>
