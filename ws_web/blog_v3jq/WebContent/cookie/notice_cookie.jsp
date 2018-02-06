<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
Cookie cookie = new Cookie("windowOpen", "close");
cookie.setMaxAge(20); // 20 초
response.addCookie(cookie);
%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
</head> 
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
<script type="text/javascript">window.close()</script>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>
 
</html> 