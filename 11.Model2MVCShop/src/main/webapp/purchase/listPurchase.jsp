<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
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
						
						var displayValue = "<h3>"
													+"상품번호 : "+JSONData.purchaseProd.prodNo+"<br/>"
													+"구매자아이디 : "+JSONData.buyer.userId+"<br/>"
													+"결제방법 : "+JSONData.paymentOption+"<br/>"
													+"구매자이름 : "+JSONData.receiverName+"<br/>"
													+"구매자연락처 : "+JSONData.receiverPhone+"<br/>"
													+"구매자주소 : "+JSONData.divyAddr+"<br/>"
													+"</h3>";
						//Debug...									
						//alert(displayValue);
						$("h3").remove();
						
						
				
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

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount } 건수, 현재${resultpage.currentPage } 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		
		
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i+1}"/>

	<tr class="ct_list_pop">
		<td align="center" class = "getPurchase" data-tranNo="${purchase.tranNo}">
			${i}
		<td></td>
		<td align="left" class = "getUser" data-userId="${purchase.buyer.userId}">
		${purchase.buyer.userId}
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
			<td></td>
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
		<td></td>
		<c:if test = "${purchase.tranCode=='002'}">
		
		<td align="left" id="updateTranCode" data-TranCode="${purchase.tranCode}" data-tranNo="${purchase.tranNo}">
		물건도착
		</td>
		</c:if>
		
		
	  <c:if test = "${purchase.tranCode=='003'}">
			<td align="left">
			배송완료
			</td>
		</c:if>
		
	
		
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		
		
		
		
		
		
		
	</tr>
	<tr>
	<td id="${purchase.tranNo }" class="updatePurchase" data-tranNo="${purchase.tranNo }" colspan="11" bgcolor="D6D7D6" height="1">
<!-- 	</td> -->
	
<%-- 	<td id="${purchase.buyer.buyerId }" class="getUser" data-tranNo="${purchase.tranNo }" colspan="11" bgcolor="D6D7D6" height="1"> --%>
<!-- 	</td> -->
	</tr>
	
	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center"></td>
		<td>
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		<jsp:include page="../common/pageNavigator.jsp"/>
	
		</td>
		
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>