<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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


</script>
</head>

<body>

<%-- <form name="updatePurchase" action="/purchase/updatePurchase?tranNo=${purchase.tranNo}" method="post"> --%>
<jsp:include page="/layout/toolbar.jsp" />

		<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상품상세조회</h3>
	    
	

<c:if test="${remainPoint>-1 || purchase.paymentOption!='3'}">
<strong>다음과 같이 구매가 되었습니다.</strong>


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
			<div class="col-xs-8 col-md-4"><c:if test="${purchase.paymentOption =='1'}">
			 현금구매
			 </c:if>
		<c:if test="${purchase.paymentOption =='2'}">
			신용구매
			</c:if>
		<c:if test="${purchase.paymentOption =='3'}">
			포인트구매
			</c:if>
			
			
			</div>
		</div>
			<hr/>
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매수량</strong></div>
			<div class="col-xs-8 col-md-4">${amount}</div>
		</div>
			<hr/>
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자이름</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
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
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
			<hr/>
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>배송희망일자</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
			<hr/>
			
			</c:if>
<c:if test ="${remainPoint<0 && purchase.paymentOption =='3'}">
<h2>포인트가 부족하여 구매에 실패했습니다.</h2>

 </div>
</c:if>
			
			
		



</body>


