<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<% 
request.setCharacterEncoding("utf-8"); 
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

  <fieldset style='width: 70%; margin: 10px auto;'>
    <legend>공지사항 수정</legend>
      <ul>
      <%
      int noticeno = Integer.parseInt(request.getParameter("noticeno"));
      String title = request.getParameter("title");
      String rname = request.getParameter("rname");
      
      Connection con = null;              // DBMS 연결   
      PreparedStatement pstmt = null; // SQL 실행
      ResultSet rs = null;                   // SELECT 결과를 저장
      StringBuffer sql = null;              // SQL 저장
      int count = 0;                          // 처리된 레코드 갯수
      
      String className = "org.gjt.mm.mysql.Driver"; // MySQL 연결 Drvier 
      String url = "jdbc:mysql://localhost:3306/javadb?useUnicode=true&characterEncoding=euckr"; 
      String user = "root"; 
      String pass = "1234";
      
      try {
        Class.forName(className); // memory로 클래스를 읽어옴, 객체는 생성하지 않음.
        con = DriverManager.getConnection(url, user, pass);  // MySQL 연결
        sql = new StringBuffer();

        sql.append(" UPDATE notice");
        sql.append(" SET title=?, rname=?");
        sql.append(" WHERE noticeno = ?");
        
        pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
        pstmt.setString(1, title);
        pstmt.setString(2, rname);
        pstmt.setInt(3, noticeno);
        count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
        
        System.out.println("--> count: " + count);
        
        if (count == 1) {
        %>  
          <li class='li_none'>수정 처리에 성공했습니다.</li>
        <%  
        } else {
        %>  
          <li class='li_none'>공지사항 수정에 실패했습니다.</li>
          <li class='li_none'>다시한번 시도해주세요.</li>
        <%  
        }
        
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        try {
          pstmt.close();
        } catch (Exception e) {
        }
        
        try {
          con.close();
        } catch (Exception e) {
        }
      }
      %>
      </ul>
  </fieldset>
  
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./update_form.jsp?noticeno=<%=noticeno %>'">다시 수정</button>
    <button type='button' onclick="location.href='./list.jsp'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>
  