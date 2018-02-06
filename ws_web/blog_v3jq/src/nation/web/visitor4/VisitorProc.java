package nation.web.visitor4;

import java.util.ArrayList;

public class VisitorProc {
  private VisitorDAO visitorDAO;
  
  public VisitorProc() { // 생성자
    visitorDAO = new VisitorDAO();
  }
  
  public int insert(VisitorVO visitorVO) { // Call By Reference
    int count = visitorDAO.insert(visitorVO);
    
    return count;
  }
  
  public ArrayList<VisitorVO> list() {
    ArrayList<VisitorVO> list = visitorDAO.list();
    
    return list;
  }
  
  /**
   * 한건의 레코드 조회
   * @param visitorno 번호
   * @return
   */
  public VisitorVO read(int visitorno) {
    VisitorVO visitorVO  = visitorDAO.read(visitorno);
    
    return visitorVO;
  }
  
  /**
   * 한건의 레코드 변경
   * @param visitorVO 변경할 레코드 객체
   * @return
   */
  public int update (VisitorVO visitorVO) { // Call By Reference
    int count = visitorDAO.update(visitorVO);
    
    return count;
  }
  
  /**
   * 패스워드 체크
   * @return 0:불일치 or 1: 일치
   */
  public int passwordCheck(int visitorno, String passwd) {
    int cnt = visitorDAO.passwordCheck(visitorno, passwd);
    
    return cnt;
  }
  
  /**
   * 한건의 레코드 삭제
   * @param visitorno 삭제할 레코드 번호
   * @return 삭제된 레코드 갯수 1 or 0
   */
  public int delete (int visitorno) { // Call By Value
    int count = visitorDAO.delete(visitorno);
    
    return count;
  }

  public ArrayList<VisitorVO> list_home(int cnt) {
    ArrayList<VisitorVO> list = visitorDAO.list_home(cnt);
    
    return list;
  }
  
}




