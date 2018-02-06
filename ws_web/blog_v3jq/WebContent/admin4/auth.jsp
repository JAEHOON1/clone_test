<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="nation.web.tool.Tool" %>
 
<%
// ----------------------------------------------------------------------------
// 요청된 주소로 자동 이동
// ----------------------------------------------------------------------------
request.setCharacterEncoding("UTF-8");
 
String url= request.getRequestURL().toString();
System.out.println("--> url: " + url);
// --> url: http://localhost:9090/blog_v3jq/admin4/list.jsp
 
// <Input> 태그의 'name' 속성의 값을 열거형으로 추출합니다.
Enumeration<String> enumeration = request.getParameterNames();
String params = "";
 
while(enumeration.hasMoreElements()){ // 요소가 있는지 검사
  // System.out.println("-->" + enumeration.nextElement());
  String name = enumeration.nextElement(); // 폼 태그의 <Input> 태그의 'name' 속성 값
  String value = request.getParameter(name); // 폼 태그의 <Input> 태그의 'value' 속성 값
  params = params + name + "=" + value + "&"; // 파라미터 조합
  System.out.println("--> params: " + params);
}
 
String url_address = request.getRequestURL() + "?" + params;
System.out.println("--> 1) auth.jsp: url_address: " + url_address);
// --> 1) auth.jsp: url_address: http://localhost:9090/travel_v1jq/admin1/update_form.jsp?admin1no=2&email=test1@mail.com&
url_address = URLEncoder.encode(url_address, "UTF-8"); // 한글 1바이트 코드로 변환
System.out.println("--> 2) auth.jsp: url_address: " + url_address);
// --> 2) auth.jsp: url_address: http%3A%2F%2Flocalhost%3A9090%2Fadmin_v1jq%2Fadmin1%2Fupdate_form.jsp%3Fadmin1no%3D2%26email%3Dtest1%40mail.com%26
//----------------------------------------------------------------------------
 
if ((Tool.isMaster(request) || Tool.isAdmin(request)) == false){
  // response.sendRedirect(request.getContextPath() + "/admin4/login_ck_form.jsp");
  // response.sendRedirect(request.getContextPath() + "/admin4/login_ck_form.jsp?url_address=" + url_address);    
%>
  <script type="text/javascript">
    location.href='<%=request.getContextPath()%>/admin4/login_ck_form.jsp?url_address=<%=url_address%>';
  </script>
<%
  return; // 이부분에서 처리 종료
}
%>
 
 