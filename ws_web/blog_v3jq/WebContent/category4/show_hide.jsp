<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<%
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
String visible = request.getParameter("visible");

categoryProc.show_hide(categoryno, visible);

response.sendRedirect("./list.jsp");
%>
 
 