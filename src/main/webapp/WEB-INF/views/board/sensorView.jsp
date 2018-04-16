<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:url value="/" var="root" />
<script>
function showLineChart(data){
   var labels = data.map(item=>item.id+' 시');
   
   var values = data.map(item=>item.value);
   
   lineChart(labels, values);
}

// MDB Line chart 이용 
function lineChart(labels, values){
   var ctxL = document.getElementById("lineChart").getContext('2d');
   var myLineChart = new Chart(ctxL, {
       type: 'line',
       data: {
           labels: labels,
           datasets: [
               {
                   label: "온도 변화",
                   fillColor: "rgba(220,220,220,0.2)",
                   strokeColor: "rgba(220,220,220,1)",
                   pointColor: "rgba(220,220,220,1)",
                   pointStrokeColor: "#fff",
                   pointHighlightFill: "#fff",
                   pointHighlightStroke: "rgba(220,220,220,1)",
                   data: values
               }
           ]
       },
       options: {
           responsive: true
       }    
   });
}

$(function(){
   var sensor_values;
   var api = "${root}api/sensor/";
   $.get(api, function(data){
      sensor_values = data; //배열로 들어옴(자바스크립트는 list 없음)
      showLineChart(sensor_values);
   });
   
   //추가 버튼 클릭
   $('#add').click(function(e){
      var data = {
         id: 8,
         type: "온도",
         value: 35
      };
      
      $.ajax({
         url: api,
         type: 'post',
         //data: data,   //url 인코딩
         data: JSON.stringify(data),   //json 인코딩(자바스크립트 객체를 JSON 문자열로 변환)
         contentType: 'application/json', //'data를 json으로 해석한다'(디폴트가 url인코딩이므로 생략시 data를 url인코딩으로 해석함)
         success: function(result){
            //성공시에 차트 다시 그리기
            sensor_values.push(data);
            showLineChart(sensor_values);
         }
      });
   });
   
   //수정 버튼 클릭(4번 센서값을 수정하여 put)
   $('#edit').click(function(e){
      var data = sensor_values[4];
      data.value = 10.0;
      
      $.ajax({
         url: api,
         type: 'put',
         data: JSON.stringify(data),
         contentType: 'application/json',
         success: function(result){
            //성공시에 차트 다시 그리기
            showLineChart(sensor_values);
         }
      });
   });
   
   //삭제 버튼 클릭
   $('#delete').click(function(e){
      var target = $(this).data('target');
      
      $.ajax({
         url: api+target,
         type: 'delete',
         success: function(result){
            if(result){
               var index = Number(target); //숫자형으로 변환
               //배열에서 삭제
               sensor_values.splice(index, 1);
               //성공시에 차트 다시 그리기
               showLineChart(sensor_values);
            }
         }
      });
   });
});
</script>

<h2 class="mt-5 mb-4">게시글 보기</h2>
<div class="row">
   <div class="col-md-2">제목</div>
   <div class="col-md-10">${board.title}</div>
</div>
<div class="row">
   <div class="col-md-2">작성자</div>
   <div class="col-md-10">${board.writer}</div>
</div>
<div class="row">
   <div class="col-md-2">조회수</div>
   <div class="col-md-10">${board.readCnt}</div>
</div>
<div class="row">
   <div class="col-md-2">첨부파일</div>
   <div class="col-md-10">
      <c:forEach var="file" items="${board.attachments}">
         <div>
            <a href="../download/${file.attachmentId}"> 
               <i class="fa fa-download"></i> ${file.fileName}
            </a>
         </div>
      </c:forEach>
   </div>
</div>
<div class="row">
   <div class="col-md-2">작성일</div>
   <div class="col-md-10">
      <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" />
   </div>
</div>
<div class="row">
   <div class="col-md-2">수정일</div>
   <div class="col-md-10">
      <fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd" />
   </div>
</div>
<hr />
<div>${board.content}</div>

<button id="add">추가</button>
<button id="edit">수정</button>
<button id="delete" data-target="5">삭제</button>

<div id="sensor_panel">
   <canvas id="lineChart"></canvas>
</div>

<div class="text-center">
   <c:if test="${USER.userId==board.writer}">
      <a href="../edit/${board.boardId}" class="mr-4"> <i
         class="fa fa-edit mr-2"></i> 수정
      </a> <a href="../delete/${board.boardId}" class="mr-4"> <i
         class="fa fa-trash mr-2"></i> 삭제
      </a> 
   </c:if>
   <a href="javascript:history.back()"> <i class="fa fa-undo mr-2"></i>
      돌아가기
   </a>
</div>