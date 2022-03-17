<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h3>비밀번호 확인</h3>
<input type="password">
<button type="button" onclick="confirmPass()">확인</button>
</div>
<script type="text/javascript">
function confirmPass() {
	$.ajax({
		
		url: 'confirmPasscheck',
		suceess:function(data){
			if(data =="sucess"){
				location.href="pmemberUpdateForm"
			}else{
				alert("실패다자식아");
			}
			
		},
		error:function(){
			
		}
		
	});
}
</script>
</body>
</html>