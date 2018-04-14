<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:url value="/" var="root" />


<script>





	$(function() {
		// 댓글 입력창
		var textArea = 
			$(`
				<div class="row">
				<div class="col-md-10">
					<textarea id="reply_content" cols="40" rows="4"
						placeholder="write a comment here"></textarea>
					<br />
				</div>
				<div class="col-md-2">
					<button id="addReply" class="btn btn-primary btn-sm">
						<i class="fa fa-reply"></i> Reply
					</button>
				</div>
				</div>
			`);
		
		
		$('.addSubReply').click(function(){
			
			console.log("clicked 서브리플라이");
			
			$(this).parent().children().addClass("replyPlus");
			textArea.appendTo('.replyPlus');
			
		})
		
		
		var api = "${root}reply/";
		
	      $.ajaxSetup({
	          type: 'POST',
	          headers: { "cache-control": "no-cache" }
	      });
		
		//$.post(api + "addTop", function(data){
		//	sensor_values = data;
	//	})
		/*$
				.get(
						api,
						function(data) { //결과값 : 배열. 
							console.log(data);
							data
									.forEach(function(item, ix) {
										showLineChart(data);

										//forEach 첫번째 데이타가 데이터, 두번쨰가 인덱스, 세번째가 배열 자체.
										console.log(typeof item.time)
										var str = `<p>\${item.id} : \${item.type}, \${item.value} \${item.time}</p>`;
										$('#sensor_panel').append($(str));
									});
						});*/
	
	
						
	$('#addReply').click(function(e){
		//var sysdate = new Date();
		var reply_content = $('#reply_content').val();
		var dataa = {
				boardId: ${board.boardId}, 
				writer: '${USER.userId}', 
				content: reply_content
				
 //필드 변수의 이름과 동일해야함. 
		};
			
	$.ajax({
		/*api 로 보낸다(위쪽) JSON으로 보낸다 (아래쪽)*/
		
		url : api + "addTop",
		type : 'post',
		data : JSON.stringify(dataa),
		contentType : 'application/json',
		cache: false,
		
		success : function(result){
			console.log("success");
		}
		
	})		
	});
						

						$('#edit').click(function(e){
				
									var data = sensor_values[4];
									data.value = 20.0;
						
								
						$.ajax({
							/*url : api,
							data : data,
							type : "post",*/
							
							/*api 로 보낸다(위쪽) JSON으로 보낸다 (아래쪽)*/
							
							url : api,
							//url : api + 4, //~/api/sensor/4
							type : 'put', //수정은 put.
							data : JSON.stringify(data),
							contentType : 'application/json',							
							success : function(result){
								showLineChart(sensor_values);
							}							
						});							
						});

				
						
						
						
	$('#delete').click(function(e){
		var target = $(this).data('target');
		$.ajax({
			url : api + target, //예 : ~/api/sensor/5
			type : 'delete',
			success : function(result){
				if(result){
					var index = Number(target);
					//배열의 index 번째 요소부터 1개 삭제
					sensor_values.splice(target, 1);
					showLineChart(sensor_values);
				}
			}
		});
	});
						
	});
</script>

<h3 class="mt-5 mb-4">${board.title}</h3>
<div class="row">
	<div class="col-md-2">Title</div>
	<div class="col-md-10">${board.title}</div>
</div>
<div class="row">
	<div class="col-md-2">Writer</div>
	<div class="col-md-10">${board.writer}</div>
</div>
<div class="row">
	<div class="col-md-2">View</div>
	<div class="col-md-10">${board.readCnt}</div>
</div>
<div class="row">
	<div class="col-md-2">Attached File</div>
	<div class="col-md-10">
		<c:forEach var="file" items="${board.attachments}">
			<div>
				<a href="../download/${file.attachmentId}"> <i
					class="fa fa-download"></i> ${file.fileName}
				</a>
			</div>
		</c:forEach>
	</div>
</div>

<hr />
<div>${board.content}</div>

<div class="row">
	<div class="col-md-10">
		<textarea id="reply_content" cols="40" rows = "4" placeholder = "write a comment here"></textarea><br/>
	</div>
	<div class="col-md-2">
		<button id="replySubmit" class = "btn btn-primary btn-sm"><i class = "fa fa-reply"></i>Submit</button>
	</div>
</div>
<hr />

<ul class="list-unstyled">

	<c:forEach var="reply" items="${board.replies}">
		<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd hh:mm:ss"
			var="regDate" />
		<div class="media">
			<img src="http://placehold.it/100x100">
			<div class="media-body">
				<div>
					<ul>
						<span class="mt-0 mb-1 font-weight-bold">${reply.writer}</span>
						<span class="float-right">${regDate} &nbsp;&nbsp;
							${reply.likeCnt}
							<a href = "#" style ="color: red"><i class="far fa-heart"></i></a>
						</span>
					</ul>
				</div>
				<ul>${reply.content}
				</ul>
				<ul class="float-right">
					<button class="btn btn-primary btn-sm addSubReply">reply</button>
				</ul>
			</div>
		</div>
		<hr />
		<a href = "#">${reply.replyCnt} open</a>
		<br>
		<div id = "replyTextArea"></div>
		<hr />
	</c:forEach>

</ul>

<button id="add">add</button>
<button id="edit">edit</button>
<button id="delete" data-target="5">delete</button>






<div id="sensor_panel"></div>
<canvas id="lineChart"></canvas>


<div class="text-center">
	<c:if test="${board.writer == USER.userId}">
		<a href="../edit/${board.boardId}" class="mr-4"> <i
			class="fa fa-edit mr-2"></i> Edit
		</a>
		<a href="../delete/${board.boardId}" class="mr-4"> <i
			class="fa fa-trash mr-2"></i> Delete
		</a>
	</c:if>

	<a href="javascript:history.back()"> <i class="fa fa-undo mr-2"></i>
		Go Back
	</a>
</div>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js"></script>