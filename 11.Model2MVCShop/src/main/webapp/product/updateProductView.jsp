<%@ page contentType="text/html; charset=euc-kr" %>

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
	
function fncAddProduct(){
	//Form 유효성 검증
//  	var name = document.detailForm.prodName.value;
// 	var detail = document.detailForm.prodDetail.value;
// 	var manuDate = document.detailForm.manuDate.value;
// 	var price = document.detailForm.price.value;

var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
		
// 	document.detailForm.action='/product/updateProduct';
// 	document.detailForm.submit();

	$("form").attr("method" , "POST").attr("action" , "/product/updateProduct?amount="+${amount}).submit();
}

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "button.btn.btn-primary:contains('수  정')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('가입')" ).html() );

		fncAddProduct();
	}); 
});	

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "td.ct_btn01:contains('취소')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
		 history.go(-1);
	});
});	

</script>
</head>

<body >
<jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품정보수정</h3>
	    </div>
	    
	    <form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo }" placeholder="중복확인하세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">상품번호는 수정불가</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
		    </div>
		  </div>
		  
		  	  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}" >
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="manuDate"  class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" name="manuDate" class="form-control"  value="${product.manuDate}" id="datePicker"/>
				
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="price"  class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" name="price" class="form-control"  value="${product.price}" />
				
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName1" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName1" name="filraName1" value="${product.fileName}" placeholder="상품이미지"
		      >
		    </div>
		  </div>
		  
		     <div class="form-group">
		    <label for="amount"  class="col-sm-offset-1 col-sm-3 control-label">수량</label>
		    <div class="col-sm-4">
		      <input type="text" name="amount" class="form-control"  value="${product.amount}" />
				
		    </div>
		  </div>



  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수  정</button>
			  <a class="ct_btn01" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
</form>

</body>
</html>