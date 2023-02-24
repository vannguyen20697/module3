<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/datatables/css/dataTables.bootstrap4.css">
<%--    <link rel="stylesheet" href="/static/datatables/css/jquery.dataTables.css">--%>
</head>
<body>
<center>
    <h1>Phong Tro Management</h1>
</center>
<h4>
    <a href="/phongtro?action=create">Add New Phong Tro</a>
</h4>

<form action="/phongtro" method="get" class="form-inline">
    <input type="hidden" name="action" value="search">
    <div class="form-group mr-3">
        <input type="text"
               class="form-control" name="search" placeholder="search">
    </div>
    <button type="submit" class="btn btn-primary">Search</button>
</form>


<h4><a href="/phongtro?action=sort">Sort Phong Tro</a></h4>
<div align="center">
    <h2>List Phong Tro</h2>
    <table class="table table-bordered" id="page">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone Number</th>
            <th>Date Begin</th>
            <th>Note</th>
            <th>Id ThanhToan</th>
            <th>Action</th>
        </tr>
        <c:forEach var="phongtro" items="${listPhongTro}">
            <tr>
                <td><c:out value="${phongtro.id}"/></td>
                <td><c:out value="${phongtro.name}"/></td>
                <td>${phongtro.phoneNumber}</td>
                <td><c:out value="${phongtro.dateBegin}"/></td>
                <td>${phongtro.note}</td>
                <td>${phongtro.idThanhToan}</td>
                <td>
                    <a class="btn btn-danger" href="/phongtro?action=update&id=${phongtro.id}">Edit</a>
                    <a class="btn btn-danger" href="#" type="button"  data-toggle="modal" data-id="${phongtro.id}" data-target="#exampleModal">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<%--Modal Delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Phong tro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Bạn có muốn xóa hay khum?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <form action="/phongtro" method="get" id="delete-btn-form">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit" class="btn btn-primary">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/static/js/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<%--<script type="text/javascript" src="https://cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js"></script>--%>
<script src="/static/js/jquery-3.5.1.min.js"></script>
<script src="/static/datatables/js/jquery.dataTables.js"></script>
<script src="/static/js/bootstrap.js"></script>
<script src="/static/datatables/js/dataTables.bootstrap4.js"></script>
<script>
    $(document).ready(function () {
        $('#page').dataTable({
            'searching': false,
            'pageLength': 6
        })
    })
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id') ;
        var modal = $(this);
        var addInput = '<input type="hidden" name="id" value="' + id + '"/>'
        modal.find('#delete-btn-form').prepend(addInput);
    })
</script>
</body>
</html>