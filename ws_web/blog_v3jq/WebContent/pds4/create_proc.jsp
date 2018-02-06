<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<%
String tempDir = application.getRealPath("/pds4/temp"); // WebContent 기준
String upDir = application.getRealPath("/pds4/storage");
// request, 메모리에 저장할 크기, 업로드할 최대 파일 크기, 임시 저장 폴더
Upload upload = new Upload(request, -1, -1, tempDir);

int categoryno = Integer.parseInt(upload.getParameter("categoryno"));
CategoryVO categoryVO = categoryProc.read(categoryno);
String category_title = categoryVO.getTitle();
// String category_title = "한국 드라마";
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV class='content'>

<DIV class='aside_menu'>
  <ASIDE style='float: left;'><A href='../category4/list.jsp'>게시판</A>＞<A href='./list.jsp?categoryno=<%=categoryno %>'><%=category_title %></A></ASIDE> 
  <ASIDE style='float: right;'>
    <A href='./list_category_table2.jsp?categoryno=<%=categoryno %>'>목록형</A> <span class='menu_divide'> |</span> 
    <A href='./list.jsp?categoryno=<%=categoryno %>'>앨범형</A> <span class='menu_divide'> |</span>
    <A href='./list_read.jsp'>펼쳐보기</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>

  <DIV class='message'>
<%
String title = upload.toKor(upload.getParameter("title"));
String content = upload.toKor(upload.getParameter("content"));
String web = upload.toKor(upload.getParameter("web"));
String rname = upload.toKor(upload.getParameter("rname"));
String email = upload.toKor(upload.getParameter("email"));
String passwd  = upload.toKor(upload.getParameter("passwd"));
String map  = upload.toKor(upload.getParameter("map"));
String youtube  = upload.toKor(upload.getParameter("youtube"));

Pds4VO pds4VO = new Pds4VO();
pds4VO.setCategoryno(categoryno);
pds4VO.setTitle(title);
pds4VO.setContent(content);
pds4VO.setWeb(web);
pds4VO.setRname(rname);
pds4VO.setEmail(email);
pds4VO.setPasswd(passwd);
pds4VO.setVisible("Y");
pds4VO.setIp(request.getRemoteAddr()); // IP address
pds4VO.setMap(map);
pds4VO.setYoutube(youtube);
  
// <input type='file' name='file1' style='width: 100%;'>
FileItem fileItem = upload.getFileItem("file1");
String file1 = "";   // 사용자가 전송한 파일명
String fstor1 = ""; // 실제 서버상의 디스크에 저장되는 파일명
String thumb = ""; // preview mini 이미지
long size1 = 0;      // 원본 파일의 크기

file1 = fileItem.getName(); // 원본 파일명
pds4VO.setFile1(file1);

size1 = fileItem.getSize(); // 파일 크기

if (size1 > 0) {
  if (size1 < 10485760) { // 1 ~ 10485760 byte
    fstor1 = upload.saveFile(fileItem, upDir); // Tomcat이 전송받은 파일을 서버에 저장
    pds4VO.setFstor1(fstor1); // 저장된 파일명 적용
    pds4VO.setSize1(size1);
    // 업로드 디렉토리, 소스 파일명, width, height
    if (Tool.isImage(fstor1)) {
      pds4VO.setThumb(Tool.preview(upDir, fstor1, 200, 150)); // Thumbnail 이미지 생성
    }
  } else {
%>
    <span class='span_warning'>
    전송 파일의 크기는 10 MB를 넘을 수 없습니다. 다시 시도해주세요.
    </span>
<%    
  }
} 

//--------------------------------------------------------------------
//MP3 파일 업로드 처리
//--------------------------------------------------------------------
FileItem fileItemMP3 = null; // 서버로 전송된 파일 객체
String mp3 = "";   // 사용자가 전송한 파일명
long sizeMP3 = 0;      // 원본 파일의 크기

//<input type='file' name='mp3' style='width: 100%;'>
fileItemMP3 = upload.getFileItem("mp3");
sizeMP3 = fileItemMP3.getSize(); // 파일 크기

if (sizeMP3 > 0) {
if (sizeMP3 < 104857600) { // 1 ~ 104857600 byte, 100 MB
 mp3 = upload.saveFile(fileItemMP3, upDir); // Tomcat이 전송받은 파일을 서버에 저장
 pds4VO.setMp3(mp3); // 저장된 파일명 VO 객체에 저장
} else {
%>
 <span class='span_warning'>
 전송 파일의 크기는 100 MB를 넘을 수 없습니다. 다시 시도해주세요.
 </span>
<%    
}
} 
//--------------------------------------------------------------------

// --------------------------------------------------------------------
// MP4 파일 업로드 처리
// --------------------------------------------------------------------
FileItem fileItemMP4 = null; // 서버로 전송된 파일 객체
String mp4 = "";   // 사용자가 전송한 파일명
long sizeMP4 = 0;      // 원본 파일의 크기
 
// <input type='file' name='mp4' style='width: 100%;'>
fileItemMP4 = upload.getFileItem("mp4");
sizeMP4 = fileItemMP4.getSize(); // 파일 크기
 
if (sizeMP4 > 0) {
  if (sizeMP4 < 1048576000) { // 1 ~ 1048576000 byte, 1000 MB
    mp4 = upload.saveFile(fileItemMP4, upDir); // Tomcat이 전송받은 파일을 서버에 저장
    pds4VO.setMp4(mp4); // 저장된 파일명 VO 객체에 저장
  } else {
%>
    <span class='span_warning'>
    전송 파일의 크기는 1000 MB(1GB)를 넘을 수 없습니다. 다시 시도해주세요.
    </span>
<%    
  }
} 
//--------------------------------------------------------------------

int count = 0;
count = pds4Proc.insert(pds4VO);
if (count == 1) {
   categoryProc.increaseCnt(categoryno);
%>
  <span class='span_info'>
    자료를 등록했습니다.
  </span>
<%    
} else {
%>
  <span class='span_warning'>
    자료 등록에 실패했습니다. 다시 시도해 주세요.
  </span>
<%
}
%>
  </DIV>  

  <DIV class='bottom_menu' style='text-align: center;'>
    <button type='button' onclick="location.href='./create_form.jsp?categoryno=<%=categoryno %>'">계속 등록</button>
    <button type='button' onclick="location.href='./list.jsp?categoryno=<%=categoryno %>'">목록</button>
  </DIV>
  
</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->

</body>
</html>


 