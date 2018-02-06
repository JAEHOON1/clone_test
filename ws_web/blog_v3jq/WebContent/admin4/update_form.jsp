<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<%
int admin4no = Integer.parseInt(request.getParameter("admin4no"));
 
Admin4VO adminVO = adminProc.read(admin4no);
 
String email = adminVO.getEmail();
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 정보 변경</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
 
  <DIV class='aside_menu'>
    <ASIDE style='float: left;'>관리자 > 목록 > 관리자 정보 변경</ASIDE> 
    <ASIDE style='float: right;'>
    </ASIDE> 
    <DIV class='menu_line' style='clear: both;'></DIV>
  </DIV>
 
<FORM name='frm' method='POST' action='./update_proc.jsp'>
  <input type='hidden' name='admin4no' value='<%=admin4no %>'>    
        
  <fieldset class='fieldset_no_line'>
    <ul>
      <li class='li_none'>
        <label class='label_basic'  style='width: 20%;' for='email'>이메일</label>
        <input type='email' name='email' id='email' required="required" value='<%=email %>' style='width: 70%;'>
      </li>
      <li class='li_right'>
        <button type="submit">변경 적용</button>
        <button type='button' id='close' onclick="window.close();">닫기</button> 
      </li>
    </ul>
  </fieldset>
</FORM>
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
 
</body>
</html>