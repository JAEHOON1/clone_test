<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<DIV>
  <fieldset class='fieldset_home'> 
    <legend class='legend_home'>공지사항 <A href='<%=root%>/notice3/list.jsp'>More...</A></legend>
    <ul>
    <%
    ArrayList<NoticeVO> list = noticeDAO.list_home(3); 
    
    for (int index=0; index < list.size(); index++) {
      NoticeVO noticeVO = list.get(index);
    %> 
      <LI class='li_home'>
        <%=noticeVO.getTitle() %> 
      
        <span style='font-size: 0.9em;'>
          [
          <%=noticeVO.getRname() %><%=noticeVO.getRdate().substring(0, 10) %>
          ]
        </span>
        
      </LI>
    <%
    }
    %>
    </ul> 
  </fieldset>
</DIV>


