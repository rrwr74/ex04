<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../include/header.jsp" %>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">글쓰기</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">글쓰기</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              	<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title">
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer">
					</div>
					<div class="form-group">
						<label>Text area</label> <textarea  class="form-control" rows="3" cols="" name="content"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">글저장하기</button>
					<button type="reset" class="btn btn-primary">글초기화</button>
					<button type="list" class="btn btn-info"><a href="/board/list">목록으로</a></button>
				</form>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

<%@ include file="../include/footer.jsp" %>