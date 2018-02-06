<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<%
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
String category_title = categoryVO.getTitle();
%>
 
<%
ArrayList<Pds4VO> list = pds4Proc.list_category(categoryno, col, word, nowPage, recordPerPage);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
  <DIV class='aside_menu'>
    <ASIDE style='float: left;'>게시판＞<%=category_title %>＞목록</ASIDE> 
 
    <ASIDE style='float: right;'>
      <FORM name='frm' method='GET' action='./list.jsp'>
        <input type='hidden' name='categoryno' value='<%=categoryno %>'>
 
        <SELECT name='col' onchange="total_list(this.form);">
          <OPTION value='rname' <%=(col.equals("rname"))?"selected='selected'":"" %>>이름</OPTION>
          <OPTION value='title' <%=(col.equals("title"))?"selected='selected'":"" %>>제목</OPTION>
          <OPTION value='content' <%=(col.equals("content"))?"selected='selected'":"" %>>내용</OPTION>
          <OPTION value='title_content' <%=(col.equals("title_content"))?"selected='selected'":"" %>>제목+내용</OPTION>
        </SELECT>
        <INPUT type='text' name='word' value='<%=word %>' placeholder="검색어">
        <BUTTON type='submit'>검색</BUTTON>
      </FORM> 
    </ASIDE>
    
    <ASIDE style='float: right;'>
      <A href='./create_form.jsp?categoryno=<%=categoryno %>'>등록</A>  
    </ASIDE> 
    
    <ASIDE style='float: right;'>
      <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>&recordPerPage=<%=recordPerPage %>'>목록형</A> <span class='menu_divide'> |</span> 
      <A href='./list.jsp?categoryno=<%=categoryno %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>&recordPerPage=<%=recordPerPage %>'>앨범형</A> <span class='menu_divide'> |</span>
      <%
      if (list.size() > 0) {
      %>
      <A href='./list_read.jsp?categoryno=<%=categoryno %>&col=<%=col%>&word=<%=word%>&nowPage=1&recordPerPage=1'>펼쳐보기</A> <span class='menu_divide'> |</span>
      <%
      } else {
      %>
      <A href='./list_read_error.jsp?categoryno=<%=categoryno %>&col=<%=col%>&word=<%=word%>&nowPage=1&recordPerPage=1'>펼쳐보기</A> <span class='menu_divide'> |</span>
      <%  
      }
      %>
      <A href='./list.jsp?categoryno=<%=categoryno %>'>전체 목록</A> <span class='menu_divide'> |</span>
       
    </ASIDE>     
        
 
    
    <DIV class='menu_line' style='clear: both;'></DIV>
  </DIV>
 
  <DIV class='message'>
    <span class='span_info'>등록된 글이 없습니다.</span><br>
  </DIV>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>
 
 
 
 
 