<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/d3d6f2df1f.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/spring/resources/js/errorPage.js"></script>

<link rel="stylesheet" href="/spring/resources/css/error/errorPage.css?ver=1.0">


</head>
<body>

	<script>
        function menuToggle(){
            const toggleMenu = document.querySelector('.menu');
            toggleMenu.classList.toggle('active');
        }
        
    </script>  
    
    <script type ="text/javascript">

		function onEnterSearch(){
		
		    var keyCode = window.event.keyCode;
		
		
		
		    if (keyCode == 13) { //엔테키 이면
		
		        myProfile.submit();
		
		    }
		
		} //onEnterLogin()

    </script>
	

    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container justify-content-center">
                <div class="d-flex flex-row justify-content-between align-items-center col-9">
                    <a class="navbar-brand" href="#">
                        <img src="/spring/resources/css/error/images/ig-logo.png" alt="" loading="lazy">
                    </a>
                    <div>
                        <form autocomplete="off" method="GET" action="/spring" name="myProfile" onkeydown="javascript:onEnterSearch();">
                            <div class="autocomplete" style="width:300px;">
                              <input id="myInput"  type="text" name="myProfile" placeholder="검색">
                              
                            </div>
                           
                            
                          </form>
                    </div>
                    <div class="d-flex flex-row">
                        <ul class="list-inline m-0">
                            <li class="list-inline-item">
                                <a href="#" class="link-menu">
                                    <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-house-door-fill"
                                        fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M6.5 10.995V14.5a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z" />
                                        <path fill-rule="evenodd"
                                            d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                    </svg>
                                </a>
                            </li>
                            <li class="list-inline-item ml-2">
                                <a href="#" class="link-menu">
                                    <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-inboxes"
                                        fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                            d="M.125 11.17A.5.5 0 0 1 .5 11H6a.5.5 0 0 1 .5.5 1.5 1.5 0 0 0 3 0 .5.5 0 0 1 .5-.5h5.5a.5.5 0 0 1 .496.562l-.39 3.124A1.5 1.5 0 0 1 14.117 16H1.883a1.5 1.5 0 0 1-1.489-1.314l-.39-3.124a.5.5 0 0 1 .121-.393zm.941.83l.32 2.562a.5.5 0 0 0 .497.438h12.234a.5.5 0 0 0 .496-.438l.32-2.562H10.45a2.5 2.5 0 0 1-4.9 0H1.066zM3.81.563A1.5 1.5 0 0 1 4.98 0h6.04a1.5 1.5 0 0 1 1.17.563l3.7 4.625a.5.5 0 0 1-.78.624l-3.7-4.624A.5.5 0 0 0 11.02 1H4.98a.5.5 0 0 0-.39.188L.89 5.812a.5.5 0 1 1-.78-.624L3.81.563z" />
                                        <path fill-rule="evenodd"
                                            d="M.125 5.17A.5.5 0 0 1 .5 5H6a.5.5 0 0 1 .5.5 1.5 1.5 0 0 0 3 0A.5.5 0 0 1 10 5h5.5a.5.5 0 0 1 .496.562l-.39 3.124A1.5 1.5 0 0 1 14.117 10H1.883A1.5 1.5 0 0 1 .394 8.686l-.39-3.124a.5.5 0 0 1 .121-.393zm.941.83l.32 2.562A.5.5 0 0 0 1.884 9h12.234a.5.5 0 0 0 .496-.438L14.933 6H10.45a2.5 2.5 0 0 1-4.9 0H1.066z" />
                                    </svg>
                                </a>
                            </li>
                            <li class="list-inline-item ml-2">
                                <a href="#" class="link-menu">
                                    <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-compass"
                                        fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                            d="M8 15.016a6.5 6.5 0 1 0 0-13 6.5 6.5 0 0 0 0 13zm0 1a7.5 7.5 0 1 0 0-15 7.5 7.5 0 0 0 0 15z" />
                                        <path
                                            d="M6 1a1 1 0 0 1 1-1h2a1 1 0 0 1 0 2H7a1 1 0 0 1-1-1zm.94 6.44l4.95-2.83-2.83 4.95-4.95 2.83 2.83-4.95z" />
                                    </svg>
                                </a>
                            </li>
                            <li class="list-inline-item ml-2">
                                <a href="#" class="link-menu">
                                    <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-heart"
                                        fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                            d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                    </svg>
                                </a>
                            </li>
                            <li class="list-inline-item ml-2 align-middle" id="action">
                               
                                <div class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border topbar-profile-photo" id="profile" onclick="menuToggle();">
                                    <img src="/spring/resources/css/error/images/profile-6.jpg" alt="..."
                                        style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                                </div>
                                <div class="menu">
                                    <div class='arrow'></div>
                                    <ul>
                                        <li><img src="/spring/resources/css/error/images/user-pic.png"><a href="#"></a>프로필</li>
                                        <li><img src="/spring/resources/css/error/images/save-button.png"><a href="#"></a>저장됨</li>
                                        <li><img src="/spring/resources/css/error/images/settings.png"><a href="#"></a>설정</li>
                                        <li><img src="/spring/resources/css/error/images/exchange.png"><a href="#"></a>계정 전환</li>
                                        <li><a href="#"></a>로그아웃</li>

                                    </ul>
                                </div>      
                                                            
                               
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <div class="warning-container">
        <div class="warning-box">
            <h2>죄송합니다. 페이지를 사용할 수 없습니다.</h2>
            <div class="error-message">클릭하신 링크가 잘못되었거나 페이지가 삭제되었습니다. <a href="http://localhost:8080/spring/"> Instagram으로 돌아가기.</a></div>
        </div>
    </div>
    <script>
        autocomplete(document.getElementById("myInput"), countries);

    </script>
    
</body>
</html>