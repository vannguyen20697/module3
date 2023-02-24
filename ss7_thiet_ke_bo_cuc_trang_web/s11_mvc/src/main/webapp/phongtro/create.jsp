<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Them Moi Nguoi Thue Tro</title>
</head><body>
<center>
    <h1>Phong Tro Management</h1>
    <h2>
        <a href="phongtro?action=phongtro">List All Users</a>
    </h2>
</center>
<div>
    <form method="post" action="/phongtro">
        <input type="hidden" name="action" value="create">
        <table>
            <caption>
                <h2>Add New Phong Tro</h2>
            </caption>
            <tr>
                <th> Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Phone Number:</th>
                <td>
                    <input type="text" name="phoneNumber" id="phoneNumber" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Date Begin:</th>
                <td>
                    <input type="date" name="dateBegin" id="dateBegin" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Note:</th>
                <td>
                    <input type="text" name="note" id="note" size="15"/>
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
                <td colspan="2">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>