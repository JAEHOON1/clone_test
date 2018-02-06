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
 
<DIV class='title'>쿠키 읽기</DIV>
 
<%
Cookie[] cookies = request.getCookies();
Cookie cookie = null;
String email = "";
 
for (int index=0; index < cookies.length; index++){
  cookie = cookies[index];
  if (cookie.getName().equals("email")){
    email = cookie.getValue();
  }
}
 
out.println("EMAIL: " + email);
%>
<br><br>
【<A href='./write.jsp'>쿠키 기록</A> 】
【<A href='./read.jsp'>쿠키 읽기</A> 】
【<A href='./delete.jsp'>쿠키 삭제</A> 】  
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>
 
</html> 
 