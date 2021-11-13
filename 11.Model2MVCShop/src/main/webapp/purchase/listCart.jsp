<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<html>
<head>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
function cart(){
	popWin = window.open("/purchase/deleteCart?prodNo=${cart.purchaseProd.prodNo}","popWin","left=300, top=200, width=200, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
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
	 
	 $('.delete').on("click" , function() {
			
		 alert('가즈아')
		 self.location ="/purchase/deleteCart?prodNo="+$(this).attr("data-prodNo")
		
				});
	 
});

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "button.btn.btn-primary" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('가입')" ).html() );
		
		
		var chek_arr = [];
		$("input[name=cartCheck]:checked").each(function(){
		var chek = $(this).val();
		chek_arr.push(chek);
})		
		if(chek_arr==0){
			alert('선택한 상품이 없습니다!')
			
		}
		if(chek_arr!=0){
		console.log(chek_arr);
		opener.parent.location="/purchase/allPurchase?chekarray="+chek_arr;
		window.close();
		 }
	});
});	

function Chk() {

	var result = Array();

	var cnt = 0;

	var chkbox = $(".checkedcart");

	for(i=0;i<chkbox.length;i++) {

		if(chkbox[i].checked == true) {

			result[cnt] = chkbox[i].value;

			cnt++;

		}

	}

	$('#result').val(result);

}

function CheckAll() {

	var chkbox = $(".checkedcart");

	var chkall = document.getElementById('checkedAllCart');

	for(i=0;i<chkbox.length;i++) {

		chkbox[i].checked = chkall.checked;

	}

	Chk();

}






</script>
</head>

<body >

<div class="container">
	
		<div class="page-header text-info">
	       <h3>장바구니</h3>
	    </div>

<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
			 <div class="col-md-12 text-right">
			 
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
            <th align="center"><input type="checkbox" id="checkedAllCart" name="cartAllCheck"  checked="checked"  onclick='CheckAll();'>
            <th align="center">이미지</th>
            <th align="center" >상품명</th>
            <th align="left">가격</th>
            <th align="left">남은수량</th>
            <th align="left">삭제</th>
          </tr>
        </thead>
       
		<tbody>
		
		<c:set var="i" value="0" />
	<c:forEach var="cart" items="${list}">
		<c:set var="i" value="${i+1}"/>
	
		<tr class="ct_list_pop">
		<td align="left" class ="getProduct1" data-prodNo="${cart.purchaseProd.prodNo}" data-amount="${cart.amount }" >
		<c:if test="${cart.amount!=0 }">
			${cart.purchaseProd.prodNo}
			</c:if>
			
			<c:if test="${cart.amount==0 }">
			${cart.purchaseProd.prodNo}
			</c:if>
			
		</td>
		
		<td>
		<c:if test="${cart.amount!=0 }">
		<input type="checkbox" class="checkedcart" name="cartCheck" value="${cart.purchaseProd.prodNo}" checked="checked"  onclick='Chk();'>
		</c:if>
		<c:if test="${cart.amount==0 }">
			품절
		</c:if>
		
		</td>
		
		<td align="left">
		
		<img 	src="/images/uploadFiles/${cart.purchaseProd.fileName }" width="140" height="105">
		
		</td>
		
		<td align="left" class ="getProduct2" data-prodNo="${cart.purchaseProd.prodNo}" data-amount="${cart.amount }" >
			<c:if test="${cart.amount!=0 }">
			${cart.purchaseProd.prodName}
			</c:if>
			
			<c:if test="${cart.amount==0 }">
			${cart.purchaseProd.prodName}
			</c:if>
			
		</td>

		<td align="left">${cart.purchaseProd.price }</td>
	
			<td align="left" ><c:if test= "${cart.amount==0 }">
			품절 상품 입니다.
			</c:if>
			<c:if test= "${cart.amount!=0 }">
			${cart.amount }
			</c:if>
			</td>
	
			<td align="left" class="delete" data-prodNo="${cart.purchaseProd.prodNo}">
			&#128701;
		</td>
		<td></td>
	
	</tr>
	</c:forEach>
	</tbody>
</table>

</div>
</div>



		<div align="center">
	
	
		  <button type="button" class="btn btn-primary"  >구 &nbsp;매</button>
		</div>

<!--  페이지 Navigator 끝 -->



</body>
</html>