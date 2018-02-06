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
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
<DIV class='title'>쿠키 기록</DIV>
 
<%
Cookie ck_email = new Cookie("email", "test1@mail.com");
ck_email.setMaxAge(30); // 30 초
response.addCookie(ck_email); // 쿠키 전송
%>
쿠키를 기록 했습니다. <br><br>
【<A href='./read.jsp'>쿠키 읽기</A> 】
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>
 
</html> 