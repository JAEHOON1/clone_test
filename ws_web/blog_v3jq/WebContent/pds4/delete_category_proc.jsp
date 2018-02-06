<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<%
String tempDir = application.getRealPath("/pds4/temp"); // WebContent 기준
String upDir = application.getRealPath("/pds4/storage");
// request, 메모리에 저장할 크기, 업로드할 최대 파일 크기, 임시 저장 폴더
Upload upload = new Upload(request, -1, 10485760, tempDir);
 
int categoryno = Integer.parseInt(upload.getParameter("categoryno"));
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
    <ASIDE style='float: left;'>게시판＞<%=category_title %>＞자료 삭제</ASIDE> 
    <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>&nowPage=<%=nowPage%>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>&nowPage=<%=nowPage%>'>앨범형</A> <span class='menu_divide'> |</span>
    <A href='./list_read.jsp?nowPage=<%=nowPage%>'>펼쳐보기</A>
    </ASIDE> 
    <DIV class='menu_line' style='clear: both;'></DIV>
  </DIV>
 
  <DIV class='message'>
    <%
    ArrayList<Pds4VO> list = pds4Proc.list_category(categoryno);
    
    for (int index=0; index < list.size(); index++) {
      Pds4VO pds4VO = list.get(index); // 레코드 1건 추출
 
      // 등록된 파일 삭제
      Tool.deleteFile(upDir, pds4VO.getFstor1());
      Tool.deleteFile(upDir, pds4VO.getThumb());
      Tool.deleteFile(upDir, pds4VO.getMp3());
      Tool.deleteFile(upDir, pds4VO.getMp4());
      
      count = pds4Proc.delete(pds4VO.getPdsno()); // DBMS 파일 삭제 처리
      if (count == 1){  
      %> 
        <SPAN class='span_info'>"<%=pds4VO.getTitle() %>" 자료를 삭제 했습니다.</SPAN><br>
      <%  
      } else {
      %>
        <SPAN class='span_warning'>에러가 발생하여 자료 삭제에 실패했습니다.</SPAN><br>
      <%  
      }
    }
    %>
  </DIV>  
 
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='../category4/list.jsp'">카테고리 목록으로 가기</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html>