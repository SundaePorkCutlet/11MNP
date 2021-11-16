<%@ page contentType="text/html; charset=euc-kr" %>

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
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddProduct();
		});
	});	
	
function fncAddProduct(){
	//Form 유효성 검증
//  	var name = document.detailForm.prodName.value;
// 	var detail = document.detailForm.prodDetail.value;
// 	var manuDate = document.detailForm.manuDate.value;
// 	var price = document.detailForm.price.value;
	var prodNo=$("button.btn.btn-primary" ).attr("data-prodNo");
	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
	var amount=$("input[name='amount']").val();
	
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

// 	document.detailForm.action='/product/addProduct';
// 	document.detailForm.submit();

	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
}

// function resetData(){
	
// 	document.detailForm.reset();
// }




$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( ".ct_btn01" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();
	});
});	
</script>
</head>

<body>

 <jsp:include page="/layout/toolbar.jsp" />

   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">상 품 등 록</h1>
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명 입력하세요">
		    </div>
		    </div>
		    
		      <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		    </div>
		  </div>

			  <div class="form-group">
		    <label for="manuDate"  class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" name="manuDate" class="form-control"  id="datePicker"/>
				
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName1" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName1" name="fileName1" placeholder="가격"
		      >
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="amount" class="col-sm-offset-1 col-sm-3 control-label">상품수량</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="amount" name="amount" placeholder="판매하실 수량을 입력해주세요">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" data-prodNo="${product.prodNo }" >등 &nbsp;록</button>
			  <a class="ct_btn01" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>

</form>
</div>
</body>
</html>