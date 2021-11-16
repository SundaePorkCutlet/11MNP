<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script type="text/javascript" src="../javascript/calendar.js">
</script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	  <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
    
    <style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	
</head>


<body>
<jsp:include page="/layout/toolbar.jsp" />
	<div class="page-header">
	       <h2 class=" text-info">�̴ϰ��Ӱ��!</h2>
	    
	    </div>
<h3><c:if test = "${rs=='����'}">
��������Ʈ�� �����մϴ�.<br>
���� �����Ͻ� ����Ʈ�� �°� �������ּ���.
</c:if></h3>




<h3><c:if test = "${rs=='����'}">
������ : ${result}<br>
�� ���� : ${gameNumber} <hr>
���ϵ帳�ϴ� �����Դϴ�!!<br>
${gamePoint}����Ʈ�� �߰� �����Ǿ����ϴ�.

</c:if></h3>
<h3>
<c:if test = "${rs=='����'}">
������ : ${result}<br>
�� ���� : ${gameNumber} <hr>
�ƽ����ϴ� �����Դϴ� �Ф�<br>
${gamePoint*-1}����Ʈ�� ���󰬽��ϴ�.
</c:if></h3>
<br><br>

					<div class="form-group">
		   <div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary" style="padding-top:3px;" >
						<a href="../miniGame/randomView.jsp;" style="color:white;">�ٽ��ϱ�</a></button>
			</div>
			</div>
				
					
				



</body>
</html>