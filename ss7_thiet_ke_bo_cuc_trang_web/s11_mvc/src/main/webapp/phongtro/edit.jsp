
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Management Application</title>
</head>
<body>
<center>
    <h1>Phong Tro Management</h1>
    <h2>
        <a href="phongtro?action=phongtro">List All Phong Tro</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/phongtro">
        <input type="hidden" name="action" value="update">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Phong Tro
                </h2>
            </caption>
            <c:if test="${phongtro != null}">
                <input type="hidden" name="id" value="<c:out value='${phongtro.id}' />"/>
            </c:if>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${phongtro.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Phone Number:</th>
                <td>
                    <input type="text" name="phoneNumber" size="45"
                           value="<c:out value='${phongtro.phoneNumber}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Date Begin:</th>
                <td>
                    <input type="date" name="dateBegin" size="15"
                           value="<c:out value='${phongtro.dateBegin}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Note:</th>
                <td>
                    <input type="text" name="note" size="15"
                           value="<c:out value='${phongtro.note}' />"
                    />
                </td>
            </tr>

            <tr>
                <th>Id ThanhToan:</th>
                <td>
                    <select id="idThanhToan" name="idThanhToan">
                        <option value="100">- Hình Thức Thanh Toán -</option>
                        <c:forEach var="thanhToan" items="${hinhThucThanhToanList}">
                            <option value="${thanhToan.id}" ${thanhToan.id == phongTro.idThanhToan? "selected":""}>${thanhToan.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>