<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardView</title>

<script type="text/javascript">

	// 게시글 수정 화면으로 전환하는 함수
	function fnEdit() {
		$('#edit_screen').show(); // 'edit_screen' 요소를 보이도록 설정
		$('#detail_screen').hide(); // 'detail_screen' 요소를 숨기도록 설정
	}

	// 게시글 삭제를 확인하고 삭제하는 함수
	function fnRemove() {
		// 확인 다이얼로그를 통해 사용자에게 삭제 여부를 물어봄
		if (confirm('게시글을 삭제하시겠습니까?')) {
			// 확인이면 게시글 삭제를 위한 링크로 이동
			location.href = '/board/boardRemove.do?boardNum=${board.boardNum}';
		}
	}

	// 게시글 목록으로 이동하는 함수
	function fnList() {
		// 게시글 목록으로 이동하는 링크로 이동
		location.href = '/board/boardList.do';
	}

	// 초기화 함수
	function fnInit() {
		$('#edit_screen').hide(); // 페이지 로딩 시 'edit_screen'을 숨기도록 설정
		let modifyResult = '${modifyResult}';
		// 게시글 수정 결과에 따라 알림 메시지 출력
		if (modifyResult != '') {
			if (modifyResult == '1') {
				alert('게시글이 수정되었습니다.');
			} else {
				alert('게시글 수정에 실패하였습니다.');
			}
		}
	}

	// 페이지 로딩 시 초기화 함수 호출
	$(function() {
		fnInit();
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
	
	.button {
		background-color: limegreen;
		color: white;
		padding: 4px 10px;
		border: none;
		cursor: pointer;
		border-radius: 5px;
	}
	
</style>

</head>
<body>

	<!-- 상세 정보 화면 -->
	<div id="detail_screen">
	    <table align="center">
	        <tr>
	            <td>
	                <table border="1">
	                    <tr>
	                        <td width="120" align="center">제목</td>
	                        <td width="400">${board.boardTitle}</td>
	                    </tr>
	                    <tr>
	                        <td height="300" align="center">내용</td>
	                        <td>${board.boardComment}</td>
	                    </tr>
	                    <tr>
	                        <td align="center">작성자</td>
	                        <td>${board.creator}</td>
	                    </tr>
	                </table>
	            </td>
	        </tr>
	        <tr>
	            <td align="right">
	                <!-- 편집, 삭제, 목록 버튼 -->
	                <input class="button" type="button" value="편집" onclick="fnEdit()">
	                <input class="button" type="button" value="삭제" onclick="fnRemove()">
	                <input class="button" type="button" value="목록" onclick="fnList()">
	            </td>
	        </tr>
	    </table>
	</div>
	
	<!-- 수정 화면 -->
	<div id="edit_screen">
	    <form action="/board/boardUpdate.do" method="post" accept-charset="UTF-8">
	        <table align="center">
	            <tr>
	                <td>
	                    <table border="1">
	                        <tr>
	                            <td width="120" align="center">제목</td>
	                            <td width="400">
	                                <!-- 제목을 수정할 수 있는 입력 필드 -->
	                                <input name="boardTitle" type="text" size="50" value="${board.boardTitle}">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td height="300" align="center">내용</td>
	                            <td valign="top">
	                                <!-- 내용을 수정할 수 있는 텍스트 에어리어 -->
	                                <textarea name="boardComment" rows="20" cols="55">${board.boardComment}</textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td align="center">작성자</td>
	                            <td>${board.creator}</td>
	                        </tr>
	                    </table>
	                </td>
	            </tr>
	            <tr>
	                <td align="right">
	                    <!-- 게시글 번호를 전송하고, 수정 및 목록 버튼 -->
	                    <input type="hidden" name="boardNum" value="${board.boardNum}">
	                    <input class="button" type="submit" value="편집완료">
	                    <input class="button" type="button" value="목록" onclick="fnList()">
	                </td>
	            </tr>
	        </table>
	    </form>
	</div>

</body>
</html>