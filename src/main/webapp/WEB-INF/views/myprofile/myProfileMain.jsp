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



<!-- bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- jquery.form.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>

<!-- font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<!-- css -->
<link rel="stylesheet" href="/spring/resources/css/profile/profile.css?ver=1.0"">


</head>
<body>

<header>
        <div class="container">
            <div class="profile">
                <div class="profile-image">
                    <figure class="summary__image-area" id="profileImageArea" 
		   					${member.signedIn && member.hasImg ? 'data-bs-toggle="modal" data-bs-target="#exampleModal"' : ''}>
		   					<img src="<c:url value = '/image/profile/${member.imgPath}/' />" class="summary__image" id="profileImg"/>
	    			</figure>
                </div>
                <div class="profile-user-settings">
                    <h1 class="profile-user-name">${member.id}</h1>
                    <button class="btn profile-edit-btn">Edit Profile</button>
                    <button class="btn profile-settings-btn" aria-label="Profile Settings"><i class="fas fa-cog" aria-hidden=""></i></button>
                </div>
                <div class="profile-stats">
                    <ul>
                        <li><span class="profile-stat-count">164</span> posts</li>
                        <li><span id="follow" class="profile-stat-count">${follow.followList.size()}follow</span></li>
                        <li><span id="follower" class="profile-stat-count">${follow.followerList.size()}follower</span></li>
                    </ul>
                </div>
                <div class="profile-bio">
                    <p><span class="profile-real-name">John Doe</span> Lorem ipsum dolor sit amet... 📷✈️🚞</p>
                </div>
                <c:if test="${member.id ne user }">
    				<c:if test="${myfollow.followCheck eq false}"><div style="float : right"><a href="/spring/follow/${member.id }">팔로우하기</a></div></c:if>
    				<c:if test="${myfollow.followCheck eq true}"><div style="float : right"><a href="/spring/ufollow/${member.id }">팔로우해제</a></div></c:if>
    			</c:if>
            </div>
<!--            End of Profile Section-->
        </div>
<!--        End of Container-->
    </header>
    <main>
        <div class="container">
            <div class="gallery">
                <div class="gallery-item" tabindex="0">
                    <img src="/spring/resources/image/mypost/hiking.jpg" alt="alt="Gallery-1" class="gallery-image" >
                    <div class="gallery-item-info">
                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i> 56</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i> 2</li>
                        </ul>
                    </div>
    
                </div>
                <div class="gallery-item" tabindex="0">
                    <img src="/spring/resources/image/mypost/hiking2.jpg" alt="alt="Gallery-1" class="gallery-image" >
                    <div class="gallery-item-info">
                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i> 56</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i> 2</li>
                        </ul>
                    </div>

                </div>
                <div class="gallery-item" tabindex="0">
                    <img src="/spring/resources/image/mypost/hiking3.jpg" alt="alt="Gallery-1" class="gallery-image" >
                    <div class="gallery-item-type">
                        <span class="visually-hidden">Gallery</span>
                        <i class="fas fa-clone" aria-hidden></i>
                    </div>
                    <div class="gallery-item-info">
                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i> 56</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i> 2</li>
                        </ul>
                    </div>
    
                </div>
                <div class="gallery-item" tabindex="0">
                    <img src="/spring/resources/image/mypost/hiking4.jpg" alt="alt="Gallery-1" class="gallery-image">
                    <div class="gallery-item-type">                   
                        <span class="visually-hidden">Video</span>
                        <i class="fas fa-video" aria-hidden></i>
                    </div>
                    <div class="gallery-item-info">
                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i> 56</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i> 2</li>
                        </ul>
                    </div>

                </div>
                <div class="gallery-item" tabindex="0">
                    <img src="/spring/resources/image/mypost/hiking5.jpg" alt="alt="Gallery-1" class="gallery-image" >
                    <div class="gallery-item-type">
                        <span class="visually-hidden">Gallery</span>
                        <i class="fas fa-clone" aria-hidden></i>
                    </div>
                    <div class="gallery-item-info">
                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i> 56</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i> 2</li>
                        </ul>
                    </div>
    
                </div>
                <div class="gallery-item" tabindex="0">
                    <img src="/spring/resources/image/mypost/hiking6.jpg" alt="alt="Gallery-1" class="gallery-image" >
                    <div class="gallery-item-info">
                        <ul>
                            <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden></i> 56</li>
                            <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden></i> 2</li>
                        </ul>
                    </div>

                </div>
            </div>
    <!--        End of Gallery-->
        </div>
        <div class="loader"></div>
    </main>





<div class="modal fade" id="followModal" role="dialog" data-backdrop="static">  
    <div class="modal-dialog">

      <!-- Modal content-->   
      <div class="modal-content">
      	  <div class="modal-header">
         	 <h4 class="modal-title" id="follow_title"></h4>
       	 </div>
      	  <div class="modal-body">
        	  <table class="modal_table" id="follow_table">
        	  </table>
        </div>
        	<div class="modal-footer" data-bs-dismiss="modal" id="followClose">닫기</div>
      	</div>
      	
    </div>
	</div>


	
	<script>
	
	var sessionId = "${user}";
	console.log(sessionId);
	
	var myFollowSeqId = [];
	var myFollowList = {
			  <c:forEach items="${myfollow.dtoFollowList}" var="item">
			  "${item.id}": {
			    name:"${item.name}",
			    img:"${item.imgPath}",
			    seqId:"${item.seqId}"
			  },
			  </c:forEach>
			}
	for(obj in myFollowList){
    	console.log(myFollowList[obj].seqId)
    	myFollowSeqId.push(myFollowList[obj].seqId);
    }
	
	var followlist = {
			  <c:forEach items="${follow.dtoFollowList}" var="item">
			  "${item.id}": {
				id:"${item.id}",
			    name:"${item.name}",
			    img:"${item.imgPath}",
			    seqId:"${item.seqId}"
			  },
			  </c:forEach>
			}
	for(obj in followlist){
    	console.log("팔로우" + followlist[obj].seqId)
    }
	
		//<c:forEach items="${follow.dtoFollowList}" var="item">
		//	followlist.push("${item}");
		//</c:forEach>
		//
	//	for (const [key, value] of Object.entries(followlist)) {
	//		  console.log('${key} : ${value}');
	//	}
		
		
		 $('#follow').on('click',function(){
		        $('#followModal').modal('show');  
		        $('#follow_title').text("팔로우");
		        $('#follow_table').html("");
		        for(obj in followlist){
		        	console.log(followlist[obj].name)
		        	var tmp = myFollowSeqId.includes(followlist[obj].seqId)
		        	if(sessionId == followlist[obj].id){
	        			tmp = true;
	        			console.log("boolean값 바뀜" + tmp);
	        		}
		        	if(!tmp){
		        		
		        		$('#follow_table').append("<tr><td>"+followlist[obj].name+"팔로우"+"</td></tr>");
		        	}else{
		        		$('#follow_table').append("<tr><td>"+followlist[obj].name+"</td></tr>");
		        	}
		        }
		        
		        
		   });
		 var followerlist = {
				  <c:forEach items="${follow.dtoFollowerList}" var="item">
				  "${item.id}": {
					id:"${item.id}",
				    name:"${item.name}",
				    img:"${item.imgPath}",
				    seqId:"${item.seqId}"
				  },
				  </c:forEach>
				}
		 for(obj in followerlist){
		    	console.log("팔로우" + followerlist[obj].seqId)
		    }
		 $('#follower').on('click',function(){
		        $('#followModal').modal('show');  
		        $('#follow_title').text("팔로워"); 
		        $('#follow_table').html("");
		        for(obj in followerlist){
		        	console.log("팔로워" + followerlist[obj].name)
		        	//$('#follow_table').append("<tr><td>"+followerlist[obj].name+"</td></tr>");
		        	var tmp2 = myFollowSeqId.includes(followerlist[obj].seqId)
		        	console.log(sessionId + "==" + followerlist[obj].id);
		        	if(sessionId == followerlist[obj].id){
	        			tmp2 = true;
	        			console.log("boolean값 바뀜" + tmp2);
	        		}
		        	
		        	if(!tmp2){
		        		$('#follow_table').append("<tr><td>"+followerlist[obj].name+"팔로우"+"</td></tr>");
		        	}else{
		        		$('#follow_table').append("<tr><td>"+followerlist[obj].name+"</td></tr>");
		        	}
		        }
		   });
		 
		 $('#followClose').on('click', function(){
			 $('#followModal').modal('hide');
		 });
	</script>





<c:if test="${member.signedIn}">
	<form method="POST" action="<c:url value='/image/profile' />" enctype="multipart/form-data" id="uploadForm">
		<input type="file" accept="image/jpeg, image/png" name="file" class="file-upload" />
		<input type="hidden" name="seqId" value="${member.seqId}" />
	</form>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				  	<h5 class="modal-title">프로필 사진 바꾸기</h5>
				</div>
				<div class="modal-body">
				  	<ul>
				  		<li class="profile-upload">사진 업로드</li>
				  		<li id="profileImgDelete">현재 사진 삭제</li>
				  	</ul>
				</div>
				<div class="modal-footer" data-bs-dismiss="modal" id="modalClose">취소</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script>
	var profileImageArea = document.getElementById('profileImageArea');
	var hasImg = ${member.hasImg};
	var prevImgPath = null;
	
	function setModal() {
		profileImageArea.setAttribute('data-bs-toggle', 'modal');
		profileImageArea.setAttribute('data-bs-target', '#exampleModal');
	}
	function removeModal() {
		profileImageArea.removeAttribute('data-bs-toggle');
		profileImageArea.removeAttribute('data-bs-target');
	}
	
	if (!hasImg) {
		$("#profileImageArea").on('click', function() {
			$('.file-upload').click();
		});
	}	

	$(".profile-upload").on('click', function(event) {
		$('.file-upload').click();
	});
	
	$(".file-upload").on('change', function() {
		$("#uploadForm").submit();
	});
	
	$('#uploadForm').ajaxForm({
		beforeSend: function() {
			prevImgPath = $('#profileImg').attr('src');
			$("#profileImg").attr("src", "<c:url value = '/image/profile/loading.gif/' />");
			$("#modalClose").click();
		},
		success: function(fileName, status, xhr) {
			switch (status) {
			case "nocontent" :
				$("#profileImg").attr("src", prevImgPath);
				break;
			case "success" :
				$("#profileImg").attr("src", "<c:url value = '/image/profile/' />" + fileName + "/");				
				$("#profileImageArea").off('click');
				$("#modalClose").click();
				setModal();
				break;
			}
		},
		error: function() {
			console.log("Upload Fail");
		}
	});
	
	$('#profileImgDelete').on('click', function() {
		$.ajax({
			type : "DELETE",
			url : "<c:url value='/image/profile' />",
			dataType : "text",
			data : "${member.seqId}",
			beforeSend: function() {
				$("#profileImg").attr("src", "<c:url value = '/image/profile/loading.gif/' />");
				$("#modalClose").click();
			},
			complete : function() {
				$("#profileImg").attr("src", "<c:url value = '/image/profile/blank.png/' />");
				$("#modalClose").click();
				$("#profileImageArea").on('click', function() {
					$('.file-upload').click();
				});
				removeModal();
			}
		})
	});
	

	
	</script>

</c:if>



</body>
</html>