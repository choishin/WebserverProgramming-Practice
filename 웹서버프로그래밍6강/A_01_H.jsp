<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@ page errorPage="A_error.jsp" contentType = "text/html; charset=utf-8" %>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*"%>
<html>
<head> 
<title>후보등록 A _01_H.jsp </title> 
</head> 
<body> 
<table cellspacing=3 width=600 border=1>
	<tr> 
		<td width=100 bgcolor="#00FFFF"><a href="A_01_H.jsp">후보등록</a></td> 
		<td width=100><a href="B_01_H.jsp">투표</a></td>
		<td width=100><a href="C_01_H.jsp">개표결과</a></td>
	</tr> 
</table> 
<h1>후보등록</h1> 
<table cellspacing=3 width=600 border=1> 
<tr>
<td><p align=center>후보명 입력</p></td> 
</tr> 
<tr>
<td> 
	<form method="post" action="A_02_H.jsp"> 
	기호: <input type="text" name="hubo_kiho" value="1" readonly> 이름: <input type="text" name="hubo_name" value="김일돌" readonly> <input type="submit" value="삭제"> 
	</form>
</td>
</tr>
<tr>
<td> 
	<form method="post" action="A_02_H.jsp"> 
	기호: <input type="text" name="hubo_kiho" value="2" readonly> 이름: <input type="text" name="hubo_name" value="김이돌" readonly> <input type="submit" value="삭제"> 
	</form>
</td>
</tr>
<tr>
<td> 
	<form method="post" action="A_02_H.jsp"> 
	기호: <input type="text" name="hubo_kiho" value="3" readonly> 이름: <input type="text" name="hubo_name" value="김삼돌" readonly> <input type="submit" value="삭제"> 
	</form>
</td>
</tr>
<tr>
<td> 
	<form method="post" action="A_02_H.jsp"> 
	기호: <input type="text" name="hubo_kiho" value="4" readonly> 이름: <input type="text" name="hubo_name" value="김사돌" readonly> <input type="submit" value="삭제"> 
	</form>
</td>
</tr>
<tr>
<td> 
	<form method="post" action="A_03_H.jsp"> 
	기호: <input type="text" name="hubo_kiho" value="5"> 이름: <input type="text" name="hubo_name" value=""> <input type="submit" value="추가"> 
	</form>
</td>
</tr>
</table> 

</body> 
</html>