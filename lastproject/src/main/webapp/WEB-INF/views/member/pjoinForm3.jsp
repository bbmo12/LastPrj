<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="float: none; margin: 0 auto 0 auto;"
		class="col-8 grid-margin stretch-card">
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">회사 정보</h4>
						<form class="forms-sample" action="pjoin_3" method="post" enctype="multipart/form-data">
						<input type="hidden" class="form-control" id="p_id" name="p_id" value="${p_id.p_id}">
						<h4 class="card-title">운영시간</h4>
							<div class="form-group">
								<input type="text" readonly="readonly" name="w_day" id="w_day" value="월">
								<select  id="selectStart" name="timeVOList[${status.index}].starttime">
									<option value='' selected>오픈시간</option>
									<option value='9:00'>9:00</option>
									<option value='9:30'>9:30</option>
									<option value='10:30'>10:30</option>
									<option value='11:00'>11:00</option>
									<option value='12:00'>12:00</option>
									<option value='12:30'>12:30</option>
								</select>
								<select  id="selectEnd" name="timeVOList[${status.index}].endtime" >
									<option value='' selected>마감시간</option>
									<option value='13:00'>13:00</option>
									<option value='13:30'>13:30</option>
									<option value='14:00'>14:00</option>
									<option value='14:30'>14:30</option>
									<option value='15:00'>15:00</option>
									<option value='15:30'>15:30</option>
									<option value='16:00'>16:00</option>
									<option value='16:30'>16:30</option>
									<option value='17:00'>17:00</option>
									<option value='17:30'>17:30</option>
									<option value='18:00'>18:00</option>
									<option value='18:30'>18:30</option>
									<option value='19:00'>19:00</option>
									<option value='19:30'>19:30</option>
									<option value='20:00'>20:00</option>
									<option value='20:30'>20:30</option>
									<option value='21:00'>21:00</option>
								</select>
								<br>
								<input type="text" class="form-control" id="n_content" name="n_content">
							</div>
							<div class="form-group">
								<input type="text" readonly="readonly" name="w_day" id="w_day" value="화">
								 <select
									id="selectStart" name="timeVOList[${status.index}].starttime">
									<option value='' selected>오픈시간</option>
									<option value='9:00'>9:00</option>
									<option value='9:30'>9:30</option>
									<option value='10:30'>10:30</option>
									<option value='11:00'>11:00</option>
									<option value='12:00'>12:00</option>
									<option value='12:30'>12:30</option>
								</select>
								<select id="selectEnd" name="timeVOList[${status.index}].endtime">
									<option value='' selected>마감시간</option>
									<option value='13:00'>13:00</option>
									<option value='13:30'>13:30</option>
									<option value='14:00'>14:00</option>
									<option value='14:30'>14:30</option>
									<option value='15:00'>15:00</option>
									<option value='15:30'>15:30</option>
									<option value='16:00'>16:00</option>
									<option value='16:30'>16:30</option>
									<option value='17:00'>17:00</option>
									<option value='17:30'>17:30</option>
									<option value='18:00'>18:00</option>
									<option value='18:30'>18:30</option>
									<option value='19:00'>19:00</option>
									<option value='19:30'>19:30</option>
									<option value='20:00'>20:00</option>
									<option value='20:30'>20:30</option>
									<option value='21:00'>21:00</option>
								</select>
								<br>
								<input type="text" class="form-control" id="n_content" name="n_content">
							</div>
							<div class="form-group">
								<input type="text" readonly="readonly" name="w_day" id="w_day" value="수">
								<select	id="selectStart" name="timeVOList[${status.index}].starttime">
									<option value='' selected>오픈시간</option>
									<option value='9:00'>9:00</option>
									<option value='9:30'>9:30</option>
									<option value='10:30'>10:30</option>
									<option value='11:00'>11:00</option>
									<option value='12:00'>12:00</option>
									<option value='12:30'>12:30</option>
								</select> <select id="selectEnd" name="timeVOList[${status.index}].endtime" >
									<option value='' selected>마감시간</option>
									<option value='13:00'>13:00</option>
									<option value='13:30'>13:30</option>
									<option value='14:00'>14:00</option>
									<option value='14:30'>14:30</option>
									<option value='15:00'>15:00</option>
									<option value='15:30'>15:30</option>
									<option value='16:00'>16:00</option>
									<option value='16:30'>16:30</option>
									<option value='17:00'>17:00</option>
									<option value='17:30'>17:30</option>
									<option value='18:00'>18:00</option>
									<option value='18:30'>18:30</option>
									<option value='19:00'>19:00</option>
									<option value='19:30'>19:30</option>
									<option value='20:00'>20:00</option>
									<option value='20:30'>20:30</option>
									<option value='21:00'>21:00</option>
								</select> <br> 
								<input type="text" class="form-control" id="n_content" name="n_content">
							</div>
							<div class="form-group">
								<input type="text" readonly="readonly"name="w_day" id="w_day" value="목">
								<select id="selectStart" name="timeVOList[${status.index}].starttime">
								<option value='' selected>오픈시간</option>
								<option value='9:00'>9:00</option>
								<option value='9:30'>9:30</option>
								<option value='10:30'>10:30</option>
								<option value='11:00'>11:00</option>
								<option value='12:00'>12:00</option>
								<option value='12:30'>12:30</option>
								</select>
								<select id="selectEnd" name="timeVOList[${status.index}].endtime">
									<option value='' selected>마감시간</option>
									<option value='13:00'>13:00</option>
									<option value='13:30'>13:30</option>
									<option value='14:00'>14:00</option>
									<option value='14:30'>14:30</option>
									<option value='15:00'>15:00</option>
									<option value='15:30'>15:30</option>
									<option value='16:00'>16:00</option>
									<option value='16:30'>16:30</option>
									<option value='17:00'>17:00</option>
									<option value='17:30'>17:30</option>
									<option value='18:00'>18:00</option>
									<option value='18:30'>18:30</option>
									<option value='19:00'>19:00</option>
									<option value='19:30'>19:30</option>
									<option value='20:00'>20:00</option>
									<option value='20:30'>20:30</option>
									<option value='21:00'>21:00</option>
								</select>
								<br>
								<input type="text" class="form-control" id="n_content" name="n_content">
							</div>
							<div class="form-group">
								<input type="text" readonly="readonly"name="w_day" id="w_day"  value="금">
								<select
									id="selectStart" name="timeVOList[${status.index}].starttime">
								<option value='' selected>오픈시간</option>
								<option value='9:00'>9:00</option>
								<option value='9:30'>9:30</option>
								<option value='10:30'>10:30</option>
								<option value='11:00'>11:00</option>
								<option value='12:00'>12:00</option>
								<option value='12:30'>12:30</option>
								</select>
								<select id="selectEnd"name="timeVOList[${status.index}].endtime" >
									<option value='' selected>마감시간</option>
									<option value='13:00'>13:00</option>
									<option value='13:30'>13:30</option>
									<option value='14:00'>14:00</option>
									<option value='14:30'>14:30</option>
									<option value='15:00'>15:00</option>
									<option value='15:30'>15:30</option>
									<option value='16:00'>16:00</option>
									<option value='16:30'>16:30</option>
									<option value='17:00'>17:00</option>
									<option value='17:30'>17:30</option>
									<option value='18:00'>18:00</option>
									<option value='18:30'>18:30</option>
									<option value='19:00'>19:00</option>
									<option value='19:30'>19:30</option>
									<option value='20:00'>20:00</option>
									<option value='20:30'>20:30</option>
									<option value='21:00'>21:00</option>
								</select>
								<br>
								<input type="text" class="form-control" id="n_content" name="n_content">
							</div>
							<div class="form-group">
								<input type="text" readonly="readonly" name="w_day" id="w_day" value="토">
								<select
									id="selectStart" name="timeVOList[${status.index}].starttime">
								<option value='' selected>오픈시간</option>
								<option value='9:00'>9:00</option>
								<option value='9:30'>9:30</option>
								<option value='10:30'>10:30</option>
								<option value='11:00'>11:00</option>
								<option value='12:00'>12:00</option>
								<option value='12:30'>12:30</option>
								</select>
								 <select id="selectEnd" name="timeVOList[${status.index}].endtime" >
									<option value='' selected>마감시간</option>
									<option value='13:00'>13:00</option>
									<option value='13:30'>13:30</option>
									<option value='14:00'>14:00</option>
									<option value='14:30'>14:30</option>
									<option value='15:00'>15:00</option>
									<option value='15:30'>15:30</option>
									<option value='16:00'>16:00</option>
									<option value='16:30'>16:30</option>
									<option value='17:00'>17:00</option>
									<option value='17:30'>17:30</option>
									<option value='18:00'>18:00</option>
									<option value='18:30'>18:30</option>
									<option value='19:00'>19:00</option>
									<option value='19:30'>19:30</option>
									<option value='20:00'>20:00</option>
									<option value='20:30'>20:30</option>
									<option value='21:00'>21:00</option>
								</select>
								<br>
								<input type="text" class="form-control" id="n_content" name="n_content">
							</div>
							<div class="form-group">
								<input type="text" readonly="readonly" name="w_day" id="w_day" value="일">
								<select
									id="selectStart" name="timeVOList[${status.index}].starttime">
								<option value='' selected>오픈시간</option>
								<option value='9:00'>9:00</option>
								<option value='9:30'>9:30</option>
								<option value='10:30'>10:30</option>
								<option value='11:00'>11:00</option>
								<option value='12:00'>12:00</option>
								<option value='12:30'>12:30</option>
								</select>
								 <select id="selectEnd" name="timeVOList[${status.index}].endtime"  >
									<option value='' selected>마감시간</option>
									<option value='13:00'>13:00</option>
									<option value='13:30'>13:30</option>
									<option value='14:00'>14:00</option>
									<option value='14:30'>14:30</option>
									<option value='15:00'>15:00</option>
									<option value='15:30'>15:30</option>
									<option value='16:00'>16:00</option>
									<option value='16:30'>16:30</option>
									<option value='17:00'>17:00</option>
									<option value='17:30'>17:30</option>
									<option value='18:00'>18:00</option>
									<option value='18:30'>18:30</option>
									<option value='19:00'>19:00</option>
									<option value='19:30'>19:30</option>
									<option value='20:00'>20:00</option>
									<option value='20:30'>20:30</option>
									<option value='21:00'>21:00</option>
								</select>
								<br>
								<input type="text" class="form-control" id="n_content" name="n_content">
							</div>
						

					
					<h4>여기 서비스내용 란.</h4>
					<div class="form-group">
								<label for="exampleInputPassword4">서비스 내용</label>
								<input type="text" class="form-control" id="title" name="title"	placeholder="서비스내용">
					</div>
					<div class="form-group">
								<label for="exampleInputPassword4">서비스 금액</label>
								<input type="text" class="form-control" id="price" name="price"	placeholder="서비스금액">
					</div>
					<div class="form-group">
								<label for="exampleInputPassword4">서비스 설명</label>
								<textarea class="form-control" id="content" name="content"
									placeholder="서비스 설명" rows="4" cols="130">
                        		</textarea>
                        		<button type="button" onclick="serviceadd()">+</button>
                        		<div id="serviceadd"></div>
					</div>


				

						
							<div class="form-group">
								<h5>
								<h4 class="card-title">서비스 가능한 동물</h4>	
								</h5>
								<label>개
								<input type="checkbox" id="code" name="code" value="501"><span class="checkmark"></span></label>&emsp;
								<label>고양이
								<input type="checkbox" id="code" name="code" value="502"><span	class="checkmark"></span></label>&emsp; 
								<label>조류
								<input type="checkbox" id="code" name="code" value="503"><span class="checkmark"></span></label>&emsp; 
								<label>파충류
								<input type="checkbox" id="code" name="code" value="504"><span	class="checkmark"></span></label>&emsp;
								<label>어류
								<input type="checkbox" id="code" name="code" value="505"><span	class="checkmark"></span></label>&emsp; 
								<label>토끼
								<input type="checkbox" id="code" name="code" value="506"><span class="checkmark"></span></label>&emsp;
								<label>돼지
								<input type="checkbox" id="code" name="code" value="507"><span class="checkmark"></span></label>&emsp;
								<label>햄스터
								<input type="checkbox" id="code" name="code" value="508"><span	class="checkmark"></span></label>&emsp;
								<label>미어켓
								<input type="checkbox" id="code" name="code" value="509"><span	class="checkmark"></span></label>&emsp;
								<label>여우
								<input type="checkbox" id="code" name="code" value="510"><span class="checkmark"></span></label>&emsp; 
								<label>거미
								<input type="checkbox" id="code" name="code" value="511"><span	class="checkmark"></span></label>&emsp;
							</div>

						

							<h4 class="card-title">이미지를 등록하세요</h4>
						
							<div class="form-group">
								<label for="exampleInputPassword4">자격증 사진</label> <input
									type="file" name="multiFileList1" multiple class="form-control">
								<button type="button" onclick="addFile1()">+</button>
								<br>
								<div id="ffile1"></div>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword4">활동 사진</label> <input
									type="file" name="multiFileList2" multiple class="form-control">
								<button type="button" onclick="addFile2()">+</button>
								<br>
								<div id="ffile2"></div>
							</div>

							<button type="submit" class="btn btn-primary mr-2">완료</button>
							<button class="btn btn-light" onclick="location.href='home'">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
         function addFile1(){
            var input = $('<input>').attr({
               'name' : 'multiFileList1',
               'type' : 'file'
            });
            
            $('#ffile1').append(input);
         }
         
         function addFile2(){
            var input = $('<input>').attr({
               'name' : 'multiFileList2',
               'type' : 'file'
            });
            
            $('#ffile2').append(input);
         }
         
         function serviceadd(){
             var input = $('<input>').attr({
                'name' : 'serviceadd',
                'type' : 'text'
             });
             
             $('#serviceadd').append(input);
          }
      </script>
</body>
</html>