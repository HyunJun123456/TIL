<%@page import="com.my.dao.MyBoardDao"%>
<%@page import="com.my.dto.MyBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");
	
	MyBoardDto dto = new MyBoardDto();
	dto.setMyno(myno);
	dto.setMytitle(mytitle);
	dto.setMycontent(mycontent);
	
	MyBoardDao dao = new MyBoardDao();
	int res = dao.update(dto);
	
	if(res>0){
%>		
		<h2 style="color:blue;">수정 성공</h2>
		<button onclick="location.href='mylist.jsp'">확인</button>
<%
	}else{
%>
		<h2 style="color:red;">수정 실패</h2>
		<button onclick="location.href='myupdate.jsp?myno=<%=dto.getMyno() %>'">되돌아가기</button>
<%	
	}
%>
</body>
</html>