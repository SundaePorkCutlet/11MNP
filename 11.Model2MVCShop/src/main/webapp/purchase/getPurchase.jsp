<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<% 
Purchase purchase = (Purchase)request.getAttribute("purchase");

%>



<html lang="ko">
	
<head>
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

<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("#cancel").on("click" , function() {
		alert('gd')
		javascript:history.go(-1);
	});
});	

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("button.btn.btn-primary").on("click" , function() {
		self.location = "/purchase/updatePurchase?tranNo="+$(this).attr("data-tranNo");
	});
});	
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "td.ct_btn01:contains('수정')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('가입')" ).html() );
		 self.location ="/purchase/updatePurchase?tranNo="+$(this).attr("data-tranNo");
	});
	
	
	 $( "td.ct_btn01:contains('확인')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('가입')" ).html() );
		 javascript:history.go(-1);
		});
});	

</script>
</head>

<body >


<jsp:include page="/layout/toolbar.jsp" />

		<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">구매상세조회</h3>
	    
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>물품번호</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodNo}</div>
		</div>
			<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
			<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매방법</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.paymentOption}</div>
		</div>
			<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자연락처</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
			<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>		
			<hr/>
		
				<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest }</div>
		</div>
		
		<hr/>
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate }</div>
		</div>
		
		<hr/>

	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center" >
		      <button type="button" class="btn btn-primary" data-tranNo="${purchase.tranNo }" >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="cancel">확&nbsp;인</a>
		    </div>
		  </div>


</div>


</body>
</html>