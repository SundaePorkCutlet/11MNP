<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<body>
<a href="javascript:kakaoLogin();" ><img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:30px;width:auto;"></a>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init("3d4ef7f8d4596e30f984701a9b6dfa51");

function kakaoLogin(){
	window.Kakao.Auth.login({
		
		scope:'account_email,profile_nickname, gender, birthday',
		success : function(authObj){
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me',
				success: function (response) {
					console.log(response.kakao_account);
                    let email = response.kakao_account.email;
                    let birthday = response.kakao_account.birthday;
             		let name = response.kakao_account.profile.nickname;
					console.log(name);
					$.ajax({
	                type : 'post',
	                data : {"email":email , "birthday":birthday , "name":name},
	                url: '/user/kakaoLogin' ,
	                dataType : 'json',
	                success : function(data) {
	                	console.log("success");
	              window.location.href="http://localhost:8090/index.jsp";
					}
				});
				
				}
			});
		}
	});
}
</script>
</body>
</html>