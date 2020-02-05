<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../include/header.jsp" %>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">글쓰기</h1>

          <!-- DataTales Example start -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">글쓰기</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
				<div class="form-group">
					<label>Bno</label> <input class="form-control" name="bno" value='<c:out value="${ board.bno }" />' readonly="readonly" >
				</div>
				<div class="form-group">
					<label>Title</label> <input class="form-control" name="title" value='<c:out value="${ board.title }" />' readonly="readonly" >
				</div>
				<div class="form-group">
					<label>Writer</label> <input class="form-control" name="writer"  value='<c:out value="${ board.writer }" />' readonly="readonly" >
				</div>
				<div class="form-group">
					<label>Text area</label> <textarea  class="form-control" rows="3" cols="" name="content" readonly="readonly" ><c:out value="${ board.content }" /></textarea>
				</div>
				<button data-oper='modify' class="btn btn-info">수정하기</button>
				<button data-oper='list' class="btn btn-info">글목록</button>
              	<form role="form" id="operForm" action="/board/modify" method="get">
            		<input type="hidden" id="bno" name="bno" value="<c:out value="${ board.bno }" />">  	
				  	<input type="hidden" name="pageNum" value="${cri.pageNum }">
				  	<input type="hidden" name="amount" value="${cri.amount }">
				  	<input type="hidden" name="type" value="${cri.type }">
				  	<input type="hidden" name="keyword" value="${cri.keyword }">
				</form>
			
              </div>
            </div>
          </div>
		  <!-- DataTales Example end -->	
       	  
       	  <div class='row'>
       	  	<div class="col-lg-12">
       	  		<!-- panel -->
       	  		<div class="panel panel-default">
       	  			<div class="panel-heading">
       	  				<i class="fa fa-comments fa-fw"></i> Reply
       	  				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
       	  			</div>
       	  		</div>
       	  		<!-- panel heading -->
       	  		<div class="panel-body">
       	  			<ul class="chat">
       	  			<!--  start reply -->
       	  				<li class="left clearfix" data-rno="12">
       	  					<div>
       	  						<div class="header">
       	  							<strong class="primary-font">user00</strong>
       	  							<samll class="pull-right text-muted">2018-01-01 13:13</samll>
       	  						</div>
       	  						<div>Good job</div>
       	  					</div>
       	  				</li>
       	  			</ul>
       	  		</div>
       	  	</div>
       	  </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      
	  <!-- Modal-->
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="exampleModalLabel">Reply Modal</h5>
	          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">×</span>
	          </button>
	        </div>
	        <div id="myModalBody" class="modal-body">
	        	<div class="form-group">
	        		<label>Reply</label>
	        		<input class="form-control" name='reply' value='New Reply!!!'>
	        	</div>
	        	<div class="form-group">
	        		<label>Replyer</label>
	        		<input class="form-control" name='replyer' value='replyer'>
	        	</div>
	        	<div class="form-group">
	        		<label>Reply Date</label>
	        		<input class="form-control" name='replyDate' value=''>
	        	</div>
	        </div>
	        <div class="modal-footer">
	          <button id="modalModBtn" class="btn btn-warning" type="button" >Modify</button>
	          <button id="modalRemoveBtn" class="btn btn-danger" type="button" >Remove</button>
	          <button id="modalRegisterBtn" class="btn btn-primary" type="button" >Register</button>
	          <button id="modalCloseBtn" class="btn btn-primary" type="button" >Close</button>
	          <!-- <a class="btn btn-primary">Save Changes</a> -->
	        </div>
	      </div>
	    </div>
	  </div>      

<%@ include file="../include/footer.jsp" %>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
	console.log("=============");
	console.log("JS TEST");

	var bnoValue= '${board.bno}';

	// for replyService add test
	/* replyService.add(
		{reply:"JS test", replyer:"tester", bno:bnoValue},
		function (result) {
			alert("RESULT : " + result);
		}
	); */

	/* replyService.getList(
		{bno:bnoValue, page:1},
		function (list) {
			for(var i = 0, len = list.length||0 ; i < len; i++) {
				console.log(list[i]);
			}
		}
	); */

	/* replyService.remove(25, 
		function (count) {
			console.log(count);
			if (count === "success") {
				alert("REMOVED");
			}
		}, function(err) {
			alert('ERROR...');
		}
	); */

	/* replyService.update(
		{rno:15, reply:"Modify reply....", bno:bnoValue},
		function (result) {
			alert("수정완료.. ");
		}
	); */
	/* replyService.get(15,
		function (data) {
			console.log(data);
		}
	); */
		
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var bnoValue = "${board.bno}";
		var operForm = $("#operForm");
		var replyUL = $(".chat");

		showList(1);
		function showList(page) {
			replyService.getList( {bno:bnoValue, page:page||1}, function(list) {
				var str = "";
				if (list == null || list.length == 0) {
					replyUL.html("");
					return;
				}
				for(var i = 0 , len = list.length || 0 ; i < len ; i++) {
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "<div>";
					str += "	<div class='header'>";
					str += "		<strong class='primary-font'>"+list[i].replyer+"</strong>";
					str += "		<samll class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</samll>";
					str += "	</div>";
					str += "	<div>"+list[i].reply+"</div>";
					str += "</div>";
				}
				replyUL.html(str);
			}); // end function
		}// end showList

		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");

		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");

		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();

			modalRegisterBtn.show();

			$(".modal").modal("show");

		});

		$("#modalRegisterBtn").on("click", function(e){
			var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				bno : bnoValue
			}

			replyService.add(reply, function(result) {

				alert(result);
				modal.find("input").val("");
				modal.modal("hide");

				showList(1);
			})

		});		

		$("#modalModBtn").on("click", function(e){
			var reply = {
				rno : modal.data("rno"),
				reply : modalInputReply.val()
			}

			replyService.update(reply, function(result) {

				alert(result);
				modal.modal("hide");
				showList(1);
			})

		});		
		
		$("#modalRemoveBtn").on("click", function(e){
			var rno = modal.data("rno");

			replyService.remove(rno, function(result) {

				alert(result);
				modal.modal("hide");
				showList(1);
			})

		});
		
		$(".chat").on("click", "li", function(e){
			var rno = $(this).data("rno");

			replyService.get(rno, function(reply) {
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				modal.data("rno", reply.rno);

				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();

				$(".modal").modal("show");
				
			});
		});

		
		$("button[data-oper='modify']").on("click",function(e) {
			operForm.attr("action","/board/modify");
			operForm.submit();
		});
		
		$("button[data-oper='list']").on("click",function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list");
			operForm.submit();
		}); 
	});

</script>