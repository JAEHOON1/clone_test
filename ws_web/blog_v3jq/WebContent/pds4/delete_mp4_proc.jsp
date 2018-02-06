<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<%
// String tempDir = application.getRealPath("/pds4/temp"); // WebContent 기준
String upDir = application.getRealPath("/pds4/storage");
// request, 메모리에 저장할 크기, 업로드할 최대 파일 크기, 임시 저장 폴더
// Upload upload = new Upload(request, -1, 10485760, tempDir);
 
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
String category_title = categoryVO.getTitle();
int count = 0;
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
    <ASIDE style='float: left;'>게시판＞<%=category_title %>＞MP4 파일 삭제</ASIDE> 
    <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>'>앨범형</A> <span class='menu_divide'> |</span>
    <A href='./list_read.jsp'>펼쳐보기</A>
    </ASIDE> 
    <DIV class='menu_line' style='clear: both;'></DIV>
  </DIV>
 
  <DIV class='message'>
<%
int pdsno = Integer.parseInt(request.getParameter("pdsno"));
String passwd  = request.getParameter("passwd");
 
if (pds4Proc.passwordCheck(pdsno, passwd) == 1) { // 패스워드 일치
  Pds4VO pds4VO = new Pds4VO();
  pds4VO.setPdsno(pdsno);  
 
  // ------------------------------------------------
  // 기존 파일 삭제
  // ------------------------------------------------
  Pds4VO oldPds4VO = pds4Proc.read(pdsno);
  Tool.deleteFile(upDir, oldPds4VO.getMp4());
  // ------------------------------------------------
        
  count = pds4Proc.delete_mp4(pdsno); // DBMS 적용
  if (count == 1) {
  %>
    <span class='span_info'>
      MP3를 삭제했습니다.
    </span>
  <%    
  } else { // 모든 조건이 일치했으나 예외가 발생한경우
  %>
    <span class='span_warning'>
      MP3 변경에 실패했습니다. 다시 시도해 주세요.
    </span>
  <%
  }
} else {
  %>
  <span class='span_warning'>
    패스워드가 일치하지 않습니다. 다시 시도해주세요.
  </span> 
<%     
}
%>
  </DIV>  
 
  <DIV class='bottom_menu'>
    <%
    if (count == 0) {
    %>
      <button type='button' onclick="history.back()">다시 시도</button>  
    <%  
    } else {
    %>
      <button type='button' onclick="location.href='./update_form.jsp?categoryno=<%=categoryno %>&pdsno=<%=pdsno %>'">계속 수정 [글 수정화면으로 돌아가기]</button>
    <%  
    }
    %>   
    <button type='button' onclick="location.href='./list.jsp?categoryno=<%=categoryno %>'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>