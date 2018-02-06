<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="nation.web.tool.DBOpen" %>
<%@ page import="nation.web.tool.DBClose" %>

<%
Connection con = null;              // DBMS 연결   
PreparedStatement pstmt = null; // SQL 실행
ResultSet rs = null;                   // SELECT 결과를 저장
StringBuffer sql = null;              // SQL 저장
int count = 0;                          // 처리된 레코드 갯수
%>

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
  <DIV class='title_box'>공 지 사 항 2</DIV>
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
      try {
        con = new DBOpen().getConnection();
        sql = new StringBuffer();
        sql.append(" SELECT noticeno, title, rname, rdate"); // 맨 앞에 공백 한 칸이 있어야함.
        sql.append(" FROM notice");
        sql.append(" ORDER BY noticeno DESC");
   
        pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
        rs = pstmt.executeQuery(); // SELECT SQL 실행
   
        while(rs.next()) {
        %>  
          <TR>
            <TD class='td_basic'><%=rs.getInt("noticeno") %></TD>
            <TD class='td_basic' style='text-align: left;'><%=rs.getString("title") %></TD>
            <TD class='td_basic'><%=rs.getString("rname") %></TD>
            <TD class='td_basic'><%=rs.getString("rdate").substring(0, 10) %></TD>
            <TD class='td_basic'>
              <A href='./update_form.jsp?noticeno=<%=rs.getInt("noticeno") %>'>수정</A> / 
              <A href='./delete_form.jsp?noticeno=<%=rs.getInt("noticeno") %>'>삭제</A>
            </TD>
          </TR>
        <%  
        }
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        new DBClose().close(con, pstmt, rs);
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
 