<%@page import="com.my.dto.MyBoardDto"%>
<%@page import="com.my.dao.MyBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int myno = Integer.parseInt(request.getParameter("myno"));
	MyBoardDao dao = new MyBoardDao();
	MyBoardDto dto = dao.selectOne(myno);
%>

	<table border="1">
  <tr>
    <th>NAME</th>
    <td><%=dto.getMyname() %></td>
  </tr>
  <tr>
    <th>TITLE</th>
    <td><%=dto.getMytitle() %></td>
  </tr>
  <tr>
  	<th>CONTENT</th>
  	<td>
  		<textarea rows="10" cols="60" readonly="readonly"><%=dto.getMycontent() %></textarea>
  	</td>
  </tr>
  <tr>
  	<td colspan="2">
  		<button onclick="">수정</button>&nbsp;&nbsp;
  		<button onclick="">삭제</button>&nbsp;&nbsp;
  		<button onclick="">목록</button>&nbsp;&nbsp;
  	</td>
  </tr>
</table>


</body>
</html>