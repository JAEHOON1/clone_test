<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
<body>
<DIV class='container'>
<DIV class='content'>
 
<DIV class='title' style='width: 50%;'>자격증 안내</DIV>
 
  <UL>
    <LI>정보처리 관련 자격</LI>
    <LI>SQL 개발자</LI>
    <LI>리눅스 마스터</LI>
    <LI>IT-PMP or PMP 국제 자격증</LI>
  </UL>
  <br><br>
  <form name='frm' method='post' action='./notice_cookie.jsp'>
    <label>
      <input type='checkbox' name='windowOpenCheck' onclick="this.form.submit()">
      1일간 창 열지 않기
    </label>
    『<A href='javascript: window.close();'>닫기</A>』
  </form>
 
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
 
</html> 
 