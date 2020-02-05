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
              	<form role="form" action="/board/modify" method="post">
				  	<input type="hidden" name="pageNum" value="${cri.pageNum }">
				  	<input type="hidden" name="amount" value="${cri.amount }">
				  	<input type="hidden" name="type" value="${cri.type }">
				  	<input type="hidden" name="keyword" value="${cri.keyword }">
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name="bno" value='<c:out value="${ board.bno }" />' readonly="readonly" >
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title" value='<c:out value="${ board.title }" />' >
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"  value='<c:out value="${ board.writer }" />'  readonly="readonly">
					</div>
					<div class="form-group">
						<label>Text area</label> <textarea  class="form-control" rows="3" cols="" name="content" ><c:out value="${ board.content }" /></textarea>
					</div>
					<button data-oper='modify' type="submit" class="btn btn-info">수정하기</button>
					<button data-oper='remove' type="submit" class="btn btn-info">삭제하기</button>
					<button data-oper='list' type="submit" class="btn btn-info">목록으로</button>
					
				</form>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/board/remove");
			} else if (operation === 'list') {
				//self.location = "/board/list";
				formObj.attr("action", "/board/list").attr("method", "get");

				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				
				formObj.empty();

				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);
			}
			formObj.submit();
		});

	});

</script>