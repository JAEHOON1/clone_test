package nation.web.notice3;

/*
  noticeno INT                NOT NULL AUTO_INCREMENT COMMENT '번호',
  title       VARCHAR(100) NOT NULL COMMENT '내용',
  rname    VARCHAR(15)  NOT NULL COMMENT '성명',
  rdate     DATETIME       NOT NULL COMMENT '등록일', */
public class NoticeVO {
  private int noticeno;
  private String title;
  private String rname;
  private String rdate;
  
  public NoticeVO() {

  }

  public NoticeVO(int noticeno, String title, String rname, String rdate) {
    this.noticeno = noticeno;
    this.title = title;
    this.rname = rname;
    this.rdate = rdate;
  }

  public int getNoticeno() {
    // noticeno = noticeno + 10;
    return noticeno;
  }

  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getRname() {
    return rname;
  }

  public void setRname(String rname) {
    this.rname = rname;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  
  
}
 