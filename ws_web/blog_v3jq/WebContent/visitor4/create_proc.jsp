<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>

  <fieldset class='fieldset_basic'>
    <legend class='legend_basic'>방명록 등록</legend>
      <ul>
      <%
      String content = request.getParameter("content");
      String rname = request.getParameter("rname");
      String passwd = request.getParameter("passwd");
      String email = request.getParameter("email");
      String home = request.getParameter("home");
       
      VisitorVO visitorVO = new VisitorVO();
      visitorVO.setContent(content);
      visitorVO.setRname(rname);
      visitorVO.setPasswd(passwd);
      visitorVO.setEmail(email);
      visitorVO.setHome(home);
      
      int count = visitorProc.insert(visitorVO); // 처리된 레코드 갯수
      
      if (count == 1) {
        // out.println("등록 성공: " + count);
        response.sendRedirect("./list.jsp"); // 주소 자동 이동
      } else {
      %>  
        <li class='li_none'>방명록 등록에 실패했습니다.</li>
        <li class='li_none'>다시한번 시도해주세요.</li>
      <%  
      }
      %>
      </ul>
  </fieldset>
  
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./create_form.jsp'">계속 등록</button>
    <button type='button' onclick="location.href='./list.jsp'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>
 
 