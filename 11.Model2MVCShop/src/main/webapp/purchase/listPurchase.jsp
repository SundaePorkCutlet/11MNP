<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<html>
<head>
<title>���� �����ȸ</title>

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
// 			alert('�����')
			
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
													+"��ǰ��ȣ : "+JSONData.purchaseProd.prodNo+"<br/>"
													+"�����ھ��̵� : "+JSONData.buyer.userId+"<br/>"
													+"������� : "+JSONData.paymentOption+"<br/>"
													+"�������̸� : "+JSONData.receiverName+"<br/>"
													+"�����ڿ���ó : "+JSONData.receiverPhone+"<br/>"
													+"�������ּ� : "+JSONData.divyAddr+"<br/>"
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
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ����${resultpage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		
		
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
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
		<td align="left">����
				
		<c:if test = "${purchase.tranCode=='000'}">
			
			�Ǹ���
		</c:if>
		<c:if test = "${purchase.tranCode=='001'}">
			
			���ſϷ�
			
			
		</c:if>
			
		<c:if test = "${purchase.tranCode=='002'}">
			
			�����
		</c:if>
		<c:if test = "${purchase.tranCode=='003'}">
			
			��ۿϷ�
		</c:if>
				���� �Դϴ�.</td>
		<td></td>
		<c:if test = "${purchase.tranCode=='002'}">
		
		<td align="left" id="updateTranCode" data-TranCode="${purchase.tranCode}" data-tranNo="${purchase.tranNo}">
		���ǵ���
		</td>
		</c:if>
		
		
	  <c:if test = "${purchase.tranCode=='003'}">
			<td align="left">
			��ۿϷ�
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

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>