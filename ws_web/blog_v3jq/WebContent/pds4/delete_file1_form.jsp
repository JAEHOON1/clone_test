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
  <ASIDE style='float: left;'><A href='../category4/list.jsp'>게시판</A>＞<A href='./list.jsp?categoryno=<%=categoryno %>'><%=category_title %></A>＞수정 > 파일 삭제</ASIDE> 
  <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>'>앨범형</A> <span class='menu_divide'> |</span>
    <A href='./list_read.jsp'>펼쳐보기</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>

<FORM name='frm' method='POST' action='./delete_file1_proc.jsp'>
  <input type='hidden' name='categoryno' value='<%=categoryno %>'>
  <input type='hidden' name='pdsno' value='<%=pdsno %>'>
  
  <fieldset class='fieldset_no_line'>
    <ul>
      <li class='li_center'>
        <label for='file1'>참고 파일: </label>
        
        <%
        if (Tool.isImage(pds4VO.getFstor1())) { // 이미지 일경우
        %>
          <IMG src='./storage/<%=pds4VO.getFstor1() %>' style='width: 200px;'>
        <%  
        } else { // 이미지가 아닐 경우
          out.println(pds4VO.getFile1());              
        }
        %>
        
        <label for='passwd'>패스워드: </label>
        <input class='input_basic'  type='password' name='passwd' id='passwd' value='123' size='5'>
      
        <button type="submit">삭제 진행</button>
        <button type="button" onclick="location.href='./update_form.jsp?categoryno=<%=categoryno %>&pdsno=<%=pdsno%>'">삭제 취소</button>
        
      </li>        

    </ul>
  </fieldset>

</FORM>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html> 
