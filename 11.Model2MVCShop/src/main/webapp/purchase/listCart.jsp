<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function cart(){
	popWin = window.open("/purchase/deleteCart?prodNo=${cart.purchaseProd.prodNo}&menu=search","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}
function fncGetUserList(currentPage) {
// 	document.getElementById("currentPage").value = currentPage;
//    	document.detailForm.submit();	
   	
   	
   	$("#currentPage").val(currentPage)
   	//document.detailForm.submit();
	$("form").attr("method" , "POST").attr("action" , "/purchase/listCart").submit();
}


$(function() {
	
	 $(".getProduct1").on("click" ,function() {
		alert('가즈아')
		 if($(this).attr("data-amount")!=0){
		 self.location ="/product/getProduct?prodNo="+$(this).attr("data-prodNo")
		 }
				});
	 
	 $('.getProduct2').on("click" , function() {
		 alert('가즈아')
		 if($(this).attr("data-amount")!=0){
		 self.location ="/product/getProduct?prodNo="+$(this).attr("data-prodNo")
		 }
				});
	 
	 $('#delete').on("click" , function() {
			
		 alert('가즈아')
		 self.location ="/purchase/deleteCart?prodNo="+$(this).attr("data-prodNo")
		
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
					<td width="93%" class="ct_ttl01">장바구니 목록조회</td>
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
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">남은수량</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">삭제</td>
		
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" />
	<c:forEach var="cart" items="${list}">
		<c:set var="i" value="${i+1}"/>

	<tr class="ct_list_pop">
		<td align="center" class ="getProduct1" data-prodNo="${cart.purchaseProd.prodNo}" data-amount="${cart.amount }" >
		<c:if test="${cart.amount!=0 }">
			${cart.purchaseProd.prodNo}
			</c:if>
			
			<c:if test="${cart.amount==0 }">
			${cart.purchaseProd.prodNo}
			</c:if>
			
		</td>
		<td></td>
		<td align="left" class ="getProduct2" data-prodNo="${cart.purchaseProd.prodNo}" data-amount="${cart.amount }" >
			<c:if test="${cart.amount!=0 }">
			${cart.purchaseProd.prodName}
			</c:if>
			
			<c:if test="${cart.amount==0 }">
			${cart.purchaseProd.prodName}
			</c:if>
			
		</td>
		<td></td>
		<td align="left">${cart.purchaseProd.price }</td>
		<td></td>
			<td align="left" ><c:if test= "${cart.amount==0 }">
			품절 상품 입니다.
			</c:if>
			<c:if test= "${cart.amount!=0 }">
			${cart.amount }
			</c:if>
			</td>
		<td></td>
			<td align="left" id="delete" data-prodNo="${cart.purchaseProd.prodNo}">
			&#128701;
		</td>
		<td></td>
		
	

	
	
		

		
	
		
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
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