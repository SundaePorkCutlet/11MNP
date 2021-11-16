<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script type="text/javascript" src="../javascript/calendar.js">
</script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	  <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
    
    <style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	
</head>


<body>
<jsp:include page="/layout/toolbar.jsp" />
	<div class="page-header">
	       <h2 class=" text-info">미니게임결과!</h2>
	    
	    </div>
<h3><c:if test = "${rs=='부족'}">
배팅포인트가 부족합니다.<br>
현재 보유하신 포인트에 맞게 배팅해주세요.
</c:if></h3>




<h3><c:if test = "${rs=='정답'}">
정답은 : ${result}<br>
내 정답 : ${gameNumber} <hr>
축하드립니다 정답입니다!!<br>
${gamePoint}포인트가 추가 적립되었습니다.

</c:if></h3>
<h3>
<c:if test = "${rs=='오답'}">
정답은 : ${result}<br>
내 정답 : ${gameNumber} <hr>
아쉽습니다 오답입니다 ㅠㅠ<br>
${gamePoint*-1}포인트가 날라갔습니다.
</c:if></h3>
<br><br>

					<div class="form-group">
		   <div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary" style="padding-top:3px;" >
						<a href="../miniGame/randomView.jsp;" style="color:white;">다시하기</a></button>
			</div>
			</div>
				
					
				



</body>
</html>