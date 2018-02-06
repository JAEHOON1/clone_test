<%@ page contentType="text/html; charset=UTF-8" %>

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

  <form name='frm' action='./create_proc.jsp' method='POST'>
    <fieldset class='fieldset_basic'>
      <legend class='legend_basic'>방명록 등록(*: 필수)</legend>
      <ul>
        <li class='li_none'>
          <textarea name='content' id='content' rows='5' style='width: 99%;'>스타트랙 시즌 종료</textarea>*
        </li>
        <li class='li_none'>
          <input type='text' name='rname' id='rname' value='' style='width: 10%;' placeholder="성명">*
           
          <input type='password' name='passwd' id='passwd' value='' style='width: 10%;' placeholder="패스워드">*
           
          <input type='text' name='email' id='email' value='' style='width: 25%;' placeholder="이메일">
           
          <input type='text' name='home' id='home' value='' style='width: 37%;' placeholder="홈페이지">
           
          <button type='submit'>등록</button>
          <button type='reset'>취소</button>
        </li>
      </ul>
    </fieldset>
    
  </form>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>

