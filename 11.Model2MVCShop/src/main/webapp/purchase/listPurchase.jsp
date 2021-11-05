<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<html>
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function fncGetUserList(currentPage) {
// 		document.getElementById("currentPage").value = currentPage;
// 		document.detailForm.submit();

		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();

	}
	
	$(function() {
		
// 		 $(".getPurchase").on("click" ,function() {
// 			alert('가즈아')
			
// 			 self.location ="/purchase/getPurchase?tranNo="+$(this).attr("data-tranNo")
		
// 					});	
	
		 
		 $(".getUser").on("click" ,function() {
				
				
				 self.location ="/user/getUser?userId="+$(this).attr("data-userId")
			
						});
		 
		 $("#updateTranCode").on("click" ,function() {
				
				
				 self.location ="/purchase/updateTranCode?TranCode="+$(this).attr("data-TranCode")+"&tranNo="+$(this).attr("data-tranNo")
			
						});

	
	$( ".getPurchase" ).on("click" , function() {
		//Debug..
		//alert(  $( this ).text().trim() );

		// 			if($(this).attr("id")=='amount'){
//			self.location ="/product/getProduct?prodNo="+$(this).attr("data-prodNo")}
		
		var tranNo = $(this).attr("data-tranNo");
			
		$.ajax( 
				{
					url : "/purchase/json/getPurchase/"+tranNo ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
							
						//Debug...
						//alert(status);
						//Debug...
						//alert("JSONData : \n"+JSONData);
						
						var displayValue = "<h5>"
													+"상품번호 : "+JSONData.purchaseProd.prodNo+"<br/>"
													+"구매자아이디 : "+JSONData.buyer.userId+"<br/>"
													+"결제방법 : "+JSONData.paymentOption+"<br/>"
													+"구매자이름 : "+JSONData.receiverName+"<br/>"
													+"구매자연락처 : "+JSONData.receiverPhone+"<br/>"
													+"구매자주소 : "+JSONData.divyAddr+"<br/>"
													+"</h5>";
						//Debug...									
						//alert(displayValue);
						$("h5").remove();
						
						
				
						$( "#"+tranNo+"" ).html(displayValue);
						
					}
				
				
					
					
				
			});
	
		});
	
	
	$(".updatePurchase").on("click" , function() {
		
		
		 self.location ="/purchase/updatePurchase?tranNo="+$(this).attr("data-tranNo");
	});
	
	});	
	
	
	</script>
</head>

<body >

<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		  
		<div class="page-header text-info">
	       <h3>구매목록조회</h3>
	    </div>
	    
	      <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		  </div>
		 <div class="col-md-12 text-right">
			    <form class="form-inline" name="detailForm">
		      <input type="hidden" id="currentPage" name="currentPage" value=""/>

			</form>
			</div>
		      
		      
		      
	   <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >회원ID</th>
            <th align="left">회원명</th>
            <th align="left">전화번호</th>
            <th align="left">배송현황</th>
            <th align="left">정보수정</th>
             <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody> 
	    
	    
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i+1}"/>
	
	<tr class="ct_list_pop">
		<td align="center" class="updatePurchase"  data-tranNo="${purchase.tranNo}">${i}</td>
	    
	    <td align="left" class = "getUser" data-userId="${purchase.buyer.userId}">${purchase.buyer.userId}</td>

		<td align="left">${purchase.receiverName}</td>
		<td align="left">${purchase.receiverPhone}</td>
	<td align="left">현재
				
		<c:if test = "${purchase.tranCode=='000'}">
			
			판매중
		</c:if>
		<c:if test = "${purchase.tranCode=='001'}">
			
			구매완료
			
			
		</c:if>
			
		<c:if test = "${purchase.tranCode=='002'}">
			
			배송중
		</c:if>
		<c:if test = "${purchase.tranCode=='003'}">
			
			배송완료
		</c:if>
				상태 입니다.</td>
				
			
				
				<c:if test = "${purchase.tranCode=='001'}">
					<td align="left">입금확인중</td>
				</c:if>
				<c:if test = "${purchase.tranCode=='002'}">
		
		<td align="left" id="updateTranCode" data-TranCode="${purchase.tranCode}" data-tranNo="${purchase.tranNo}">
		<a href="#">물건도착</a>
		</td>
		</c:if>
		
		
	  <c:if test = "${purchase.tranCode=='003'}">
			<td align="left">
			배송완료
			</td>
		</c:if>
		
				<td id="${purchase.tranNo }" class = "getPurchase" data-tranNo="${purchase.tranNo }" colspan="11" bgcolor="D6D7D6" height="1">click</td>
</tr>
<tr>
<!-- 	</td> -->
	
<%-- 	<td id="${purchase.buyer.buyerId }" class="getUser" data-tranNo="${purchase.tranNo }" colspan="11" bgcolor="D6D7D6" height="1"> --%>
<!-- 	</td> -->
	</tr>

</c:forEach>

</tbody>

</table>
</div>
</div>



		<div align="center">
		<jsp:include page="../common/pageNavigator.jsp"/>
	
		</div>		





</body>
</html>