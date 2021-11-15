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
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 	<script src="./jquery.jscroll.js"></script> -->
	
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



	var page = 1; // ajax�� ���� back�ܿ��� select�� limit�ɼ��� �ɱ� ����
	var temp = false; // �����Ͱ� ������ ��������� ajaxȣ���� �Ǵ°��� �����ϱ� ����
	var type = "type1"; // ajax�� ���� back�ܿ��� Ȯ���� type

// 	$(document).ready(function(){
// 		$(window).scroll(function(){ // ��ũ���� ��ȭ�� ����
// 			var scrollT = $(this).scrollTop(); // ��ũ�ѹ��� �����ġ
// 			var scrollH = $(this).height(); // �ش� div�� ����
// 			var contentH = $("body").height(); // ���� ��ü�� ������ ���� div�� ����
// 			console.log(contentH)
// 			let temp1 = false;
// 			if(scrollT + scrollH+1  >= contentH && !temp1) { // ��ũ���� �Ʒ��ʿ� ��ġ�Ҷ� 
// 				page++; 
// 				console.log('����');
// 				temp1 = true;
// 				setTimeout(() => select_list(), 1000);
					
				
				
				
// 			}
// 		});
// 	});
	$(document).ready(function(){
		if(window.scrollY==0){
			console.log("�ٴ�");
            ++page; 
            select_list();
		}
		
	});
	
	$(window).scroll(function () {
	
		
		console.log(window.innerHeight+'+'+window.scrollY);
		console.log('win'+document.body.offsetHeight);
		if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            console.log("�ٴ�");
            ++page; 
            select_list();
        }
    });


	function select_list() {
		console.log($("#searchKeyword").attr("data-keyword"));
		console.log($("input:checked").val());
		
		var searchCondition = $("option:selected").val();
		var searchKeyword = $("#searchKeyword").attr("data-keyword");
	$.ajax( 

		{
			url : "/product/json/listProduct",
			type : 'post',
			data:JSON.stringify({"currentPage":page,"searchCondition":searchCondition, "orderOption":$("input:checked").val() , "searchKeyword":searchKeyword}),
			dataType : "JSON" ,
			contentType: "application/json; charset=utf-8",
			success : function(data){
			
				if(data.list.length > 0 ){
					$.each(data.list, function (idx, val){
					console.log("��Ҵ�")
					var html = '<div class="col-sm-6 col-md-3"><div class="thumbnail">  <div style="height:30%; width:100%"> <img src="/images/uploadFiles/'+val.fileName+'" width="100%" height="100%" alt="..."></div> <div class="caption">'
					html+='<h3>'+val.prodName+'</h3>'
					html+='<p>���� : '+val.price+'</p>'
					if(val.amount!=0 ){
					html+='<p>���� : 	<td align="left">'+val.amount+'</td>'}
			 		if(val.amount==0){ 
			 		html+='<p>���� : 	<td align="left" >ǰ���� ��ǰ�Դϴ�.</td>'}
			 		html+='</p>'
			 		html+='<p><a href="###" class="btn btn-primary" role="button" data-prodNo="'+val.prodNo+'" data-amount="'+val.amount+'">��ǰ����</a> <a href="##" class="btn btn-second" role="button" data-prodNo="'+val.prodNo+'" >��������</a></p>'
			 		html+=' <tr><td align="left" class="information" data-prodNo="'+val.prodNo+'" data-amount="'+val.amount+'">'
			 		html+='<i id="'+val.prodNo+'" class = "addPuchase"  colspan="11" bgcolor="D6D7D6" height="1"></i>'
			 		html+='<input type="hidden" value="'+val.prodNo+'"></td></tr>'
			 		
			 		html+='</div></div></div>';
                    // �ش��ϴ� ��ŭ li�� ���� #list �ڿ� ����
// 					$(".container pt-1").append(data.list);
				
					$(".container.pt-1").append(html);
					});
					
				}else{
				console.log("����")
                	// ���̻� ��ȸ�� �����Ͱ� ���� �� temp�� true�� ����� ���̻��� ajaxȣ���� ����.
					temp = true;
				}
			}
			,error: function(xhr, status, error) { alert(error); }
		});
	}

$(function() {
	
    $('#searchKeyword').autocomplete({
     
        source : function(request, response) {
            $.ajax({
                type : 'post',
                url: '/product/json/autoComplete' ,
                dataType : 'json',
                success : function(data) {
               
//                     // �������� JSON ������ RESPONSE �� ��� �߰�
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
    .autocomplete('instance')._renderItem = function(ul, item) { // UI ���� ��
        return $('<li>') //�⺻ tag�� li
        .append('<div>' + item.value + '<br> </div>') // ���ϴ� ����� HTML ����� ��
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
		 
		
		 
		 

	 
		$(document).on("click" ,"a[href='##' ]", function() {
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
							$("h6").remove();
							
							
						if(JSONData.amount!=0){
							$( "#"+prodNo+"" ).html(displayValue);}
						if(JSONData.amount==0){
							alert('ǰ���� ��ǰ�Դϴ�.')
						}
						}
					
				});
			
		});
			
			$(document).on("click" ,"a[href='###' ]", function() {
				
				if($(this).attr("data-amount")!=0){
				self.location="/product/getProduct?prodNo="+$(this).attr("data-prodNo");}
				if($(this).attr("data-amount")==0){
					alert('ǰ���� ��ǰ�Դϴ�.');}
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
		    		��ü  ${resultPage.totalCount } �Ǽ�
		    	</p>
		    </div>
			 <div class="col-md-12 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
			<input type="radio" name="orderOption" id = "orderOption0" value="0"  ${ ! empty search.orderOption && search.orderOption==0 ? "checked" : ""  } checked="checked"/><label for = "orderOption0">��ǰ���</label>		 
		<input type="radio" name="orderOption" id = "orderOption1" value="1"  ${ ! empty search.orderOption && search.orderOption==1 ? "checked" : "" }/><label for = "orderOption1">�������ݼ�</label>
		<input type="radio" name="orderOption" id = "orderOption2" value="2"  ${ ! empty search.orderOption && search.orderOption==2 ? "checked" : "" }/><label for = "orderOption2">�������ݼ�</label>														
		<input type="radio" name="orderOption" id = "orderOption3" value="3"  ${ ! empty search.orderOption && search.orderOption==3 ? "checked" : "" }/><label for = "orderOption3">�ֽż�</label>														
		<input type="radio" name="orderOption" id = "orderOption4" value="4"  ${ ! empty search.orderOption && search.orderOption==4 ? "checked" : "" }/><label for = "orderOption4">�����ȼ�</label>														
			</div>
			<div class="form-group">	
			<select class="form-control" name="searchCondition" >
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" } selected="selected">��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
		
			</select>
		</div>
		
		<div class="form-group" data-keyword="${search.searchKeyword}">
		 <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" data-keyword="${search.searchKeyword}" id="searchKeyword" name="searchKeyword"  placeholder="�˻���" value="${! empty search.searchKeyword ? search.searchKeyword : ""}"   class="ct_input_g" style="width:200px; height:19px" >
		</div>
		
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>

			</form>
			</div>
			</div>

<!-- <table class="table table-hover table-striped" > -->
      
    
      
      
      
      
<!--         <thead> -->
<!--           <tr> -->
<!--             <th align="center">No</th> -->
<!--             <th align="left" >��ǰ��</th> -->
<!--             <th align="left">����</th> -->
<!--             <th align="left">�����</th> -->
<!--             <th align="left">����</th> -->
<!--             <th align="left">��������</th> -->
<!--           </tr> -->
<!--         </thead> -->
       
<!-- 		<tbody> -->


	
   
	
	<div class="container pt-1">
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
	 
  <div class="col-sm-6 col-md-3"  >
    <div class="thumbnail" >
    <div style="height:30%; width:100%">
		 <img src="/images/uploadFiles/${product.fileName }" width="100%" height="100%" alt="...">
    </div>
      <div class="caption">
  
  <h3>${product.prodName }</h3>
  <p>���� : ${product.price }</p>
  <p>���� : 		<c:if test="${product.amount!=0 }"> 
 		<td align="left">${product.amount }</td> 
		
 		</c:if> 
 		<c:if test="${product.amount==0 }"> 
 		<td align="left" >ǰ���� ��ǰ�Դϴ�.</td> 
 		</c:if></p>
   <p><a href="###" class="btn btn-primary" role="button" data-prodNo="${product.prodNo }" data-amount="${product.amount}">��ǰ����</a> <a href="##" class="btn btn-second" role="button" data-prodNo="${product.prodNo }" >��������</a></p>
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
<!-- 		<td align="left">ǰ���� ��ǰ�Դϴ�.</td> -->

		
<%-- 		</c:if> --%>
		 
<!-- 	</td> -->
<!-- 	</tr> -->
	</c:forEach>
<!-- 	</tbody> -->
<!-- </table> -->
</div>
</div>


<!-- 			<div align = "center"> -->
<%-- 			<jsp:include  page="../common/pageNavigator.jsp"/>	 --%>
<!-- 			</div> -->
<!--  ������ Navigator �� -->



</body>
</html>
