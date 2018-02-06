<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
String windowOpen = "open";
 
Cookie[] cookies = request.getCookies(); // 모든 쿠키 추출
Cookie cookie = null;
 
if (cookies != null){
  for (int i=0; i < cookies.length; i++){
    cookie = cookies[i]; // 하나의 쿠키 추출
    if (cookie.getName().equals("windowOpen")){ // 쿠키 이름 비교
      windowOpen = cookie.getValue(); // 쿠키 값 "close" 추출
    }
  }
}
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/javascript">
window.onload = function(){
  if ('<%=windowOpen %>' == 'open'){
    openNotice();
  }
}
 
function openNotice(){
  var url = './notice.jsp';
  var win = window.open(url, '공지 사항', 'width=500px, height=400px');
  
  var x = (screen.width - 500) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}
</script>
</head> 
 
 
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
 
  2016 자격증 취득 안내<br><br>
  2016년 새해를 맞아 자격증 취득을 추천합니다.<br><br>
  【<A href='javascript: openNotice();'>자격증 취득 정보 조회</A>】
 
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>
 
 
</html> 