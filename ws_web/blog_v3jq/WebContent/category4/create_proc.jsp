<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>

  <fieldset class='fieldset_basic'>
    <legend class='legend_basic'>카테고리 등록</legend>
      <ul>
      <%
      String title = request.getParameter("title");
      int seqno = Integer.parseInt(request.getParameter("seqno"));
      String visible = request.getParameter("visible");
      String ids = request.getParameter("ids");
       
      CategoryVO categoryVO = new CategoryVO();
      categoryVO.setTitle(title);
      categoryVO.setSeqno(seqno);
      categoryVO.setVisible(visible);
      categoryVO.setIds(ids);
      
      int count = categoryProc.insert(categoryVO); // 처리된 레코드 갯수
      
      if (count == 1) {
        response.sendRedirect("./list.jsp");
      %>
        <!-- <li class='li_none'>카테고리 등록에 성공했습니다.</li> -->
      <%  
      } else {
      %>  
        <li class='li_none'>카테고리 등록에 실패했습니다.</li>
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
 