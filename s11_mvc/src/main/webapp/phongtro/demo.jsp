<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<body>
<div class="container-fluid" style="margin-top: 10px">
    <div class="container-fluid">
        <nav class="navbar navbar-light bg-black">
            <div class="container-fluid" style="height: 120px; line-height: 120px;margin-top: -10px">
                <a class="navbar-brand" href="/phongtro">
                    <img src="../../img/home_1.png" alt="" width="80" height="100"
                         class="d-inline-block align-content-center">
                </a>
                <strong style="color: white; font-family: 'Lucida Sans'; font-size: 20px; margin-right: 0px;color: pink">Bùi
                    Minh Tiến</strong>
            </div>
        </nav>
    </div>
</div>
<div class="container-fluid" style="margin-top: 10px">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg bg-black">
                    <div class="container-fluid">
                        <div class="col-lg-12">
                            <a class="navbar-brand" href="/phongtro" style="color: pink"><strong
                                    style="font-size: 20px">Chỉnh Sửa <span
                                    style="font-style: italic;border-radius: 10px;background-color: deeppink; color: white; font-size: 30px">Thông Tin Phòng Trọ</span></strong></a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent"
                                    aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
<div style="margin: 20px 500px;width: 100%">
    <form action="/phongtro?action=edit" method="post">
        <pre>Tên Người Thuê Trọ:     <input type="text" name="name" value="${phongTro.name}"> </pre>
        <pre style="color:red;">            ${map.get('name')}</pre>
        <pre>Số Điện Thoại:          <input type="text" name="phoneNumber" value="${phongTro.phoneNumber}"> </pre>
        <pre style="color:red;">            ${map.get('phoneNumber')}</pre>
        <pre>Ngày Bắt Đầu Thuê Trọ:  <input type="date" name="dateBegin" value="${phongTro.dateBegin}"> </pre>
        <pre style="color:red;">            ${map.get('dateBegin')}</pre>
        <pre>Ghi Chú:                <input type="text" name="note" value="${phongTro.note}"> </pre>
        <pre style="color:red;">            ${map.get('note')}</pre>
        <pre>Hình Thức Thanh Toán:   <select id="idThanhToan" name="idThanhToan">
                                                <option value="100">- Hình Thức Thanh Toán -</option>
                                            <c:forEach var="thanhToan" items="${hinhThucThanhToanMap}">
                                                <option value="${thanhToan.key}" ${thanhToan.key == phongTro.idThanhToan? "selected":""}>${thanhToan.value}</option>
                                            </c:forEach>
                                     </select></pre>
        <pre style="color:red;">           ${map.get('idThanhToan')}</pre>

        <pre>                          <input type="submit" value="Thay Đổi"></pre>
    </form>
</div>
<pre style="text-align: center;color: #2196F3">         ${mess}</pre>
<script src="../../bootstrap/js/bootstrap.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
