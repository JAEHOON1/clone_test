<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<%
int visitorno = Integer.parseInt(request.getParameter("visitorno"));
VisitorVO visitorVO = visitorProc.read(visitorno); 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>

  <form name='frm' action='./delete_proc.jsp' method='POST'>
    <input type='hidden' name='visitorno' value='<%=visitorno %>'>
    <fieldset class='fieldset_basic'>
      <legend class='legend_basic'>방명록 삭제</legend>
      <ul>
        <li class='li_none'>
          <%=Tool.convertChar(visitorVO.getContent()) %>
          <span style='font-size: 0.8em;'>
          [
          <%=visitorVO.getRname() %> <%=visitorVO.getRdate() %>
          <%=visitorVO.getEmail() %> <%=visitorVO.getHome() %>
          ]
        </span>
        </li>
        <li class='li_none' style='text-align: center;'>
          <br>
          삭제하면 복구 할 수 없습니다. 삭제 하시려면 삭제 버튼을 눌러주세요.
          <br>
          패스워드: <input type='password' name='passwd' id='passwd' value='' style='width: 10%;' placeholder="패스워드">*
           
          <button type='submit'>삭제</button>
          <button type='button' onclick="location.href='./list.jsp'">취소</button>
        </li>
      </ul>
    </fieldset>
    
  </form>
  
  <DIV style='border: none; margin: 0px auto; width: 80%; padding: 5px 20px;'>
    <%
    ArrayList<VisitorVO> list = visitorProc.list(); 
        
    for (int index=0; index < list.size(); index++) {
      visitorVO = list.get(index);
    %>
      <IMG src='./images/bu6.gif'> <%=Tool.convertChar(visitorVO.getContent()) %>
      <span style='font-size: 0.8em;'>
        [
        <%=visitorVO.getRname() %> <%=visitorVO.getRdate() %>
        <%=visitorVO.getEmail() %> <%=visitorVO.getHome() %>
        <A href='./update_form.jsp?visitorno=<%=visitorVO.getVisitorno() %>'><IMG src='./images/update.png' style='width: 12px;'></A>
        <A href='./delete_form.jsp?visitorno=<%=visitorVO.getVisitorno() %>'><IMG src='./images/delete.png' style='width: 12px;'></A>
         ]
        
      </span>
      <br>
      <HR style='border: dotted 1px #CCCCCC; margin: 5px auto;'>
    <%
    }
    %>  
  </DIV>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>
 