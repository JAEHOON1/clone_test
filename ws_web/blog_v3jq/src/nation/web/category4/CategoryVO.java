package nation.web.category4;

/*
  categoryno INT                           NOT NULL AUTO_INCREMENT,
  title           VARCHAR(20)             NOT NULL, -- 게시판 제목
  seqno        INT DEFAULT 1           NOT NULL,  -- 출력 순서
  visible        CHAR(1) DEFAULT 'Y'   NOT NULL,  -- 출력 선택
  ids            VARCHAR(200) DEFAULT 'admin' NOT NULL, -- 접근 계정 목록
  cnt            INT                DEFAULT 0         NOT NULL, -- 등록된 자료수

 */
public class CategoryVO {
  private int categoryno;
  private String title;
  private int seqno;
  private String visible;
  private String ids;
  private int cnt;
  
  public CategoryVO() {

  }

  public CategoryVO(int categoryno, String title, int seqno, String visible, String ids, int cnt) {
    this.categoryno = categoryno;
    this.title = title;
    this.seqno = seqno;
    this.visible = visible;
    this.ids = ids;
    this.cnt = cnt;
  }

  public int getCategoryno() {
    return categoryno;
  }

  public void setCategoryno(int categoryno) {
    this.categoryno = categoryno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public int getSeqno() {
    return seqno;
  }

  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }

  public String getVisible() {
    return visible;
  }

  public void setVisible(String visible) {
    this.visible = visible;
  }

  public String getIds() {
    return ids;
  }

  public void setIds(String ids) {
    this.ids = ids;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
} 
 
 