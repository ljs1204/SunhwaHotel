<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sogo Hotel by Colorlib.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />


<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>


<!-- 20220324 - fullcalender용 library / script -->
<link href='./resources/fullcalender/main.css' rel='stylesheet' />
<script src='./resources/fullcalender/main.js'></script>
<!-- 언어 설정 -->
<script src='./resources/fullcalender/locales-all.js'></script>


</head>

<script>

// 수정버전
document.addEventListener('DOMContentLoaded', function() {
	// locales-all.js에 사용할 수 있는 언어들 있음
    var initialLocaleCode = 'ko';
    var localeSelectorEl = document.getElementById('locale-selector');
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      initialDate: new Date(),		// 오늘날짜
      locale: initialLocaleCode,
      buttonIcons: true, // show the prev/next text
      weekNumbers: true,
      navLinks: true, // can click day/week names to navigate views
      editable: true,

      // more 버튼 누르면 밑으로 나오는 거
      dayMaxEvents: true, // allow "more" link when too many events
      
      // 일정을 클릭하면 일어나는 이벤트
      eventClick: function(elem){
    	  //console.log('일정 클릭시', elem.event.title);
      },
      
      // 실제 데이터 연결부분 => 읽기 전용이므로 수정이 필요하면 메소드를 이용한다.)
      events: function(info, successCallback, failureCallback){
      	  var url = 'reserveListGet';
      	  $.ajax({
      		  type: 'POST',
      		  url: url,
      		  dataType: 'JSON',
      		  success: function(data){
      			  var events = [];
      			  //console.log(data);
      			  // JSON(hashmap구조) 안의 res라는 index 번호에 arrayList니까 이렇게 찍는다
      			  //console.log(data.res[0].mem_id);
      			  
      			  // json 객체는 javascript 방식으로 foreach 불가
      			  /* res.forEach( function(data, index){
      				 console.log('element', index, data); 
      			  }); */
      			  
      			  // json 객체 foreach 방법( 이중배열구조라서 이중 for )
      			  for(key in data){
      				  var set = data[key];
      				  for(key in set){
      					  //console.log(set[key]);
      				  }
      			  }
      			  
      			  // 아니면 제이쿼리 $.each문으로 사용( 얘도 하나하나 데이터에 접근하려면 이중 for )
      			  $.each(data, function (index, array){
      				 //console.log(array);
      				 $.each(array, function(index, elem){
      					 //console.log(elem);
      					 if(elem.mem_id=='비회원'){
      						 events.push({
      							title: elem.reserve_num+'-'+elem.mem_id,
      							start: elem.checkindate,
      							end: elem.checkoutdate,
      							color: '#3788d9'
      						 });
      					 }else{
      						events.push({
      							title: elem.reserve_num+'-'+elem.mem_name_kr,
      							start: elem.checkindate,
      							end: elem.checkoutdate,
      							color: '#6c56c8'
      						 });
      					 }
      				 });
      				 
      				 
      				 // 이게 그려주는 역할?
      				 successCallback(events);
      			  }); 
      			  
      		  }
      	  })
        }
    	
    	
      
      
      
      
    	
    /* 라이브러리 기본 데이터 사용 방식	
    [
      {
        title: 'All Day Event',
        start: '2020-09-01'
      },
      {
        title: 'Long Event',
        start: '2020-09-07',
        end: '2020-09-10'
      }
    ]
     */	
  });

  calendar.render();

  // build the locale selector's options
  calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
    var optionEl = document.createElement('option');
    optionEl.value = localeCode;
    optionEl.selected = localeCode == initialLocaleCode;
    optionEl.innerText = localeCode;
    localeSelectorEl.appendChild(optionEl);
  });

  // when the selected option changes, dynamically change the calendar option
  localeSelectorEl.addEventListener('change', function() {
    if (this.value) {
      calendar.setOption('locale', this.value);
    }
  });

});






/* 
//이전방식 => 실패
//1. 데이터 SELECT
dataGet();

function dataGet(){
	$.ajax({
		url: 'reserveListGet',
		type: 'POST',
		data: {},
		dataType: 'JSON',
		success: function(data){
			console.log('ajax 결과 : ', data);
			console.log(data.res.length);
			listDraw(data.res);
		},
		error: function(e){
			console.log(e);
		}
	});
};

//2. 받아온 데이터로 달력 그리기
function listDraw(res){
	// locales-all.js에 사용할 수 있는 언어들 있음
 var initialLocaleCode = 'ko';
 var localeSelectorEl = document.getElementById('locale-selector');
 var calendarEl = document.getElementById('calendar');

 var calendar = new FullCalendar.Calendar(calendarEl, {
   headerToolbar: {
     left: 'prev,next today',
     center: 'title',
     right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
   },
   initialDate: new Date(),		// 오늘날짜
   locale: initialLocaleCode,
   buttonIcons: true, // show the prev/next text
   weekNumbers: true,
   navLinks: true, // can click day/week names to navigate views
   editable: true,

   // more 버튼 누르면 밑으로 나오는 거
   dayMaxEvents: true, // allow "more" link when too many events
   
   // 일정을 클릭하면 일어나는 이벤트
   eventClick: function(elem){
 	  console.log('일정 클릭시', elem.event.title);
   },
   
   // 실제 데이터 연결부분 => 읽기 전용이므로 수정이 필요하면 메소드를 이용한다.

 	
 	 [
 	  {
 		  title:'2022031348',
 		  start:'2022-03-01',
 		  end:'2022-03-03'
 	  },
 	  {
 		  title:'2022034894',
 		  start:'2022-03-20',
 		  end:'2022-03-24'
 	  }
 	] 
 	 
 	
 	  function(){
 	  //console.log(res[0].reserve_num);
 	  console.log("["+
				"{title:'"+res[0].reserve_num+"',"+
				"start:'"+res[0].checkindate+"',"+
				"end:'"+res[0].checkoutdate+"'},");
 	  for(var i=0; i<res.length; i++){
			if(i==0){
				"["+
				"{title:'"+res[i].reserve_num+"',"+
				"start:'"+res[i].checkindate+"',"+
				"end:'"+res[i].checkoutdate+"'},";
			}else if(i==res.length){
				"{title:'"+res[i].reserve_num+"',"+
				"start:'"+res[i].checkindate+"',"+
				"end:'"+res[i].checkoutdate+"'}"+"]";
			}else{
 		"{title:'"+res[i].reserve_num+"',"+
			"start:'"+res[i].checkindate+"',"+
			"end:'"+res[i].checkoutdate+"'},";
			}
 	  };
   }
 	 
   
 });
 
 calendar.render();

 // build the locale selector's options
 calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
   var optionEl = document.createElement('option');
   optionEl.value = localeCode;
   optionEl.selected = localeCode == initialLocaleCode;
   optionEl.innerText = localeCode;
   localeSelectorEl.appendChild(optionEl);
 });

 // when the selected option changes, dynamically change the calendar option
 localeSelectorEl.addEventListener('change', function() {
   if (this.value) {
     calendar.setOption('locale', this.value);
   }
 });

};


*/







</script>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#top {
	background: #eee;
	border-bottom: 1px solid #ddd;
	padding: 0 10px;
	line-height: 40px;
	font-size: 12px;
}

#calendar {
	max-width: 1100px;
	margin: 40px auto;
	padding: 0 10px;
}
</style>
</head>
<body>

	<div id='top'>

		Locales:
		<select id='locale-selector'></select>

	</div>

	<div id='calendar'></div>

</body>
</html>









