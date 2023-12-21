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

	// 전역 변수 (각종 검사 통과 유무를 저장하는 변수)
	var verifyId = false;
	var verifyPw = false;
	var verifyRePw = false;

	// 아이디 검사(정규식 + 중복)
	function fnCheckId() {
		$('#userId').on('keyup', function() {
		// 입력한 아이디
		let userId = $(this).val();
		// 정규식 (5~15자, 소문자+숫자+하이픈(-)+밑줄(_) 사용 가능, 첫 글자는 소문자+숫자 사용 가능)
		let regId = /^[a-z0-9][a-z0-9_-]{4,14}$/;
		// 정규식 검사
		verifyId = regId.test(userId);
		if (verifyId == false) {
			$('#msgId')
					.text(
							'5~15자 ID를 입력해주세요. 소문자+숫자+특수문자(-,_) 사용 가능하며, 첫 글자는 소문자+숫자 사용 가능합니다.');
			return; // 여기서 함수 실행을 종료한다. (이후에 나오는 ajax(중복 체크) 실행을 막기 위해서)
			}
		})
		$('#btnIdCheck').on('click', function() {
			// 아이디 중복 체크 ajax
			var userId = $('#userId').val();
			$.ajax({
				type : 'get',
				url : '/user/idCheck.do',
				data : 'userId=' + userId,
				dataType : 'json',
				success : function(resData) { // resData = {"enableId": true} 또는 {"enableId": false}
					if (resData > 0) {
						$('#msgId').css('color', 'red').text(
								'이미 사용 중인 아이디입니다.');
					} else {
						$('#msgId').css('color', 'blue').text(
								'사용 가능한 아이디입니다.');
					}
				}
			})
		});
	}

	// 비밀번호 검사 (정규식)
	function fnCheckPw() {
		$('#userPw').on('keyup', function() {
			// 입력한 비밀번호
			let userPw = $(this).val();
			// 길이(4~20자) 및 정규식(소문자+대문자+숫자+특수문자 사용 가능, 3개 이상 조합)
			let pwLength = userPw.length;
			let validCount = /[a-z]/.test(userPw) //   소문자를 가지고 있으면 true(1), 없으면 false(0)
					+ /[A-Z]/.test(userPw) //   대문자를 가지고 있으면 true(1), 없으면 false(0)
					+ /[0-9]/.test(userPw) //     숫자를 가지고 있으면 true(1), 없으면 false(0)
					+ /[^a-zA-Z0-9]/.test(userPw); // 특수문자를 가지고 있으면 true(1), 없으면 false(0)
			verifyPw = (pwLength >= 6) && (pwLength <= 12)
					&& (validCount >= 3);
			if (verifyPw) {
				$('#msgPw').css('color', 'blue').text(
						'사용 가능한 비밀번호입니다.');
			} else {
				$('#msgPw')
						.css('color', 'red')
						.text(
								'6~12자 PW를 입력해주세요. 소문자+대문자+숫자+특수문자 사용 가능하며, 3개 이상 조합해주세요.');
			}
		})
	}

	// 비밀번호 확인
	function fnCheckPwAgain() {
		$('#userRePw').on('keyup', function() {
			// 입력된 비밀번호
			let userPw = $('#userPw').val();
			// 재입력한 비밀번호
			let rePw = $(this).val();
			// 비밀번호와 재입력한 비밀번호 검사
			verifyRePw = (rePw != '') && (rePw == userPw);
			if (verifyRePw) {
				$('#msgRePw').text('');
			} else {
				$('#msgRePw').css('color', 'red').text('비밀번호 입력을 확인하세요.');
			}
		})
	}
	
	// 우편번호 검사 (정규식)
	function fnCheckPost() {
		$('#userAddr1').on('keyup', function() {
			// 입력한 우편번호
			let userAddr1 = $(this).val();
			// 정규식(XXX-XXX)
			let validCount = /^[0-9]{3}-[0-9]{3}$/;
			// 우편번호가 정규식 패턴과 맞는지 확인
			if (validCount.test(userAddr1)) {
				$('#msgPost').css('color', 'blue').text(
						'');
			} else {
				$('#msgPost')
						.css('color', 'red')
						.text(
								'XXX-XXX 형식으로 입력해주세요.');
			}
		})
	}

	// submit (회원가입)
	$(document).on('click', '#btnJoin', function(e) {
		e.preventDefault();
		if (!verifyId || !verifyPw || !verifyRePw) {
			alert("가입 정보를 입력해주세요.");
			return;
		}
		$("#frmJoin").submit();
	});

	// 함수 호출
	$(function() {
		fnCheckId();
		fnCheckPw();
		fnCheckPwAgain();
		fnCheckPost();
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

	<form id="frmJoin" modelAttribute="userVo" role="frmJoin"
		action="/user/join.do" method="post" accept-charset="UTF-8">
		<table align="center">
			<tr>
				<td>
					<table border="1">
						<!-- 아이디 입력 -->
						<tr>
							<td>아이디</td>
							<td><input type="text" name="userId" id="userId" required />
								<!-- 중복 확인 버튼 수정 -->
								<button type="button" id="btnIdCheck">중복확인</button> <span
								id="msgId"></span></td>
						</tr>

						<!-- 비밀번호 입력 -->
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="userPw" id="userPw"
								required /><span id="msgPw"></span></td>
						</tr>

						<!-- 비밀번호 확인 -->
						<tr>
							<td>비밀번호확인</td>
							<td><input type="password" name="userRePw" id="userRePw"
								required /><span id="msgRePw"></span></td>
						</tr>

						<!-- 이름 입력 -->
						<tr>
							<td>이름</td>
							<td><input type="text" name="userName" id="userName"
								required /></td>
						</tr>

						<!-- 전화번호 입력 -->
						<tr>
							<td>전화번호</td>
							<td><select name="userPhone1" id="userPhone1">
									<option value="010">010</option>
									<option value="02">02</option>
									<option value="070">070</option>
							</select> - <input type="text" name="userPhone2" id="userPhone2"
								maxlength="4" required /> - <input type="text"
								name="userPhone3" id="userPhone3" maxlength="4" required /></td>
						</tr>

						<!-- 우편번호 및 주소 입력 -->
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="userAddr1" id="userAddr1"
								required pattern="[0-9]{3}-[0-9]{3}" /><span id="msgPost"></span></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="userAddr2" id="userAddr2"
								required /></td>
						</tr>

						<!-- 회사 입력 -->
						<tr>
							<td>회사</td>
							<td><input type="text" name="userCompany" id="userCompany" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<button type="button" id="btnJoin">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>