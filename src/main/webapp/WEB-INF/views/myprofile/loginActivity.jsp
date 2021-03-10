<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 활동</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/d3d6f2df1f.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/spring/resources/css/mainpage/main.css?ver=1.0">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	min-width: 630px;
	min-height: 1200px;
}

a {
	color: black;
	text-decoration: none;
}

hr {
	background-color: LightGray;
}

main {
	height: 100%;
	width: 44%;
	margin: 100px 28% 40px;
	background-color: white;
	border: 1px solid gainsboro;
	display: grid;
	grid-template-columns: 1fr 3fr;
}

main>div {
	border: 1px solid gainsboro;
}

.main1>div {
	text-align: center;
	font-size: 17px;
	border-left: white solid 2px;
}

.main1>div>a {
	width: 100%;
	padding: 20px 20px 20px 18px;
	display: inline-block;
}

.main1>div:hover {
	border-left-color: gainsboro;
}

footer {
	display: grid;
	grid-template-columns: repeat(12, 1fr);
	font-size: 12px;
	text-align: center;
	height: 100px;
	margin: 0 15%;
}

input:focus {
	outline: none;
}

input[type=text]:focus {
	text-align: start;
}

.copyright {
	color: gainsboro;
}

.menu3 {
	border-left-color: black !important;
}

.profile {
	grid-column: 1/2 span;
	padding: 10px;
}

.profile p:nth-child(1) {
	font-size: 20px;
}

.profile p:nth-child(2) {
	color: #3897f0;
	font-size: 13px;
}

.liner:nth-child(1n) {
	display: inline-block;
}

.profile div {
	display: inline-block;
	height: 40px;
}

.a_check {
	height: 100%;
}

.table {
	display: inline-block;
}

.login_form {
	margin-top: 16px;
	margin-right: 64px;
	margin-left: 64px;
	margin-bottom: 16px;
}

.login_form2 {
	margin-top: 16px;
	margin-right: 64px;
	margin-left: 64px;
	margin-bottom: 16px;
}

</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
</head>
<body>
	<div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container justify-content-center">
                <div class="d-flex flex-row justify-content-between align-items-center col-9">
                    <a class="navbar-brand" href="#">
                        <img src="/spring/resources/css/mainpage/images/ig-logo.png" alt="" loading="lazy">
                    </a>
                    <div>
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
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
                            <li class="list-inline-item ml-2 align-middle">
                                <a href="#" class="link-menu">
                                    <div
                                        class="rounded-circle overflow-hidden d-flex justify-content-center align-items-center border topbar-profile-photo">
                                        <img src="/spring/resources/css/mainpage/images/profile-6.jpg" alt="..."
                                            style="transform: scale(1.5); width: 100%; position: absolute; left: 0;">
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>

	<main>
	<div class="main1">
		<div class="menu1">
			<a href="/spring/account/edit">프로필 편집</a>
		</div>
		<div class="menu2">
			<a href="/spring/account/checkpw">비밀번호 변경</a>
		</div>
		<div class="menu3">
			<a href="/spring/account/loginActivity">로그인 활동</a>
		</div>
	</div> 
	<div class="main2">
	<form id="ipForm" action="<c:url value='/account/loginActivity' />" method="POST">
		<div class="login_form">
			<h2 class="">로그인 활동</h2>
		</div>
		<div class="login_form2">
			<h4 id="login_place">로그인한 위치</h4>
			<br>
				<div id="map" style="width:500px;height:300px;"></div>
				<br>
				<div>
					<c:forEach items="${loginActivity }" var="login" >
						<br>
						<div><i class="fas fa-map-marker"></i></div>
						<div class="test">
				        ${login.location }
				        <fmt:formatDate value="${login.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>   
				        <span class="ip">${login.ip }</span> 
				        <br><br>
				        </div>
				        <hr>
			    	</c:forEach>
				</div>
		</div>
	</form>
	</div>
	</main>
	<footer>
		<div>
			<a href="#">INSTARGRAM 정보</a>
		</div>
		<div>
			<a href="#">지원</a>
		</div>
		<div>
			<a href="#">홍보 센터</a>
		</div>
		<div>
			<a href="#">API</a>
		</div>
		<div>
			<a href="#">채용 정보</a>
		</div>

		<div>
			<a href="#">개인정보처리방침</a>
		</div>
		<div>
			<a href="#">약관</a>
		</div>
		<div>
			<a href="#">디렉터리</a>
		</div>
		<div>
			<a href="#">프로필</a>
		</div>
		<div>
			<a href="#">해시태그</a>
		</div>

		<div>
			<a href="#">언어</a>
		</div>
		<div>
			<p class="copyright">©️2021 INSTARGRAM</p>
		</div>
	</footer>
	
<script src = "<c:url value='/resources/config/config.js' />"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
//Create the script tag, set the appropriate attributes
var script = document.createElement('script');
script.src = 'https://maps.googleapis.com/maps/api/js?key='+ config.MY_KEY +'&callback=initMap';
script.async = true;

// Attach your callback function to the `window` object
window.initMap = function() {
  // JS API is loaded and available
};

// Append the 'script' element to 'head'
document.head.appendChild(script);

window.onload = function() {
	if (!navigator.geolocation) {
		document.getElementById('login_place').innerHTML = '위치 정보 지원 안됨';
		return;
	}
	navigator.geolocation.getCurrentPosition(function(position) {
		var lat = position.coords.latitude;
		var lon = position.coords.longitude;
		
		console.log('위도 : ' + lat);
		console.log('경도 : ' + lon);
		
		var initLoc = new google.maps.LatLng(lat,lon);
		console.log(initLoc);
		
		var map = new google.maps.Map(document.getElementById('map'),{
			zoom:6,
            mapTypeId : google.maps.MapTypeId.ROADMAP,
            gestureHandling: "none",
            zoomControl: false,
            fullscreenControl: false,
            streetViewControl: false,
            mapTypeControl: false,
		});
         map.setCenter(initLoc);
         var marker = new google.maps.Marker({position:initLoc,map:map,title:'현재위치'})
	});
};


$(".test").click(function() {

	$.get( "https://api.ipify.org?format=json", function(login) {
    });
	
	function showLocationOnMap (location) {
		  var map;
	      map = new google.maps.Map(document.getElementById('map'), {
	          center: {lat: Number(location.latitude), lng: Number(location.longitude)},
	          zoom: 6,
	          gestureHandling: "none",
	          zoomControl: false,
	          fullscreenControl: false,
	          streetViewControl: false,
	          mapTypeControl: false,
	      });
	      var marker = new google.maps.Marker({
	          position: {lat: Number(location.latitude), lng: Number(location.longitude)},
	          map: map,
	          title: "Public IP:"+location.ipAddress+" @ "+location.city
	      });      
	}
	
	$.ajax({
		  url: "GeoIP",
		  type: "POST",
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		  data: $.param( {ipAddress : $(this).children(".ip").text()} ),
		  success: function(data) {
			  if (data.ipAddress != null) {
				  console.log ("Success:"+data.ipAddress);    
			    	showLocationOnMap(data);  	
			  }
		  },
		  error: function(err) {
		      console.log(err);
		  },
	  });
	
});
</script>
</body>
</html>