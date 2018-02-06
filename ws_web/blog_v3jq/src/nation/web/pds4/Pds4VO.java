package nation.web.pds4;

public class Pds4VO {
  /** 글 번호 */
  private int pdsno;
  /** 그룹 번호 */
  private int categoryno;
  /** 성명 */
  private String rname;
  /** 이메일 */
  private String email;
  /** 제목 */
  private String title;
  /** 내용 */
  private String content;
  /** 패스워드 */
  private String passwd;
  /** 조회수 */
  private int cnt;
  /** 등록일 */
  private String rdate;
  /** 관련 인터넷 주소 */
  private String web;
  /** 파일명 */
  private String file1;
  /** 실제 디스크상에 저장된 파일명 */
  private String fstor1;
  /** preview 이미지 */
  private String thumb;
  /** 저장된 파일 사이즈 */
  private long size1;
  /** Google 지도 API */
  private String map;
  /** Youtube */
  private String youtube;
  /** MP3 음악 파일 */
  private String mp3;
  /** MP4 영상 파일 */
  private String mp4;
  /** 등록한 컴퓨터의 ip */
  private String ip;
  /** 출력 여부 */
  private String visible;
  
  public Pds4VO() {

  }

  public Pds4VO(int pdsno, int categoryno, String rname, String email, String title, String content, String passwd,
      int cnt, String rdate, String web, String file1, String fstor1, String thumb, long size1, String map,
      String youtube, String mp3, String mp4, String ip, String visible) {
    this.pdsno = pdsno;
    this.categoryno = categoryno;
    this.rname = rname;
    this.email = email;
    this.title = title;
    this.content = content;
    this.passwd = passwd;
    this.cnt = cnt;
    this.rdate = rdate;
    this.web = web;
    this.file1 = file1;
    this.fstor1 = fstor1;
    this.thumb = thumb;
    this.size1 = size1;
    this.map = map;
    this.youtube = youtube;
    this.mp3 = mp3;
    this.mp4 = mp4;
    this.ip = ip;
    this.visible = visible;
  }

  public int getPdsno() {
    return pdsno;
  }

  public void setPdsno(int pdsno) {
    this.pdsno = pdsno;
  }

  public int getCategoryno() {
    return categoryno;
  }

  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }

  public String getRname() {
    return rname;
  }

  public void setRname(String rname) {
    this.rname = rname;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public String getWeb() {
    return web;
  }

  public void setWeb(String web) {
    this.web = web;
  }

  public String getFile1() {
    return file1;
  }

  public void setFile1(String file1) {
    this.file1 = file1;
  }

  public String getFstor1() {
    return fstor1;
  }

  public void setFstor1(String fstor1) {
    this.fstor1 = fstor1;
  }

  public String getThumb() {
    return thumb;
  }

  public void setThumb(String thumb) {
    this.thumb = thumb;
  }

  public long getSize1() {
    return size1;
  }

  public void setSize1(long size1) {
    this.size1 = size1;
  }

  public String getMap() {
    return map;
  }

  public void setMap(String map) {
    this.map = map;
  }

  public String getYoutube() {
    return youtube;
  }

  public void setYoutube(String youtube) {
    this.youtube = youtube;
  }

  public String getMp3() {
    return mp3;
  }

  public void setMp3(String mp3) {
    this.mp3 = mp3;
  }

  public String getMp4() {
    return mp4;
  }

  public void setMp4(String mp4) {
    this.mp4 = mp4;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getVisible() {
    return visible;
  }

  public void setVisible(String visible) {
    this.visible = visible;
  }
  
  
  
}
 






