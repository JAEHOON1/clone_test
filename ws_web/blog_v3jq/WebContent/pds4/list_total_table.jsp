<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

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

<%
ArrayList<Pds4VO> list = pds4Proc.list();
%>
<DIV class='title_box'>게시판(전체 목록)</DIV>

<TABLE class='table_basic'>
  <colgroup>
    <col style='width: 10%;' />
    <col style='width: 40%;' />
    <col style='width: 10%;' />
    <col style='width: 10%;' />
    <col style='width: 20%;' />
    <col style='width: 10%;' />
  </colgroup>
  <thead>
    <TR>
      <TH class='th_basic'>번호</TH>
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

%> 
  <TR>
    <TD class='td_basic'><%=pds4VO.getPdsno() %></TD>
    <TD class='td_basic'>
      <A href='./read.jsp?pdsno=<%=pds4VO.getPdsno() %>'><%=pds4VO.getTitle() %></A></TD>
    <TD class='td_basic'><%=pds4VO.getRname() %></TD>
    <TD class='td_basic'><%=pds4VO.getCnt() %></TD>
    <TD class='td_basic'><%=pds4VO.getRdate() %></TD>
    <TD class='td_basic'>
      <A href='./update_form.jsp?pdsno=<%=pds4VO.getPdsno() %>'><IMG src='./images/update.png' title='수정'></A>
      <A href='./delete_form.jsp?pdsno=<%=pds4VO.getPdsno() %>'><IMG src='./images/delete.png' title='삭제'></A>
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
             onclick="location.href='./create_form.jsp?categoryno=7'">등록</button>
</DIV>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html> 
