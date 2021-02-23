<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/include/commonCss.jspf" %>
<%@ include file="/WEB-INF/include/headerCss.jspf" %>

<style>
.summary {
	margin: 0 auto;
	width: 100%;
	display: flex;
	justify-content: space-around;
}
.summary__image-area {
	display: inline-block;
	width: 160px;
	height: 160px;
}
.summary__image {
	width: 100%;
	height: 100%;
	opacity: 0.15;
}
hr {
	width: 100%;
	min-width: 600px;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="wrapper">
    <div class="container">
    	<div class="summary">
    		<figure class="summary__image-area">
    			<img src="<c:url value='/resources/image/myprofile/blank.png' />" class="summary__image" />
    		</figure>
    		<div class="summary__content">
    			<div>
    				<span>${member.id}</span>
    				<button>프로필 편집</button>
    				<span>아이콘</span>
    			</div>
    			<div>
    				<span>게시물</span>
    				<span>팔로워</span>
    				<span>팔로우</span>
    			</div>
    			<div>
    				<span>${member.name}</span>
    			</div>
    		</div>
    		
    		
    	</div>
    	<hr>
    	
    	
    </div>    
</div>

</body>
</html>