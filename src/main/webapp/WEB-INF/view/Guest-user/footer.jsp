<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/4/2023
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/assets/css/indexes.css" rel="stylesheet">
<html>
<head>
    <title>footer</title>
</head>

<style>
  footer{
    background: #228B22;
    color: aliceblue;
    padding: 2rem;
    text-align: center;
    flex: 0 0 auto;
  }

  .footer{
    position: relative;
    height: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #228B22;
    width: 100%;
  }
  .footerTable {
    border-collapse: collapse;
    margin: 0 auto;
    width: 50%;
  }

  .footerTh, .footerTd {
    text-align: center;
  }


  /*footer div table tr td{*/
  /*  padding: 0px 100px;*/
  /*}*/


</style>
<body>

<footer>
  <div class="footer">
    <table class="footerTable">
      <tr>
        <th class="footerTh"><img src="${pageContext.request.contextPath}/assets/img/facebook.png" alt="" width="40px" height="40px"></th>
        <th class="footerTh"><img src="${pageContext.request.contextPath}/assets/img/email.png" alt="" width="40px" height="40px"></th>
        <th class="footerTh"><img src="${pageContext.request.contextPath}/assets/img/telephone-call.png" alt="" width="40px" height="40px"></th>
      </tr>
      <tr>
        <td class="footerTd" style="color: #FFFFFF">Maejo University</td>
        <td class="footerTd" style="color: #FFFFFF">Maejo@mju.ac.th</td>
        <td class="footerTd" style="color: #FFFFFF">053-873000</td>
      </tr>
    </table>
  </div>
</footer>

</body>
</html>
