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
<!--
function fncAddPurchase() {
	document.addPurchase.submit();
}
-->
function fncAddPurchase(){
	
	$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddPurchase();
	});
});	


//============= "���"  Event ó�� ��  ���� =============
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	



$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('����')" ).html() );
		fncAddPurchase();
	});
});	


$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "td.ct_btn01:contains('���')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			history.go(-1);
	});
});	
</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">��������</h3>
	    </div>
	    
	    <form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" readonly>
		    </div>
		  </div>
		  
		  	  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}" readonly >
		    </div>
		  </div>
		  
		    
		   <div class="form-group">
		    <label for="manuDate"  class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" name="manuDate" class="form-control"  value="${product.manuDate}" readonly/>
				
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="price"  class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" name="price" class="form-control"  value="${product.price}" readonly/>
				
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="regDate"  class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <input type="text" name="regDate" class="form-control"  value="${product.regDate}" readonly/>
				
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="buyerId"  class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" name="buyerId" class="form-control"  value="${user.userId}" readonly />
				
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
		    <label for="amount"  class="col-sm-offset-1 col-sm-3 control-label">���ż���</label>
		    <div class="col-sm-4">
		   	<select 	name="amount"		class="form-control" 
							style="width: 360px; height: 35px" maxLength="20">
			<c:forEach var="amount" begin="1" end ="${product.amount}" >
				
				<option value="${amount}"  selected="selected">${amount}</option>
			
				</c:forEach>
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
		      <input type="text" name="receiverDate" class="form-control"   id="datePicker" readonly/>
				
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