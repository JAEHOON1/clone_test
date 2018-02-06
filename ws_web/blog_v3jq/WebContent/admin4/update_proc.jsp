<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<%
int admin4no = Integer.parseInt(request.getParameter("admin4no"));
String email = request.getParameter("email");
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
</head> 
<body>
<DIV class='container'>
<DIV class='content'>
 
<%
if (adminProc.update(admin4no, email) == 1){ 
%>
  <script type="text/javascript">
    opener.location.reload();
  </script>
  회원 정보를 변경했습니다.
<%  
}else{
%>
  회원 정보를 변경하지 못했습니다.<br><br>
  다시 시도해주세요.<br><br>
<%
}
%>
 
<DIV class='bottom_menu'>
  <button type='button' onclick="location.href='./update_form.jsp?admin4no=<%=admin4no %>'">새로운 이메일 주소로 재변경</button>
  <button type='button' onclick="window.close();">닫기</button>
</DIV>
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html> 