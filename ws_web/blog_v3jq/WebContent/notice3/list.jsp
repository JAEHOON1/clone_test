<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
  <DIV class='title_box'>공 지 사 항 3</DIV>
  <TABLE class='table_basic'>
    <colgroup>
      <col style='width: 5%;'>
      <col style='width: 50%;'>
      <col style='width: 12%;'>
      <col style='width: 18%;'>
      <col style='width: 15%;'>
    </colgroup>
    <thead>
      <TR>
        <TH class='th_basic'>NO</TH>
        <TH class='th_basic'>내용</TH>
        <TH class='th_basic'>성명</TH>
        <TH class='th_basic'>등록일</TH>
        <TH class='th_basic'>기타</TH>
      </TR>
    </thead>
    <tbody>
      <%
      ArrayList<NoticeVO> list = noticeDAO.list(); 
       
      for (int index=0; index < list.size(); index++) {
        NoticeVO noticeVO = list.get(index); // 0 ~
      %>  
        <TR>
          <TD class='td_basic'><%=noticeVO.getNoticeno() %></TD>
          <TD class='td_basic' style='text-align: left;'><%=noticeVO.getTitle() %></TD>
          <TD class='td_basic'><%=noticeVO.getRname() %></TD>
          <TD class='td_basic'><%=noticeVO.getRdate().substring(0, 10) %></TD>
          <TD class='td_basic'>
            <A href='./update_form.jsp?noticeno=<%=noticeVO.getNoticeno() %>'>수정</A> / 
            <A href='./delete_form.jsp?noticeno=<%=noticeVO.getNoticeno() %>'>삭제</A>
          </TD>
        </TR>
      <%  
      }
      %>
    </tbody>
  </TABLE>

  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./create_form.jsp'">등록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>

