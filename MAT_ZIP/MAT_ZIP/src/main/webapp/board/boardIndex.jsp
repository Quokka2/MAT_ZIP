<%@page import="com.mat.zip.mzMember.model.MzMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛.zip 회원커뮤니티</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#result").empty();
        $.ajax({
            url : "allPost",
            success : function(data) {
            	$('#result').append(data)
            },
            error:function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            } // error
        }); // ajax
	}); // $ 
</script>
	<h1>맛.zip 회원 커뮤니티</h1>
	<br>
	
	<%-- 세션에 저장된 회원 정보 가져오기 --%>
	<% String user_id = (String) session.getAttribute("user_id"); %>
	<%= user_id != null ? user_id + " 님이 로그인 중입니다." : "" %>
	
	<% if (user_id == null) { %>
		! 로그인이 필요합니다. ! 
		<a href="../mz_member/login" class="order_online">
		      LOGIN
		</a>
	
	<% } %>
	
	<br>
	<br>
	<a href="boardReview.jsp">
		<button style="background: pink;">리뷰게시판</button>
	</a>
	<a href="boardPhoto.jsp">
		<button style="background: pink;">맛집 사진첩</button>
	</a>
	<a href="boardPost.jsp">
		<button style="background: pink;">자유게시판</button>
	</a>
	<br>
	
	<hr color=green>
	<div id="result" style="background: #ffd9f7"></div>
	<a href="../index.jsp">
		<button style="background: grey;">index로 돌아가기</button>
	</a>
</body>
</html>