<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
       function sendIt() {
        var email = document.f.mail.value;
        var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
          var jumin1 = document.f.personnumber1.value.substr(0,6);
          var jumin2 = document.f.personnumber2.value.substr(0,1);
          var yy     = jumin1.substr(0,2);        // 년도
          var mm     = jumin1.substr(2,2);        // 월
          var dd     = jumin1.substr(4,2);        // 일
          var genda  = jumin2.substr(0,1);        // 성별
          var msg, ss, cc;
          //정규표현식
 
        //아이디 입력여부 검사
        if (f.id.value == "") {
            alert("아이디를 입력하지 않았습니다.")
            f.id.focus();
            return false;
        }
        //아이디 유효성 검사 (영문소문자, 숫자만 허용)
       for (var i = 0; i < document.f.id.value.length; i++) {
            ch = document.f.id.value.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
                document.f.id.focus();
                document.f.id.select();
                return false;
            }
        }
        //아이디에 공백 사용하지 않기
        if (document.f.id.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.")
            document.f.id.focus();
            document.f.id.select()
            return false;
        }
        //아이디 길이 체크 (4~12자)
       if (document.f.id.value.length<4 || document.f.id.value.length>12) {
            alert("아이디를 4~12자까지 입력해주세요.")
            document.f.id.focus();
            document.f.id.select();
            return false;
        }
           //비밀번호 입력여부 체크
        if (document.f.password.value == "") {
            alert("비밀번호를 입력하지 않았습니다.")
            document.f.password.focus();
            return false;
        }
        if (f.password.value == f.id.value) {
            alert("아이디와 비밀번호가 같습니다.")
            document.f.password.focus();
            return false;
        }
        //비밀번호 길이 체크(4~8자 까지 허용)
        if (document.f.password.value.length<4 || document.f.password.value.length>12) {
            alert("비밀번호를 4~12자까지 입력해주세요.")
            document.f.password.focus();
            document.f.password.select();
            return false;
        }
        //비밀번호와 비밀번호 확인 일치여부 체크
        if (document.f.password.value != document.f.password1.value) {
            alert("비밀번호가 일치하지 않습니다")
            document.f.password1.value = ""
            document.f.password1.focus();
            return false;
        }
 
        if (document.f.mail.value == "") {
            alert("이메일을 입력하지 않았습니다.")
            document.mail.focus();
            return false;
        }
        if (regex.test(mail) === false) {
            alert("잘못된 이메일 형식입니다.");
            document.f.mail.value=""
            document.f.mail.focus();
            return false;
        }
 
        for (var i = 0; i < document.f.mail.value.length; i++) {
            chm = document.f.mail.value.charAt(i)
            if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')&&!(chm >= 'A' && chm <= 'Z')) {
                alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
                document.f.mail.focus();
                document.f.mail.select();
                return false;
            }
        }
 
        if (document.f.name.value == "") {
            alert("이름을 입력하지 않았습니다.")
            document.f.name.focus();
            return false;
        }
 
        if(document.f.name.value.length<2){
            alert("이름을 2자 이상 입력해주십시오.")
            document.f.name.focus();
            return false;
        }
 
        if (document.f.personnumber1.value == "") {
            alert("주민번호를 입력하지 않았습니다.");
            document.f.personnumber1.focus();
            return false;
        }
 
        if (document.f.personnumber2.value == "") {
            alert("주민번호를 입력하지 않았습니다.");
            document.f.personnumber2.focus();
            return false;
        }
 
        if (document.f.personnumber1.value.length<6||document.f.personnumber1.value.length>6) {
            alert("주민번호 길이가 맞지 않습니다.");
            document.f.personnumber1.value = "";
            document.f.personnumber1.focus();
            return false;
        }
 
        if (document.f.personnumber2.value.length<7||document.f.personnumber2.value.length>7) {
            alert("주민번호 길이가 맞지 않습니다.");
            document.f.personnumber2.value = "";
            document.f.personnumber2.focus();
            return false;
        }
    
 
          // 숫자가 아닌 것을 입력한 경우
        if (!isNumeric(jumin1)) {
            alert("주민번호는 숫자로 입력하세요.");
            document.f.personnumber1.value = "";
            document.f.personnumber1.focus();
            return false;
        }
          
          // 첫번째 자료에서 연월일(YYMMDD) 형식 중 기본 구성 검사
        if (yy < "00" 
              || yy > "99" 
              || mm < "01" 
              || mm > "12" 
              || dd < "01" 
              || dd > "31") {
            alert("주민등록번호다시 입력하세요.");
            document.f.personnumber1.value = "";
                document.f.personnumber1.focus();
            return false;
        }
          
          // 숫자가 아닌 것을 입력한 경우
        if (!isNumeric(jumin2)) {
            alert("주민등록번호는 숫자로 입력하세요.");
            document.f.personnumber2.value = "";
                document.f.personnumber2.focus();
            return false;
        }
          
        // 성별부분이 1 ~ 4 가 아닌 경우
        if (genda < "1" || genda > "4") {
            alert("주민등록번호 다시 입력하세요.");
            document.f.personnumber2.value = "";
            document.f.personnumber2.focus();
            return false;
        }
        
        f.birthyy.value ="19" +jumin1.charAt(0) + jumin1.charAt(1);
        f.birthmm.value = parseInt(jumin1.charAt(2))+parseInt(jumin1.charAt(3));
        f.birthday.value = parseInt(jumin1.charAt(4)+jumin1.charAt(5));
 
        if(document.f.hobby[0].checked==false && 
           document.f.hobby[1].checked==false && 
           document.f.hobby[2].checked==false && 
           document.f.hobby[3].checked==false && 
           document.f.hobby[4].checked==false){
            alert("관심분야를 체크해 주세요");
            return false;
        }
        
        if(document.f.intro.value== ""){
              alert("자기소개를 입력해주십시오.");
              document.f.intro.focus();
              return false;
        }
 
        if(document.f.intro.length>100){
              alert("자기소개는 100자 이내입니다.");
              document.f.intro.focus();
              return false;
        }
 
    }
    function isNumeric(s) { 
          for (i=0; i<s.length; i++) { 
            c = s.substr(i, 1); 
            if (c < "0" || c > "9") return false; 
          } 
          return true; 
    }
         
    function isSSN(s1, s2) {
          n = 2;
          sum = 0;
          for (i=0; i<s1.length; i++)
            sum += parseInt(s1.substr(i, 1)) * n++;
          for (i=0; i<s2.length-1; i++) {
            sum += parseInt(s2.substr(i, 1)) * n++;
            if (n == 10) n = 2;
        };
          
          c = 11 - sum % 11;
          if (c == 11) c = 1;
          if (c == 10) c = 0;
          if (c != parseInt(s2.substr(6, 1))) return false;
          else return true;
 
         document.f.submit();
    }
   </script>
</head>
<body>
<form name="f" action="./success" method="post" onsubmit="return sendIt();">
     <table align="center" border="1" bordercolor="skyblue">
         <tr>
             <td colspan="2" align="center" bgcolor="skyblue">
                 회원 기본 정보
             </td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink"> 아이디 :</td>
             <td> <input type="text" id="id" name="id" maxlength="8" size="8"> 4~8자의 영문 대소문자와 숫자로만 입력</td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink"> 비밀번호 : </td>
             <td><input type="password" id="password" name="password" maxlength="12" size="12"> 4~12자리의 영문 대소문자와 숫자로만 입력</td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink"> 비밀번호 확인 : </td>
             <td> <input type="password" id="password1" name="password1" maxlength="12" size="12"> </td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink"> E-mail</td>
             <td><input type="text" id="mail" name="mail" size="10"> @ 
                 <select>
                     <option>naver.com</option>
                     <option>google.com</option>
                     <option>daum.net</option>
                 </select> ex) id@mail.com</td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink"> 이름 : </td>
             <td><input type="text" id="name" name="name" size="7"></td>
         </tr>
         <tr>
             <td colspan="2" align="center" bgcolor="skyblue"> 개인 신상 정보 </td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink">주민등록번호 : </td>
             <td> <input type="text" id="personnumber1" name="personnumber1" maxlength="6" size="6"> - <input type="password" id="personnumber2" name="personnumber2" maxlength="7" size="7"> ex)123456-1234567</td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink">생일 : </td>
             <td><input type="text" id="birthyy" name="birthyy" size="5">년 
                 <select id="birthmm" name="birthmm" >
                     <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                 </select>월 
                 <select id="birthday" name="birthday">
                     <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>                
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>                    
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>                
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>            
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                 </select>일</td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink">관심분야 : </td>
             <td> <input type="checkbox" id="hobby" name="hobby" value="컴퓨터" checked="true"> 컴퓨터
                 <input type="checkbox" id="hobby" name="hobby" value="인터넷"> 인터넷
                 <input type="checkbox" id="hobby" name="hobby" value="여행"> 여행
                 <input type="checkbox" id="hobby" name="hobby" value="영화감상"> 영화감상
                 <input type="checkbox" id="hobby" name="hobby" value="음악감상"> 음악감상
             </td>
         </tr>
         <tr>
             <td align="center" bgcolor="pink">자기소개 : </td>
             <td><textarea cols="60" id="intro" name="intro"></textarea></td>
         </tr>
     </table>
     <center>
         <input type="submit" name="submit" value="회원가입">
        <input type="reset" name="reset" value="다시입력">
    </center>
</form>
 
</body>
</html>