<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
</head>

<script type="text/javascript">
	
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

	<h1 align="center">입사지원서</h1>
	<form>
		<table align="center" border="1" width="90%">
			<tr>
				<td><br />
					<table align="center">
						<tr>
							<td>
								<table border="1">
									<tr>
										<td>이름</td>
										<td width="200" id="name">${name}</td>
										<td>생년월일</td>
										<td width="200"><input></td>
									</tr>
									<tr>
										<td>성별</td>
										<td><select>
												<option>남자</option>
												<option>여자</option>
										</select></td>
										<td>연락처</td>
										<td id="phone">${phone}</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input></td>
										<td>주소</td>
										<td><input></td>
									</tr>
									<tr>
										<td>희망근무지</td>
										<td><select>
												<option>서울</option>
												<option>인천</option>
												<option>대전</option>
												<option>대구</option>
												<option>광주</option>
												<option>울산</option>
												<option>부산</option>
												<option>경기</option>
												<option>강원</option>
												<option>충북</option>
												<option>충남</option>
												<option>전북</option>
												<option>전남</option>
												<option>경북</option>
												<option>경남</option>
												<option>제주</option>
										</select></td>
										<td>근무형태</td>
										<td><select>
												<option>계약직</option>
												<option>정규직</option>
										</select></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<h1>학력</h1>
					<table align="center">
						<tr>
							<td>
								<table align="right">
									<tr>
										<td>
											<button>추가</button>
										</td>
										<td>
											<button>삭제</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table border="1">
									<tr>
										<td></td>
										<td width="200">재학기간</td>
										<td>구분</td>
										<td width="200">학교명(소재지)</td>
										<td width="200">전공</td>
										<td width="200">학점</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td><input /><br />~<br /> <input /></td>
										<td><select>
												<option>재학</option>
												<option>중퇴</option>
												<option>졸업</option>
										</select></td>
										<td><input /><br /> <select>
												<option>서울</option>
												<option>인천</option>
												<option>대전</option>
												<option>대구</option>
												<option>광주</option>
												<option>울산</option>
												<option>부산</option>
												<option>경기</option>
												<option>강원</option>
												<option>충북</option>
												<option>충남</option>
												<option>전북</option>
												<option>전남</option>
												<option>경북</option>
												<option>경남</option>
												<option>제주</option>
										</select></td>
										<td><input /></td>
										<td><input /></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<h1>경력</h1>
					<table align="center">
						<tr>
							<td>
								<table align="right">
									<tr>
										<td>
											<button>추가</button>
											<button>삭제</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table align="center" border="1">
									<tr>
										<td></td>
										<td width="250">근무기간</td>
										<td width="200">회사명</td>
										<td width="200">부서/직급/지역</td>
										<td width="200">지역</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td><input /><br />~<br /> <input /></td>
										<td><input /><br /></td>
										<td><input /></td>
										<td><input /></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<h1>자격증</h1>
					<table align="center">
						<tr>
							<td>
								<table align="right">
									<tr>
										<td>
											<button>추가</button>
											<button>삭제</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table align="center" border="1">
									<tr>
										<td></td>
										<td width="300">자격증명</td>
										<td width="275">취득일</td>
										<td width="275">발행처</td>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td><input /></td>
										<td><input /></td>
										<td><input /></td>
									</tr>
								</table>
							</td>
						</tr>
					</table> <br /></td>
			</tr>
		</table>
		<br />
		<table align="center">
			<tr>
				<td>
					<button>저장</button>
				</td>
				<td>
					<button>제출</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>