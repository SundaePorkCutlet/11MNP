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
//==> null 을 ""(nullString)으로 변경
String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>

--%>




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
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="./jquery.jscroll.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
// function fncGetUserList(currentPage) {
// 	document.getElementById("currentPage").value = currentPage;
//    	document.detailForm.submit();		
// }









$(function() {
	
    $('#searchKeyword').autocomplete({
     
        source : function(request, response) {
            $.ajax({
                type : 'post',
                url: '/product/json/autoComplete' ,
                dataType : 'json',
                success : function(data) {
               
//                     // 서버에서 JSON 데이터 RESPONSE 후 목록 추가
//                     RESPONSE(
//                         $.MAP(DATA, FUNCTION(ITEM) {
//                             RETURN {
                               
//                                 VALUE : ITEM
                               
//                             }
//                         })
//                     );
                	var final_data =( $.map( data, function( item ) {
						return {
							value : item
						}
					}));
					response($.ui.autocomplete.filter(final_data, $("#searchKeyword").val()));


                }
            });
        }
    })
    .autocomplete('instance')._renderItem = function(ul, item) { // UI 변경 부
        return $('<li>') //기본 tag가 li
        .append('<div>' + item.value + '<br> </div>') // 원하는 모양의 HTML 만들면 됨
        .appendTo(ul);
    };
});



	function fncGetUserList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}


	 
	 $(function() {
			
		 $( "button.btn.btn-default" ).on("click" , function() {

			 fncGetUserList(1)
						
					});
		 
		
		 
		 

	 
		$( "a[href='##' ]" ).on("click" , function() {
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
														+"상품번호 : "+JSONData.prodNo+"<br/>"
														+"상품명 : "+JSONData.prodName+"<br/>"
														+"가격 : "+JSONData.price+"<br/>"
														+"수량 : "+JSONData.amount+"<br/>"
														+"상세정보 : "+JSONData.prodDetail+"<br/>"
														+"</h6>";
							//Debug...									
							//alert(displayValue);
							$("h3").remove();
							
							
						if(JSONData.amount!=0){
							$( "#"+prodNo+"" ).html(displayValue);}
						if(JSONData.amount==0){
							alert('품절된 상품입니다.')
						}
						}
					
				});
			
		});
			
			$("a[href='###' ]").on("click" , function() {
				
				if($(this).attr("data-amount")!=0){
				self.location="/product/getProduct?prodNo="+$(this).attr("data-prodNo");}
				if($(this).attr("data-amount")==0){
					alert('품절된 상품입니다.');}
			});
			
			
			

	
	//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
	
	$( ".ct_list_pop td:nth-child(2)" ).css("color" , "red");
	$("h7").css("color" , "red");
	
	
	
	$(".ct_list_pop:nth-child(2n+5)").css("background-color", "whitesmoke");
	
});	
</script>

</head>

<body>


<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>상품목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
			 <div class="col-md-12 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
			<input type="radio" name="orderOption" id = "orderOption0" value="0"  ${ ! empty search.orderOption && search.orderOption==0 ? "checked" : "" }/><label for = "orderOption0">상품명순</label>		 
		<input type="radio" name="orderOption" id = "orderOption1" value="1"  ${ ! empty search.orderOption && search.orderOption==1 ? "checked" : "" }/><label for = "orderOption1">높은가격순</label>
		<input type="radio" name="orderOption" id = "orderOption2" value="2"  ${ ! empty search.orderOption && search.orderOption==2 ? "checked" : "" }/><label for = "orderOption2">낮은가격순</label>														
		<input type="radio" name="orderOption" id = "orderOption3" value="3"  ${ ! empty search.orderOption && search.orderOption==3 ? "checked" : "" }/><label for = "orderOption3">최신순</label>														
		<input type="radio" name="orderOption" id = "orderOption4" value="4"  ${ ! empty search.orderOption && search.orderOption==4 ? "checked" : "" }/><label for = "orderOption4">오래된순</label>														
			</div>

			<div class="form-group">	
			<select class="form-control" name="searchCondition" >
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
		
			</select>
		</div>
		
		<div class="form-group" data-keyword="${search.searchKeyword}">
		 <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" data-keyword="${search.searchKeyword}" id="searchKeyword" name="searchKeyword"  placeholder="검색어" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"   class="ct_input_g" style="width:200px; height:19px" >
		</div>
		
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>

			</form>
			</div>
			</div>

<!-- <table class="table table-hover table-striped" > -->
      
    
      
      
      
      
<!--         <thead> -->
<!--           <tr> -->
<!--             <th align="center">No</th> -->
<!--             <th align="left" >상품명</th> -->
<!--             <th align="left">가격</th> -->
<!--             <th align="left">등록일</th> -->
<!--             <th align="left">수량</th> -->
<!--             <th align="left">간략정보</th> -->
<!--           </tr> -->
<!--         </thead> -->
       
<!-- 		<tbody> -->


	
   
	
	<div class="container pt-1">
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
	 
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
    
      <img src="/images/uploadFiles/${product.fileName }" width="160" height="90" alt="...">
      <div class="caption">
  
  <h3>${product.prodName }</h3>
  <p>가격 : ${product.price }</p>
  <p>수량 : 		<c:if test="${product.amount!=0 }"> 
 		<td align="left">${product.amount }</td> 
		
 		</c:if> 
 		<c:if test="${product.amount==0 }"> 
 		<td align="left" >품절된 상품입니다.</td> 
 		</c:if></p>
   <p><a href="###" class="btn btn-primary" role="button" data-prodNo="${product.prodNo }" data-amount="${product.amount}">상품보기</a> <a href="##" class="btn btn-second" role="button" data-prodNo="${product.prodNo }" >간략정보</a></p>
   <tr>
   <td align="left" class="information" data-prodNo="${product.prodNo }" data-amount="${product.amount }">
		<i id="${product.prodNo}" class = "addPuchase"  colspan="11" bgcolor="D6D7D6" height="1"></i>
		<input type="hidden" value="${product.prodNo}">
		</td>
		</tr>
</div>
</div>
</div>


	
	
	
<!-- 	<tr class="ct_list_pop"> -->
<%-- 		<td align="center">${i}</td> --%>

<%-- 				<c:if test="${product.amount!=0 }"> --%>
<%-- 				<td id ="amount" data-prodNo="${product.prodNo }" align="left"> --%>
				
<%-- 				${product.prodName } --%>
<!-- 				</td> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${product.amount==0 }"> --%>
<!-- 				<td id ="zeroamount" > -->
<!-- 				<span style="color:blue"> -->
<%-- 				${product.prodName } --%>
<!-- 				</span> -->
<!-- 				</td> -->
<%-- 				</c:if> --%>
				
		
		
<%-- 		<td align="left">${product.price }</td> --%>

<%-- 		<td align="left">${product.regDate }</td> --%>
	
<%-- 		<c:if test="${product.amount!=0 }"> --%>
<%-- 		<td align="left">${product.amount }</td> --%>
		
<%-- 		</c:if> --%>
<%-- 		<c:if test="${product.amount==0 }"> --%>
<!-- 		<td align="left">품절된 상품입니다.</td> -->

		
<%-- 		</c:if> --%>
		 
<!-- 	</td> -->
<!-- 	</tr> -->
	</c:forEach>
<!-- 	</tbody> -->
<!-- </table> -->
</div>
</div>


			<div align = "center">
			<jsp:include  page="../common/pageNavigator.jsp"/>	
			</div>
<!--  페이지 Navigator 끝 -->



</body>
</html>
