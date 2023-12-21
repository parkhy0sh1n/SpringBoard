<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MBTI</title>

<style type="text/css">
body {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 0;
}

form {
	width: 100%;
	height: 100%;
}

.question-group p {
	font-size: 23px;
	font-weight: bold;
	color: #586071;
}

hr {
	border-color: #fafafb;
	opacity: 0.6;
}

footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	background-color: #586071;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 5px;
}

#header {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 100%;
	background-color: #34a474;
	padding-top: 50px;
	padding-bottom: 50px;
}

.left {
	display: inline-block;
	vertical-align: middle;
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 80px;
	margin-left: 20px;
	margin-right: 20px;
	color: #6fbd9a;
}

.right {
	display: inline-block;
	vertical-align: middle;
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 80px;
	margin-left: 20px;
	margin-right: 20px;
	color: #88619a;
}

#mbtiForm {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	margin: 0;
}

.button-container {
	display: flex;
	justify-content: center;
	margin-top: 20px; /* 버튼과 폼 사이에 여백을 조절합니다. */
}
/* 라디오 버튼 스타일링 */
input[type="radio"]+label {
	margin: 40px; /* 각 라디오 버튼 사이의 간격을 설정할 수 있습니다. */
	transform: scale(4); /* 기본 크기의 2배로 확대합니다. */
	border-radius: 50%;
}

input[type="radio"][value$="3"]+label, input[type="radio"][value$="3"]:checked+label
	{
	transform: scale(7); /* 매우 동의, 매우 비동의 버튼 크기 조절 */
}

input[type="radio"][value$="2"]+label, input[type="radio"][value$="2"]:checked+label
	{
	transform: scale(6); /* 동의, 비동의 버튼 크기 조절 */
}

input[type="radio"][value$="1"]+label, input[type="radio"][value$="1"]:checked+label
	{
	transform: scale(5); /* 약간 동의, 약간 비동의 버튼 크기 조절 */
}

input[type="radio"][value$="0"]+label, input[type="radio"][value$="0"]:checked+label
	{
	transform: scale(4); /* 모름 버튼 크기 조절 */
}

input[type="radio"][value^="E"]+label, input[type="radio"][value^="N"]+label,
	input[type="radio"][value^="F"]+label, input[type="radio"][value^="J"]+label
	{
	border: 0.1px solid #6fbd9a;
}

input[type="radio"][value^="E"]:checked+label, input[type="radio"][value^="N"]:checked+label,
	input[type="radio"][value^="F"]:checked+label, input[type="radio"][value^="J"]:checked+label
	{
	border: 0.1px solid #6fbd9a;
	background-color: #6fbd9a;
}

input[type="radio"][value^="E"]:hover+label, input[type="radio"][value^="N"]:hover+label,
	input[type="radio"][value^="F"]:hover+label, input[type="radio"][value^="J"]:hover+label
	{
	border: 0.1px solid #6fbd9a;
	background-color: #6fbd9a;
}

input[type="radio"][value^="I"]+label, input[type="radio"][value^="S"]+label,
	input[type="radio"][value^="T"]+label, input[type="radio"][value^="P"]+label
	{
	border: 0.1px solid #88619a;
}

input[type="radio"][value^="I"]:checked+label, input[type="radio"][value^="S"]:checked+label,
	input[type="radio"][value^="T"]:checked+label, input[type="radio"][value^="P"]:checked+label
	{
	border: 0.1px solid #88619a;
	background-color: #88619a;
}

input[type="radio"][value^="I"]:hover+label, input[type="radio"][value^="S"]:hover+label,
	input[type="radio"][value^="T"]:hover+label, input[type="radio"][value^="P"]:hover+label
	{
	border: 0.1px solid #88619a;
	background-color: #88619a;
}

input[type="radio"][value$="0"]+label, input[type="radio"][value$="0"]+label,
	input[type="radio"][value$="0"]+label, input[type="radio"][value$="0"]+label
	{
	border: 0.1px solid #9b9faa;
}

input[type="radio"][value$="0"]:checked+label, input[type="radio"][value$="0"]:checked+label,
	input[type="radio"][value$="0"]:checked+label, input[type="radio"][value$="0"]:checked+label
	{
	border: 0.1px solid #9b9faa;
	background-color: #9b9faa;
}

input[type="radio"][value$="0"]:hover+label, input[type="radio"][value$="0"]:hover+label,
	input[type="radio"][value$="0"]:hover+label, input[type="radio"][value$="0"]:hover+label
	{
	border: 0.1px solid #9b9faa;
	background-color: #9b9faa;
}

input[type="radio"] {
	display: none; /* 실제 라디오 버튼을 숨김 */
}

/* 사용자 정의 라디오 버튼 외관을 스타일링합니다. */
label {
	display: inline-block;
	cursor: pointer;
	padding: 5px;
	transition: background-color 0.5s ease;
}

#prevButton {
	padding: 20px 80px 20px 80px;
	border-radius: 50px;
	border: 1px solid #88619a;
	background-color: #88619a;
	font-size: 28px;
	color: white;
	margin-right: 5px;
}

#nextButton, #resultButton {
	padding: 20px 80px 20px 80px;
	border-radius: 50px;
	border: 1px solid #6fbd9a;
	background-color: #6fbd9a;
	font-size: 28px;
	color: white;
	margin-left: 5px;
}

.custom-text {
	font-weight: bolder;
	color: pink;
	font-size: 38px;
}

.custom-text1 {
	font-weight: bolder;
	color: yellow;
	font-size: 50px;
}

.custom-text2 {
	font-weight: bolder;
	color: yellow;
	font-size: 20px;
}

#progress {
	color: white;
}

#progressBarContainer {
	width: 100%;
	height: 10px;
	background-color: #ddd;
	margin-bottom: 18px;
}

#progressBar {
	height: 100%;
	width: 0;
	background-color: #34a474;
}

#result {
	width: 1000px;
}

#mbtiResult {
	font-size: 38px;
}
</style>

</head>
<body>
	<div id="header">
		<p style="color: white; font-size: 38px;">
			<span class="custom-text">${userName}</span>님의 <span
				class="custom-text1">MBTI</span>는 무엇인가요?
		</p>
		<p style="color: white;">
			재미로 알아보는 나의 <span class="custom-text2">성격유형</span>!
		</p>
		<p style="color: white;">
			당신의 진짜 모습을 담은 <span class="custom-text2">MBTI</span>를 알아보세요.
		</p>
	</div>
	<form id="mbtiForm">
		<!-- E / I -->
		<div class="question-group" id="group1">
			<br> <br> <br>
			<p>당신은 사람들과 함께 있을 때 에너지를 얻는 편인가요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q1"
				id="q1_E3" value="E3"> <label for="q1_E3"></label> <input
				type="radio" name="q1" id="q1_E2" value="E2"> <label
				for="q1_E2"></label> <input type="radio" name="q1" id="q1_E1"
				value="E1"> <label for="q1_E1"></label> <input type="radio"
				name="q1" id="q1_EI0" value="EI0"> <label for="q1_EI0"></label>
			<input type="radio" name="q1" id="q1_I1" value="I1"> <label
				for="q1_I1"></label> <input type="radio" name="q1" id="q1_I2"
				value="I2"> <label for="q1_I2"></label> <input type="radio"
				name="q1" id="q1_I3" value="I3"> <label for="q1_I3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>사회적인 행사에서 어떤 역할을 맡거나 주도적으로 참여하시는 편인가요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q2"
				id="q2_E3" value="E3"> <label for="q2_E3"></label> <input
				type="radio" name="q2" id="q2_E2" value="E2"> <label
				for="q2_E2"></label> <input type="radio" name="q2" id="q2_E1"
				value="E1"> <label for="q2_E1"></label> <input type="radio"
				name="q2" id="q2_EI0" value="EI0"> <label for="q2_EI0"></label>
			<input type="radio" name="q2" id="q2_I1" value="I1"> <label
				for="q2_I1"></label> <input type="radio" name="q2" id="q2_I2"
				value="I2"> <label for="q2_I2"></label> <input type="radio"
				name="q2" id="q2_I3" value="I3"> <label for="q2_I3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>외부 환경과 사건들에 대한 관심과 호기심을 가지고 있나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q3"
				id="q3_E3" value="E3"> <label for="q3_E3"></label> <input
				type="radio" name="q3" id="q3_E2" value="E2"> <label
				for="q3_E2"></label> <input type="radio" name="q3" id="q3_E1"
				value="E1"> <label for="q3_E1"></label> <input type="radio"
				name="q3" id="q3_EI0" value="EI0"> <label for="q3_EI0"></label>
			<input type="radio" name="q3" id="q3_I1" value="I1"> <label
				for="q3_I1"></label> <input type="radio" name="q3" id="q3_I2"
				value="I2"> <label for="q3_I2"></label> <input type="radio"
				name="q3" id="q3_I3" value="I3"> <label for="q3_I3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>타인과 함께 일하면서 의사소통과 협업을 즐기시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q4"
				id="q4_E3" value="E3"> <label for="q4_E3"></label> <input
				type="radio" name="q4" id="q4_E2" value="E2"> <label
				for="q4_E2"></label> <input type="radio" name="q4" id="q4_E1"
				value="E1"> <label for="q4_E1"></label> <input type="radio"
				name="q4" id="q4_EI0" value="EI0"> <label for="q4_EI0"></label>
			<input type="radio" name="q4" id="q4_I1" value="I1"> <label
				for="q4_I1"></label> <input type="radio" name="q4" id="q4_I2"
				value="I2"> <label for="q4_I2"></label> <input type="radio"
				name="q4" id="q4_I3" value="I3"> <label for="q4_I3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>새로운 사람들과 쉽게 친구가 되는 경향이 있나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q5"
				id="q5_E3" value="E3"> <label for="q5_E3"></label> <input
				type="radio" name="q5" id="q5_E2" value="E2"> <label
				for="q5_E2"></label> <input type="radio" name="q5" id="q5_E1"
				value="E1"> <label for="q5_E1"></label> <input type="radio"
				name="q5" id="q5_EI0" value="EI0"> <label for="q5_EI0"></label>
			<input type="radio" name="q5" id="q5_I1" value="I1"> <label
				for="q5_I1"></label> <input type="radio" name="q5" id="q5_I2"
				value="I2"> <label for="q5_I2"></label> <input type="radio"
				name="q5" id="q5_I3" value="I3"> <label for="q5_I3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
		</div>
		<!-- N /S -->
		<div class="question-group" id="group2">
			<br> <br> <br>
			<p>미래에 대한 비전과 가능성에 관심과 흥미를 가지고 있나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q6"
				id="q6_N3" value="N3"> <label for="q6_N3"></label> <input
				type="radio" name="q6" id="q6_N2" value="N2"> <label
				for="q6_N2"></label> <input type="radio" name="q6" id="q6_N1"
				value="N1"> <label for="q6_N1"></label> <input type="radio"
				name="q6" id="q6_NS0" value="NS0"> <label for="q6_NS0"></label>
			<input type="radio" name="q6" id="q6_S1" value="S1"> <label
				for="q6_S1"></label> <input type="radio" name="q6" id="q6_S2"
				value="S2"> <label for="q6_S2"></label> <input type="radio"
				name="q6" id="q6_S3" value="S3"> <label for="q6_S3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>추상적인 개념과 이론에 대해 탐구하고 이해하려는 경향이 있나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q7"
				id="q7_N3" value="N3"> <label for="q7_N3"></label> <input
				type="radio" name="q7" id="q7_N2" value="N2"> <label
				for="q7_N2"></label> <input type="radio" name="q7" id="q7_N1"
				value="N1"> <label for="q7_N1"></label> <input type="radio"
				name="q7" id="q7_NS0" value="NS0"> <label for="q7_NS0"></label>
			<input type="radio" name="q7" id="q7_S1" value="S1"> <label
				for="q7_S1"></label> <input type="radio" name="q7" id="q7_S2"
				value="S2"> <label for="q7_S2"></label> <input type="radio"
				name="q7" id="q7_S3" value="S3"> <label for="q7_S3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>새로운 아이디어와 가능성에 열린 마음을 가지고 있나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q8"
				id="q8_N3" value="N3"> <label for="q8_N3"></label> <input
				type="radio" name="q8" id="q8_N2" value="N2"> <label
				for="q8_N2"></label> <input type="radio" name="q8" id="q8_N1"
				value="N1"> <label for="q8_N1"></label> <input type="radio"
				name="q8" id="q8_NS0" value="NS0"> <label for="q8_NS0"></label>
			<input type="radio" name="q8" id="q8_S1" value="S1"> <label
				for="q8_S1"></label> <input type="radio" name="q8" id="q8_S2"
				value="S2"> <label for="q8_S2"></label> <input type="radio"
				name="q8" id="q8_S3" value="S3"> <label for="q8_S3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>상상력을 기반으로 창의적인 해결책을 찾는 것을 좋아하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q9"
				id="q9_N3" value="N3"> <label for="q9_N3"></label> <input
				type="radio" name="q9" id="q9_N2" value="N2"> <label
				for="q9_N2"></label> <input type="radio" name="q9" id="q9_N1"
				value="N1"> <label for="q9_N1"></label> <input type="radio"
				name="q9" id="q9_NS0" value="NS0"> <label for="q9_NS0"></label>
			<input type="radio" name="q9" id="q9_S1" value="S1"> <label
				for="q9_S1"></label> <input type="radio" name="q9" id="q9_S2"
				value="S2"> <label for="q9_S2"></label> <input type="radio"
				name="q9" id="q9_S3" value="S3"> <label for="q9_S3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>현재의 상황보다는 미래의 가능성과 경향성에 관심이 많나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q10"
				id="q10_N3" value="N3"> <label for="q10_N3"></label> <input
				type="radio" name="q10" id="q10_N2" value="N2"> <label
				for="q10_N2"></label> <input type="radio" name="q10" id="q10_N1"
				value="N1"> <label for="q10_N1"></label> <input type="radio"
				name="q10" id="q10_NS0" value="NS0"> <label for="q10_NS0"></label>
			<input type="radio" name="q10" id="q10_S1" value="S1"> <label
				for="q10_S1"></label> <input type="radio" name="q10" id="q10_S2"
				value="S2"> <label for="q10_S2"></label> <input type="radio"
				name="q10" id="q10_S3" value="S3"> <label for="q10_S3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
		</div>
		<!-- F / T -->
		<div class="question-group" id="group3">
			<br> <br> <br>
			<p>다른 사람들의 감정과 필요를 고려하는 것을 좋아하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q11"
				id="q11_F3" value="F3"> <label for="q11_F3"></label> <input
				type="radio" name="q11" id="q11_F2" value="F2"> <label
				for="q11_F2"></label> <input type="radio" name="q11" id="q11_F1"
				value="F1"> <label for="q11_F1"></label> <input type="radio"
				name="q11" id="q11_FT0" value="FT0"> <label for="q11_FT0"></label>
			<input type="radio" name="q11" id="q11_T1" value="T1"> <label
				for="q11_T1"></label> <input type="radio" name="q11" id="q11_T2"
				value="T2"> <label for="q11_T2"></label> <input type="radio"
				name="q11" id="q11_T3" value="T3"> <label for="q11_T3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>상대방의 감정에 민감하게 대응하고 공감하는 편인가요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q12"
				id="q12_F3" value="F3"> <label for="q12_F3"></label> <input
				type="radio" name="q12" id="q12_F2" value="F2"> <label
				for="q12_F2"></label> <input type="radio" name="q12" id="q12_F1"
				value="F1"> <label for="q12_F1"></label> <input type="radio"
				name="q12" id="q12_FT0" value="FT0"> <label for="q12_FT0"></label>
			<input type="radio" name="q12" id="q12_T1" value="T1"> <label
				for="q12_T1"></label> <input type="radio" name="q12" id="q12_T2"
				value="T2"> <label for="q12_T2"></label> <input type="radio"
				name="q12" id="q12_T3" value="T3"> <label for="q12_T3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>자신의 가치관과 타인의 가치관을 중요시하고 존중하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q13"
				id="q13_F3" value="F3"> <label for="q13_F3"></label> <input
				type="radio" name="q13" id="q13_F2" value="F2"> <label
				for="q13_F2"></label> <input type="radio" name="q13" id="q13_F1"
				value="F1"> <label for="q13_F1"></label> <input type="radio"
				name="q13" id="q13_FT0" value="FT0"> <label for="q13_FT0"></label>
			<input type="radio" name="q13" id="q13_T1" value="T1"> <label
				for="q13_T1"></label> <input type="radio" name="q13" id="q13_T2"
				value="T2"> <label for="q13_T2"></label> <input type="radio"
				name="q13" id="q13_T3" value="T3"> <label for="q13_T3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>조화롭고 화합적인 분위기를 조성하는 것을 좋아하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q14"
				id="q14_F3" value="F3"> <label for="q14_F3"></label> <input
				type="radio" name="q14" id="q14_F2" value="F2"> <label
				for="q14_F2"></label> <input type="radio" name="q14" id="q14_F1"
				value="F1"> <label for="q14_F1"></label> <input type="radio"
				name="q14" id="q14_FT0" value="FT0"> <label for="q14_FT0"></label>
			<input type="radio" name="q14" id="q14_T1" value="T1"> <label
				for="q14_T1"></label> <input type="radio" name="q14" id="q14_T2"
				value="T2"> <label for="q14_T2"></label> <input type="radio"
				name="q14" id="q14_T3" value="T3"> <label for="q14_T3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>타인의 의견과 감정을 고려하여 의사결정을 내리시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q15"
				id="q15_F3" value="F3"> <label for="q15_F3"></label> <input
				type="radio" name="q15" id="q15_F2" value="F2"> <label
				for="q15_F2"></label> <input type="radio" name="q15" id="q15_F1"
				value="F1"> <label for="q15_F1"></label> <input type="radio"
				name="q15" id="q15_FT0" value="FT0"> <label for="q15_FT0"></label>
			<input type="radio" name="q15" id="q15_T1" value="T1"> <label
				for="q15_T1"></label> <input type="radio" name="q15" id="q15_T2"
				value="T2"> <label for="q15_T2"></label> <input type="radio"
				name="q15" id="q15_T3" value="T3"> <label for="q15_T3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
		</div>
		<!-- J / P -->
		<div class="question-group" id="group4">
			<br> <br> <br>
			<p>일정과 계획을 따르는 것을 선호하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q16"
				id="q16_J3" value="J3"> <label for="q16_J3"></label> <input
				type="radio" name="q16" id="q16_J2" value="J2"> <label
				for="q16_J2"></label> <input type="radio" name="q16" id="q16_J1"
				value="J1"> <label for="q16_J1"></label> <input type="radio"
				name="q16" id="q16_JP0" value="JP0"> <label for="q16_JP0"></label>
			<input type="radio" name="q16" id="q16_P1" value="P1"> <label
				for="q16_P1"></label> <input type="radio" name="q16" id="q16_P2"
				value="P2"> <label for="q16_P2"></label> <input type="radio"
				name="q16" id="q16_P3" value="P3"> <label for="q16_P3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>구조화된 환경에서 일하고 계획을 세우는 것을 좋아하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q17"
				id="q17_J3" value="J3"> <label for="q17_J3"></label> <input
				type="radio" name="q17" id="q17_J2" value="J2"> <label
				for="q17_J2"></label> <input type="radio" name="q17" id="q17_J1"
				value="J1"> <label for="q17_J1"></label> <input type="radio"
				name="q17" id="q17_JP0" value="JP0"> <label for="q17_JP0"></label>
			<input type="radio" name="q17" id="q17_P1" value="P1"> <label
				for="q17_P1"></label> <input type="radio" name="q17" id="q17_P2"
				value="P2"> <label for="q17_P2"></label> <input type="radio"
				name="q17" id="q17_P3" value="P3"> <label for="q17_P3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>일을 끝내고 마무리하는 것을 중요시하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q18"
				id="q18_J3" value="J3"> <label for="q18_J3"></label> <input
				type="radio" name="q18" id="q18_J2" value="J2"> <label
				for="q18_J2"></label> <input type="radio" name="q18" id="q18_J1"
				value="J1"> <label for="q18_J1"></label> <input type="radio"
				name="q18" id="q18_JP0" value="JP0"> <label for="q18_JP0"></label>
			<input type="radio" name="q18" id="q18_P1" value="P1"> <label
				for="q18_P1"></label> <input type="radio" name="q18" id="q18_P2"
				value="P2"> <label for="q18_P2"></label> <input type="radio"
				name="q18" id="q18_P3" value="P3"> <label for="q18_P3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>계획에 따라 진행되는 것을 좋아하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q19"
				id="q19_J3" value="J3"> <label for="q19_J3"></label> <input
				type="radio" name="q19" id="q19_J2" value="J2"> <label
				for="q19_J2"></label> <input type="radio" name="q19" id="q19_J1"
				value="J1"> <label for="q19_J1"></label> <input type="radio"
				name="q19" id="q19_JP0" value="JP0"> <label for="q19_JP0"></label>
			<input type="radio" name="q19" id="q19_P1" value="P1"> <label
				for="q19_P1"></label> <input type="radio" name="q19" id="q19_P2"
				value="P2"> <label for="q19_P2"></label> <input type="radio"
				name="q19" id="q19_P3" value="P3"> <label for="q19_P3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
			<p>결정을 내리고 실행하기 전에 충분한 정보와 계획을 수립하시나요?</p>
			<br> <span class="left">동의</span> <input type="radio" name="q20"
				id="q20_J3" value="J3"> <label for="q20_J3"></label> <input
				type="radio" name="q20" id="q20_J2" value="J2"> <label
				for="q20_J2"></label> <input type="radio" name="q20" id="q20_J1"
				value="J1"> <label for="q20_J1"></label> <input type="radio"
				name="q20" id="q20_JP0" value="JP0"> <label for="q20_JP0"></label>
			<input type="radio" name="q20" id="q20_P1" value="P1"> <label
				for="q20_P1"></label> <input type="radio" name="q20" id="q20_P2"
				value="P2"> <label for="q20_P2"></label> <input type="radio"
				name="q20" id="q20_P3" value="P3"> <label for="q20_P3"></label>
			<span class="right">비동의</span> <br> <br> <br>
			<hr>
			<br> <br> <br>
		</div>

		<div class="button-container">
			<button type="button" id="prevButton" style="display: none;">이전</button>
			<button type="button" id="nextButton">다음</button>
			<button type="submit" id="resultButton" style="display: none;">검사
				결과</button>
		</div>
		<br> <br> <br> <br> <br> <br>
		<p style="color: gray;">©2023 KIM MIN SEO</p>
	</form>

	<div id="result">
		<br> <br> <br>
		<h2>
			${userName}님의 MBTI 유형은 <span id="mbtiResult"></span> 입니다!
		</h2>
		<img id="mbtiImage" src="" alt="MBTI 이미지">
		<p style="font-size: 23px; color: #80858e;"></p>
	</div>

	<footer id="progressFooter"> <span id="progress">0%</span> <span>
		<div id="progressBarContainer">
			<div id="progressBar"></div>
		</div>
	</span> </footer>

	<script type="text/javascript">
	
		const groups = document.querySelectorAll('.question-group');
		let currentGroupIndex = 0;
	
		const prevButton = document.getElementById('prevButton');
		const nextButton = document.getElementById('nextButton');
		const resultButton = document.getElementById('resultButton');
	
		function showGroup(index) {
		    groups.forEach((group, i) => {
		        group.style.display = i === index ? 'block' : 'none';
		    });
	
		    prevButton.style.display = index === 0 ? 'none' : 'block';
		    nextButton.style.display = index < groups.length - 1 ? 'block' : 'none';
		    resultButton.style.display = index === groups.length - 1 ? 'block' : 'none';
		}
	
		nextButton.addEventListener('click', function () {
		    if (currentGroupIndex < groups.length - 1) {
		        currentGroupIndex++;
		        showGroup(currentGroupIndex);
		    }
		});
	
		prevButton.addEventListener('click', function () {
		    if (currentGroupIndex > 0) {
		        currentGroupIndex--;
		        showGroup(currentGroupIndex);
		    }
		});
		
		document.getElementById('mbtiForm').addEventListener('submit', function (event) {
			$('#result').show(); // 'edit_screen' 요소를 보이도록 설정
			$('#mbtiForm').hide();
		    event.preventDefault();
		    const scores = {
		      E: 0, I: 0, S: 0, N: 0, T: 0, F: 0, J: 0, P: 0
		    };
		    const formData = new FormData(event.target);
		    for (const [question, answer] of formData.entries()) {
		        // 각 답변에 대한 점수 배치를 조절하세요.
		        switch (answer) {
		          // E / I
		          case 'E3': scores.E += 3; break;
		          case 'E2': scores.E += 2; break;
		          case 'E1': scores.E += 1; break;
		          case 'EI0': scores.I += 1; break;
		          case 'I1': scores.I += 1; break;
		          case 'I2': scores.I += 2; break;
		          case 'I3': scores.I += 3; break;
		          // N / S
		          case 'N3': scores.N += 3; break;
		          case 'N2': scores.N += 2; break;
		          case 'N1': scores.N += 1; break;
		          case 'NS0': scores.S += 1; break;
		          case 'S1': scores.S += 1; break;
		          case 'S2': scores.S += 2; break;
		          case 'S3': scores.S += 3; break;
		          // F / T
		          case 'F3': scores.F += 3; break;
		          case 'F2': scores.F += 2; break;
		          case 'F1': scores.F += 1; break;
		          case 'FT0': scores.T += 1; break;
		          case 'T1': scores.T += 1; break;
		          case 'T2': scores.T += 2; break;
		          case 'T3': scores.T += 3; break;
		          // J / P
		          case 'J3': scores.J += 3; break;
		          case 'J2': scores.J += 2; break;
		          case 'J1': scores.J += 1; break;
		          case 'JP0': scores.P += 1; break;
		          case 'P1': scores.P += 1; break;
		          case 'P2': scores.P += 2; break;
		          case 'P3': scores.P += 3; break;
		        }
		      }
		    const mbtiType = (scores.E > scores.I ? 'E' : 'I') +
		                     (scores.N > scores.S ? 'N' : 'S') +
		                     (scores.F > scores.T ? 'F' : 'T') +
		                     (scores.J > scores.P ? 'J' : 'P');
		    
		    document.getElementById('mbtiResult').textContent = mbtiType;
		    
		    const mbtiResultElement = document.getElementById('mbtiResult');
		    const resultTextElement = document.getElementById('result').querySelector('p');
		    mbtiResultElement.textContent = mbtiType;
		    
			// 이미지 변경 로직 추가
		    var mbtiImageElement = document.getElementById('mbtiImage');
				// MBTI 결과값에 따라 다른 텍스트 및 이미지를 설정
				switch (mbtiType) {
			       case 'ISTJ':
			    	   mbtiResultElement.textContent = 'ISTJ - 현실주의자';
			    	   resultTextElement.innerHTML = '현실주의자(ISTJ)는 진솔하게 행동하는 자신의 모습에서 자부심을 느끼며, 자기 생각을 솔직하게 이야기하고 어떤 것에 헌신하기로 한 경우 최선을 다합니다.<br><br>현실주의자는 인구의 상당 부분을 차지합니다. 화려한 삶이나 다른 사람의 주의를 끄는 일에는 관심이 없으며 안정된 사회를 위해 자신의 몫보다 많은 기여를 하곤 합니다. 이들은 가족이나 주변 사람들로부터 믿음직한 사람이라는 평판을 받을 때가 많으며, 현실 감각이 뛰어나 스트레스가 극심한 상황에서도 현실적이고 논리적인 태도를 유지하는 사람으로 인정받곤 합니다.<br><br>현실주의자의 자존감은 진솔하게 행동하는 자신의 모습에서 나옵니다. 이들은 상황마다 적절한 행동 방식이 존재한다고 생각하며, 다른 방식으로 행동하는 사람은 자신의 이익을 위해 규칙을 어기려는 사람이라고 생각하곤 합니다. 또한 체계와 전통을 중시하기에 위계질서가 존재하고 기대치가 명확한 조직과 직장과 교육 환경을 선호하는 편입니다.<br><br>현실주의자는 자신의 행동과 결정에 책임을 지는 일을 두려워하지 않습니다. 또한 실수했을 때는 자신의 판단이 틀렸다는 사실을 인정하고 이를 빠르게 만회하기 위해 노력하는 편입니다. 이들에게는 남에게 보여주는 것보다 정직함을 유지하는 일이 중요하며, 다른 사람에게 거짓말을 하기보다는 자신의 양심을 지키는 쪽을 선택합니다.<br><br>현실주의자는 어떠한 일이 있어도 자신의 의무를 지키려는 성향이 있습니다. 이 때문에 자신만큼 책임감이 없는 사람을 만나게 되면 당혹감을 느끼곤 합니다. 또한 자신만큼 자제력이 뛰어나지 않은 사람을 게으르거나 부정직한 사람으로 단정지을 때도 있습니다. 자신의 생각을 대놓고 말하지는 않지만 다른 사람에 대한 판단이 말과 행동에서 묻어 나오기 때문에 엄격하거나 공감 능력이 낮은 사람이라는 평가를 받기도 합니다.<br><br>헌신적인 성향은 현실주의자의 훌륭한 강점이며 다양한 일을 성취하는 데 도움이 됩니다. 하지만 이들의 헌신을 이용하려는 사람을 만나게 되면 이러한 성향이 약점이 될 수도 있습니다. 이들은 높은 업무 윤리 의식과 의무감을 지니고 있으며 다른 사람의 책임도 함께 짊어질 때가 종종 있습니다. 현실주의자가 드러내고 불만을 표하는 성격은 아니지만, 이러한 상황이 계속된다면 자신뿐만 아니라 동료와 친구와 연인도 함께 책임져야 한다는 사실에 피로감이나 절망감을 느끼게 될 수도 있습니다.<br><br>현실주의자는 보통 즉시 감정을 표현하지는 않습니다. 그렇다고 해서 자신에게 너무 많은 책임이 주어졌을 때 좌절감이나 억울함을 느끼지 않는다는 의미는 아닙니다. 또한 균형 잡히고 지속 가능한 관계를 추구하지 않는다면 관계를 유지하기 위해 자신을 희생하게 될 가능성도 있습니다. 책임의 한계를 명확히 하고 과도한 책임이 주어졌을 때 이를 거부하는 방법을 익힌다면 진실되고 충실하고 책임감 있는 태도로 사회에 많은 기여를 하는 사람이 될 수 있을 것입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#4298b4';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/sentinels_Logistician_ISTJ_personality_header.svg';
			           break;
			       case 'ISFJ':
			    	   mbtiResultElement.textContent = 'ISFJ - 수호자';
			    	   resultTextElement.innerHTML = '수호자(ISFJ)는 겸손한 자세로 세상을 지탱하는 역할을 합니다. 이들은 근면하고 헌신적인 성격으로 주변 사람들에 대한 깊은 책임감을 느낍니다. 이들은 마감 기한을 철저히 지키고 동료와 친구의 생일과 기념일을 챙기며, 기존 질서를 유지하고 주변 사람을 배려하는 동시에 기꺼이 도움의 손길을 건넵니다. 또한 감사를 요구하기보다는 뒤에서 묵묵히 헌신하는 성격이라고 할 수 있습니다.<br><br>수호자는 유능하고 긍정적인 성격으로 다양한 방면에서 역량을 발휘합니다. 또한 세심하고 배려심이 넘치며 분석 능력과 세부 사항 파악 능력도 뛰어납니다. 그리고 차분한 성격인 동시에 대인 관계 능력도 뛰어나며, 이 덕분에 여러 사람과 깊은 관계를 맺을 가능성도 큽니다. 이들의 다양한 장점은 시너지 효과를 내며 일상생활에서도 빛을 발하곤 합니다.<br><br>수호자는 매우 충실한 성격으로 친구나 연인 관계를 위해 최선을 다합니다. 이들은 연인과 친밀한 관계를 유지하기 위해 많은 에너지를 투자하며, 친구나 가족이 어려움을 겪고 있다면 하던 일을 내려놓고 도움의 손길을 건넵니다.<br><br>수호자는 가까운 사람뿐만 아니라 집단과 회사에도 충실한 태도를 유지하며 가족의 전통도 소중히 여깁니다. 그러나 다른 사람을 도우려는 성향으로 인해 문제가 발생하기도 합니다. 수호자의 배려심과 근면함을 이용하려는 사람들 때문에 스트레스를 받고 번아웃을 경험할 수 있기 때문입니다. 또한 변화를 수용하기 힘들어하기에 자신의 방식을 바꾸거나 인간관계를 끊을 필요가 있을 때는 스트레스를 받거나 죄책감을 느끼기도 합니다.<br><br>완벽주의적 성향을 지닌 수호자에게는 “이 정도면 됐어”라는 말은 통하지 않습니다. 이들은 자신의 책임을 진지하게 생각하며 다른 사람의 기대치를 뛰어넘을 만큼 일에 최선을 다합니다.<br><br>그렇다고 수호자가 다른 사람들이 자신의 노력을 알아차리지 못하거나 자신을 인정하지 않아도 신경쓰지 않는다는 의미는 아닙니다. 겸손한 태도를 유지한다고 해서 칭찬을 싫어하거나 자신의 노력을 당연히 여기는 것을 받아들인다는 의미는 아니기 때문입니다. 따라서 자신의 노력에 대한 정당한 인정을 요구하는 방법을 익히지 않는다면 열정과 활력을 잃거나 자신을 인정하지 않는 사람들 때문에 분노를 느끼게 될 수도 있습니다.<br><br>수호자는 내향적(I) 성향을 지닌 동시에 다른 사람과의 소통을 추구하는 성격입니다. 수호자는 다른 사람에 대해 세세한 사항도 잘 기억하며, 이러한 능력은 어려움 없이 친구를 만들고 인간관계를 유지하는 데 큰 도움이 됩니다. 사실 수호자만큼 친구와 연인이 원하는 선물이 무엇인지 잘 파악하는 성격도 없을 것입니다.<br><br>수호자는 세심하고 사려 깊은 성격으로, 주변 사람이 안전하고 행복한 삶을 살 수 있도록 돕는 일에서 만족감을 느낍니다. 남을 먼저 챙기려는 성향 때문에 자신을 돌보지 못할 때가 있기는 하지만, 다른 사람을 생각하는 만큼 자신도 챙긴다면 더욱 넘치는 에너지와 활력으로 선을 행할 수 있을 것입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#4298b4';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/sentinels_Defender_ISFJ_personality_header.svg';
			           break;
			       case 'INFJ':
			    	   mbtiResultElement.textContent = 'INFJ - 옹호자';
			    	   resultTextElement.innerHTML = '옹호자(INFJ)는 매우 희귀한 성격임에도 불구하고 세상에 큰 영향력을 발휘하곤 합니다. 이들은 이상주의적이고 원칙주의적인 성격으로, 삶에 순응하는 대신 삶에 맞서 변화를 만들어 내고자 합니다. 이들에게 성공이란 돈이나 지위가 아니라 자아를 실현하고 다른 사람을 도우며 세상에서 선을 실천하는 일입니다.<br><br>원대한 목표와 야망을 품고 있다고 해서 옹호자가 몽상가와 같은 성격이라는 뜻은 아닙니다. 이들은 원칙과 완벽함을 중시하며 자신이 옳다고 믿는 일을 끝내기 전에는 만족하지 않습니다. 또한 매우 양심적인 성격으로 자신의 확실한 가치관에 따라 인생을 살아가며, 다른 사람이나 사회의 가치를 따르는 대신 자신의 지혜와 직관을 통해 정말로 중요한 가치를 찾기 위해 노력합니다.<br><br>옹호자는 매우 희귀한 성격으로 대부분의 사람과는 다른 분위기를 풍기곤 합니다. 이들은 내면에 깊이 집중하며 인생의 목표를 찾으려는 강한 욕구를 지니고 있기에 주변 사람들과 어울리지 못할 때가 있습니다. 그렇다고 다른 사람들과 깊은 관계를 맺을 수 없다는 의미는 아닙니다. 다만 가끔씩 세상이 자신을 이해하지 못하거나 세상과 자신의 의견이 다르다고 느낄 때가 있기는 합니다.<br><br>옹호자는 세상을 더 나은 곳으로 만들기 위해 최선을 다합니다. 이들은 불평등을 싫어하며 자신의 이익보다는 남을 돕는 일에 더욱 집중하곤 합니다. 또한 창의력과 상상력과 세심함 등 자신의 강점을 다른 사람을 돕는 일에 활용해야 한다는 사명감을 느낄 때가 많습니다.<br><br>많은 옹호자는 다른 사람을 돕는 일을 인생의 사명으로 생각하며 정의를 추구할 방법을 찾습니다. 이들은 사회의 본질적인 문제를 해결하고 부당함을 해소하려는 열망이 있습니다. 그러나 가끔은 자신을 돌보는 대신 이상에만 집중하느라 스트레스나 번아웃으로 고생할 때도 있습니다.<br><br>옹호자는 내향적(I) 성향을 지니고 있으며 다른 사람과 깊이 있고 진실한 관계를 맺고자 합니다. 다른 사람과 서로를 진실되게 알아가는 일은 이들에게 깊은 행복감을 줍니다. 이들은 단순한 잡담보다는 의미 있는 대화를 추구합니다. 이들은 따뜻하고 세심한 방식으로 소통하려고 하며, 솔직한 태도와 통찰력은 주변 사람에게 깊은 인상을 남기곤 합니다.<br><br>옹호자는 사려 깊고 공감 능력이 뛰어나며 다른 사람과의 관계를 위해 큰 노력을 기울입니다. 하지만 모든 사람이 이러한 노력에 감사하는 것은 아니므로 다른 사람이 자신의 선한 의도를 알아차리지 못할 때는 좌절하기도 합니다. 또한 정당한 비판도 개인적인 비난으로 받아들여 마음에 상처를 입을 때가 있습니다.<br><br>많은 옹호자는 자신의 삶에 특별한 목적과 성취해야 할 사명이 있다고 생각합니다. 이들은 사명을 찾는 일에서 보람을 느끼며, 사명을 찾았다면 이를 성취하기 위해 최선을 다합니다.<br><br>옹호자는 불평등이나 불공평한 일을 마주했을 때 현실에 안주하는 대신 직관과 열정을 통해 해결책을 찾기 위해 노력합니다. 이들은 이성과 열정의 균형을 유지할 능력이 있으며 세상의 다양한 문제를 해결하고자 합니다. 그러나 다른 사람을 돌보는 일도 중요하지만 가끔은 자신을 챙기는 시간을 보내야 한다는 사실을 기억할 필요가 있습니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#34a474';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/diplomats_Advocate_INFJ_personality_header.svg';
			           break;
			       case 'INTJ':
			    	   mbtiResultElement.textContent = 'INTJ - 전략가';
			    	   resultTextElement.innerHTML = '최고가 되는 것은 외로운 일입니다. 매우 희귀한 성격이면서도 뛰어난 능력을 지닌 전략가(INTJ)는 이러한 말의 의미를 잘 알고 있습니다. 전략가는 이성적이면서도 두뇌 회전이 빠른 성격으로, 자신의 뛰어난 사고 능력을 자랑스러워하며 거짓말과 위선을 꿰뚫어 보는 능력이 있습니다. 하지만 이로 인해 끊임없이 생각하고 주변의 모든 것을 분석하려는 자신의 성향을 이해할 수 있는 사람을 찾는 데 어려움을 겪기도 합니다.<br><br>전략가는 모든 것에 의문을 제기합니다. 다른 많은 성격은 현재 상태를 유지하고 일반적인 통념과 다른 사람의 전문 지식에 의존해 살아가곤 합니다. 하지만 비판적인 성향을 지닌 전략가는 자신만의 방식을 찾아내기를 원하며, 일을 진행하는 더 나은 방식을 찾기 위해 규칙을 깨거나 다른 사람의 반대를 무릅쓰는 일도 마다하지 않습니다. 사실 오히려 이러한 과정을 즐기는 편입니다.<br><br>전략가는 실제로 활용할 수 있는 아이디어만이 가치가 있다고 생각하며, 단순히 새로운 아이디어를 내는 데 그치는 것이 아니라 아이디어를 이용해 성공을 쟁취하고자 합니다. 이들은 업무에 자신의 모든 통찰력과 논리력과 의지를 쏟아부으며, 불필요한 규칙을 설정하거나 쓸모없는 비판을 제기하면서 자신을 방해하는 사람에게는 가차없는 모습을 보입니다.<br><br>전략가는 독립성이 매우 강하며 혼자서 행동하는 일을 두려워하지 않습니다. 아마 다른 사람을 기다리는 일을 좋아하지 않기 때문일 수도 있습니다. 또한 일반적으로 다른 사람의 의견을 묻지 않고 결정을 내리는 편입니다. 이렇게 혼자서 행동하려는 성향으로 인해 다른 사람의 의견과 욕구와 계획을 무시함에 따라 무신경한 사람처럼 보일 수도 있습니다.<br><br>하지만 전략가가 남에게 무심하다는 생각은 사실이 아닙니다. 감정이 풍부하지 않고 지적인 성격이라는 편견이 있기는 하지만 사실 전략가는 예민한 감성을 지니고 있기 때문입니다. 전략가는 일이 잘못되거나 남에게 상처를 주게 되었을 때 슬픔과 후회를 느끼며, 왜 그런 일이 발생했는지 파악하는 데 많은 시간과 에너지를 투자합니다. 결정을 내릴 때 감정을 중시하지 않는다고 해서 감정을 느끼지 못하는 것은 아니기 때문입니다.<br><br>전략가는 대담한 몽상가인 동시에 극심한 비관주의자이기도 합니다. 이들은 의지와 지적 능력이 있다면 어떠한 목표라도 성취할 수 있다고 믿지만, 동시에 대부분의 사람이 게으르고 상상력이 부족하고 특별할 것이 없다고 냉소적으로 생각하기도 합니다.<br><br>전략가의 자존감은 대부분 자신의 지식과 지적 능력에 기반을 두고 있습니다. 학교에서 ‘책벌레‘나 ‘범생이‘라는 소리를 듣기도 하지만, 이러한 말을 모욕이 아닌 자신의 특징으로 받아들입니다. 또한 자신에게 코딩, 무술, 클래식 음악 등 관심이 있는 분야라면 어떤 분야든지 최고가 될 수 있는 능력이 있다는 사실을 알고 있습니다.<br><br>전략가는 완고할 때가 있으며 주의가 산만한 환경이나 불필요한 잡담 등 시시한 일을 참지 못합니다. 하지만 그렇다고 이들이 지루하거나 재미없는 성격이라는 의미는 아닙니다. 진지해 보이는 모습과 달리 재치가 넘치며. 날카롭게 비꼬면서도 재미있는 유머 감각을 지니고 있는 경우가 많습니다.<br><br>일반적으로 전략가가 따뜻하고 부드러운 성격은 아닙니다. 겸손함과 인사치레보다는 이성과 성공을 중시하며, 입바른 말을 하기보다는 솔직하게 이야기하는 성격이기 때문입니다. 소설이나 영화의 악당이 전략가의 성격을 지닌 것으로 표현되는 이유도 바로 이러한 점 때문일 것입니다.<br><br>솔직함을 중시하고 핵심만을 이야기하려는 전략가는 잡담과 빈말 등 일반적인 사교 활동이 무의미하거나 멍청하다고 생각할 수 있습니다. 이로 인해 솔직함에만 집중하느라 무례하거나 공격적인 사람처럼 보일 수도 있습니다.<br><br>하지만 전략가도 다른 성격과 마찬가지로 다른 사람과의 소통을 원합니다. 다만 자신과 가치관이 비슷한 사람을 만나고 싶어하며, 그럴 수 없다면 차라리 혼자 있는 것을 선택할 뿐입니다. 이들은 자신의 관심사에 집중할 때 자신감을 발산하는 성격으로, 이러한 자신감은 직장 동료와 관계를 맺거나 친구나 연인을 사귈 때 도움이 되기도 합니다.<br><br>전략가는 모순이 가득한 성격입니다. 상상력이 넘치면서도 결단력이 강하고, 야망이 넘치면서도 차분하고, 호기심이 많으면서도 집중력이 높은 성격이기 때문입니다. 다른 사람은 모순적인 전략가의 성격을 이해하기 힘들다고 생각할 수도 있지만, 전략가의 사고방식을 생각하면 이러한 모순도 이해할 수 있습니다.<br><br>전략가에게 삶은 거대한 체스 경기와 같습니다. 이들은 운보다는 전략에 의존하며 결정을 내릴 때마다 결정으로 인한 장단점을 심사숙고합니다. 또한 아무리 힘든 일이 생기더라도 지적 능력과 통찰력을 이용하면 승리할 방법을 찾을 수 있다고 믿습니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#88619a';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/analysts_Architect_INTJ_personality_header.svg';
			           break;
			       case 'ISTP':
			    	   mbtiResultElement.textContent = 'ISTP - 장인';
			    	   resultTextElement.innerHTML = '장인(ISTP)은 이성과 호기심을 통해 세상을 바라보며 눈과 손으로 직접 탐구하는 일을 즐깁니다. 이들은 타고난 손기술을 지니고 있으며, 다양한 프로젝트에서 유용하고 재미있는 물건을 만들어 내고 주변 환경에서 배울 점을 찾습니다. 장인은 보통 기술자나 엔지니어로 일하는 경우가 많으며 물건을 직접 분해하고 조립해 개선하는 일을 즐깁니다.<br><br>장인은 물건을 제작하고 문제를 해결하고 시행착오를 거치고 직접 경험함으로써 아이디어에 대해 탐구합니다. 또한 다른 사람이 자신의 프로젝트에 관심을 보이는 것에 즐거워하며 개방적인 태도를 보입니다. 다만 다른 사람이 자신의 원칙이나 자유를 침해하는 일은 원치 않으며, 상대방도 자신에게 개방적인 태도를 보일 것을 기대합니다.<br><br>장인은 남을 돕고 경험을 공유하는 일을 좋아합니다. 이렇게 매력적인 장인이 전체 인구의 약 5%밖에 되지 않는 점은 아쉽다고 할 수 있습니다. 특히 여성 장인은 더욱 희귀하며 전통적인 성 역할을 기대하는 사회에서는 말괄량이 취급을 받는 어려움을 겪기도 합니다.<br><br>기술과 기계에 집중하는 성향 때문에 단순한 성격처럼 보일 수 있지만, 사실 장인은 불가사의한 성격이라고 할 수 있습니다. 친절하지만 매우 내향적이고, 차분하지만 즉흥적이며, 호기심이 넘치지만 일반적인 교육 시스템에서는 집중력을 유지하지 못하는 수수께끼 같은 성격이기 때문입니다. 이로 인해 친구와 연인도 장인을 이해하지 못할 때가 있습니다. 또한 매우 충실하고 꾸준한 성격처럼 보일 때가 많지만, 갑자기 넘치는 에너지를 발산하고 새로운 관심사를 찾아 나서기도 합니다.<br><br>장인의 성향이 상황에 따라 달라지는 이유는 결정을 내릴 때 실용성과 현실성을 고려하며, 남에게 대접받고자 하는 대로 남을 대접하는 것이 공정하다고 생각하기 때문입니다. 이러한 생각 때문에 남에게 피해를 주지 않기 위해 조심하기보다는 다른 사람이 피해를 주면 자신도 앙갚음하겠다는 태도를 보이기도 합니다.<br><br>장인의 문제점은 남들도 자신과 같이 관대한 성격을 지니고 있다고 생각해 너무 성급하게 행동할 가능성이 크다는 것입니다. 이 때문에 남에게 상처를 주는 농담을 하거나, 다른 사람의 프로젝트에 지나치게 관여하거나, 주변 사람의 주의를 산만하게 하거나, 더 흥미로운 계획이 있다는 이유로 계획을 갑자기 변경하는 행동을 보일 수도 있습니다.<br><br>장인은 자신과 다르게 지켜야 할 선과 규칙을 명확히 정하는 사람이 많다는 사실을 알게 될 것이며, 지나친 농담을 불쾌하게 생각하거나 주의가 산만한 환경을 싫어하는 사람도 있다는 사실을 알게 될 것입니다. 특히 감정적으로 격양된 상황이라면 선을 넘는 말과 행동으로 인해 극심한 갈등이 발생할 수도 있다는 점에 주의해야 합니다.<br><br>장인은 다른 사람의 반응을 예상하는 일을 어려워합니다. 자신의 감정과 의도에 따라 말이나 행동이 적절한지를 판단하기 때문입니다. 인간관계에서 공감 능력보다는 행동을 중시하는 성향은 갈등으로 이어질 수 있으며, 자유로운 성향의 장인은 상대방이 정한 선을 지키는 일을 어려워할 때가 있습니다.<br><br>그러나 장인의 예측 불가능한 성향을 이해하고, 창의성과 유머 감각과 해결책을 만들어 내는 능력을 인정하는 환경을 찾는다면 즐겁게 일하고 다른 사람의 존경도 받을 수 있을 것입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#d8a537';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/explorers_Virtuoso_ISTP_personality_header.svg';
						break;
			       case 'ISFP':
			    	   mbtiResultElement.textContent = 'ISFP - 모험가';
			    	   resultTextElement.innerHTML = '모험가(ISFP)는 진정한 의미의 예술가라고 할 수 있습니다. 하지만 모험가라고 반드시 예술 업계에만 종사하는 것은 아닙니다. 이들에게는 삶 자체가 자신을 표현하기 위한 캔버스이기 때문입니다. 이들은 입는 옷부터 여가 시간을 보내는 방식까지 다양한 측면에서 자신의 독특한 개성을 생생히 드러냅니다.<br><br>모든 모험가는 각자 독특한 성격을 지니고 있습니다. 이들은 호기심이 많고 새로운 것을 추구하는 성격으로 다양한 분야에 관심과 열정을 보일 때가 많습니다. 모험가는 탐험가적 성향과 일상 생활에서 즐거움을 찾을 수 있는 능력을 지니고 있는 매우 흥미로운 성격이라고 할 수 있습니다. 그러나 보통 자신의 놀라운 개성에 자만하는 대신 자신이 하고 싶은 일을 할 뿐이라고 겸손하게 생각하곤 합니다.<br><br>모험가는 유연한 방식으로 삶에 적응하며 일부 성격과 달리 엄격한 일정과 계획을 따르는 일을 좋아하지 않습니다. 모험가는 하루 하루를 있는 그대로 받아들이며 현재를 기준으로 결정을 내립니다. 또한 삶에서 여유를 추구하며, 혼자 또는 사랑하는 사람들과 훌쩍 여행을 떠나거나 새로운 일에 도전하는 등 즉흥적인 방식으로 다양한 추억을 쌓고자 합니다.<br><br>모험가는 유연한 사고 방식과 관용적이고 개방적인 태도를 지니고 있습니다. 이들은 다양한 사람들과 함께 살아가는 것을 진심으로 사랑하며, 자신과 생각이나 라이프스타일이 다른 사람도 받아들입니다. 또한 자기 생각이나 의견을 바꾸는 데도 거리낌이 없으며 다른 사람도 변화할 수 있다고 믿곤 합니다.<br><br>그러나 현재에 집중하는 모험가의 성향에도 단점은 존재합니다. 이들은 장기적 계획을 수립하고 이를 지키는 데 어려움을 겪을 수 있습니다. 이로 인해 자신이 목표를 성취할 수 있는 능력이 있는지 제대로 파악하지 못할 때가 있으며 다른 사람을 실망하게 할까 걱정하곤 합니다. 가끔은 체계적인 태도로 삶을 바라본다면 독립성을 유지하는 동시에 자신의 능력에 대한 자신감을 느끼고 계획을 수립하는 데 도움이 될 것입니다.<br><br>모험가는 따뜻하고 친절하며 배려심 넘치는 성격으로 친구나 사랑하는 사람과 함께 할 때 깊은 행복감을 느낍니다. 동시에 내향적(I) 성향으로 인해 다른 사람과의 만남 후에는 혼자만의 시간이 필요하며, 혼자만의 시간을 통해 자신의 진정한 정체성에 대해 다시 생각하곤 합니다.<br><br>모험가는 창의력이 넘치는 자유로운 영혼으로 자신의 리듬에 따라 살아갑니다. 이 때문에 다른 사람의 의견을 신경쓰지 않는 성격처럼 보일 수도 있습니다. 하지만 사실 모험가는 사려 깊고 통찰력이 뛰어난 성격으로, 다른 사람이 기분이나 생각을 파악할 수 있는 능력을 지니고 있습니다. 또한 다른 사람들이 자신을 좋아하지 않는다고 느낄 때는 불안해하기도 합니다. 이 때문에 비판을 받았을 때 평정심을 유지하기 어려워할 때가 많으며, 너무 직설적이거나 부당한 비판을 받는다면 크게 화를 내기도 합니다.<br><br>모험가의 성격에는 다양한 장점이 있습니다. 이들은 과거의 상처나 좌절한 경험을 되돌아보는 대신 현재에 집중하며, 이미 지나간 일에 대해 후회하기보다는 현재에 가장 적절한 결정을 내립니다. 또한 주변에서 다른 사람이 발견하지 못한 즐거움을 찾아내곤 합니다. 이렇게 긍정적인 삶의 태도는 모험가의 다양한 매력 중 하나라고 할 수 있습니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#d8a537';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/explorers_Adventurer_ISFP_personality_header.svg';
			           break;
			       case 'INFP':
			    	   mbtiResultElement.textContent = 'INFP - 중재자';
			    	   resultTextElement.innerHTML = '중재자(INFP)는 언뜻 보기에 조용하고 자신을 내세우지 않는 것처럼 보이지만, 사실은 에너지와 열정이 넘치는 마음을 지닌 성격입니다. 이들은 창의적이고 상상력이 뛰어나며 몽상을 즐기는 성격으로 머릿속에서 수많은 이야기를 만들어 내곤 합니다. 또한 음악과 예술과 자연에 대한 감수성이 뛰어나며 다른 사람의 감정을 빠르게 알아차립니다.<br><br>중재자는 이상주의적이고 공감 능력이 높으며 깊고 의미 있는 관계를 원하고 다른 사람을 도와야 한다는 사명감을 느끼곤 합니다. 그러나 전체 인구에서 큰 비중을 차지하지 않는 성격이기 때문에 외로움을 느끼거나 존재감을 드러내지 못하는 때가 있으며, 자신의 독특한 강점을 인정하지 않는 세상에서 방황하는 느낌을 받을 수도 있습니다.<br><br>중재자는 인간의 본성에 대한 깊은 호기심을 지니고 있습니다. 이들은 자기 성찰적인 성격으로 자기 생각과 감정에 집중합니다. 하지만 동시에 주변 사람들을 이해하고자 하는 욕구도 지니고 있습니다. 이들은 공감 능력이 높고 항상 다른 사람의 이야기를 편견 없이 들을 준비가 되어 있으며, 상대방의 이야기를 경청하고 상대방에게 도움이 될 수 있다는 사실에서 만족감을 느낍니다.<br><br>공감 능력은 중재자의 가장 큰 재능이지만 가끔씩은 단점이 되기도 합니다. 높은 공감 능력 때문에 다른 사람의 부정적인 감정이나 사고방식에 쉽게 영향을 받기 때문입니다. 선을 확실히 정하지 않는다면 주변의 수많은 문제에 신경쓰느라 상당한 스트레스를 받게 될 수 있습니다.<br><br>중재자는 다른 사람인 척하는 일을 매우 불편해합니다. 이들은 민감하고 솔직함을 중시하는 성격으로, 창의적인 방식으로 자신을 표현할 기회를 원합니다. 이 때문에 중재자 중에는 시인, 작가, 배우, 예술가가 많은 편입니다. 이들은 삶에 대해 이야기하는 일을 즐기며 다양한 이야기와 아이디어와 가능성을 생각하곤 합니다.<br><br>중재자의 뛰어난 상상력은 자신을 성찰하고 세상에서 자신의 역할을 찾는 데 도움이 됩니다. 그러나 몽상과 아이디어에만 집중하느라 실제로 행동하지 못하게 될 때도 있습니다. 좌절감과 무능감을 느끼는 일을 피하기 위해서는 꿈과 아이디어를 실현하는 일에도 집중해야 합니다.<br><br>중재자는 삶의 목적을 찾기 전까지는 방황하는 듯한 느낌을 받곤 합니다. 보통 이들에게 삶의 목적이란 다른 사람을 돕고 다른 사람의 어려움에 공감하는 일과 관련이 있습니다. 이들은 모든 사람을 돕고 싶어하지만, 스트레스를 방지하기 위해서는 자신의 에너지와 노력을 어디에 쏟을지 현명하게 결정해야 합니다.<br><br>중재자의 이상주의적 성향과 높은 창의성은 세상을 더 나은 곳으로 만드는 데 도움이 되며, 중재자는 가는 곳마다 주변에 열정과 친절함과 아름다움을 퍼뜨리는 역할을 하곤 합니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#34a474';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/diplomats_Mediator_INFP_personality_header.svg';
			           break;
			       case 'INTP':
			    	   mbtiResultElement.textContent = 'INTP - 논리술사';
			    	   resultTextElement.innerHTML = '논리술사(INTP)는 자신의 독특한 관점과 활기 넘치는 지성에 자부심을 느끼며, 우주의 미스터리에 대해 깊이 생각하곤 합니다. 유명한 철학자와 과학자 중 논리술사 성격이 많은 것도 이 때문일 것입니다. 논리술사는 상당히 희귀한 성격이지만 뛰어난 창의성과 독창성으로 많은 사람 사이에서 존재감을 드러내곤 합니다. 이렇게 논리적이면서도 마술사와 같은 창의력을 발휘하는 성격이기에 ‘논리술사’라고 부르게 되었습니다.<br><br>논리술사는 깊은 생각에 빠질 때가 많습니다. 이들은 항상 무엇을 생각하고 있으며 일어난 순간부터 다양한 아이디어와 질문을 떠올립니다. 또한 가끔 머릿속에서 혼자 치열한 토론을 펼치기도 합니다.<br><br>남들의 눈에는 논리술사가 몽상에 빠진 사람처럼 비칠 수 있습니다. 또한 생각이 깊고 현실에 집중하지 않으며 약간은 내성적이라는 평가를 받기도 합니다. 이 때문에 현재와 상대방에 집중하는 습관을 기르지 않는다면 다른 사람을 불편하게 할 가능성이 있다는 사실에 주의해야 합니다. 논리술사는 내향적(I) 성향으로 인해 사람들을 만나는 일에서 피로감을 느끼곤 하며, 사교 활동 후에는 생각할 수 있는 혼자만의 시간이 필요합니다.<br><br>그렇다고 논리술사가 불친절하거나 예민한 성격이라는 것은 아니며, 자신처럼 지적 에너지가 충만한 사람을 만나면 에너지가 넘치곤 합니다. 논리술사 입장에서 호기심이 충만한 사람과 활기차게 토론하고 아이디어를 공유하는 일만큼 즐거운 일도 없기 때문입니다.<br><br>논리술사는 패턴을 분석하는 일을 즐깁니다. 셜록 홈즈처럼 무의식적으로 미세한 차이나 이상한 점을 발견하며 다른 사람의 거짓말도 잘 간파하는 편입니다.<br><br>하지만 논리술사가 항상 약속을 지키는 성격은 아닙니다. 정직하지 않은 성격이어서가 아니라 수많은 아이디어와 이론을 생각하느라 자신이 한 말을 잊을 때가 있기 때문입니다. 이들은 자기 생각을 바꾸는 때가 많기에 다른 사람 입장에서는 이미 확고하게 결정한 일을 바꾸는 사람으로 비칠 수도 있습니다. 또한 흥미로운 토론을 위해 일부러 반대 입장을 취하는 일을 즐기기도 합니다.<br><br>논리술사는 하루 종일 아이디어와 가능성에 대해 생각할 때가 많지만, 아이디어를 실현하는 데는 크게 관심이 없는 편입니다. 그러나 동시에 복잡하게 얽혀 있는 문제에 대한 해결책을 마련하는 데는 창의적인 천재성과 잠재력을 지닌 논리술사만큼 적합한 성격도 없다고 할 수 있습니다.<br><br>논리술사는 우주의 모든 것을 이해하고 싶어합니다. 그러나 이들을 미궁에 빠뜨리는 것이 하나 있습니다. 바로 사람입니다. 논리술사는 이름대로 논리와 이성에 집중할 때 편안함을 느낍니다. 이 때문에 비논리적이고 비이성적인 감정이 자신과 다른 사람들의 행동에 영향을 미친다는 사실에 당황하곤 합니다.<br><br>그렇다고 논리술사가 감정이 메마른 성격이라는 뜻은 아닙니다. 다만 친구와 연인에게 감정적으로 힘이 되어주고 싶어도 어떻게 해야 할지 모를 때가 있을 뿐입니다. 또한 어떤 방법이 최선인지 모르기 때문에 아예 말이나 행동을 하지 않기도 합니다.<br><br>이렇게 분석에 집중하느라 말이나 행동을 할 기회를 놓치는 성향은 삶 전반에 영향을 줄 수 있습니다. 논리술사는 사소한 결정에 대해 너무 오래 생각할 때가 있으며, 수많은 생각으로 인해 실제로 일을 완수하지 못해 답답함이나 피로감을 느낄 수 있습니다.<br><br>다행히 논리술사는 어려움을 금방 해결해 낼 수 있는 능력을 지니고 있으며, 가끔씩 답답함을 느끼더라도 자신의 강점으로 이를 극복하곤 합니다. 자신의 창의성과 개방적인 태도를 적절히 활용한다면 모든 잠재력을 실현하고 사고력뿐만 아니라 여러 방면에서 유능하면서도 행복한 사람이 될 수 있을 것입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#88619a';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/analysts_Logician_INTP_personality_header.svg';
			           break;
			       case 'ESTP':
			    	   mbtiResultElement.textContent = 'ESTP - 사업가';
			    	   resultTextElement.innerHTML = '사업가(ESTP)는 항상 주변 사람에게 영향력을 행사하곤 합니다. 파티에서 가는 곳마다 사람들에게 둘러싸여 있는 사람을 발견한다면 바로 사업가일 것입니다. 이들은 직설적인 유머 감각을 지니고 있으며 수많은 사람의 관심을 받는 일을 즐깁니다. 한 마디로 사회자가 무대로 올라올 사람을 찾을 때 직접 무대로 올라가는 성격이라고 할 수 있습니다.<br><br>사업가는 이론적이고 추상적인 개념과 지루한 토론에는 크게 관심이 없습니다. 지능이 높고 활기찬 대화를 유지할 수 있는 성격이기는 하지만, 현실적인 주제에 대해 이야기하고 직접 행동하기를 원하는 성격이기 때문입니다. 이들은 계획을 심사숙고하기보다는 먼저 행동하고 시행착오를 겪으며 실수를 바로잡는 방식을 선호합니다.<br><br>사업가는 위험 추구 성향이 가장 강한 성격으로 현재에 집중하며 자신의 생각을 바로 행동으로 옮깁니다. 이들은 열정과 즐거움에 집중하며 지적 자극을 제공하는 모험을 추구합니다. 또한 중요한 결정을 내릴 때는 현재의 사실에 집중하는 경향이 있습니다.<br><br>사업가의 행동지향적 성향은 학교 등의 체계적인 교육 환경과 충돌할 수 있습니다. 기존의 정형화된 교육 방식보다는 직접 배우는 일을 선호하기 때문입니다. 그 결과 교육을 즐거움을 만들어 낼 수 있는 기회로 바라보기까지 상당한 시간이 걸리는 편입니다.<br><br>또한 사업가는 자신만의 규칙을 만들려고 하는 경향이 있으며 불필요하다고 생각하는 규칙을 어기는 데 거리낌이 없습니다. 이 때문에 학교나 회사에서 규칙을 따르지 않는 사람이라는 평판을 받게 될 수 있습니다. 갈등을 최소화하고 넘치는 에너지를 활용하는 동시에 지루한 일에도 집중하는 법을 익힌다면 다른 사람에게 인정을 받을 수 있을 것입니다.<br><br>사업가는 관찰력이 뛰어나고 현상을 있는 그대로 받아들이는 성격으로 사소한 변화도 감지하는 능력을 지니고 있습니다. 이들은 대부분의 성격과 달리 숨겨진 생각이나 의도를 손쉽게 간파하며 표정 변화와 새로운 패션 스타일 등 다양한 변화를 감지해 내곤 합니다. 이들은 관찰한 결과를 바탕으로 변화를 요구하거나 질문을 건네는 등 생각을 즉시 행동으로 옮기며, 이 과정에서 상대방의 감정을 고려하지 않을 때가 많습니다. 이들에게는 모든 사람이 자신의 비밀과 결정에 대해 이야기하고 싶어하지는 않는다는 사실을 기억할 필요가 있습니다.<br><br>사업가는 전체 인구의 4%밖에 되지 않음에도 큰 존재감을 발휘하는 성격입니다. 다만 현재에 집중하느라 일을 잘못된 방향으로 진행하거나, 다른 사람의 기분을 상하게 하거나, 자신의 건강과 안전을 생각하지 않을 때가 있습니다.<br><br>가끔 주의력이 분산될 때가 있기는 하지만, 일반적으로 사업가는 열정과 에너지가 가득하며 강한 정신력을 지닌 성격입니다. 이들은 다른 사람에게 의욕을 불어넣는 일과 설득하는 일에 능합니다. 이러한 자질을 건설적이고 의미 있는 방식으로 발휘할 수 있다면 타고난 지도자로서 사람들을 새로운 길로 이끌고 가는 곳마다 에너지와 즐거움을 선사하는 역할을 할 수 있을 것입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#d8a537';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/explorers_Entrepreneur_ESTP_personality_header.svg';
			           break;
			       case 'ESFP':
			    	   mbtiResultElement.textContent = 'ESFP - 연예인';
			    	   resultTextElement.innerHTML = '연예인(ESFP)은 즉흥적으로 노래하고 춤을 추는 일을 즐기는 성격입니다. 이들은 지금 이 순간을 즐기며 남들도 자신과 같은 즐거움을 느낄 수 있기를 바랍니다. 또한 남을 응원하는 데 기꺼이 시간과 에너지를 투자하며, 매우 매력적인 방식으로 다른 사람의 기운을 북돋곤 합니다.<br><br>연예인은 다른 사람의 관심을 즐기며 세상을 하나의 무대로 생각합니다. 연예인 성격을 지닌 사람은 배우로 일하는 경우가 많으며, 친구와 외출할 때는 파티처럼 즐거운 분위기를 유지하는 역할을 합니다. 이들은 매우 사교적인 성격으로 사소한 일도 즐거워하며 친구들과 재미있는 시간을 보내는 일에서 큰 만족감을 느낍니다.<br><br>또한 연예인은 미적 감각과 패션 감각이 매우 뛰어난 성격으로 자신과 집을 멋지게 꾸미는 일에도 소질이 있습니다. 이들은 매력적인 물건을 한눈에 알아보며 자신의 스타일에 맞게 주변을 변화시키곤 합니다. 또한 선천적으로 호기심이 많은 성격이기에 자유롭게 새로운 디자인과 스타일을 시도해 보기도 합니다.<br><br>연예인이 자신에만 집중하는 것처럼 보일 수도 있지만, 사실은 관찰력이 뛰어나며 빠르게 다른 사람의 감정을 알아차리는 성격입니다. 이들은 다른 사람이 자신의 문제에 대해 이야기할 수 있도록 돕고, 다른 사람의 문제에 공감하며 실질적인 조언을 제공하곤 합니다. 그러나 다른 사람과 갈등이 발생하면 문제를 해결하기보다는 아예 소통을 거부하기도 합니다. 또한 열정과 즐거움을 추구하며 다른 사람의 비판을 받는 일은 달가워하지 않습니다.<br><br>연예인이 겪을 수 있는 가장 큰 문제는 즉흥적인 즐거움을 추구하는 과정에서 의무와 책임을 무시할 수 있다는 것입니다. 또한 복잡한 분석이나 반복적인 작업이나 통계치를 실제 결과에 대입하는 일 등에는 큰 소질이 없습니다. 이들은 보통 행운이나 우연한 기회에 의존하거나 친구들에게서 도움을 받곤 합니다. 그러나 은퇴 계획이나 건강 관리 등의 장기적인 계획은 스스로 챙길 수 있도록 노력하는 것이 중요합니다.<br><br>연예인은 물건의 가치와 품질을 파악하는 데 뛰어난 소질을 지니고 있습니다. 그러나 계획성이 부족한 편이기 때문에 신용 카드를 과다하게 사용하는 등 사치에 빠지게 될 위험이 있습니다. 또한 장기적인 목표를 수립하기보다는 새로운 기회를 발견하는 데 집중하느라 주의가 산만해질 때가 있습니다.<br><br>연예인은 주변 사람을 웃게 하고 활기를 북돋우며 새롭고 즐거운 일을 시도합니다. 또한 모든 사람을 즐겁게 할 때 큰 행복감을 느낍니다. 이들은 오랫동안 이야기하는 일을 즐기며 사랑하는 사람과 즐거움과 슬픔을 함께 나누곤 합니다. 일의 우선순위를 적절히 정할 수만 있다면 친구와 함께 신나고 참신한 일을 언제든지 걱정없이 즐길 수 있을 것입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#d8a537';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/explorers_Entertainer_ESFP_personality_header.svg';
			           break;
			       case 'ENFP':
			    	   mbtiResultElement.textContent = 'ENFP - 활동가';
			    	   resultTextElement.innerHTML = '활동가(ENFP)는 진정으로 자유로운 영혼이라고 할 수 있으며 외향적이고 솔직하며 개방적인 성격입니다. 이들은 활기차고 낙관적인 태도로 삶을 대하며 다른 사람들 사이에서 돋보이곤 합니다. 그러나 신나는 인생을 보내는 것처럼 보인다고 해서 즐거움만을 좇는 성격은 아니며, 다른 사람과 감정적으로 깊고 의미 있는 관계를 맺는 일을 추구합니다.<br><br>활동가는 친절하고 사교적인 성격으로 다른 사람과의 관계를 맺는 일과 사교 활동을 즐깁니다. 하지만 사교적이고 느긋해 보이는 겉모습과 달리 깊은 내면을 지니고 있으며 상상력과 창의력이 풍부하고 호기심이 많은 성격입니다.<br><br>활동가는 자기 성찰적인 모습을 보일 때가 있으며, 다른 일에 주의를 기울여야 할 때도 인생의 근본적인 의미와 중요성에 대해 생각하곤 합니다. 또한 모든 사물과 사람이 연결되어 있다고 믿으며 이러한 관계에 대한 통찰을 추구합니다.<br><br>활동가는 자신의 상상력을 자극하는 일에 강한 열정을 보이며 이러한 열정은 다른 사람에게도 전달됩니다. 또한 긍정적인 에너지로 다른 사람들을 끌어들이고 지도자 역할을 맡게 될 때가 많습니다. 그러나 처음의 열망이 사그라들고 나면 일관성과 자제력을 유지하는 데 어려움을 겪거나 이전에 중요하게 생각했던 일을 더는 신경쓰지 않게 될 수도 있습니다.<br><br>활동가는 인생에서 즐거움과 깊은 의미를 동시에 추구하는 성격으로, 열정적인 이상주의자이자 다른 사람을 신경쓰지 않고 즐겁게 춤출 수 있는 자유로운 영혼이기도 합니다.<br><br>활동가는 즐거움을 추구하는 동시에 다른 사람과 감정적으로 교류하고 싶어하며, 아끼는 사람들과 진솔하고 가슴 따뜻한 대화를 나누는 일을 중시합니다. 활동가는 모든 사람이 자신의 감정을 표현할 수 있어야 한다고 생각하며 공감 능력과 따뜻한 태도로 다른 사람이 마음을 열 수 있도록 돕습니다.<br><br>다만 다른 사람을 지레짐작하지 않도록 주의할 필요는 있습니다. 직관적인 성향으로 인해 다른 사람의 행동을 자신의 방식대로 해석할 때가 있기 때문입니다. 상대방이 원하는 것과 의도를 혼자서 파악하려고 하기보다는 직접 상대방에게 물어본다면 인간관계에서 오는 스트레스를 줄이는 데 도움이 될 것입니다.<br><br>활동가는 진로를 정하기 전에 여러 사람과 관계를 맺고 다양한 감정과 아이디어를 충분히 고려하고 싶어합니다. 그리고 자신이 정한 분야에서 상상력과 공감 능력과 용기로 자신의 삶뿐만 아니라 주변 사람 모두를 즐겁게 하는 역할을 합니다.<br><br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#34a474';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/diplomats_Campaigner_ENFP_personality_header.svg';
			           break;
			           break;
			       case 'ENTP':
			    	   mbtiResultElement.textContent = 'ENTP - 변론가';
			    	   resultTextElement.innerHTML = '변론가(ENTP)는 두뇌 회전이 빠르고 대담한 성격으로 현재 상황에 이의를 제기하는 데 거리낌이 없습니다. 변론가는 어떤 의견이나 사람에 반대하는 일을 두려워하지 않으며, 논란이 될 만한 주제에 대해 격렬하게 논쟁하는 일을 즐깁니다.<br><br>그렇다고 변론가가 반론을 제기하는 데만 관심이 있거나 악의를 지닌 것은 아닙니다. 사실 변론가는 지식이 풍부하고 호기심이 넘치며 활기찬 유머 감각으로 다른 사람을 즐겁게 할 수 있는 성격입니다. 다만 대부분의 성격과 달리 논쟁에서 즐거움을 찾는 성향이 있을 뿐입니다.<br><br>변론가는 반항심이 강한 성격입니다. 변론가는 모든 신념에 의문을 제기하고 모든 아이디어를 세심히 검토합니다. 또한 규칙을 철저히 검증하며 불필요하다고 판단되는 규칙은 지킬 필요가 없다고 생각합니다. 그리고 자신의 신념을 객관적으로 바라보기 위해 자신의 의견에 직접 반론을 제기하기도 합니다.<br><br>변론가 입장에서는 많은 사람이 그저 시키는 일만 하고 사회 규범과 압력과 기준에 쉽게 순응하는 것처럼 보입니다. 변론가는 널리 퍼진 생각에 의문을 제기함으로써 정신을 단련하는 일을 즐기며, 사회에서 소외된 사람과 평범하지 않은 사람들의 가치를 발견하는 일에서 만족감을 느낍니다. 또한 모든 사람들이 당연하게 받아들이는 사실을 다시 생각하고 새로운 아이디어를 제시하곤 합니다.<br><br>변론가는 브레인스토밍을 즐기고 원대한 아이디어를 생각하는 일을 좋아하지만 아이디어를 실현하는 일에는 크게 관심이 없습니다. 수많은 생각과 아이디어 때문에 이를 실현하는 데 신경쓸 겨를이 없기 때문입니다. 이 때문에 아이디어의 우선 사항을 지정하고 이를 실현하기 위해 노력하지 않는다면 자신의 잠재력을 모두 발휘하는 데 어려움을 겪을 수 있습니다.<br><br>변론가는 논쟁에 엄청난 소질이 있지만 이로 인해 문제가 발생할 때도 있습니다. 회의에서 상사의 의견에 대놓고 반대하거나 배우자의 말을 조목조목 반박하는 등 이성과 논리에만 집중하다 보면 직장과 인간관계에서 갈등이 발생할 가능성이 큽니다.<br><br>모든 상황에서 반론을 제기하는 일이 항상 도움이 되는 것은 아니며, 대부분의 사람은 자신의 신념을 반박하고 감정을 해치는 사람을 좋아하지 않습니다. 이 때문에 논쟁의 즐거움만을 추구하게 되면 인간관계를 망치게 될 위험이 있습니다. 변론가는 비전과 자신감, 풍부한 지식과 날카로운 유머 감각을 지니고 있다는 장점이 있습니다. 그러나 다른 사람의 기분을 살피는 능력을 기르지 못한다면 깊은 인간관계를 맺거나 직업적 성공을 거두는 데 어려움을 겪을 수 있습니다.<br><br>변론가는 시간이 지남에 따라 이상적인 삶을 위해서는 다른 사람이 필요하며, 논쟁에서 이기는 데만 에너지를 집중하면 다른 사람의 도움을 받지 못하게 될 수 있다는 사실을 깨닫곤 합니다. 변론가가 자신의 능력을 포기해야 하는 것은 아닙니다. 다만 유연성을 발휘해 다른 사람의 관점을 파악하려 노력하고, 논리만큼이나 협력과 배려가 중요하다는 사실을 이해할 필요는 있습니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#88619a';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/analysts_Debater_ENTP_personality_header.svg';
			           break;
			       case 'ESTJ':
			    	   mbtiResultElement.textContent = 'ESTJ - 경영자';
			    	   resultTextElement.innerHTML = '경영자(ESTJ)는 전통과 질서를 중시하는 성격으로, 자신이 생각하는 옳고 그름과 사회적 기준에 따라 가족과 공동체가 화합할 수 있도록 노력합니다. 이들은 정직과 헌신과 존엄성을 중시하며, 어려운 길을 기꺼이 앞장서고 다른 사람들에게 명확한 조언과 지도를 제공합니다. 이들은 사람들이 화합하도록 하는 일에서 자부심을 느끼며, 모든 사람이 지역 축제를 즐길 수 있도록 노력하거나 가족과 공동체의 전통적인 가치관을 지키는 역할 등을 맡곤 합니다.<br><br>경영자의 지도력은 민주 사회에서 특히 중요한 능력이며 경영자는 전체 인구의 11% 이상을 차지하고 있습니다. 이러한 점을 생각하면 미국 대통령의 다수가 경영자 성격이라는 것도 그리 놀라운 사실이 아닙니다. 이들은 법치주의를 신봉하고 권위를 얻으려면 합당한 노력을 해야 한다고 생각합니다. 경영자는 직접 헌신하고 정직하게 행동하며, 나태함이나 부정행위는 단호히 거절함으로써 모범을 보이는 지도자입니다. 이러한 성향은 특히 직장에서 두드러지며, 일을 성취하기 위해서는 직접 열심히 일해야 한다고 하는 사람이 있다면 바로 경영자일 것입니다.<br><br>경영자는 주변을 관찰하는 능력이 뛰어나며 명확하고 입증 가능한 사실을 중시합니다. 또한 자신의 지식에 강한 믿음이 있기에 강한 저항에 부딪히더라도 원칙에 따라 자신의 비전을 밀어붙입니다. 또한 어려운 프로젝트에 참여해 행동 계획을 개선하고 세부 사항을 정리하는 등 직접 행동하며, 어려운 작업도 손쉽게 처리할 수 있는 능력을 지니고 있습니다.<br><br>그렇다고 경영자가 혼자 일하는 성격은 아닙니다. 이들은 다른 사람도 자신만큼 믿을 수 있고 높은 업무 윤리를 지닌 사람이기를 바랍니다. 무능력하거나 게으르거나 부정직한 동료나 부하 직원을 발견하면 분노를 표출하곤 합니다. 이 때문에 경영자는 다른 관리자형 성격과 마찬가지로 융통성이 없는 사람이라는 평가를 받을 때가 있습니다. 그렇다고 경영자가 자신의 방식만을 고집하는 완고한 성격은 아닙니다. 다만 성실함과 정직함이 사회에 꼭 필요한 가치라고 믿고 있을 뿐입니다.<br><br>경영자는 모든 사람이 같은 길을 가거나 같은 방식으로 기여할 필요는 없다는 사실을 이해하는 데 어려움을 겪습니다. 하지만 진정한 지도자라면 개인과 집단의 강점을 파악하고 다른 사람들이 아이디어를 제시할 수 있도록 도와야 합니다. 이를 기억한다면 강점을 유지하면서도 모든 사람에게 도움이 되는 방식으로 사람들을 이끌 수 있을 것입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#4298b4';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/sentinels_Executive_ESTJ_personality_header.svg';
			           break;
			       case 'ESFJ':
			    	   mbtiResultElement.textContent = 'ESFJ - 집정관';
			    	   resultTextElement.innerHTML = '집정관(ESFJ)에게 인생이란 다른 사람과 함께할 때 가장 달콤한 것입니다. 이들은 많은 공동체의 기반이 되며 친구와 연인과 이웃을 열린 마음으로 대합니다.<br><br>집정관이 모든 사람을 좋아하거나 무한한 관용을 지닌 것은 아닙니다. 하지만 이들은 친절하고 예의 바른 태도가 도움이 된다고 믿고 있으며 주변 사람들에게 강한 책임감을 느끼곤 합니다. 또한 관대하고 신뢰할 수 있는 성격으로 작은 일이든 큰 일이든 가족과 공동체를 하나로 모으기 위해 스스로 책임을 짊어질 때가 많습니다.<br><br>집정관은 이타주의적인 성격으로 다른 사람에게 보답하고 다른 사람을 돕고 옳은 일을 해야 한다는 깊은 책임감을 느낍니다.<br><br>집정관은 거의 모든 상황에서 옳은 일을 명확하게 알 수 있다고 생각합니다. 남과 자신에게 관대한 태도를 보이는 일부 성격 유형과 달리 이들은 잘못된 길로 가고 있다고 생각되는 사람을 자기 기준으로 판단하는 경향이 있습니다. 이 때문에 다른 사람, 특히 자신이 아끼는 사람의 의견이 자신이 다르다는 사실을 받아들이기 힘들어 할 때가 많습니다.<br><br>집정관은 옳고 그름에 대한 명확한 견해를 지니고 있기에 자기 의견을 고수하는 경향이 있습니다. 하지만 자의적인 의견을 고집하는 것은 아니며 관습을 깊이 존중하는 선에서 의견을 형성할 때가 많습니다. 이들은 자신이 하는 모든 일이 다른 사람에게 영향을 미칠 수 있음을 알고 있으며, 법과 규율과 관습이 일상에서 다른 사람을 배려하고 책임감 있게 행동하는 데 도움이 된다고 믿고 있습니다.<br><br>집정관은 배려심이 많고 외향적인 성격입니다. 파티에서 모든 사람이 즐거운 시간을 보내고 있는지 확인하기 위해 분주히 돌아다니는 사람이 있다면 바로 집정관일 것입니다. 하지만 다른 사람과의 관계를 가볍게 여기는 성격은 아닙니다. 이들은 마음속 깊이 신실한 성격으로 장기적 관계를 구축하며 언제나 다른 사람에게 도움의 손길을 내밀거나 다른 사람의 말을 경청할 준비가 되어 있습니다.<br><br>집정관은 규칙과 질서를 중시하며 즉흥적인 활동이나 만남보다는 계획된 일정을 선호합니다. 또한 모든 일이 순조롭게 진행되도록 하는 책임도 마다하지 않습니다. 또한 다른 사람들로 하여금 자신이 특별하고 존중받고 있다고 느끼게 하는 데 많은 에너지를 쏟으며, 이러한 노력을 인정받지 못한다고 생각할 때는 상처를 받을 수도 있습니다.<br><br>많은 집정관에 있어 삶의 가장 큰 어려움은 가장 친밀하거나 소중한 사람이라도 다른 사람의 생각이나 행동을 통제할 수는 없다는 사실을 받아들이는 것입니다. 다행히 이들은 자신이 가장 잘하는 일에 집중함으로써 평안함과 만족감을 찾을 수 있습니다. 바로 배려심과 책임감의 모범이 되어 사람들을 하나로 뭉치게 하는 일입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#4298b4';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/sentinels_Consul_ESFJ_personality_header.svg';
			       	   break;
			       case 'ENFJ':
			    	   mbtiResultElement.textContent = 'ENFJ - 선도자';
			    	   resultTextElement.innerHTML = '선도자(ENFJ)는 삶에서 위대한 사명을 위해 힘써야 한다는 느낌을 받곤 합니다. 사려 깊고 이상주의적 성향을 지닌 선도자는 다른 사람과 주변 세상에 긍정적인 영향력을 발휘하기 위해 최선을 다하며, 어려운 상황에서도 올바른 일을 할 기회를 마다하지 않습니다.<br><br>선도자는 타고난 지도자라고 할 수 있으며 많은 선도자가 정치인, 코치, 교사로 활동하고 있습니다. 이들의 열정과 카리스마는 직업뿐만 아니라 인간관계 등 삶의 다양한 측면에서 다른 사람에게 영향을 주곤 합니다. 또한 이들은 친구와 사랑하는 사람이 발전할 수 있도록 돕는 일에서 즐거움과 깊은 만족감을 느낍니다.<br><br>선도자는 진실함과 이타주의 등 자신의 가치관을 적극적으로 설파하며, 부당하거나 잘못된 일이라고 생각이 되면 이에 반대의 목소리를 냅니다. 그러나 보통은 성급하게 자기 생각을 강요하기보다는 세심함과 통찰력으로 다른 사람의 공감을 이끌어내는 방법을 선택할 때가 많습니다.<br><br>선도자는 다른 사람의 의도와 믿음을 간파하는 데 놀라운 소질이 있으며, 가끔씩은 자신도 눈치채지 못할 정도로 빠르게 다른 사람의 생각과 감정을 파악하곤 합니다. 이렇게 번뜩이는 통찰력은 남을 설득하고 다른 사람에게 의욕을 불어넣는 데 큰 도움이 됩니다.<br><br>선도자는 선한 의도를 지닌 성격으로, 다른 사람을 조종하거나 권력을 얻고자 하는 욕망보다는 올바른 일을 하고자 하는 진실한 소망에 따라 행동합니다. 또한 자신과 생각이 다르더라도 상대방과 자신 사이에 공통점을 찾으려고 노력하며, 자신의 가치관에 대해 세심한 태도로 소통함으로써 상대방에게 감동을 주곤 합니다.<br><br>선도자는 자신이 아끼는 사람의 문제를 해결하기 위해 헌신하며, 사람들은 선도자의 도움과 조언에 감사함을 느끼곤 합니다. 이 때문에 선도자는 다른 사람이 더 나은 삶을 살도록 돕는 사람이라는 평가를 받을 때가 많습니다.<br><br>하지만 다른 사람의 문제에 개입하는 일이 항상 바람직한 결과로 이어지는 것은 아닙니다. 선도자는 더 나은 삶을 위해 할 수 있는 일과 해야 하는 일을 명확히 파악하고 있지만, 모두가 자신을 변화시킬 준비가 되어 있는 것은 아니기 때문입니다. 따라서 선도자가 변화를 강요하게 되면 상대방이 불만을 느끼거나 부당한 대우를 받고 있다고 생각하게 될 수 있습니다. 또한 통찰력이 뛰어난 성격이기는 하지만 가끔씩 상황을 잘못 파악하거나 자신도 모르게 잘못된 조언을 건넬 때가 있습니다.<br><br>선도자는 헌신적인 이타주의자로 다른 사람과 자신의 신념을 지키기 위해 어려움을 헤쳐 나갈 준비가 되어 있습니다. 또한 이들의 강력한 신념은 선천적인 리더십 기술과 결합되어 막강한 힘을 발휘합니다.<br><br>사실 선도자의 가장 뛰어난 능력은 모범을 보임으로써 다른 사람들을 이끄는 능력이라고 할 수 있습니다. 이들은 열정적이고 헌신적이고 배려하는 태도로 하루를 보내며, 어려움을 겪는 동료에게 조언을 건네는 등 일상에서 다른 사람을 돕고 더 나은 세상을 만들 기회를 찾아내곤 합니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#34a474';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/diplomats_Protagonist_ENFJ_personality_header.svg';
			           break;
			       case 'ENTJ':
			    	   mbtiResultElement.textContent = 'ENTJ - 통솔자';
			    	   resultTextElement.innerHTML = '통솔자(ENTJ)는 타고난 리더라고 할 수 있습니다. 이들은 카리스마와 자신감을 지니고 있으며 자신의 권한을 이용해 사람들이 공통된 목표를 위해 함께 노력하도록 이끕니다. 또한 이들은 냉철한 이성을 지닌 것으로 유명하며 자신이 원하는 것을 성취하기 위해 열정과 결단력과 날카로운 지적 능력을 활용합니다. 이들은 전체 인구의 3%에 불과하지만, 다른 많은 성격을 압도하는 존재감을 뽐내며 다양한 비즈니스와 단체를 이끄는 역할을 할 때가 많습니다.<br><br>통솔자는 도전을 즐기는 성격으로 충분한 시간과 자원이 주어진다면 어떠한 목표도 달성할 수 있다고 믿습니다. 이들은 훌륭한 사업가가 될 가능성이 높으며, 전략적 사고 능력과 장기적 목표에 집중하고 결단력 있게 계획을 실행하는 능력은 위대한 비즈니스 리더가 되는 데 도움이 됩니다. 이들은 강력한 의지로 다른 사람이 포기하는 상황에서도 굴하지 않고 목표를 추구하며, 외향적(E) 성향은 다른 사람이 목표를 이루는 과정에 협력하도록 하는 데 도움이 됩니다.<br><br>통솔자는 거침없는 태도로 협상에서 우위를 점합니다. 그렇다고 이들이 냉혈한이거나 악한 의도를 지니고 있는 것은 아닙니다. 다만 도전과 지적 대결을 즐기고 재치 있는 논쟁을 즐거워하며, 상대방이 자신의 상대가 되지 않는다고 판단되면 상대방을 거침없이 압도하곤 합니다.<br><br>통솔자는 자신과 동일하거나 우월한 지적 능력을 갖추고, 깔끔하고 정확하게 일을 처리할 수 있는 사람을 존경합니다. 또한 다른 사람의 재능을 파악하는 능력을 지니고 있으며, 이러한 능력은 능력 있는 사람들로 팀을 구성하고 자신의 자만심과 우월감을 억제하는 데 도움이 됩니다. 그러나 다른 사람의 실패를 노골적으로 지적하는 성향이 있어 다른 사람과 갈등을 겪을 때도 있습니다.<br><br>모든 분석가형 성격은 자신의 감정을 표현하는 데 익숙하지 않으며, 특히 통솔자는 많은 사람에게 감정적으로 무관심한 사람이라는 인상을 주곤 합니다. 그리고 직장에서는 비효율적이거나 무능력하거나 게으르다고 생각하는 사람에게 거침없는 모습을 보일 때가 있습니다. 이들은 감정을 드러내는 것은 약점을 드러내는 것과 같다고 생각하는 경향이 있습니다. 하지만 이러한 생각은 친밀한 관계를 형성하는 데 도움이 되지 않으며, 직장에서는 목표를 달성하는 일뿐만 아니라 팀원의 인정과 피드백도 중요하다는 사실을 인정할 필요가 있습니다.<br><br>통솔자는 에너지가 넘치며 위대한 사람이라는 분위기를 풍기곤 합니다. 그러나 자신의 위상은 자신뿐만 아니라 주변 사람들 덕분이기도 하다는 사실을 기억해야 하며, 자신을 돕는 사람들의 기여를 인정하고 남의 욕구와 감정에 주의를 기울일 필요가 있습니다. 처음에는 다른 사람의 감정을 고려하기 위한 노력이 필요하겠지만, 일단 공감 능력을 확보한다면 자신의 강점을 활용해 의미 있고 만족스러운 인간관계를 구축하는 동시에 값진 성공을 쟁취할 수 있을 것입니다.<br><br><br><br><br>';
			    	   mbtiResultElement.style.color = '#88619a';
			    	   mbtiImageElement.src = 'https://www.16personalities.com/static/images/personality-types/headers/analysts_Commander_ENTJ_personality_header.svg';
			           break;
			       default:
			    	   break;
			   }
		    document.getElementById('result').style.display = 'block';
		  });

		// 초기 그룹 표시
		showGroup(currentGroupIndex);
		
		// 스크롤
		function scrollToTop() {
		     window.scrollTo({
		         top: 0,
		         behavior: 'smooth'
		     });
		}
		document.getElementById('prevButton').addEventListener('click', scrollToTop);
		document.getElementById('nextButton').addEventListener('click', scrollToTop);
		document.getElementById('resultButton').addEventListener('click', scrollToTop);
        var radioButtons = document.querySelectorAll('.question-group input[type="radio"]');
        var progressElement = document.getElementById('progress');
        var progressBar = document.getElementById('progressBar');
        var totalQuestions = 20; // 전체 문항 수
        var progress = 0;
        radioButtons.forEach(function(radioButton) {
            radioButton.addEventListener('change', function() {
                // 라디오 버튼이 선택될 때마다 진행률 증가
                if (this.checked) {
                    progress++;
                }
                // 퍼센트 계산
                var percent = (progress / totalQuestions) * 100;
                // 진행률 업데이트 (소수점 이하 자리수 제거)
                progressElement.textContent = Math.round(percent) + '%';
                // 게이지 바 업데이트
                progressBar.style.width = percent + '%';
                // 문항 그룹의 높이의 5분의 1을 계산
                var questionGroupHeight = this.closest('.question-group').offsetHeight / 5;
                // 문항 그룹의 높이의 5분의 1만큼 아래로 스크롤
                window.scrollBy({ top: questionGroupHeight, behavior: 'smooth' });
            });
        });
		 
		// 초기화 함수
		function fnInit() {
			$('#result').hide(); // 페이지 로딩 시 'result'을 숨기도록 설정
		}
		
		// 페이지 로딩 시 초기화 함수 호출
		$(function() {
			fnInit();
		});
	</script>

</body>
</html>