package nation.web.category4;

import java.util.ArrayList;

public class CategoryProc {
  private CategoryDAO categoryDAO;
  
  public CategoryProc() {
    categoryDAO = new CategoryDAO();
  }
  
  /**
   * 카테고리 등록
   * @param categoryVO
   * @return 등록된 갯수 1 or 0
   */
  public int insert(CategoryVO categoryVO){
    int count = categoryDAO.insert(categoryVO);
    
    return count;
  } 
  
  /**
   * 전체 목록
   * @return
   */
  public ArrayList<CategoryVO> list() {
    ArrayList<CategoryVO> list = categoryDAO.list();
    
    return list;
  }

  public CategoryVO read(int categoryno){
    CategoryVO categoryVO = categoryDAO.read(categoryno);
    
    return categoryVO;
  }
  
  /**
   * Category 수정
   * @param CategoryVO
   * @return 등록한 갯수
   */
  public int update(CategoryVO categoryVO){ // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    
    count = categoryDAO.update(categoryVO);
    
    return count;
  }
  
  /**
   * Category 삭제
   * @param categoryno
   * @return 삭제한 갯수
   */
  public int delete(int categoryno){ 
    int count = 0;                     // 처리된 레코드 갯수
    
    count = categoryDAO.delete(categoryno);
    
    return count;
  }
 
  /**
   * 우선순의 하향
   * @param categoryno
   * @return
   */
  public int low(int categoryno) { // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    
    count = categoryDAO.low(categoryno);
    
    return count;
  }
  
  /**
   * 우선순의 상향
   * @param categoryno
   * @return
   */
  public int high(int categoryno) { // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    
    count = categoryDAO.high(categoryno);
    
    return count;
  }
   
  /**
   * 게시판 출력 변경
   * @param categoryVO
   * @return 수정한 갯수
   */
  public int show_hide(int categoryno, String visible){
    int count = 0;
    if (visible.equals("Y")) {
      count = categoryDAO.hide(categoryno); // N
    } else {
      count = categoryDAO.show(categoryno); // Y
    }
    
    return count;
  }
  
  public int getMaxSeqno() {
    int seqno = 0;
    seqno = categoryDAO.getMaxSeqno();
    
    return seqno;
  }
  /**
   * 관련 게시판 글수의 증가
   * @param categoryno
   * @return
   */
  public int increaseCnt(int categoryno) { // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    
    count = categoryDAO.increaseCnt(categoryno);
    
    return count;
  }
 
  /**
   * 관련 게시판 글수의 감소
   * @param categoryno
   * @return
   */
  public int decreaseCnt(int categoryno) { // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    
    count = categoryDAO.decreaseCnt(categoryno);
    
    return count;
  }
}

