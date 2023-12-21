<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>

<script type="text/javascript">
	// 입사지원 버튼
	$(document).on('click', '#login', function() {
		var name = $("#name").val();
		var phone = $("#phone").val();
		if (name == "") {
			alert("이름을 입력하세요");
			$("#name").focus(); // 입력포커스 이동
			return; // 함수 종료
		}
		if (phone == "") {
			alert("휴대폰번호를 입력하세요");
			$("#phone").focus();
			return;
		}
	});
</script>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

table {
	border-collapse: collapse;
}

td {
	padding: 8px;
}

a {
	color: green;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

a:visited {
	color: green;
}

button {
	background-color: limegreen;
	color: white;
	padding: 4px 10px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}
</style>

<body>

	<form id="frmLogin" modelAttribute="recruitVo" role="frmLogin"
		action="/recruit/appJoin.do" method="post" accept-charset="UTF-8">
		<table align="center" border="1">
			<tr>
				<td>
					<table border="1">
						<tr>
							<td>이름</td>
							<td><input id="name" name="name" required /></td>
						</tr>
						<tr>
							<td>휴대폰번호</td>
							<td><input id="phone" name="phone" required /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center">
					<button type="submit" id="login">입사지원</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>