<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<DIV>
  <fieldset class='fieldset_home'> 
    <legend class='legend_home'>방명록 <A href='<%=root%>/notice3/list.jsp'>More...</A></legend>
    <ul>
    <%
    ArrayList<VisitorVO> list = visitorProc.list_home(3); 
     
    for (int index=0; index < list.size(); index++) {
      VisitorVO visitorVO = list.get(index);
    %> 
      <LI class='li_home'>
        <%=Tool.convertChar(visitorVO.getContent()) %> 
      
        <span style='font-size: 0.9em;'>
          [
          <%=visitorVO.getRname() %><%=visitorVO.getRdate().substring(0, 10) %>
          ]
        </span>
        
      </LI>
    <%
    }
    %>
    </ul> 
  </fieldset>
</DIV>


