<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file = "./ssi.jsp"  %>

<%
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
String category_title = categoryVO.getTitle();

int pdsno = Integer.parseInt(request.getParameter("pdsno"));
Pds4VO pds4VO = pds4Proc.read(pdsno); // 조회
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
  <ASIDE style='float: left;'><A href='../category4/list.jsp'>게시판</A>＞<A href='./list.jsp?categoryno=<%=categoryno %>'><%=category_title %></A>＞수정 > Youtube 변경</ASIDE> 
  <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>'>앨범형</A> <span class='menu_divide'> |</span>
    <A href='./list_read.jsp'>펼쳐보기</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>

<FORM name='frm' method='POST' action='./replace_youtube_proc.jsp'>
  <input type='hidden' name='categoryno' value='<%=categoryno %>'>
  <input type='hidden' name='pdsno' value='<%=pdsno %>'>
           
  <fieldset class='fieldset_no_line'>
    <ul>
      <%
      String youtube = Tool.checkNull(pds4VO.getYoutube());
      if (youtube.trim().length() > 0) { // youtube가 있는 경우만 출력
      %>
      <li class='li_center'>
        <!-- 가운데 정렬 설정 -->
        <DIV style='width: 640px; margin: 0px auto;'>
          <%=pds4VO.getYoutube() %>
        </DIV>
      </li>  
      <%
      }
      %>
      <li class='li_center'>
        기존에 등록된 Youtube 영상을 삭제하고 새로운 영상을 등록합니다.
      </li>
      <li class='li_center'>
        <label for='content'>Youtube(<A href='https://www.youtube.com' target='_blank'>https://www.youtube.com</A>): </label><br>
        <textarea name='youtube' id='youtube' rows='3' style='width: 100%;'><%=pds4VO.getYoutube() %></textarea>
      </li>                
      <li class='li_center'>
        <label for='passwd'>패스워드: </label>
        <input class='input_basic'  type='password' name='passwd' id='passwd' value='123' size='5'>
      </li>

      <li class='li_center'>
        <button type="submit">수정</button>
        <button type="button" onclick="history.back();">수정 취소</button>
      </li>    
    </ul>
  </fieldset>

</FORM>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html> 

