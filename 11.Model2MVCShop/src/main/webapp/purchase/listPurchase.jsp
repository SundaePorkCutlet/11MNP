<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<html>
<head>

	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
						
						var displayValue = "<h5>"
													+"��ǰ��ȣ : "+JSONData.purchaseProd.prodNo+"<br/>"
													+"�����ھ��̵� : "+JSONData.buyer.userId+"<br/>"
													+"������� : "+JSONData.paymentOption+"<br/>"
													+"�������̸� : "+JSONData.receiverName+"<br/>"
													+"�����ڿ���ó : "+JSONData.receiverPhone+"<br/>"
													+"�������ּ� : "+JSONData.divyAddr+"<br/>"
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		  
		<div class="page-header text-info">
	       <h3>���Ÿ����ȸ</h3>
	    </div>
	    
	      <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
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
            <th align="left" >ȸ��ID</th>
            <th align="left">ȸ����</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
             <th align="left">��������</th>
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
				
			
				
				<c:if test = "${purchase.tranCode=='001'}">
					<td align="left">�Ա�Ȯ����</td>
				</c:if>
				<c:if test = "${purchase.tranCode=='002'}">
		
		<td align="left" id="updateTranCode" data-TranCode="${purchase.tranCode}" data-tranNo="${purchase.tranNo}">
		<a href="#">���ǵ���</a>
		</td>
		</c:if>
		
		
	  <c:if test = "${purchase.tranCode=='003'}">
			<td align="left">
			��ۿϷ�
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