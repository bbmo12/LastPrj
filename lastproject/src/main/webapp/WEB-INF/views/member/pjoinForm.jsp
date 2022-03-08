<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>

//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /* /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; */ RegExp(/^[가-힣]{2,4}$/);
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([016789])([0-9]{3,4})([0-9]{4})$/;


var birthJ = false;

var address = $('#mem_detailaddress');

	$(document).ready(function(){
		/* 아이디 중복체크 */
		$('form').on('submit', function(){
			var inval_Arr = new Array(5).fill(false);
			
			if($('#idCheck').val() === 'NO'){
				alert("아이디 중복체크를 해주세요.");
				inval_Arr[0] = false;
				return false;
			}else if($('#idCheck').val() === 'YES'){
				inval_Arr[0] = true;  
			}
			
			if($("#password").val() != $("#password1").val()){
				alert("패스워드가 일치하지 않습니다.");
				$("#password").val('');
				$("#password1").val('');
				$("#password").focus();
				inval_Arr[1] = false;
				return false;
			}else{
				 inval_Arr[1] = true;
			}
			
		     // 이름 정규식
		     if (nameJ.test($('#name').val())) {
		        inval_Arr[2] = true;   
		     } else {
		        inval_Arr[2] = false;
		        alert('이름을 확인하세요.');
		        return false;
		     }
		     
		     // 휴대폰번호 정규식
		     if (phoneJ.test($('#tel').val())) {
		        console.log(phoneJ.test($('#tel').val()));
		        inval_Arr[4] = true;
		     } else {
		        inval_Arr[4] = false;
		        alert('휴대폰 번호를 확인하세요.');
		        return false;
		     }
			
			     return true;
			
		  });

	

	   $('#password').blur(function() {
	      if (pwJ.test($('#password').val())) {
	         console.log('true');
	         $('#pw_check').text('');
	      } else {
	         console.log('false');
	         $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
	         $('#pw_check').css('color', 'red');
	      }
	   });

	   //1~2 패스워드 일치 확인
	   $('#password1').blur(function() {
	      if ($('#password').val() != $(this).val()) {
	         $('#pw1_check').text('비밀번호가 일치하지 않습니다.');
	         $('#pw1_check').css('color', 'red');
	      } else {
	         $('#pw1_check').text('');
	      }
	   });

	   //이름에 특수문자 들어가지 않도록 설정
	   $("#name").blur(function() {
	      if (nameJ.test($(this).val())) {
	         console.log(nameJ.test($(this).val()));
	         $("#name_check").text('');
	      } else {
	         $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
	         $('#name_check').css('color', 'red');
	      }
	   });
	               // 휴대전화
	              $('#tel').blur(function(){
	                 if(phoneJ.test($(this).val())){
	                    console.log(phoneJ.test($(this).val()));
	                    $("#tel_check").text('');
	                 } else {
	                    $('#tel_check').text('휴대폰번호를 확인해주세요 ');
	                    $('#tel_check').css('color', 'red');
	                 }
	              });

	});
	
</script>

<div style="float : none; margin : 0 auto 0 auto;" class="col-8 grid-margin stretch-card">
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">내 정보</h4>
						<form class="forms-sample" action="pjoin_1" method="post" enctype="multipart/form-data">
						<div class="form-group">
								<h5> <strong>자격증번호*</strong></h5>
								<input type="text" class="form-control" id="no" name="no" placeholder="자격증번호를 입력하세요">
							</div>
							<div class="form-group">
								<label>수의사&emsp;<input type="radio" id="code" name="code" value="100"><span class="checkmark"></span></label>
								<label>미용사&emsp;<input type="radio" id="code" name="code" value="103"><span class="checkmark"></span></label>
								<label>펫시터&emsp;<input type="radio" id="code" name="code" value="102"><span class="checkmark"></span></label>
								<label>훈련사&emsp;<input type="radio" id="code" name="code" value="101"><span class="checkmark"></span></label>
							</div>
							<div class="form-group">
								<h5> <strong>이름*</strong></h5>
								<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
								<div id="name_check"></div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail3">아이디*</label>
								<input type="email" class="form-control" id="p_id" name="p_id" placeholder="Email">
								<button type="button" class="site-btn" onclick="isIdCheck()" id="idCheck" value="NO">중복체크</button>
								<div id="id_check"></div>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">비밀번호*</label> <input type="password" class="form-control" id="password" name="password"
									placeholder="Password">
									<div id="pw_check"></div>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword4">비밀번호확인*</label>
								<input type="password" class="form-control" id="password1" name="password1"	placeholder="Password">
								<div id="pw1_check"></div>
							</div>
							<div class="form-group">
								<label for="exampleSelectGender">전화번호*</label>
								<p>휴대폰 번호('-'없이 번호만 입력해주세요)<span>*</span></p>
								<input type="text" class="form-control" id="tel" name="tel"	placeholder="tel">
								 <div id="tel_check"></div>
							</div>
							 <div class="form-group">
								<label>프로필 사진</label>
								<div class="input-group col-xs-12">
								<input  class="file-upload-browse btn btn-primary" type="file" id="file" name ="file">
								</div>
							</div>
							
							<button type="submit" class="btn btn-primary mr-2">다음</button>
							<button class="btn btn-light" onclick="location.href='home'" >취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	/* 아이디 중복체크 */
	function isIdCheck(){
		var id = $("#p_id").val();
		if(id != ''){
			//ajax
			$.ajax({
				url : "pajaxIsIdCheck",
				type : "post",
				data : {"p_id" : id},
				success : function(result){
					var b = (result===true); // 넘어온 값을 boolean 타입으로 변경 false = 0 true = 1
					if(b){
						/* alert("사용가능한 아이디입니다."); */
						$("#idCheck").val("YES");
						//$("#idCheck").prop("disabled", true);
						$("#id_check").text('사용가능한 아이디입니다.');
						$("#id_check").css('color', 'blue');
						$("#member_password").focus();
						
					}else{
						/* alert("이미 사용중인 아이디입니다."); */
						$("#p_id").val('');
						$("#id_check").text('이미 사용중인 아이디입니다.');
						$("#id_check").css('color', 'red');
						$("#p_id").focus();
					}
				}
			});
		} else{
			$("#id_check").text('이메일을 입력해주세요.');
			$("#id_check").css('color', 'red');
			$("#p_id").focus();
		}
	}
	</script>