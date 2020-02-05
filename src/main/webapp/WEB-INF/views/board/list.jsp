<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../include/header.jsp" %>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4"><button data-oper='modify' type="submit" class="btn btn-info"><a href="/board/register">글쓰기</a></button></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>수정일</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${list }" var="board">
                    <tr>
                      <td><a href='/board/get?bno=<c:out value="${ board.bno }" />'><c:out value="${board.bno }" /></a></td>
                      <td><c:out value="${board.title }" /></td>
                      <td><c:out value="${board.writer }" /></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }" /></td>
                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
                <!--  start pagination -->
                <%-- <div class="row">
                <div class="col-sm-12 col-md-3">
					<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">전체 건수 : ${pageMaker.total }</div>                
                </div>
                <div class="col-sm-12 col-md-9">
                	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                		<ul class="pagination">
               			<li class="paginate_button page-item previous ${pageMaker.prev ? 'active' : 'disabled' }" id="dataTable_previous">
               				<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
               			</li>
                		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                			<li class="paginate_button page-item ${pageMaker.cri.pageNum eq num ? 'active' : 'disabled' }">
                				<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${num }</a>
                			</li>
                		</c:forEach>
               			<li class="paginate_button page-item next ${pageMaker.next ? 'active' : 'disabled' }">
               			<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">Next</a>
               			</li>
                		</ul>
                	</div>
                </div>
                </div> --%>
                <!--  end pagination -->
                
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

	  <!-- Logout Modal-->
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="exampleModalLabel">글쓰기 등록확인</h5>
	          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">×</span>
	          </button>
	        </div>
	        <div id="myModalBody" class="modal-body">처리가 완료되었습니다.</div>
	        <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Save Changes</button>
	          <!-- <a class="btn btn-primary">Save Changes</a> -->
	        </div>
	      </div>
	    </div>
	  </div>
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}" />';

		checkModal(result);

		function checkModal(result) {
			if (result === '') {
				return;
			}

			if(parseInt(result) > 0) {
				$("#myModalBody").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}

	});

</script>
