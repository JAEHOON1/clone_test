package nation.web.visitor4;

import java.util.ArrayList;

public class VisitorProc {
  private VisitorDAO visitorDAO;
  
  public VisitorProc() { // ������
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
   * �Ѱ��� ���ڵ� ��ȸ
   * @param visitorno ��ȣ
   * @return
   */
  public VisitorVO read(int visitorno) {
    VisitorVO visitorVO  = visitorDAO.read(visitorno);
    
    return visitorVO;
  }
  
  /**
   * �Ѱ��� ���ڵ� ����
   * @param visitorVO ������ ���ڵ� ��ü
   * @return
   */
  public int update (VisitorVO visitorVO) { // Call By Reference
    int count = visitorDAO.update(visitorVO);
    
    return count;
  }
  
  /**
   * �н����� üũ
   * @return 0:����ġ or 1: ��ġ
   */
  public int passwordCheck(int visitorno, String passwd) {
    int cnt = visitorDAO.passwordCheck(visitorno, passwd);
    
    return cnt;
  }
  
  /**
   * �Ѱ��� ���ڵ� ����
   * @param visitorno ������ ���ڵ� ��ȣ
   * @return ������ ���ڵ� ���� 1 or 0
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




