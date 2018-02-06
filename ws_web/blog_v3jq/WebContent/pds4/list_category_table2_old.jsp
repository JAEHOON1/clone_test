<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<%
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
String category_title = categoryVO.getTitle();
%>

<!DOCTYPE html>  
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>게시판</title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 

<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>  

<DIV class='aside_menu'>
  <ASIDE style='float: left;'><A href='../category4/list.jsp'>게시판</A>＞<A href='./list.jsp?categoryno=<%=categoryno %>'><%=category_title %></A></ASIDE> 
  <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>'>앨범형</A> <span class='menu_divide'> |</span>
    <A href='./list_read.jsp'>펼쳐보기</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>

<%
ArrayList<Pds4VO> list = pds4Proc.list_category(categoryno);
%>
  <%--  
  <DIV class='title_box'><%=category_title %></DIV>
  --%>

<TABLE class='table_basic'>
  <colgroup>
    <col style='width: 10%;' />
    <col style='width: 10%;' />
    <col style='width: 30%;' />
    <col style='width: 10%;' />
    <col style='width: 10%;' />
    <col style='width: 20%;' />
    <col style='width: 10%;' />
  </colgroup>
  <thead>
    <TR>
      <TH class='th_basic'>번호</TH>
      <TH class='th_basic'>파일</TH>
      <TH class='th_basic'>제목</TH>
      <TH class='th_basic'>성명</TH>
      <TH class='th_basic'>조회</TH>
      <TH class='th_basic'>등록일</TH>
      <TH class='th_basic'>기타</TH>
    </TR>
  </thead>
  <tbody>
<%
  for(int index=0; index < list.size(); index++){
    Pds4VO pds4VO = list.get(index);
    int pdsno = pds4VO.getPdsno();

%> 
  <TR>
    <TD class='td_basic'><%=pdsno %></TD>
    <TD class='td_img' style='padding: 2px;'>
      <A href='./read.jsp?pdsno=<%=pdsno %>'><IMG src='./storage/<%=pds4VO.getThumb() %>' style='width: 100%; display: block;'></A></TD>
    <TD class='td_basic'>
      <A href='./read.jsp?pdsno=<%=pdsno %>&categoryno=<%=categoryno %>'><%=pds4VO.getTitle() %></A></TD>
    <TD class='td_basic'><%=pds4VO.getRname() %></TD>
    <TD class='td_basic'><%=pds4VO.getCnt() %></TD>
    <TD class='td_basic'><%=pds4VO.getRdate() %></TD>
    <TD class='td_basic'>
      <%
      if (pds4VO.getVisible().equals("Y")) {
      %>
        <A href='./show_hide.jsp?categoryno=<%=categoryno %>&pdsno=<%=pdsno %>&visible=<%=pds4VO.getVisible() %>'><IMG src='./images/show.png' title='출력'></A>
      <%
      } else {
        %>
        <A href='./show_hide.jsp?categoryno=<%=categoryno %>&pdsno=<%=pdsno %>&visible=<%=pds4VO.getVisible() %>'><IMG src='./images/hide.png' title='숨기기'></A>
      <%
      }
      %>
      <A href='./update_form.jsp?pdsno=<%=pdsno %>'><IMG src='./images/update.png' title='수정'></A>
      <A href='./delete_form.jsp?pdsno=<%=pdsno %>'><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>
  </tbody>
  <tfoot>
  </tfoot>
</TABLE>

<DIV class='bottom_menu'>
  <button type='button' 
             onclick="location.href='./create_form.jsp?categoryno=<%=categoryno %>'">등록</button>
  <button type='button' 
              onclick="location.href='../category4/list.jsp'">카테고리</button>
</DIV>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html> 

   