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




<html lang="ko">
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
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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



	$(function() {	
	$("#datePicker").datepicker({      
        showOn: "button",
        dateFormat: 'yy-mm-dd',
         buttonImage: "../images/ct_icon_date.gif",
         buttonImageOnly: true,
         buttonText: "Select date"
    });
	});	
<!--

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		alert('gd')
		fncGetUserList();
		
	});
});	


$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	








	function fncGetUserList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			var chek_arr = [];
			$(".thumbnail").each(function(){
			var chek = $(this).attr("data-prodNo");
			chek_arr.push(chek);
			
			})
			alert(chek_arr);
			
			var input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'prodNo';
			input.value = chek_arr;
			$("form").append($(input));
			
			
	
			
			$("form").attr("method" , "GET").attr("action" , "/purchase/addAllPurchase?prodNo="+chek_arr).submit();
		}
	
	 
	$(document).ready(function(){
		var totalPrice = 0;
		$(".thumbnail").each(function(){
			var price = $(this).attr("data-price")
			totalPrice +=parseInt(price);
		});
		
		console.log(totalPrice);
		$("#price").val(totalPrice);
	})
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
	 
	 
	 
		
	
	<div class="container pt-1">
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
	 
	   
	    
	 
	 
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail" data-price="${product.price}" data-prodNo="${product.prodNo }">
    
      <img src="/images/uploadFiles/${product.fileName }" width="160" height="90" alt="...">
      <div class="caption">
  
  <h3>${product.prodName }</h3>
  <p>���� : ${product.price }</p>
</div>
</div>
</div>

	</c:forEach>
</div>
</div>
<hr/>
<form class="form-horizontal">
		
		
		  
		  
		    
		  
		  
		    <div class="form-group">
		    <label for="buyerId"  class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" name="buyerId" class="form-control"  value="${user.userId}" readonly />
				
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price"  class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" id="price" name="price" class="form-control"   readonly >
				
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="paymentOption"  class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		    	<select 	name="paymentOption"		class="form-control" 
							style="width: 360px; height: 35px" maxLength="20">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
				<option value="3">����Ʈ����</option>
			</select>
				
		    </div>
		  </div>
		  
		  
		      <div class="form-group">
		    <label for="receiverName"  class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverName" class="form-control"  value="${user.userName}" />
				
		    </div>
		  </div>
		  
		     <div class="form-group">
		    <label for="receiverPhone"  class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverPhone" class="form-control"  value="${user.phone}" />
				
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="receiverAddr"  class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverAddr" class="form-control"  value="${user.addr}" />
				
		    </div>
		  </div>
		  
		     <div class="form-group">
		    <label for="receiverRequest"  class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverRequest" class="form-control"   />
				
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="receiverDate"  class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverDate" class="form-control"   id="datePicker" >
				
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
	 
	 
	 
	 
	 





</form>
</body>
</html>
