<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<%
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
%>
  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>

  <form name='frm' action='./delete_proc.jsp' method='POST'>
    <input type='hidden' name='categoryno' value='<%=categoryno %>'>
  
    <fieldset class='fieldset_basic'>
      <legend class='legend_basic'>카테고리 삭제(*: 필수)</legend>
      <ul>
        <li class='li_none' style='text-align: center;'>
          카테고리를 삭제하시겠습니까? 삭제하면 복구 할 수 없습니다.<br>
      <%
          int countByCategory = pds4Proc.countByCategory(categoryno);
           
          if (countByCategory > 0) {
          %> 
            <span class='span_warning'>카테고리 관련 글이 <%=countByCategory %> 발견되었습니다. (PDS4: <%=categoryVO.getTitle() %>)</span>
            <br>
            '<%=categoryVO.getTitle() %>' 카테고리를 삭제하려면 관련 레코드를 모두 삭제해야합니다.
            <br> 
            [<A href='../pds4/delete_category_form.jsp?categoryno=<%=categoryno %>'>관련 레코드 삭제하러 가기</A>]
          <%  
          }
          %>
          <br><br>         
          <button type='submit'>삭제</button>
          <button type='button' onclick="location.href='./list.jsp'">취소</button>
        </li>
      </ul>
    </fieldset>
    
  </form>

  <TABLE class='table_basic'>
    <colgroup>
      <col style='width: 5%;' />   <!-- 출력 순서 -->
      <col style='width: 40%;' /> <!-- 제목 -->
      <col style='width: 25%;' /> <!-- 접근 계정 -->
      <col style='width: 5%;' /> <!-- 출력 선택 -->
      <col style='width: 10%;' /> <!-- 등록된 자료수 -->
      <col style='width: 15%;' /> <!-- 기타 -->
    </colgroup>
    <TR>
      <TH class='th_basic'>순서</TH>
      <TH class='th_basic'>제목</TH>
      <TH class='th_basic'>계정</TH>
      <TH class='th_basic'>출력</TH>      
      <TH class='th_basic'>자료수</TH>
      <TH class='th_basic'>기타</TH>
    </TR>
<%
ArrayList<CategoryVO> list = categoryProc.list();
for (int index=0; index < list.size(); index++) {
  categoryVO = list.get(index);
  
  categoryno = categoryVO.getCategoryno();
  String visible = categoryVO.getVisible();
%>
    <TR>
      <TD class='td_basic'><%=categoryVO.getSeqno() %></TD>
      <TD class='td_basic' style='text-align: left;'>
        <%=categoryVO.getTitle() %>
      </TD>
      <TD class='td_basic'><%=categoryVO.getIds() %></TD>
      <TD class='td_basic'><%=visible %></TD>
      <TD class='td_basic'><%=categoryVO.getCnt() %></TD>
      <TD class='td_basic'>
        <A href='./update_form.jsp?categoryno=<%=categoryno %>'><IMG src='./images/update.png' style='width: 12px;'></A>
        <A href='./delete_form.jsp?categoryno=<%=categoryno %>'><IMG src='./images/delete.png' style='width: 12px;'></A>
    </TR>
<%  
}
%>
  </TABLE>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>
   
   