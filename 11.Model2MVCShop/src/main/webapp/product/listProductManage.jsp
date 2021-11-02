<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.common.*" %>
<%@ page import="com.model2.mvc.common.util.* "%>

<%
List<Product> list= (List<Product>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");

Search search = (Search)request.getAttribute("search");
//==> null �� ""(nullString)���� ����
String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>

--%>




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

// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
// function fncGetUserList(currentPage) {
// 	document.getElementById("currentPage").value = currentPage;
//    	document.detailForm.submit();		
// }
	function fncGetUserList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProductManage").submit();
		}


	 
	 $(function() {
			
		 $( "button.btn.btn-default" ).on("click" , function() {

			 fncGetUserList(1)
						
					});
		 
		 $(".ct_list_pop td:nth-child(2)").on("click", function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				console.log('���⵵��')
				console.log('${product.prodNo}')
				alert($(this).attr("id"))
				self.location ="/product/updateProduct?prodNo="+$(this).attr("id")+"&amount="+$(this).attr("data-amount");
			});
		
		 
		 

	 
		$( ".ct_list_pop td:nth-child(9)" ).on("click" , function() {
			//Debug..
// 			alert(  $( this ).text().trim() );

			// 			if($(this).attr("id")=='amount'){
// 			self.location ="/product/getProduct?prodNo="+$(this).attr("data-prodNo")}

			var prodNo = $(this).attr("data-prodNo");
		
			$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
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
// 							alert("JSONData : \n"+JSONData);
							
							var displayValue = "<h6>"
														+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
														+"��ǰ�� : "+JSONData.prodName+"<br/>"
														+"���� : "+JSONData.price+"<br/>"
														+"���� : "+JSONData.amount+"<br/>"
														+"������ : "+JSONData.prodDetail+"<br/>"
														+"</h6>";
							//Debug...									
							//alert(displayValue);
							$("h3").remove();
							
							
						if(JSONData.amount!=0){
							$( "#"+prodNo+"" ).html(displayValue);}
						if(JSONData.amount==0){
							alert('ǰ���� ��ǰ�Դϴ�.')
						}
						}
					
				});
			
		});
			
		
			
			$("td.move:contains('����ϱ�')").on("click", function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				
				
				self.location ="/purchase/updateTranCodeByProd?ProTranCode="+$(this).attr("data-ProTranCode")+"&tranNo="+$(this).attr("data-tranNo");
			});
			
			
			

	
	//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
	
	$( ".ct_list_pop td:nth-child(2)" ).css("color" , "red");
	$("h7").css("color" , "red");
	
	
	
	$(".ct_list_pop:nth-child(2n+5)").css("background-color", "whitesmoke");
	
});	
</script>

</head>

<body>


<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>��ǰ�����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
			 <div class="col-md-12 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
			<input type="radio" name="orderOption" id = "orderOption0" value="0"  ${ ! empty search.orderOption && search.orderOption==0 ? "checked" : "" }/><label for = "orderOption0">��ǰ���</label>		 
		<input type="radio" name="orderOption" id = "orderOption1" value="1"  ${ ! empty search.orderOption && search.orderOption==1 ? "checked" : "" }/><label for = "orderOption1">�������ݼ�</label>
		<input type="radio" name="orderOption" id = "orderOption2" value="2"  ${ ! empty search.orderOption && search.orderOption==2 ? "checked" : "" }/><label for = "orderOption2">�������ݼ�</label>														
		<input type="radio" name="orderOption" id = "orderOption3" value="3"  ${ ! empty search.orderOption && search.orderOption==3 ? "checked" : "" }/><label for = "orderOption3">�ֽż�</label>														
		<input type="radio" name="orderOption" id = "orderOption4" value="4"  ${ ! empty search.orderOption && search.orderOption==4 ? "checked" : "" }/><label for = "orderOption4">�����ȼ�</label>														
			</div>

			<div class="form-group">	
			<select class="form-control" name="searchCondition" >
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
		
			</select>
		</div>
		
		<div class="form-group">
		 <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"   class="ct_input_g" style="width:200px; height:19px" >
		</div>
		
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>

			</form>
			</div>
			</div>

<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">���Ź�ȣ</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">���ż���</th>
            <th align="left">��������</th>
            <th align="left">����</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>

	
	
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
	
	<tr class="ct_list_pop">
		<td align="center">${i}</td>

			
				<td  data-prodNo="${product.prodNo }" align="left">
				
				${product.prodName }
				</td>
		
			
				<td id ="zeroamount" >
		
				${product.tranNo }
				</td>
			
		
				
		
		
		<td align="left">${product.price }</td>

		<td align="left">${product.regDate }</td>
	
		
		<td align="left">${product.purchaseAmount }</td>

		<td align="left"><c:if test="${product.amount!=0}">${product.amount}</c:if>
		
		<c:if test="${product.amount==0}">0</c:if>
		</td>

					<td align="left" class="move" data-ProTranCode="${product.proTranCode}" data-tranNo="${product.tranNo} "><c:if test="${product.proTranCode=='000'}">
			
			�Ǹ���
			</c:if> <c:if test="${product.proTranCode=='001'}">
			
			���ſϷ�
			
		����ϱ�


							</c:if> <c:if test="${product.proTranCode=='002'}">
			
			�����
		</c:if> <c:if test="${product.proTranCode=='003'}">
			
			��ۿϷ�
		</c:if></td>
	
		 <td align="left" data-prodNo="${product.prodNo }" data-amount="${product.amount }">
		<i id="${product.prodNo}" class = "addPuchase"  colspan="11" bgcolor="D6D7D6" height="1">click!</i>
		<input type="hidden" value="${product.prodNo}">
	</td>
	</tr>
	</c:forEach>
	</tbody>
</table>

</div>
			<div align = "center">
			<jsp:include  page="../common/pageNavigator.jsp"/>	
			</div>
<!--  ������ Navigator �� -->




</body>
</html>
