<%@ page import="java.util.LinkedList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<!-- Main -->
<main>
    <div class="container-fluid px-4">
        <center><h1 class="mt-4">Thể loại</h1></center>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
            <li class="breadcrumb-item active">Thể loại</li>
        </ol>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
          <i class="fa-solid fa-plus"></i> Thêm thể loại
      </button>

      <!-- Create Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm thể loại</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3" action="inserttl" method="post">
                  <div class="col-md-12">
                      <label for="validationDefault02" class="form-label">Tên thể loại</label>
                      <input name="tentl" type="text" class="form-control" id="validationDefault02" value="" required maxlength="100">
                  </div>


                  <div class="col-12">
                      <button class="btn btn-primary" type="submit">Thêm thể loại</button>
                  </div>
              </form>      </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>

<button type="button" class="btn btn-primary float-end" onclick="print()"><i class="fa-solid fa-print"></i> In danh sách</button> 
<form action="searchTL" method="post" class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0 float-end">
    <div class="input-group">
        <input name="search" value="${searchTL}" class="form-control" type="text" placeholder="Tìm kiếm ..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
        <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
    </div>
</form>
<br><br> 
<div class="card mb-4">
    <div class="card-body">
        <table class="table">
            <thead class="table-dark">
              <tr>
                <th scope="col">Mã thể loại</th>
                <th scope="col">Tên thể loại</th>
                <th colspan="2"><center>Thao tác</center></th>
            </tr>


            </thead>
            <tbody>
              <c:forEach items="${listTL}" var ="o">    
                <tr>
                  <td>${o.MATL}</td>
                  <td>${o.TENTL}</td>
                  <td><a title="Sửa" href="updateTL?sid=${o.MATL}" style="border: none; background: #fff; color: #0d6efd;">
                  <i class="fa-solid fa-pen-to-square"></i>
                  </a>
                  </td>
                  <td><a title="Xóa" href="#" onclick="showMess(${o.MATL})" style="color:red"><i class="fa-solid fa-trash"></i></a></td>
                </tr>
              </c:forEach>
            </tbody>
        </table>
</div>
</div>

<!-- pagination -->
<nav aria-label="...">
    <ul class="pagination justify-content-center">
      <li class="page-item disabled">
        <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active">
        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
    </li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
        <a class="page-link" href="#">Next</a>
    </li>
</ul>
</nav>   

<div style="height: 32vh"></div>
</div>
</main>
<script type="text/javascript">
    function showMess(id){
        var option = confirm("Bạn có chắc muốn xóa không?");
        if(option == true){
            window.location.href = "deleteTL?sid=" + id ;
        }
    }
</script>
<%@include file="include/footer.jsp" %>

