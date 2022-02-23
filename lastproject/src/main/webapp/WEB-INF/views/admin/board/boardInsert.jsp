<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<style>
              th, td{
                 text-align:center;
              } 
              th {
                background-color: #f5f5f5;
              }
              td {
                background-color: #fffafa;
              }
.click{
position: relative;
left:1370px;
top: 40px;
background-color: rgba(255, 255, 255, 0);
border-color: rgba(255, 255, 255, 0);
color: white;
}
.btn{
position: relative;
left:1360px;
top: 40px;
background-color: rgba(255, 255, 255, 0);
border-color: rgba(255, 255, 255, 0);
color: white;
}		          
.title{
position: relative;
left:440px;
top: -10px;
}

}   

</style>
<body>
	<div style="color: white;" class="title"><h1>글쓰기</h1>
	</div>
   <div style="margin-top:150px">
      <form id="frm" action="noticeInsert.do" method="post" enctype="multipart/form-data">
       <table width=53% height=500px border=1 align=center>
      	<colgroup>
      		<col width="15%">
      		<col width="*">
      	</colgroup>
      	<tbody>
      	<tr>
             <th scope="row">제목</th>
             <td class="view_text">
             <td> <input type="text" id="notice_title" name="notice_title"  value="${notices.notice_title}"></td>
        </tr>
        	<tr>
             <th scope="row">내용</th>
             <td colspan="3" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="notice_subject" name="notice_subject">${notices.notice_subject 	}</textarea>
                        </td>
        	</tr>
        	<tr>
             <th scope="row">작성자</th>
             <td class="view_text">
             <td><input type="email" id="notice_writername" name="notice_writername"  value="${notices.notice_writername}"></td> 
       		</tr>
      	
      </table> 
  		<div><input  type="submit" class="click" value="등 록">&nbsp;&nbsp;
        <input type="reset" class="btn" value="취 소"></div>
      </form>
   </div>
</body>
</html>