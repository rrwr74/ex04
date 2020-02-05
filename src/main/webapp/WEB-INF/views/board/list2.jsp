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
                <table class="table table-bordered" width="100%" cellspacing="0">
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
                <!--  start condition -->
                <div class="row">
	                <div class="col-lg-12">
	                	<form id="searchForm" action="/board/list2" method="get">
	                		<select name = 'type'>
	                			<option value="" ${ pageMaker.cri.type == null ? 'selected' : '' }>------</option>
	                			<option value="T" ${ pageMaker.cri.type eq 'T' ? 'selected' : '' }>제목</option>
	                			<option value="C" ${ pageMaker.cri.type eq 'C' ? 'selected' : '' }>내용</option>
	                			<option value="W" ${ pageMaker.cri.type eq 'W' ? 'selected' : '' }>작성자</option>
	                			<option value="TC" ${ pageMaker.cri.type eq 'TC' ? 'selected' : '' }>제목 or 내용</option>
	                			<option value="TW" ${ pageMaker.cri.type eq 'TW' ? 'selected' : '' }>제목 or 작성자</option>
	                			<option value="TWC" ${ pageMaker.cri.type eq 'TWC' ? 'selected' : '' }>제목 or 작성자 or 내용</option>
	                		</select>
	                		<input type='text' name='keyword' value="${ pageMaker.cri.keyword }" />
	                		<input type='hidden' name='pageNum' value='${ pageMaker.cri.pageNum }' />
	                		<input type='hidden' name='amount' value='${ pageMaker.cri.amount }' />
	                		<button class="btn btn-primary">Search</button>
	                	</form>
	                </div>
                </div>
                <!--  end condition -->

                <!--  start pagination -->
                <div class="row">
                <div class="col-sm-12 col-md-3">
					<div class="dataTables_info" role="status" aria-live="polite">전체 건수 : ${pageMaker.total }</div>                
                </div>
                <div class="col-sm-12 col-md-9">
                	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                		<ul class="pagination">
               			<li class="paginate_button page-item previous ${pageMaker.prev ? 'active' : 'disabled' }" id="dataTable_previous">
               				<a href="${ pageMaker.startPage - 1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
               			</li>
                		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                			<li class="paginate_button page-item ${pageMaker.cri.pageNum eq num ? 'active' : '' }">
                				<a href="${num }" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${num }</a>
                			</li>
                		</c:forEach>
               			<li class="paginate_button page-item next ${pageMaker.next ? 'active' : 'disabled' }">
               			<a href="${ pageMaker.endPage + 1 }" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">Next</a>
               			</li>
                		</ul>
                	</div>
                </div>
                </div>
                <!--  end pagination -->
                
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
	  <form id="actionForm" action="/board/list2" method="get">
	  	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	  	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	  	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	  	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	  </form>
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

		history.replaceState({}, null, null);
		
		function checkModal(result) {
			if (result === '') {
				return;
			}

			if(parseInt(result) > 0) {
				$("#myModalBody").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}

		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click",function(e) {
			e.preventDefault();
			console.log("click page");
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",function(e) {
			if(!searchForm.find("option:selected").val()) {
				alert("검색종류를 입력하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	});

</script>
