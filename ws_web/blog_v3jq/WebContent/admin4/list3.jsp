<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function act_proc(admin4no, act) {
  var url = './act_form.jsp?admin1no=' + admin4no + '&act=' + act; // 문자열: '', ""
  var win = window.open(url, '권한 변경', 'width=500px, height=350px');
  
  var x = (screen.width - 500) / 2; 
  var y = (screen.height - 350) / 2;
  
  win.moveTo(x, y); //  화면을 가운데로 이동
}
 
function passwd_form(admin4no) {
  var url = './passwd_form.jsp?admin4no=' + admin4no; // 문자열: '', ""
  var win = window.open(url, '패스워드 변경', 'width=550px, height=350px');
  
  var x = (screen.width - 550) / 2; 
  var y = (screen.height - 350) / 2;
  
  win.moveTo(x, y); //  화면을 가운데로 이동
}
 
function update_form(admin1no, email) {
  var url = './update_form.jsp?admin4no=' + admin4no + "&email=" + email; // 문자열: '', ""
  var win = window.open(url, '회원 정보 변경', 'width=550px, height=350px');
  
  var x = (screen.width - 550) / 2; 
  var y = (screen.height - 350) / 2;
  
  win.moveTo(x, y); //  화면을 가운데로 이동
}
 
function delete_form(admin4no) {
  var sw = window.confirm("정말로 관리자를 삭제하시겠습니까?");
  if (sw == true) {
    var url = './delete_proc.jsp?admin4no=' + admin4no; // 문자열: '', ""
    var win = window.open(url, '관리자 삭제', 'width=550px, height=350px');
  
    var x = (screen.width - 550) / 2; 
    var y = (screen.height - 350) / 2;
  
    win.moveTo(x, y); //  화면을 가운데로 이동
  } else {
    window.alert("관리자 삭제를 취소합니다.");
  }
}
 
</script> 
</head> 
 
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>
 
<%
ArrayList<Admin4VO> list = adminProc.list();
%>
<DIV class='title_box'>관리자 목록</DIV>
 
<TABLE class='table_basic'>
  <CAPTION>
  권한: M: Master, H: 대기(Hold), Y: 로그인 가능, N: 로그인 불가 / 이메일 확인: Y(확인), N(미확인)
  </CAPTION>
  <TR>
    <TH class='th' style='width: 10%;'>번호</TH>
    <TH class='th' style='width: 30%;'>이메일</TH>
    <TH class='th' style='width: 10%;'>인증키</TH>
    <TH class='th' style='width: 10%;'>권한</TH>
    <TH class='th' style='width: 15%;'>이메일<br>확인</TH>
    <TH class='th' style='width: 15%;'>등록일</TH>
    <TH class='th' style='width: 10%;'>기타</TH>
  </TR>
 
<%
  for(int index=0; index < list.size(); index++){
    Admin4VO vo = list.get(index);
    int admin4no = vo.getAdmin4no();
 
%> 
  <TR>
    <TD class='td'><%=admin4no %></TD>
    <TD class='td_l'><%=vo.getEmail() %></A></TD>
    <TD class='td'><%=vo.getAuth() %></TD>
    <TD class='td'>
      <A href="javascript: act_proc(<%=admin4no %>, '<%=vo.getAct() %>')"><%=vo.getAct() %></A>
    </TD>
    <TD class='td'><%=vo.getConfirm() %></TD>
    <TD class='td'><%=vo.getMdate().substring(0, 10) %></TD>
    <TD class='td'>
      <A href="javascript:passwd_form(<%=admin4no %>)"><IMG src='./images/passwd.png' title='패스워드 변경'></A>
      <A href="javascript:update_form(<%=admin4no %>, '<%=vo.getEmail() %>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:delete_form(<%=admin4no %>)"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>
 
</TABLE>
 
<DIV class='bottom'>
  <button type='button' onclick="location.href='./create_form.jsp'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
 
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>
 
</html> 