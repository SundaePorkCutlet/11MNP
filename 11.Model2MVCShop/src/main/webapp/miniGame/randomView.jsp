<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
<!--
function fncRandom() {
	document.random.submit();
}
-->
</script>
<body>
<form name="random" method="post" action="/purchase/random">
	<div class="container">
	
		<div class="page-header">
	       <h2 class=" text-info">미니게임!</h2>
<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20150126_258%2Fwjdqurwls_1422278556878TUFFm_GIF%2F%25B1%25E2%25BA%25BB%25C1%25D6%25BB%25E7%25C0%25A7.gif&type=sc960_832_gif">
	    
<h3>1~5의 랜덤 숫자가 생성되었습니다.<hr>
예상가는 숫자를 적어주세요.<br>
배당률 : 3배</h3>
	    </div>
	    
 <jsp:include page="/layout/toolbar.jsp" />

<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write"><h4>예상 숫자</h4></td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input		type="text" name="gameNumber" 	class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write"><h4>배팅 포인트</h4></td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input		type="text" name="gamePoint" 	class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" />
		</td>
	</tr>
	<tr class="ct_list_pop">
		<td align="center">
			<a href="javascript:fncRandom();"><h4>배팅!</h4></a>
		</td>
		</tr>
		
		
	
	
	
	
	
	
	<tr>
	<td align="center">
			<a href="/purchase/addPoint"><h4>돈벌기!</h4></a>
		</td>
	</tr>
			</table>
			</form>
			</div>
</body>
</html>