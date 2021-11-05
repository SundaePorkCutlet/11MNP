<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
	
<head>
<meta charset="EUC-KR">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"> </script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

   
   <!--  ///////////////////////// CSS ////////////////////////// -->
   <style>
      body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

$(function() {	
	$("#datePicker").datepicker({      
        showOn: "button",
        dateFormat: 'yy-mm-dd',
         buttonImage: "../images/ct_icon_date.gif",
         buttonImageOnly: true,
         buttonText: "Select date"
    });
	});	

$(function() {
	
	 $( "td.ct_btn01:contains('���')" ).on("click" , function() {
		 
		
		 javascript:history.go(-1)
	
				});
});

function fncAddPurchase(){

	$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddPurchase();
	});
});	



</script>



</head>

<body >

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">������������</h3>
	    </div>
	     <form class="form-horizontal">
	      <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyerId" name="buyerId" value="${purchase.buyer.userId}" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">���� ���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>
		
		 	     <div class="form-group">
		    <label for="paymentOption"  class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		      <input type="text" name="paymentOption" class="form-control"  value="${purchase.paymentOption}" readonly/>
				<span id="helpBlock2" class="help-block">
		      	<strong class="text-danger">1:���� 2:ī�� 3:����Ʈ</strong>
		      </span>
		    </div>
		  </div>
		 
		
		      <div class="form-group">
		    <label for="receiverName"  class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverName" class="form-control"  value="${purchase.receiverName}" />
				
		    </div>
		  </div>

		
		 <div class="form-group">
		    <label for="receiverPhone"  class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverPhone" class="form-control"  value="${purchase.receiverPhone}" />
				
		    </div>
		  </div>
		  
		 
		   <div class="form-group">
		    <label for="receiverAddr"  class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverAddr" class="form-control"  value="${purchase.divyAddr}" />
				
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="receiverRequest"  class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverRequest" value="${divyRequest }" class="form-control"   />
				
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="divyDate"  class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" name="divyDate" class="form-control" value="${purchase.divyDate}"  id="datePicker" readonly/>
				
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>


</form>
</div>
</body>
</html>