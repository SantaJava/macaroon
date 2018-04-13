<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root" />
<script>
	function showLineChart(data) {
	/*	var labels = data.map(function(item) {
			return item.id + 'hour';
		})*/
		
		var labels = data.map(item=>item.id +'hour'); //람다식. 자바는 -> js는 =>
		var values = data.map(item=>item.value);
		
	/*	var values = data.map(function(item) {
			return item.value;
		}) */
		
		lineChart(labels, values);
	}
	
	
	

	function lineChart(labels, values) {
		var ctxL = document.getElementById("lineChart").getContext('2d');
		var myLineChart = new Chart(ctxL, {
			type : 'line',
			data : {
				labels : labels,
				datasets : [ {
					label : "temperature change",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : values
				},
				]
			},
			options: {
				responsive: true
			}
		});
	}

	$(function() {
		var sensor_values;
		var api = "${root}api/sensor/";
		
		$.get(api, function(data){
			showLineChart(data);
			sensor_values = data;
		})
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
	
	
	$('#add').click(function(e){
		var data = {
				id: 8,
				type: "temperature",
				value: 35 //필드 변수의 이름과 동일해야함. 
		};
			
	$.ajax({
		/*url : api,
		data : data,
		type : "post",*/
		
		/*api 로 보낸다(위쪽) JSON으로 보낸다 (아래쪽)*/
		
		url : api,
		type : 'post',
		data : JSON.stringify(data),
		contentType : 'application/json',
		
		success : function(result){
			sensor_values.push(data);
			showLineChart(sensor_values);
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

<button id="add">add</button>
<button id="edit">edit</button>
<button id="delete" data-target = "5">delete</button>
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