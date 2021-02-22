<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>login page</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="/spring/resources/signin/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/spring/resources/signin/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form method="post" action="/spring/">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>
    <label for="inputEmail" class="visually-hidden">Email address</label>
    <input type="text" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
    <label for="inputPassword" class="visually-hidden">Password</label>
    <input type="password" id="inputPassword" name="pw" class="form-control" placeholder="Password" required>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me" name="remember"> 자동로그인
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
  </form>
  <div style="margin-top: 10px">
  <button class="w-50 btn btn-sm">아이디 찾기</button>
  <button class="w-50 btn btn-sm">비밀번호 찾기</button>
  <button class="w-50 btn btn-sm">회원가입</button>
  
  </div>
  
</main>

<script type="text/javascript"> 

</script>
    
  </body>
</html>