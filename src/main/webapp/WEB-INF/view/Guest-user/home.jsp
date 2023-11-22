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
            /*background: rgba(125, 161, 125, 0.62);*/
            width: 560px;
            border-radius: 13px;
            border-style: solid;
            align-items: center;
            /*text-align: center;*/
            padding: 2rem;
            margin: 0 auto 15px;
        }

    </style>
</head>

<body onload="">
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
                        <c:forEach items="${busStopNoDes}" var="busStops">
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
<%--                    <select class="choose" name="start_point" id="start_point" >--%>
<%--                        <option value="เลือกต้นทาง">เลือกต้นทาง</option>--%>
<%--                        <c:forEach items="${busStop}" var="busStops">--%>
<%--                        <option> ${busStops}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>

                </td>
            </tr>
            <tr>
                <td><img src="${pageContext.request.contextPath}/assets/img/building.png" width="40px" height="40px"></td>
                <td style="width: 200px"> <p class="p">ระบุสถานีปลายทาง</p> </td>
                <td></td>
                <td>
                    <select name="destination" id="destination" class="choose">
                        <option value="เลือกปลายทาง">--กรุณาเลือกปลายทาง--</option>
                        <c:forEach items="${busStopNoStart}" var="busStops">
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
<%--                    <select class="choose" name="destination" id="destination">--%>
<%--                        <option value="เลือกปลายทาง">เลือกปลายทาง</option>--%>
<%--                        <c:forEach items="${busStop}" var="busStops">--%>
<%--                        <option>${busStops}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>
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
        <script>
            for (let i = 0; i < ${route.busstops.size()}; i++) {
                if (i === 0) {
                    console.log("Start point " + (i+1));
                }
                if (i === ${route.busstops.size()} - 1) {
                    console.log("Destination " + (i+1));
                }
            }
        </script>

        <c:choose>

            <c:when test="${not empty intervals.get(route.name_route) && intervals.get(route.name_route) >= 0}">
<%--            <c:when test="${intervals != null}">--%>
                <div class="resultSearch" style="background-color: ${secondaryColorCode.get(route.name_route)}">
                    <div>
                        <h1 style="color: ${routeColors.get(route.name_route)}; text-align: center; align-items: center">
                                ${route.name_route}
                        </h1>
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
                        </table>
                    </div>

                    <div style="background: rgb(229,172,92); width: 170px; border-radius: 15px; margin-top: 20px; text-align: center">
                        <h4>ใช้เวลาเดินทาง : ${intervals.get(route.name_route)} นาที</h4>
                    </div>

                    <div style="margin-top: 20px">
                        <table>
                            <tr>
<%--                                <c:forEach items="${route.busstops}" var="busstop">--%>


<%--                                    <c:if test="${busstop.id_busstop == route.busstops.get(0).id_busstop}">--%>
<%--                                        <h3>ต้นทาง :</h3>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${busstop.id_busstop == route.busstops.get(route.busstops.size() - 1).id_busstop}">--%>
<%--                                        <h3>ปลายทาง :</h3>--%>
<%--                                    </c:if>--%>
<%--                                    <h3>${busstop.name_busstop}</h3>--%>
<%--&lt;%&ndash;                                <td style="width: 20px"></td>&ndash;%&gt;--%>
<%--                                </c:forEach>--%>



<%--    <c:forEach items="${route.busstops}" var="busstop">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${busstop.id_busstop == route.busstops.get(0).id_busstop}">--%>
<%--                <h3 style="background-color: #d0f8ce;display: inline-block; width: auto; border-radius: 8px;">--%>
<%--                    ต้นทาง : ${busstop.name_busstop}--%>
<%--                </h3>--%>
<%--            </c:when>--%>
<%--            <c:when test="${busstop.id_busstop == route.busstops.get(route.busstops.size() - 1).id_busstop}">--%>
<%--                <h3 style="background-color: #ef8181; display: inline-block; width: auto; border-radius: 8px;">--%>
<%--                    ปลายทาง : ${busstop.name_busstop}--%>
<%--                </h3>--%>
<%--            </c:when>--%>

<%--            <c:otherwise>--%>
<%--                <c:set var="busStopCounter" value="0" scope="page"/>--%>
<%--                <c:set var="busStopCounter" value="${busStopCounter + 1}" scope="page"/>--%>
<%--                <h3>จุดจอดที่ ${busStopCounter}</h3>--%>
<%--                <h3>${busstop.name_busstop}</h3>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </c:forEach>--%>
    <c:forEach items="${route.busstops}" var="busstop" varStatus="loop">
        <c:choose>
            <c:when test="${loop.index == 0}">
                <table>
                    <tr>
                        <td>
                <img src="${pageContext.request.contextPath}/assets/img/location.png" width="35px" height="35px">
                        </td>
                        <td>
                <h3 style="background-color: #d0f8ce; display: inline-block; width: auto; border-radius: 8px;">
                    ต้นทาง : ${busstop.name_busstop}
                </h3>
                        </td>
                    </tr>
                </table>
            </c:when>
            <c:when test="${loop.index == route.busstops.size() - 1}">
    <table>
        <tr>
            <td>

                <img src="${pageContext.request.contextPath}/assets/img/building.png" width="35px" height="35px">
            </td>
            <td>
                <h3 style="background-color: #ef8181; display: inline-block; width: auto; border-radius: 8px;">
                    ปลายทาง : ${busstop.name_busstop}
                </h3>
            </td>
        </tr>
    </table>

            </c:when>
            <c:otherwise>
    <table>
        <tr>
            <td style="width: 35px"></td>
            <td>
                <h3>จุดที่ ${loop.index} :${busstop.name_busstop}</h3>
            </td>
        </tr>
    </table>
            </c:otherwise>
        </c:choose>
    </c:forEach>
                            </tr>
                        </table>
                    </div>

<%--                    <div style="background: rgb(229,172,92); width: 170px; border-radius: 15px; margin-top: 20px; text-align: center">--%>
<%--                        <h4>ใช้เวลาเดินทาง : ${intervals.get(route.name_route)} นาที</h4>--%>
<%--                    </div>--%>
                </div>
            </c:when>


            <c:otherwise>
                <div class="resultSearch" style="background: red; border-radius: 10px;">
                    <p>ไม่พบเส้นทาง</p>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${intervals != null && intervals.size() == 0}">
        <div class="resultSearch" style="background: red; border-radius: 10px;">
            <p>ไม่พบเส้นทาง</p>
        </div>
    </c:if>
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

