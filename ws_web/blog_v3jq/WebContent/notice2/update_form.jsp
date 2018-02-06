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

<%
// 수정할 레코드의 pk 컬럼의 값
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
String title = "";
String rname = "";

try {
  con = new DBOpen().getConnection();
  sql = new StringBuffer();

  sql.append(" SELECT noticeno, title, rname, rdate");
  sql.append(" FROM notice");
  sql.append(" WHERE noticeno = ?");
  
  pstmt = con.prepareStatement(sql.toString());
  pstmt.setInt(1, noticeno);
  
  rs = pstmt.executeQuery();
  
  if (rs.next()){ // 첫번째 레코드로 이동
    title = rs.getString("title");
    rname = rs.getString("rname");
  }
  
} catch (Exception e) {
  e.printStackTrace();
} finally {
  new DBClose().close(con, pstmt, rs);
}
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

  <form name='frm' action='./update_proc.jsp' method='POST'>
    <input type='hidden' name='noticeno' id='noticeno' value='<%=noticeno%>'>
    
    <fieldset style='width: 70%; margin: 10px auto;'>
      <legend>공지사항 수정</legend>
      <ul>
        <li class='li_none'>
          <label for='title'>내용: </label>
          <input type='text' name='title' id='title' value='<%=title %>' style='width: 80%;'>
        </li>
        <li class='li_none'>
          <label for='rname'>성명: </label>
          <input type='text' name='rname' id='rname' value='<%=rname %>' style='width: 30%;'>
        </li>
      </ul>
    </fieldset>
    
    <DIV class='bottom_menu'>
      <button type='submit'>저장</button>
      <button type='button' onclick="location.href='./list.jsp'">취소</button>
    </DIV>    
  </form>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>
  
 