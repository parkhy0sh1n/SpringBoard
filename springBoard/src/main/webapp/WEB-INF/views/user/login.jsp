<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join</title>
</head>

<script type="text/javascript">

	$(function() {
		$("#login").click(function() {
			userId = $("#userId").val();
			var passwd = $("#userPw").val();
			if (userId == "") {
				alert("아이디를 입력하세요");
				$("#userId").focus(); //입력포커스 이동
				return; //함수 종료
			}
			if (userPw == "") {
				alert("비밀번호를 입력하세요");
				$("#userPw").focus();
				return;
			}
			//폼 내부의 데이터를 전송할 주소
			document.form1.action = "/user/login_check.do";
			document.form1.submit(); //제출
		});
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

	<form name="form1" method="post">
		<table align="center">
			<tr>
				<td>
					<table border="1">
						<tr>
							<td>아이디</td>
							<td><input id="userId" name="userId"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="userPw" name="userPw"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<button type="button" id="login">로그인</button> <c:if
						test="${message == 'error'}">
						<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if> <c:if test="${message == 'logout'}">
						<div style="color: red;">로그아웃되었습니다.</div>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>