<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<%
request.setCharacterEncoding("UTF-8");
String get_id = request.getParameter("get_id");
%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<SCRIPT LANGUAGE="JavaScript">
	function getDate() {
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth();
		var date = now.getDate();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		document.write(year + "년 " + month + "월 " + date + "일 " + hours + ":"
				+ minutes + ":" + seconds);
	}
</SCRIPT>
<style>
.contaner {
	/*flex : 정렬을 위한 컨테이너*/
	display: flex;
	/*주측 방향 정렬 (가로에서만)*/
	justify-content: flex-start;
	/*교차측 방향 정렬 (가로세로모두에서)*/
	align-items: flex-start;
}

#table {
	width: 900px;
	margin-top: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

tr, th {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Board-Project</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="BoardList.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href='gongji_list.jsp'>board1</a></li>
					<li class="nav-item"><a class="nav-link"
						href='gongji_list2.jsp'>board2</a></li>
				</ul>
				<form class="d-flex" method='get' action='gongji_search.jsp'>
					<input class="form-control me-2" type="text" placeholder="Search"
						aria-label="Search" name="keyword"> 
					<input class="btn btn-outline-secondary" type="submit" value="Search">
				</form>
			</div>
		</div>
	</nav>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://34.83.91.32:3306/kopoctc", "root", "2356");
		Statement stmt = conn.createStatement();

		String QueryTxt;
		QueryTxt = String.format("select * from gongji where id=" + get_id + ";");

		ResultSet rset = stmt.executeQuery(QueryTxt);
		String id = "";
		String title = "";
		String date = "";
		String content = "";
		String viewcnt = "";
		while (rset.next()) {
			id = rset.getString(1);
			title = rset.getString(2);
			date = rset.getString(3);
			content = rset.getString(4);
			viewcnt = rset.getString(5);
		}
	%>
	<form method="post" action="gongji_set.jsp">
		<div class="container">
			<div id="table">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col"><b>번호</b></th>
							<th scope="col" style="vertical-align: top;">
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Username"
										name=get_id value=<%=get_id%> readonly>
								</div>
							</th>
						</tr>
						<tr>
							<th scope="col" style="vertical-align: top;">조회수</th>
							<th scope="col" style="vertical-align: top;">
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Username"
										name=get_viewcnt value=<%=viewcnt%> readonly>
								</div>
							</th>
						</tr>
						<tr>
							<th scope="col"><b>제목</b></th>
							<th scope="col"><input type="text" class="form-control"
								value=<%=title%> aria-label="Username" name=get_title size="20"
								maxlength="70" minlength="1" onkeyup='characterCheck(this);'
								onkeydown='characterCheck(this);' onchange='noSpaceForm(this);'
								autocomplete='off' required></th>
						</tr>
						<tr>
							<th scope="col"><b>일자</b></th>
							<th scope="col" style="text-align: left;"><script>
								getDate()
							</script></th>
							<!--<input type=text name=get_date readonly></td>-->
						</tr>
						<tr>
							<th scope="col"><b>내용</b></th>
							<th scope="col">
								<div class="input-group">
									<textarea class="form-control" aria-label="With textarea"
										placeholder="내용을 작성해 주세요."
										style='width: 500px; height: 250px;' name=get_content cols=70
										row=600 onkeyup='characterCheck(this);'
										onkeydown='characterCheck(this);'
										onchange='noSpaceForm(this);' autocomplete='off' required><%=content%></textarea>
								</div>
							</th>
						</tr>
				</table>
			</div>
		</div>
		<%
		rset.close();
		stmt.close();
		conn.close();

		} catch (Exception e) {
		out.print(e);
		}
		%>
		<div class="container">
			<table class="buttons">
				<tr>
					<td width=780></td>
					<td><input class="btn btn-outline-secondary" type=button
						value="취소" OnClick="location.href='gongji_list.jsp'"></td>
					<td><input class="btn btn-outline-secondary" type="submit"
						value="수정"></td>
					<td>
						<input class="btn btn-outline-secondary" type=button 
						value="삭제" OnClick="location.href='gongji_delete.jsp?get_id=<%=get_id%>'">
					</td>
				</tr>
			</table>
			</div>
	</form>
	<script>
		function characterCheck(obj) {
			var regExp = /[\{\}\\?.,;(\)*~~\'!^-_+<>!\#$%&\'\"\(\=]/gi;
			if (regExp.test(obj.value)) {
				alert('특수문자는 입력하실수 없습니다.');
				obj.value = obj.value.substring(0, obj.value.length - 1);
			}
		}
		function noSpaceForm(obj) {
			var str_space = /\s/;
			if (str_space.exec(obj.value)) {
				alert("해당 항목에는 공백을 사용할수 없습니다.");
				obj.focus();
				obj.value = obj.value.replace(' ', '');
			}
		}
	</script>
</body>
</html>
