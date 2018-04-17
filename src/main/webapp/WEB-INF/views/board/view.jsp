<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:url value="/" var="root" />

<script>
	
var replyContent; //댓글 내용을 통해서 명시
var replyContentTag; //태그 자체를 저장
	
	
	

	$(function() {
		var api = "${root}reply/";	
	
		//헤더 캐쉬 새팅
	      $.ajaxSetup({
	          headers: { "cache-control": "no-cache" }
	      });
	
	      //그 외 댓글 등록창
	       $('#bottom').on('keyup','.subTextAreaContent',function(e){
	          var length = $(this).val().length;
	           $(this).parent().find('.counter').html(length + " / 140");
	     });
	       //맨 위 게시물 댓글 등록창
	       $('.topTextAreaContent').keyup(function(){
	           var length = $(this).val().length;
	           $(this).parent().find('.counter').html(length + " / 140");
	     });
		
		
		
		//서브 리플라이 추가하기 위한 텍스트창을 연다. - 여기서 submit까지 처리			
	  $('#bottom').on('click','.addSubReply',function(e){
		 var flag = $(this).data('flag');
		 var current = $(this);
		 var api = "${root}reply/";
		 var parent = $(this).parent();
		 var Rcontent = "";
		 var reply_id = $(this).data('id');
		 var current_id = $(this).find('.openReply').data('id');
		 var parent_id = parent.find('.openReply').data('id');
		 var ReplyCnt = $(this).data('replyCnt');
		 
			console.log("parent_id : " +parent_id);
		console.log("clicked 서브리플라이");
		
		var textArea = 
	         $(`
	            <div class="subTextArea">
	            <form class="caption-create" style="border:1px solid gray; position:relative; background-color:white;">
	               <textarea id="reply_content" class = "replyContent subTextAreaContent" rows="40" cols="4" maxlength="140" style="resize:none;border:none;background-color:white;outline: none; overflow-y:hidden;">
	               </textarea>
	               <div style="text-align:right;">
                   <span class="counter" >/140
                   </span>
		               <button id="submit" class="btn btn-primary btn-sm">
		                  <i class="fa fa-reply"></i> submit
		               </button>
	               </div>
	            </form>
	            </div>
	         `);
		
		if(flag === 'false'){
			// parent.removeClass("replyArea");

			parent.find('.textAreaOpen').empty();
			$(this).data('flag', 'true');
			console.log(flag);
			return true;
		}
		
		$('.subTextArea').remove();
		//$('.textAreaOpen')
		//$('.replyCnt[data-id="'+parent_id+'"]').text();
		parent.find('.textAreaOpen').eq(0).append(textArea);
		console.log("아 패런트 아이디!!! : " + parent_id);
		//$('.textAreaOpen[data-id="'+parent_id+'"]').append(textArea);
		
		//$('.textAreaOpen[data-id="'+parent_id+'"]').append(textArea);
		
		
		
		$('#submit').click(function(){
			 Rcontent = $(this).parent().parent().find('.replyContent').val();
			console.log(Rcontent);
			console.log(parent_id);
			
			
			var data = {
		            boardId: ${board.boardId}, 
		            writer: '${USER.userId}', 
		            content: Rcontent,
		            parentReply : parent_id
		      };
		         
		      $.ajax({
		         /*api 로 보낸다(위쪽) JSON으로 보낸다 (아래쪽)*/
		         
		         url : api + "addTop",
		         type : 'post',
		         data : JSON.stringify(data),
		         contentType : 'application/json',
		         cache: false,
		         
		         success : function(reply){
		        	 	        	 		
		        	 
		        	 strc = "";
		     		strc += 
		     			`<div class="media mt-4">
		       			<img class =" d-flex mr-3" src="http://placehold.it/50x50">
		       			<div class="media-body">
		       				<div>
		       					<span class="mt-0 mb-1 font-weight-bold">\${reply.writer}</span>`; 
		       					
		       					if("${USER.userId}"==reply.writer && reply.content != null){ 	
		     		                     strc += `<a class="deleteReply" data-id="\${reply.replyId}"><i class="fa fa-trash"></i></a>
		     		                     <a class="editReply" data-id="\${reply.replyId}"><i class="fa fa-edit"></i></a>`;
		       					}
		     							strc +=	`<span class="float-right">\${reply.regDate} &nbsp;&nbsp;
		     		      						\${reply.likeCnt} <a href="#" style="color: red"><i
		     		      							class="far fa-heart"></i></a>
		     		      					</span>
		     		      				</div>
		     		      				<div>`;
		       					
		       				if(reply.content!=null){
		       					strc+=`<div class="content" data-id="\${reply.replyId}">\${reply.content}</div>`;
		       				}else{
		       					strc+=`<div class="text-muted">사용자에 의해 삭제된 댓글입니다.</div>`;
		       				}
		     			
		                   	
		                  strc+= `</div>
		       				<a data-id="\${reply.replyId}" class="openReply" data-flag="true"><span data-id = "\${reply.replyId}" class = "replyCnt">\${reply.replyCnt}
		       				</span>open</a>
		       				<button class="btn btn-primary btn-sm float-right addSubReply"
		       					data-id="\${reply.replyId}"  data-flag="true">reply</button>
		       					<div data-id = "\${reply.replyId}" class="textAreaOpen"></div>
		       					<div class="children"></div>
		       				</li>
		       			</div>
		       		</div>`;
		        	 
		        	 
		        	 
		        	//텍스트창을 지우고 새로 넣은 창을 append한다.
		        	parent.find('.textAreaOpen').empty();
		        //	$('.addRecent[data-id="'+parent_id+'"]').append(strc);
		   			var count = $('.replyCnt[data-id="'+parent_id+'"]').text();
		   			$('.replyCnt[data-id="'+parent_id+'"]').text(parseInt(count)+1);
		   			console.log("새로 만든 카운트 : " +count+ parent_id);
		   			
		   			
		        	//printReplies(reply_id,current);
		         }	         
		      });      			
		});	
		
		console.log(reply_content);
		 $(this).data('flag', 'false');
		
	});		
		
		
						
				
	//top reply print 탑 리플라이 서브밋				
	$('.replySubmit').click(function(e){
		var api = "${root}reply/";
		//var sysdate = new Date();
		var current = $(this);
		var reply_id = $(this).data('id');
		var reply_content = $('#reply_content').val();
		var reply_writer = '${USER.userId}';
		var reply_cnt = 0;
		var like_cnt = 0;
		var dataa = {
				boardId: ${board.boardId}, 
				writer: '${USER.userId}', 
				content: reply_content
				
 //필드 변수의 이름과 동일해야함. 
		};
		
		$.ajax({
		//api 로 보낸다(위쪽) JSON으로 보낸다 (아래쪽)
			
			url : api + "addTop",
			type : 'post',
			data : JSON.stringify(dataa),
			contentType : 'application/json',
			cache: false,
			
			success : function(reply){
		    	 strc = "";
		     		strc += 
		     			`<div class="media mt-4">
		       			<img class =" d-flex mr-3" src="http://placehold.it/100x100">
		       			<div class="media-body">
		       				<div>
		       					<span class="mt-0 mb-1 font-weight-bold">\${reply.writer}</span>`; 
		       					
		       					if("${USER.userId}"==reply.writer && reply.content != null){ 	
		     		                     strc += `<a class="deleteReply" data-id="\${reply.replyId}"><i class="fa fa-trash"></i></a>
		     		                     <a class="editReply" data-id="\${reply.replyId}"><i class="fa fa-edit"></i></a>`;
		       					}
		     							strc +=	`<span class="float-right">\${reply.regDate} &nbsp;&nbsp;
		     		      						\${reply.likeCnt} <a href="#" style="color: red"><i
		     		      							class="far fa-heart"></i></a>
		     		      					</span>
		     		      				</div>
		     		      				<div>`;
		       					
		       				if(reply.content!=null){
		       					strc+=`<div class="content" data-id="\${reply.replyId}">\${reply.content}</div>`;
		       				}else{
		       					strc+=`<div class="text-muted">사용자에 의해 삭제된 댓글입니다.</div>`;
		       				}
		     			
		                   	
		                  strc+= `</div>
		       				<a data-id="\${reply.replyId}" class="openReply" data-flag="true"><span data-id = "\${reply.replyId}" class = "replyCnt">\${reply.replyCnt}
		       				</span>open</a>
		       				<button class="btn btn-primary btn-sm float-right addSubReply"
		       					data-id="\${reply.replyId}"  data-flag="true">reply</button>
		       					<div data-id = "\${reply.replyId}" class="textAreaOpen"></div>
		       					<div class="children"></div>
		       				</li>
		       			</div>
		       		</div>`;
		        	 
				
					console.log("got heres");
				  $('#children').prepend(strc);
			}
			
		})		
	});
		
	
	//리플라이 제거
	 $('#bottom').on('click','.deleteReply',function(e){
	        console.log("삭제 버튼 클릭");
	        var replyId = $(this).data('id');
	      //DB에서 제거
	         $.ajax({
	           url: api+replyId,
	           type: 'delete',
	           success: function(result){
	              if(result){
	                 console.log("DB에서 해당 댓글이 제거되었습니다.");
	                 //화면 업데이트
	                 $('.content[data-id="'+replyId+'"]').text("사용자에 의해 삭제된 댓글입니다.").addClass('text-muted');
	                // $('.editReply[data-id="'+replyId+'"]').remove();
	                 $('.deleteReply[data-id="'+replyId+'"]').remove();
	              }
	           }
	        }); 
	     });

	

		
	//리플라이 리스트를 가져온다.
	$('#bottom').on('click', '.openReply', function(e){ 
			var api = "${root}reply/";
			var reply_id = $(this).data('id');
			var parent = $(this).parent();
			console.log(reply_id);
			var api = api + reply_id;
			var flag = $(this).data('flag');
			console.log(flag);
				
			
			if(flag === 'false'){
				// parent.removeClass("replyArea");
				parent.find('.children').empty();
				$(this).data('flag', 'true');
				//console.log(flag);
				return true;
			}
			
			
			
			
			 $.get(api,function(replies){ //결과값 : 배열.
		         console.log(replies);
		         
			
					var str = "";
			 
		         replies.forEach(function(reply, ix){ //forEach  첫번째 데이타가 데이터, 두번쨰가 인덱스, 세번째가 배열 자체.
		              console.log(reply);
		              str += `<div class="media mt-4">
		      			<img class =" d-flex mr-3" src="http://placehold.it/50x50">
		      			<div class="media-body">
		      				<div>
		      					<span class="mt-0 mb-1 font-weight-bold">\${reply.writer}</span>`; 
		      					
		      					if("${USER.userId}"==reply.writer && reply.content != null){ 	
					                     str += `<a class="deleteReply" data-id="\${reply.replyId}"><i class="fa fa-trash"></i></a>
					                     <a class="editReply" data-id="\${reply.replyId}"><i class="fa fa-edit"></i></a>`;
		      					}
										str +=	`<span class="float-right">\${reply.regDate} &nbsp;&nbsp;
					      						\${reply.likeCnt} <a href="#" style="color: red"><i
					      							class="far fa-heart"></i></a>
					      					</span>
					      				</div>
					      				<div>`;
		      					
		      				if(reply.content!=null){
		      					str+=`<div class="content" data-id="\${reply.replyId}">\${reply.content}</div>`;
		      				}else{
		      					str+=`<div class="text-muted">사용자에 의해 삭제된 댓글입니다.</div>`;
		      				}
						
			              	
			             str+= `</div>
		      				<a data-id="\${reply.replyId}" class="openReply" data-flag="true"><span data-id = "\${reply.replyId}" class = "replyCnt">\${reply.replyCnt}</span>
		      					open</a>
		      				<button class="btn btn-primary btn-sm float-right addSubReply"
		      					data-id="\${reply.replyId}"  data-flag="true">reply</button>
		      					<div class="textAreaOpen"></div>
		      					<div data-id = "\${reply.replyId}"class = "recentAdd"></div>
		      					<div class="children"></div>
		      				</li>
		      			</div>
		      		</div>`;
		            // $(str).appendTo('.replyArea');
		         });
		         parent.find('.children').append(str);
			 });
		$(this).data('flag', 'false');
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

<div class="row topTextArea">
	<div class="col-md-10">
		<textarea id="reply_content" class = "topTextAreaContent" cols="40" rows="4"
			placeholder="write a comment here"></textarea>
		<br />
	</div>
	<div class="col-md-2">
		<button id="replySubmit" class="btn btn-primary btn-sm replySubmit">
			<i class="fa fa-reply"></i>Submit
		</button>
	</div>
	
</div>
<hr />


<ul id="bottom" class="list-unstyled">
	<div id="children"></div>
	<c:forEach var="reply" items="${board.replies}">
		<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd hh:mm:ss"
			var="regDate" />
		<div class="media mt-4">
			<img class=" d-flex mr-3" src="http://placehold.it/100x100">
			<div class="media-body">
				<div>
					<span class="mt-0 mb-1 font-weight-bold">${reply.writer}</span>
					<c:if
						test="${(USER.userId==reply.writer) and (not empty reply.content)}">
						<a class="deleteReply" data-id="${reply.replyId}"><i
							class="fa fa-trash"></i></a>
						<a class="editReply" data-id="${reply.replyId}"><i
							class="fa fa-edit"></i></a>
					</c:if>
					<span class="float-right">${regDate} &nbsp;&nbsp;
						${reply.likeCnt} <a href="#" style="color: red"><i
							class="far fa-heart"></i></a>
					</span>
				</div>
				<c:choose>
					<c:when test="${not empty reply.content}">
						<div class="content" data-id="${reply.replyId}">${reply.content}</div>
					</c:when>
					<c:otherwise>
						<div class="text-muted">사용자에 의해 삭제된 댓글입니다.</div>
					</c:otherwise>
				</c:choose>
				<a data-id="${reply.replyId}" class="openReply" data-flag="true"><span data-id = "${reply.replyId}" class = "replyCnt">${reply.replyCnt}
				</span>	open</a>
				<button class="btn btn-primary btn-sm float-right addSubReply"
					data-id="${reply.replyId}" data-flag="true">reply</button>
				<div class="textAreaOpen"></div>
				<div class="children"></div>
				</li>
			</div>
		</div>
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