package nation.web.visitor4;

/*
   CREATE TABLE visitor( 
     visitorno  INT     NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 공지사항 번호
     content   VARCHAR(1000)  NOT NULL, -- 내용, 1000 자
     rname     VARCHAR(15)    NOT NULL, -- 등록자
     passwd   VARCHAR(15)    NOT NULL, -- 패스워드
     home     VARCHAR(200)          NULL, -- Homepage
     email     VARCHAR(100)           NULL, -- Email
     rdate     DATETIME         NOT NULL  -- 등록일
   );  
 */
public class VisitorVO {
  private int visitorno;
  private String content;
  private String rname; 
  private String passwd;
  private String home;
  private String email;
  private String rdate;
  
  public VisitorVO() {

  }

  public VisitorVO(int visitorno, String content, String rname, String passwd, String home, String email,
      String rdate) {
    this.visitorno = visitorno;
    this.content = content;
    this.rname = rname;
    this.passwd = passwd;
    this.home = home;
    this.email = email;
    this.rdate = rdate;
  }

  public int getVisitorno() {
    return visitorno;
  }

  public void setVisitorno(int visitorno) {
    this.visitorno = visitorno;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getRname() {
    return rname;
  }

  public void setRname(String rname) {
    this.rname = rname;
  }

  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }

  public String getHome() {
    return home;
  }

  public void setHome(String home) {
    this.home = home;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  

}



