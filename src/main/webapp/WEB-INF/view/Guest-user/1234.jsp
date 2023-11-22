<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/16/2023
  Time: 12:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <section class="main9">
        <c:forEach items="${routes}" var="route">
            <c:choose>
                <c:when test="${not empty intervals.get(route.name_route) && intervals.get(route.name_route) >= 0}">
                    <%--            <c:when test="${intervals != null}">--%>
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
                                        <%--                                <c:forEach items="${route.routetimetable}" var="routetimetable">--%>
                                        <%--                                    <td>--%>
                                        <%--                                        <h3>รอบ : <fmt:formatDate value="${routetimetable.start_time}" pattern="HH:mm" /> น.</h3>--%>
                                        <%--                                    </td>--%>
                                        <%--                                    <td style="width: 20px"></td>--%>
                                        <%--                                </c:forEach>--%>
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

                                <%--                        <c:forEach items="${route.busstops}" var="busstop">--%>
                                <%--                            <table>--%>
                                <%--                                <tr>--%>

                                <%--                                    <td style="background-color: ${busstop.name_busstop.equals(start_point_name) ? '#d0f8ce' : 'transparent'}; border-radius: 7px">--%>
                                <%--                                        <c:if test="${busstop.name_busstop.equals(start_point_name)}">--%>
                                <%--                                            <h3>ต้นทาง : ${busstop.name_busstop}</h3>--%>
                                <%--                                        </c:if>--%>
                                <%--                                    </td>--%>
                                <%--&lt;%&ndash;                                        <td>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                            <c:if test="${busstop.name_busstop.equals(destination_name)}">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                                <h3>ปลายทาง : ${busstop.name_busstop}</h3>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                            </c:if>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;                                        </td>&ndash;%&gt;--%>
                                <%--                                    <td style="background-color: ${busstop.name_busstop.equals(destination_name) ? '#f9bdbb' : 'transparent'}; border-radius: 7px">--%>
                                <%--                                        <c:if test="${busstop.name_busstop.equals(destination_name)}">--%>
                                <%--                                            <h3>ปลายทาง : ${busstop.name_busstop}</h3>--%>
                                <%--                                        </c:if>--%>
                                <%--                                    </td>--%>
                                <%--                                </tr>--%>
                                <%--                            </table>--%>
                                <%--                        </c:forEach>--%>
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


</head>
<body>

</body>
</html>
