<%@ page contentType="text/html; charset=UTF-8" %> 
 
<%@ include file = "./ssi.jsp"  %>
 
<%
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
String category_title = categoryVO.getTitle();
 
recordPerPage = 1; // 페이지당 레코드 수, 펼쳐 보기만 지정
ArrayList<Pds4VO> list = pds4Proc.list_category(categoryno, col, word, nowPage, recordPerPage);
 
Pds4VO pds4VO = list.get(0);
int pdsno = pds4VO.getPdsno();
 
listFile = "list_read.jsp";
%>
 
<%
// -----------------------------------------------------------------
// 페이징 관련 코드 시작
// -----------------------------------------------------------------
int recordCount = pds4Proc.count(categoryno, col, word);
 
// listFile 목록 파일명
// recordCount 전체 레코드수 
// nowPage 현재 페이지
// recordPerPage 페이지당 레코드 수
// col 검색 컬럼 
// word 검색어  
String paging = new Paging().paging5(listFile, recordCount, nowPage, recordPerPage, col, word, categoryno);
// -----------------------------------------------------------------
%>  
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>  
 
<DIV class='aside_menu'>
  <ASIDE style='float: left;'>게시판＞<%=category_title %>＞조회</ASIDE> 
  <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>&col=<%=col%>&word=<%=word%>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>&col=<%=col%>&word=<%=word%>'>앨범형</A> <span class='menu_divide'> |</span>
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
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>
 
<FORM name='frm' method='POST' action='./create_proc.jsp' 
           enctype='multipart/form-data'>
  <input type='hidden' name='categoryno' value='<%=categoryno %>'>
           
  <fieldset class='fieldset_no_line'>
    <ul>
      <li class='li_none'>
        <span style="font-weight: bold;">
          <%=pds4VO.getTitle() %> (<%=pds4VO.getRdate() %>)
          조회수: <%=pds4VO.getCnt() %>
          <%
          if (pds4VO.getSize1() > 0) {
          %>
            <%=pds4VO.getFile1() %> (<%=Tool.unit(pds4VO.getSize1()) %>)
            <A href='<%=root%>/download2?dir=/pds4/storage&filename=<%=pds4VO.getFstor1() %>&downname=<%=pds4VO.getFile1() %>'><IMG src='./images/download.png'></A>
            
          <% 
          }
          %>
        </span>
      </li>
      
      <li class='li_none'>
        <%
        if (Tool.isImage(pds4VO.getFstor1())) {
        %>
          <DIV style='float: left; margin: 10px 10px 0px 0px;'>
            <IMG src='./storage/<%=pds4VO.getFstor1() %>'>
          </DIV>
        <%  
        }
        %>
        <DIV><%=Tool.convertChar(pds4VO.getContent()) %></DIV>
      </li>
 
      
      <%
      String map = Tool.checkNull(pds4VO.getMap());
      if (map.trim().length() > 0) { // 지도가 있는 경우만 출력
      %>
      <li class='li_none'>
        <!-- 가운데 정렬 설정 -->
        <DIV style='width:520px; margin: 0px auto;'>
          <%=pds4VO.getMap() %>
        </DIV>
      </li>
      <%
      }
      %>
      
      <li class='li_none' style='font-size: 0.8em;'>
        <%=pds4VO.getRname() %>(<%=pds4VO.getEmail() %>) <%=pds4VO.getWeb() %>
        <%
        String mp3 = Tool.checkNull(pds4VO.getMp3());
        if (mp3.trim().length() > 0) { // MP3 파일이 있는 경우만 출력
        %>
          <AUDIO controls>
            <source src="./storage/<%=pds4VO.getMp3() %>" type="audio/mp3">
          </AUDIO>
        <%
        }
        %>  
      </li>
      
      <%
      String mp4 = Tool.checkNull(pds4VO.getMp4());
      if (mp4.trim().length() > 0) { // MP3 파일이 있는 경우만 출력
      %>
        <li class='li_none' style='font-size: 0.8em;'>
          <VIDEO controls src='./storage/<%=mp4 %>' style='width: 80%;'></VIDEO>
        </li>
      <%
      }
      %>  
      
      <%
      String youtube = Tool.checkNull(pds4VO.getYoutube());
      if (youtube.trim().length() > 0) { // 지도가 있는 경우만 출력
      %>
      <li class='li_none'>
        <!-- 가운데 정렬 설정 -->
        <DIV style='width: 640px; margin: 0px auto;'>
          <%=pds4VO.getYoutube() %>
        </DIV>
      </li>  
      <%
      }
      %>
            
    </ul>
  </fieldset>
 
</FORM>
 
<HR class='hr_dotted'>
                      
<DIV class='bottom_menu'>
  <%=paging %>
</DIV>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
 
</body>
</html> 
 
 