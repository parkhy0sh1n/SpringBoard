<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>

<script type="text/javascript">

	// 문서가 로드된 후 실행되는 함수
	$(document).ready(function() {
	});
	
	// 모든 카테고리를 토글하는 함수
	function toggleAllCategories() {
		// 전체 선택 체크박스와 각 카테고리 체크박스 가져오기
		var selectAllCheckbox = document.getElementById("selectAll");
		var categoryCheckboxes = document.getElementsByName("category");
		// 전체 선택 체크박스의 상태에 따라 각 카테고리 체크박스 상태 변경
		for (var i = 0; i < categoryCheckboxes.length; i++) {
			categoryCheckboxes[i].checked = selectAllCheckbox.checked;
		}
	}
	
	// 리스트를 필터링하는 함수
	function filterList() {
		// 콘솔에 로그 출력
		console.log('filterList 함수 호출됨');
		// 선택된 카테고리를 저장할 배열
		var selectedCategories = [];
		// 체크된 각 카테고리 체크박스의 값을 배열에 추가
		$('input[name="category"]:checked').each(function() {
			selectedCategories.push($(this).val());
		});
		// 모든 카테고리 체크박스의 체크 해제
		$('input[name="category"]').prop('checked', false);
		// 선택된 카테고리 배열의 값에 해당하는 카테고리 체크박스만 체크
		for (var i = 0; i < selectedCategories.length; i++) {
			$('input[name="category"][value="' + selectedCategories[i] + '"]')
					.prop('checked', true);
		}
		// 선택된 카테고리 값을 폼 필드에 설정
		$('#selectedCategories').val(selectedCategories);
		// 폼 제출
		$('#filterForm').submit();
	}
	
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

	<table align="center">
		<tr>
			<!-- 사용자 이름이 존재하면 환영 메시지를, 그렇지 않으면 로그인과 회원가입 링크를 표시 -->
			<td><c:choose>
					<c:when test="${not empty userName}">
	                    ${userName}님 환영합니다!
	                </c:when>
					<c:otherwise>
						<a href="/user/login.do">로그인</a>
						<a href="/user/join.do">회원가입</a>
					</c:otherwise>
				</c:choose></td>
			<td align="right">${totalCnt}개의글</td>
		</tr>
		<tr>
			<td colspan="2">
				<table id="boardTable" border="1">
					<tr>
						<td width="80" align="center">카테고리</td>
						<td width="40" align="center">순번</td>
						<td width="300" align="center">제목</td>
					</tr>
					<!-- 게시글 목록이 존재하는 경우 표시, 그렇지 않으면 안내 메시지 표시 -->
					<c:choose>
						<c:when test="${not empty boardList}">
							<c:forEach items="${boardList}" var="list">
								<tr>
									<td align="center">${list.boardType}</td>
									<td align="center">${list.boardNum}</td>
									<td><a
										href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">
											${list.boardTitle} </a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" align="center">
									<p>아직 작성된 글이 없습니다.</p>
									<p style="font-size: 12px;">문득 스치는 생각이나 기분, 일기 등 다양한 이야기로</p>
									<p style="font-size: 12px;">공간을 채워보세요!</p>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</td>
		</tr>
		<tr>
			<!-- 사용자가 로그인한 경우에는 글쓰기와 로그아웃 링크를 표시, 그렇지 않으면 글쓰기만 표시 -->
			<td align="right" colspan="2"><c:choose>
					<c:when test="${not empty userName}">
						<a href="/board/mbti.do">MBTI 테스트 하러 가기</a>
						<a href="/board/boardWrite.do">글쓰기</a>
						<a href="/user/logout.do">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="/board/boardWrite.do">글쓰기</a>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td>
				<!-- 카테고리 필터링을 위한 폼 -->
				<form id="filterForm" method="GET">
					<input type="hidden" name="selectedCategories"
						id="selectedCategories" value="${pageVo.selectedCategories}">
					<!-- 각 카테고리에 대한 체크박스 -->
					<label> <input type="checkbox" name="selectAll"
						id="selectAll" onclick="toggleAllCategories()"> 전체
					</label> <label> <input type="checkbox" name="category" value="일반"
						${fn:contains(pageVo.selectedCategories, '일반') ? 'checked' : ''}>
						일반
					</label> <label> <input type="checkbox" name="category" value="자유"
						${fn:contains(pageVo.selectedCategories, '자유') ? 'checked' : ''}>
						자유
					</label> <label> <input type="checkbox" name="category" value="질문"
						${fn:contains(pageVo.selectedCategories, '질문') ? 'checked' : ''}>
						질문
					</label> <label> <input type="checkbox" name="category" value="익명"
						${fn:contains(pageVo.selectedCategories, '익명') ? 'checked' : ''}>
						익명
					</label>
					<!-- 필터링 버튼 -->
					<button type="button" onclick="filterList()">조회</button>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" class="paging-links">
				<!-- 페이징 링크 표시 --> <c:set var="itemsPerPage" value="10" /> <c:set
					var="totalPages"
					value="${(totalCnt / itemsPerPage) + (totalCnt % itemsPerPage > 0 ? 1 : 0)}" />
				<c:if test="${totalPages > 1}">
					<c:choose>
						<c:when test="${pageNo > 1}">
							<a href="/board/boardList.do?pageNo=${pageNo - 1}">이전</a>
						</c:when>
						<c:otherwise>
	                        이전
	                    </c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="1" end="${totalPages}">
						<c:choose>
							<c:when test="${i == pageNo}">
								<b>${i}</b>
							</c:when>
							<c:otherwise>
								<a href="/board/boardList.do?pageNo=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
						<c:if test="${i != totalPages}"> | </c:if>
					</c:forEach>
					<c:choose>
						<c:when test="${pageNo < totalPages}">
							<a href="/board/boardList.do?pageNo=${pageNo + 1}">다음</a>
						</c:when>
						<c:otherwise>
	                        다음
	                    </c:otherwise>
					</c:choose>
				</c:if>
			</td>
		</tr>
	</table>
	
</body>
</html>