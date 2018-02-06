<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
  <DIV style='width: 30%; background-color: #EEEEFF; margin: 20px auto; font-size: 32px; text-align: center;'>
    영화와 여행 이야기
  </DIV>
  
  <TABLE style='width: 30%; margin: 30px auto; border-collapse: collapse;'>
    <tr>
      <td style='width: 20%;'><img src='./menu/images/01.jpg' style='width: 100%; display: block;'></td>
      <td style='width: 20%;'><img src='./menu/images/02.jpg' style='width: 100%; display: block;'></td>
      <td style='width: 20%;'><img src='./menu/images/03.jpg' style='width: 100%; display: block;'></td>
      <td style='width: 20%;'><img src='./menu/images/04.jpg' style='width: 100%; display: block;'></td>
      <td style='width: 20%;'><img src='./menu/images/01.jpg' style='width: 100%; display: block;'></td>
    </tr>
  </TABLE>
  
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
      <jsp:include page="/notice3/list_home.jsp" flush='false' />
     </DIV>
     <DIV style='float: left; width: 50%;'>
       <jsp:include page="/notice3/list_home.jsp" flush='false' />
    </DIV>  
  </DIV>

  <DIV style='width: 94.8%; margin: 0px auto;'>
    <jsp:include page="/visitor4/list_home.jsp" flush='false' />
  </DIV>  

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>
 
 