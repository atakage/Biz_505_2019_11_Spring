<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js" 
			type="text/javascript"></script>
			
<script>
$(function(){

	$("#login").click(function(){
	   $("#mymodal").css("display","block")
	})
})
</script>			
<style>
	* {
	 marign:0;
	 padding:0;
	 box-sizing: border-box;
	}
	
	header {
		padding:2rem 1rem;
		margin-bottom: 2rem;
		background-color: #E9ECEF;
		border-radius: 0.3rem;
	}
	
	table {
		border-collapse: collapse;
		width: 95%;
		margin:0 auto;
		border :1px solid gray;
	}

	table.input tr, table.input td, table.input th {
		padding:10px;
	}


	table.list tr, table.list td, table.list th {
		border :1px solid gray;
		padding:5px;
	}
	
	/* 취소선 */
	.line-through {
		text-decoration: line-through;
	}
	
</style>
</head>
<body>
<header>
	<h3>TO DO LIST</h3>
</header>
<nav>
	<ul>
		<li id="login">login</li>
	</ul>	
</nav>
<section>
	<article id="input">
		<form method="POST">
			<table class="input">
				<tr>
					<td>
						<label for="tdFlag">중요도</label>
						<input id="tdFlag" type="number" value="1"
									min="1" max="5" name="td_flag">
					</td>

					<td>
						<input type="text" name="td_subject">
					</td>

					<td>
						<input type="checkbox" 
							id="tdAlaram" name="td_alarm" 
							value="Y">
						<label for="tdAlaram">알람설정</label>
					</td>
					
					<td>
						<button>저장</button>
					</td>
				
				</tr>
			</table>
		</form>
	</article>
	<article id="list">
		<c:if test="${!empty todoList}">
		<table class="list">
			<tr>
				<th>no</th>
				<th>Flag</th>
				<th>제목</th>
				<th>완성</th>
				<th>알람</th>
				<th>명령</th>
			</tr>
			<c:forEach items="${todoList}" var="todo" varStatus="index">
				<tr>
					<td>${index.count}</td>
					<td>${todo.td_flag}</td>
					<td <c:if test="${todo.td_complete == 'Y'}">class="line-through"</c:if> >${todo.td_subject}</td>
					<td>
						<a href="${rootPath}/complete?tdSeq=${todo.td_seq}&tdComplete=${todo.td_complete}">
						${todo.td_complete}
						</a>
					</td>
					<td>
					<a href="${rootPath}/alarm?tdSeq=${todo.td_seq}&tdAlarm=${todo.td_alarm}">
					${todo.td_alarm}
					</td>
					<td>
					<a href="${rootPath}/update?tdSeq=${todo.td_seq}">수정</a>
					<a href="${rootPath}/delete?tdSeq=${todo.td_seq}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
	</article>
</section>
<%@ include file="/WEB-INF/views/modal-box.jsp" %>
</body>
</html>