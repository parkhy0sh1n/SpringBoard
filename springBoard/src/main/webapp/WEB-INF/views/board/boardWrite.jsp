<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
</head>

<script type="text/javascript">

    // 문서가 로드될 때 실행되는 함수
    $(document).ready(function() {
        // "submit" 버튼이 클릭될 때 실행되는 함수
        $("#submit").on("click", function() {
            // 선택된 게시글 유형을 가져옴
            var selectedType = $("#boardType").val();
            // form 요소 내의 모든 입력 필드를 가져옴
            var $frm = $('.boardWrite :input');
            // form 데이터를 직렬화하고 선택된 게시글 유형을 추가하여 파라미터로 설정
            var param = $frm.serialize() + "&boardType=" + selectedType;
            // AJAX를 이용하여 서버에 데이터 전송
            $.ajax({
                url : "/board/boardWriteAction.do",  // 서버로 요청을 보낼 URL
                dataType : "json",  // 응답 데이터 타입
                type : "POST",  // HTTP 메소드 (POST)
                data : param,  // 전송할 데이터
                success : function(data, textStatus, jqXHR) {
                    // 성공적으로 응답 받은 경우 실행되는 콜백 함수
                    alert("게시글이 업로드되었습니다.");
                    location.href = "/board/boardList.do?pageNo=1";  // 목록 페이지로 이동
                },
                error : function(jqXHR, textStatus, errorThrown) {
                    // 요청이 실패한 경우 실행되는 콜백 함수
                    alert("업로드 실패");
                }
            });
        });
    });

    // 목록으로 이동하는 함수
    function fnList() {
        location.href = '/board/boardList.do';
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
	#submit,
	#btnList
	 {
	    background-color: limegreen;
	    color: white;
	    padding: 4px 10px;
	    border: none;
	    cursor: pointer;
	   	border-radius: 5px;
	}
	
</style>

<body>

	<form class="boardWrite" accept-charset="UTF-8" action="/board/boardWriteAction.do" method="POST">
	    <table align="center">
	        <tr>
	            <td>
	                <table border="1">
	                    <!-- 카테고리 선택 -->
	                    <tr>
	                        <td width="120" align="center">카테고리</td>
	                        <td width="400">
	                            <select name="boardTypeSelect" id="boardType">
	                                <!-- 카테고리 목록을 동적으로 생성 -->
	                                <c:forEach var="type" items="${boardTypes}">
	                                    <option value="${type}" ${type eq board.boardType ? 'selected' : ''}>${type}</option>
	                                </c:forEach>
	                            </select>
	                        </td>
	                    </tr>
	                    <!-- 제목 입력 -->
	                    <tr>
	                        <td width="120" align="center">제목</td>
	                        <td width="400"><input name="boardTitle" type="text" size="50" value="${board.boardTitle}"></td>
	                    </tr>
	                    <!-- 내용 입력 -->
	                    <tr>
	                        <td height="300" align="center">내용</td>
	                        <td valign="top"><textarea name="boardComment" rows="20" cols="55">${board.boardComment}</textarea></td>
	                    </tr>
	                    <!-- 작성자 표시 및 hidden 필드로 전송 -->
	                    <tr>
	                        <td align="center">작성자</td>
	                        <input type="hidden" name="creator" value="${userName}">
	                        <td>${userName}</td>
	                    </tr>
	                </table>
	            </td>
	        </tr>
	        <!-- 작성 및 목록 버튼 -->
	        <tr>
	            <td align="right">
	                <input id="submit" type="button" value="작성완료">
	                <input id="btnList" type="button" value="목록" onclick="fnList()">
	            </td>
	        </tr>
	    </table>
	</form>
		
</body>
</html>