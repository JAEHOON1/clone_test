<%@ page contentType="text/html; charset=UTF-8" %> 
 
<%@ include file = "./ssi.jsp"  %>
 
<%
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
String category_title = categoryVO.getTitle();
 
int countByCategory = pds4Proc.countByCategory(categoryno);
%>
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
 
<DIV class='aside_menu'>
  <ASIDE style='float: left;'>게시판＞<%=category_title %>＞자료 삭제</ASIDE> 
  <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>'>앨범형</A> <span class='menu_divide'> |</span>
    <A href='./list_read.jsp'>펼쳐보기</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>
 
<FORM name='frm' method='POST' action='./delete_category_proc.jsp'>
  <input type='hidden' name='categoryno' value='<%=categoryno %>'>
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
  <input type='hidden' name='nowPage' value='<%=nowPage %>'>
 
  <fieldset class='fieldset_no_line'>
    <ul>
      <li class='li_center'>
        <span class='span_alert'>'<%=category_title %>' 게시판에 등록된 글수: <%=countByCategory %> 건</span>
      </li>     
      <li class='li_none' style='text-align: center; font-size: 1.2em;'>
        <span class='span_warning'>기존에 등록된 글과 파일은 삭제되면 복구 할 수 없습니다.</span>
      </li>    
      <li class='li_center'>
        <button type="submit">삭제 진행</button>
        <button type="button" onclick="history.back()">삭제 취소</button>
      </li>      
    </ul>
  </fieldset>
 
</FORM>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html> 