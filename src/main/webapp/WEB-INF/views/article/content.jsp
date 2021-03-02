<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jstl.jspf" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<%@ include file="/WEB-INF/include/commonCss.jspf" %>
<%@ include file="/WEB-INF/include/headerCss.jspf" %>

<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- jquery.form.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>

<style>
.wrapper {
	min-height: calc(100vh - 62px);
}
.container {
	padding-top: 40px;
}
.article {
	display: flex;
	justify-content: center;
}
.article__content {
	max-height: 500px;
}
.article__content--image {
	background-color: black;
	width: 450px;
	display: flex;
	justify-content: center;
	align-content: center;
	padding: 20px;
}
.article__content--description {
	width: 300px;
	border: 1px solid black;
}
.article__image {
	max-width: 100%;
	object-fit: contain;
}
.article__writer-figure {
	display: inline-block;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	overflow: hidden;
	margin: 0 10px;
}
.article__writer-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.article__header {
	height: 60px;
	display: flex;
	align-items: center;
	border-bottom: 1px solid gray;
}
.article__text {
	padding: 10px;
}
.comment {
	box-sizing: border-box;
	display: flex;
	vertical-align: top;
}
.comment__content {
	display: inline-block;
	width: calc(100% - 70px);
}
.comment__text {
	overflow: normal;
}
.article__text-container {
	height: calc(100% - 60px - 60px);
	overflow: auto;
}
.comment-write {
	height: 60px;
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="wrapper">
    <div class="container">
    	<div class="row article">
    		<div class="col-1 article__content article__content--image">
    			<img src = "<c:url value = '/resources/image/article/test3.jpg' />" alt="" class="article__image"/>
    		</div>
    		<div class="col-1 article__content article__content--description">
    			<div class="article__header">
    				<figure class="article__writer-figure">
    					<img src="<c:url value = '/image/profile/${article.imgPath}/'/>" alt="" class="article__writer-img"> 
    				</figure>
    				${article.writerId}
    			</div>
    			<div class="article__text-container">
	   				<div class="article__text">
		   				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem dolor earum id eum amet quo ullam hic velit accusantium nobis perspiciatis ducimus error dicta nam veniam esse laboriosam fugit corporis.
		   				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius odio nam est at magnam laboriosam velit adipisci praesentium obcaecati ipsam facere distinctio quisquam aliquam eum sequi facilis cumque. Eaque aliquam totam assumenda sint deleniti cumque delectus numquam placeat recusandae consequuntur minima omnis unde modi sequi natus saepe illum beatae architecto nesciunt praesentium autem consequatur illo provident commodi ratione eius itaque neque vero officia excepturi id accusamus sit minus iste ex quasi dignissimos? Debitis beatae eius adipisci quos molestias reprehenderit quis error aliquid tenetur autem fugit officiis magni sint enim magnam suscipit sapiente nisi aut expedita nesciunt minus accusamus explicabo omnis totam aperiam sed rem perferendis praesentium amet velit. Provident ducimus neque quia accusantium repellendus accusamus natus aliquam repudiandae dolorem iure! Aliquam quam aliquid. Animi voluptatum inventore laboriosam nulla aspernatur tempore sint saepe labore esse ullam veritatis excepturi maxime porro blanditiis non. Officia ea itaque doloremque pariatur dolorum quis eaque natus iste ad veniam accusantium tempore consectetur voluptates velit saepe recusandae aut quidem illo at id! Incidunt autem ab omnis quos pariatur commodi illo reprehenderit totam sequi asperiores non provident deleniti cumque assumenda tenetur voluptatibus minus sed necessitatibus eum impedit. Nihil dolor similique blanditiis alias consequatur itaque neque eos id impedit nisi tempora fugit ea debitis asperiores praesentium autem quos accusantium recusandae non quis modi sapiente maiores enim libero ipsam vitae pariatur dolorem maxime voluptatum iure cumque nobis minima quaerat vel veniam illo aperiam labore soluta sunt doloremque. Deserunt cumque quia sint iusto accusantium cum sequi nisi consequuntur hic eaque ut molestiae adipisci iure iste ducimus impedit numquam magnam labore nihil dolores nam quae dignissimos id veniam quos pariatur eos at voluptates perferendis ipsam officia temporibus a nostrum. Sed temporibus officia doloribus quae delectus excepturi numquam assumenda exercitationem sequi hic dicta dolores minima minus est ut facere laborum! Rem odio quam blanditiis nulla doloremque vitae cumque quo illo odit facilis praesentium ex omnis porro nobis repellendus mollitia reiciendis error aliquam esse non provident accusamus hic incidunt earum numquam culpa voluptate expedita. Voluptatibus officiis dolorem reprehenderit cumque id aperiam veritatis veniam sunt temporibus doloremque placeat eaque dicta ex praesentium accusamus illum labore! Atque est eveniet magnam ullam provident modi ipsam hic maiores et dolore nemo sapiente praesentium culpa. Suscipit debitis reiciendis assumenda iusto itaque dolores quibusdam nostrum nisi id dolorum natus perferendis. Eius illum atque cum. Inventore blanditiis laboriosam repudiandae nisi nulla officiis quis cumque possimus maiores ipsum omnis dicta molestiae qui placeat quos. Autem cupiditate quaerat quia suscipit magnam sint id corporis totam numquam molestias ea possimus quis et voluptas architecto. A eveniet doloremque facilis numquam sit maiores placeat beatae esse similique vero commodi dolore consectetur fuga aperiam odit sequi id cupiditate fugit facere ratione vel saepe dignissimos ea iure officia. Provident illum aut ea dolore possimus placeat incidunt alias cumque velit distinctio laborum debitis amet blanditiis. Sunt fugiat dolore provident quae facere voluptatibus perspiciatis totam asperiores libero delectus iusto eos voluptate beatae id consequuntur accusamus in odio rerum explicabo atque impedit quasi eveniet blanditiis doloremque veritatis quidem aliquid sed nobis!
	   				</div>
	   				
	   				<!-- 작업하실 영역 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
	   				
	   				<div class="comments">
	   					<!-- 작성된 댓글이 보여지는 영역 -->
	   					<div class="comment">
	   						<figure class="article__writer-figure">
		    					<img src="<c:url value = '/image/profile/${"imgPath"}/'/>" alt="" class="article__writer-img"> 
		    				</figure>
		    				<div class="comment__content">
		    				${article.writerId}
	  						<p class="comment__text">
	  						${comment.content}
	  						</p>
	   						${comment.writeDate}
	   						</div>
	   					</div>
	   				</div>
   				</div>
   				<div class="comment-write">
   					<!-- 댓글을 작성하는 영역 -->
   					<input type="text" />
   					<button>작성</button>
   				</div>
   					
   			</div>
    	</div>
    	<hr>
    </div>    
</div>
</body>
</html>