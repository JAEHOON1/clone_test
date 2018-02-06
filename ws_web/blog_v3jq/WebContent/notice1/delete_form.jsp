<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
Connection con = null;              // DBMS 연결   
PreparedStatement pstmt = null; // SQL 실행
ResultSet rs = null;                   // SELECT 결과를 저장
StringBuffer sql = null;              // SQL 저장
int count = 0;                          // 처리된 레코드 갯수

String className = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Drvier 
String url = "jdbc:mysql://localhost:3306/javadb?useUnicode=true&characterEncoding=euckr"; 
String user = "root"; 
String pass = "1234";
%>

<%
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
String title = "";
String rname = "";

try {
  Class.forName(className); // memory로 클래스를 읽어옴, 객체는 생성하지 않음.
  con = DriverManager.getConnection(url, user, pass); // MySQL 연결
  sql = new StringBuffer();

  sql.append(" SELECT noticeno, title, rname, rdate");
  sql.append(" FROM notice");
  sql.append(" WHERE noticeno = ?");
  
  pstmt = con.prepareStatement(sql.toString());
  pstmt.setInt(1, noticeno);
  
  rs = pstmt.executeQuery();

  if (rs.next()) {
    title = rs.getString("title");
    rname = rs.getString("rname");
  }
} catch (Exception e) {
  e.printStackTrace();
} finally {
  try {
    rs.close();
  } catch (Exception e) { // 하나의 문장을 쓰는 건 하나의 문장을 잡는단 뜻.
  }
  
  try {
    pstmt.close();
  } catch (Exception e) { // 하나의 문장을 쓰는 건 하나의 문장을 잡는단 뜻.
  }

  try {
    con.close();
  } catch (Exception e) {
  }
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

  <form name='frm' action='./delete_proc.jsp' method='POST'>
    <input type='hidden' name='noticeno' id='noticeno' value='<%=noticeno%>'>
    
    <fieldset style='width: 70%; margin: 10px auto;'>
      <legend>공지사항 삭제</legend>
      <ul>
        <li class='li_none'>
          내용: <%=title %>
        </li>
        <li class='li_none'>
          성명: <%=rname %>
        </li>
        <li class='li_none' style="margin: 20px auto; text-align: center;">
          <span style='color: #FF0000; font-weight: bold;'>삭제를 진행하면 복구 할 수 없습니다.</span><br>
          삭제하시겠습니까?
        </li>
      </ul>
    </fieldset>
    
    <DIV class='bottom_menu'>
      <button type='submit'>삭제</button>
      <button type='button' onclick="location.href='./list.jsp'">취소</button>
    </DIV>    
  </form>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>
 