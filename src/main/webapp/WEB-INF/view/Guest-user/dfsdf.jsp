<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- แปลงจาก HH:mm:ss == HH:mm -->

<%@ page import="java.util.Collections" %>
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
        }
        .choose{
            width: 250px;
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
        .main9 .resultSearch{
            background: rgba(125, 161, 125, 0.62);
            width: 560px;
            border-radius: 13px;
            align-items: center;
            text-align: center;
            padding: 2rem;
            margin: 0 auto 15px;
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

        <form action="${pageContext.request.contextPath}/search-result" method="POST" onsubmit="return validateForm();">
            <table style="margin: auto;  margin-top: 30px;">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/location.png" width="40px" height="40px"></td>
                    <td style="width: 200px"> <p class="p">ระบุสถานีต้นทาง</p> </td>
                    <td></td>
                    <td>
                        <select name="start_point" id="start_point" class="choose">
                            <option value="เลือกต้นทาง">--กรุณาเลือกต้นทาง--</option>
                            <c:forEach items="${busStopp}" var="busStops">
                                <c:choose>
                                    <c:when test="${busStops.name_busstop eq start_point_name}">
                                        <option value="${busStops.name_busstop}" selected> ${busStops.name_busstop}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${busStops.name_busstop}"> ${busStops.name_busstop}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/assets/img/building.png" width="40px" height="40px"></td>
                    <td style="width: 200px"> <p class="p">ระบุสถานีปลายทาง</p> </td>
                    <td></td>
                    <td>
                        <select name="destination" id="destination" class="choose">
                            <option value="เลือกต้นทาง">--กรุณาเลือกปลายทาง--</option>
                            <c:forEach items="${busStopp}" var="busStops">
                                <c:choose>
                                    <c:when test="${busStops.name_busstop eq destination_name}">
                                        <option value="${busStops.name_busstop}" selected> ${busStops.name_busstop}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${busStops.name_busstop}"> ${busStops.name_busstop}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
            <br><br>
            <center>
                <button type="submit" class="button"><img src="${pageContext.request.contextPath}/assets/img/SearchView.png" class="ICsearch">ค้นหา</button>
                <%--                <button type="reset" class="button">ยกเลิก</button>--%>
                <a href="${pageContext.request.contextPath}/">
                    <button type="button" class="button">ย้อนกลับ</button>
                </a>
            </center>
        </form>
    </div>
</section>


<section class="main9">
    <c:forEach items="${routes}" var="route">
        <c:choose>
            <c:when test="${not empty intervals.get(route.name_route) && intervals.get(route.name_route) > 0}">
                <div class="resultSearch">
                    <div>
                        <h1>${route.name_route}</h1>
                        <c:forEach items="${route.cars}" var="car">
                            <table>
                                <tr>
                                    <td><h3>คนขับรถ : ${car.driver.name_driver} ${car.driver.sername_driver}</h3></td>
                                    <td style="width: 25px"></td>
                                    <td><h3>ทะเบียนรถ : ${car.regplate_no}</h3></td>
                                </tr>
                            </table>
                        </c:forEach>
                    </div>

                    <div>
                        <table>
                            <tr>
                                <c:forEach items="${routesTimeTableByRoute}" var="routetimetable">
                                    <c:if test="${routetimetable.route.id_route == route.id_route}">
                                        <td>
                                            <h3>รอบ : <fmt:formatDate value="${routetimetable.start_time}" pattern="HH:mm" /> น.</h3>
                                        </td>
                                        <td style="width: 20px"></td>
                                    </c:if>
                                </c:forEach>
                            </tr>
                        </table>
                    </div>

                    <div>

                        <table>
                            <tr style="margin-bottom: 5px">
                                <td style="background-color: #d0f8ce; border-radius: 7px">
                                    <h3>ต้นทาง : ${start_point_name}</h3>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #f9bdbb; border-radius: 7px">
                                    <h3>ปลายทาง : ${destination_name}</h3>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div style="background: rgba(255,165,0,0.75); width: 170px; border-radius: 15px">
                        <h4>ใช้เวลา : ${intervals.get(route.name_route)} นาที</h4>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="resultSearch" style="background: red; border-radius: 10px;">
                    <p>ไม่พบเส้นทาง</p>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</section>



<!-- footer -->
<jsp:include page="/WEB-INF/view/Guest-user/footer.jsp"/>
<!-- footer -->
</body>

<script>


    function validateForm() {
        const start_point = document.getElementById("start_point").value;
        const destination = document.getElementById("destination").value;


        if (start_point === "เลือกต้นทาง" || destination === "เลือกปลายทาง") {
            alert("โปรดเลือกต้นทางและปลายทาง");
            return false; // ยกเลิกการส่งข้อมูล
        } else if (start_point === destination ){
            alert("โปรดอย่าเลือกจุดต้นทางและปลายทางซ้ำกัน");
            return false;
        }

        return true; // ส่งข้อมูลเมื่อข้อมูลถูกต้อง
    }


</script>

</html>

