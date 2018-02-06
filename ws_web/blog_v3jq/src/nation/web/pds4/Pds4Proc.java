package nation.web.pds4;

import java.util.ArrayList;

import nation.web.tool.Tool;

public class Pds4Proc {
  private Pds4DAO pds4DAO;
  
  public Pds4Proc() {
    pds4DAO = new Pds4DAO();
  }
  
  /**
   * 등록
   * @param pds4VO
   * @return 등록한 갯수
   */
  public int insert(Pds4VO pds4VO){ // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    count = pds4DAO.insert(pds4VO);
    
    return count;
  }
  
  /**
   * 모든 레코드
   * 
   * @return
   */
  public ArrayList<Pds4VO> list() {
    ArrayList<Pds4VO> list = null;
    
    list = pds4DAO.list();
    
    return list;
    
  } 
  
  /**
   * 카테고리별 레코드 목록
   * 
   * @return
   */
  public ArrayList<Pds4VO> list_category(int categoryno) {
    ArrayList<Pds4VO> list = null;
    
    list = pds4DAO.list_category(categoryno);
    
    return list;
    
  }
  
  /**
   * 조회
   * 
   * @return
   */
  public Pds4VO read(int pdsno){
    Pds4VO pds4VO = null;
    
    pds4DAO.increaseCnt(pdsno);  // 조회수 증가
    pds4VO = pds4DAO.read(pdsno);
    
    return pds4VO;
  } 
  
  /**
   * 패스워드를 검사합니다.
   * @param pdsno
   * @param passwd
   * @return
   */
  public int passwordCheck(int pdsno, String passwd){
    int count = 0;
    
    count = pds4DAO.passwordCheck(pdsno, passwd);
    
    return count;
  }
  
  /**
   * 글 수정
   * @param pds4VO
   * @return 등록한 갯수
   */
  public int update(Pds4VO pds4VO){ // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update(pds4VO);
    
    return count;
  }
  
  /**
   * Visible 모드 변경
   * @param pds4VO
   * @return 등록한 갯수
   */
  public int show_hide(int pdsno, String visible){ // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    
    if (visible.equals("Y")) {
      pds4DAO.show_hide(pdsno, "N");
    } else {
      pds4DAO.show_hide(pdsno, "Y");
    }
    return count;
    
  }
 
  /**
   * 파일 삭제
   * @param pdsno
   * @return
   */
  public int delete_file1(int pdsno) {
    int count = 0;                     // 처리된 레코드 갯수
    
    Pds4VO pds4VO = new Pds4VO();
    pds4VO.setFile1("");
    pds4VO.setFstor1("");
    pds4VO.setThumb("");
    pds4VO.setSize1(0);
    pds4VO.setPdsno(pdsno);
    
    count = pds4DAO.update_file1(pds4VO);
    
    return count;
  }
  
  /**
   * 파일 신규 등록
   * @param pdsno
   * @return
   */
  public int create_file1(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_file1(pds4VO);
    
    return count;
  }
  
  /**
   * 글 삭제
   * @param 
   * @return 처리한 갯수
   */
  public int delete(int pdsno){ 
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.delete(pdsno);
    
    return count;
  }
  
  /**
   * Map 변경
   * @param pdsno
   * @return
   */
  public int create_map(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_map(pds4VO);
    
    return count;
    
  }
  
  /**
   * Map 변경
   * @param pdsno
   * @return
   */
  public int replace_map(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_map(pds4VO);
    
    return count;
    
  }
 
  /**
   * Map 삭제
   * @param pdsno
   * @return
   */
  public int delete_map(int pdsno) {
    int count = 0;                     // 처리된 레코드 갯수
    
    Pds4VO pds4VO = new Pds4VO();
    pds4VO.setPdsno(pdsno);
    pds4VO.setMap(""); // 삭제
    
    count = pds4DAO.update_map(pds4VO);
    
    return count;

  }
    
  /**
   * youtube 등록
   * @param pdsno
   * @return
   */
  public int create_youtube(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_youtube(pds4VO);
    
    return count;
    
  }
   
  /**
   * youtube 변경
   * @param pdsno
   * @return
   */
  public int replace_youtube(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_youtube(pds4VO);
    
    return count;
    
  }
  
  /**
   * Youtube 삭제
   * @param pdsno
   * @return
   */
  public int delete_youtube(int pdsno) {
    int count = 0;                     // 처리된 레코드 갯수
    
    Pds4VO pds4VO = new Pds4VO();
    pds4VO.setPdsno(pdsno);
    pds4VO.setYoutube(""); // 삭제
    
    count = pds4DAO.update_youtube(pds4VO);
    
    return count;

  }
  /**
   * 신규 MP3 등록
   * @param pdsno
   * @return
   */
  public int create_mp3(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_mp3(pds4VO);
    
    return count;
  }
  
  /**
   * 신규 MP3 등록
   * @param pdsno
   * @return
   */
  public int replace_mp3(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_mp3(pds4VO);
    
    return count;
  }
  /**
   * 파일 변경
   * @param pdsno
   * @return
   */
  public int delete_mp3(int pdsno) {
    int count = 0;                     // 처리된 레코드 갯수
    
    Pds4VO pds4VO = new Pds4VO();
    pds4VO.setPdsno(pdsno);
    pds4VO.setMp3("");
    
    count = pds4DAO.update_mp3(pds4VO);
    
    return count;
  }
  
  /**
   * 신규 MP4 등록
   * @param pdsno
   * @return
   */
  public int create_mp4(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_mp4(pds4VO);
    
    return count;
  }
  
  /**
   * MP4 파일 변경
   * @param pdsno
   * @return
   */
  public int replace_mp4(Pds4VO pds4VO) {
    int count = 0;                     // 처리된 레코드 갯수
    
    count = pds4DAO.update_mp4(pds4VO);
    
    return count;
  }
  
  /**
   * MP4 파일 변경
   * @param pdsno
   * @return
   */
  public int delete_mp4(int pdsno) {
    int count = 0;                     // 처리된 레코드 갯수
    
    Pds4VO pds4VO = new Pds4VO();
    pds4VO.setPdsno(pdsno);
    pds4VO.setMp4("");
    
    count = pds4DAO.update_mp4(pds4VO);
    
    return count;
  }
  
  /**
   * 검색된 모든 레코드
   * 
   * @return
   */
  public ArrayList<Pds4VO> list(String col, String word) {
    ArrayList<Pds4VO> list = null;
    
    list = pds4DAO.list(col, word);
    
    for (int index=0; index < list.size(); index++) {
      // System.out.println("list.get(index).getMp3(): " + list.get(index).getMp3());
      Pds4VO pds4VO = list.get(index);
      
      String title = Tool.textLength(pds4VO.getTitle(), 10);
      pds4VO.setTitle(title);
    }  
    
    return list;
    
  }
 
  /**
   * 카테고리별로 검색된 레코드
   * 
   * @return
   */
  public ArrayList<Pds4VO> list_category(int categoryno, String col, String word) {
 
    ArrayList<Pds4VO> list = null;
    
    list = pds4DAO.list_category(categoryno, col, word);
    
    for (int index=0; index < list.size(); index++) {
      // System.out.println("list.get(index).getMp3(): " + list.get(index).getMp3());
      Pds4VO pds4VO = list.get(index);
      
      String title = Tool.textLength(pds4VO.getTitle(), 10);
      pds4VO.setTitle(title);
    }  
     
    return list;
    
  }
  
  /**
   * 카테고리별로 검색된 레코드
   * 
   * @return
   */
  public int count(int categoryno, String col, String word) {
    int count = 0;
    
    count = pds4DAO.count(categoryno, col, word);
    
    return count;
  }
  
 
  /**
   * 카테고리별로 검색 및 페이징이 구현된 목록, SELECT된 목록중에
   * 페이징 기법을 이용하여 특정 레코드 부분(10개)만 가져옵니다. 
   *  1 페이지: (nowPage 1 - 1) *  10 → 0 ~ 9 
   *  2 페이지: (nowPage 2 - 1) *  10 → 10 ~ 19 
   *  3 페이지: (nowPage 3 - 1) *  10 → 20 ~ 29 
   *  4 페이지: (nowPage 4 - 1) *  10 → 30 ~ 39 
   *  5 페이지: (nowPage 5 - 1) *  10 → 40 ~ 49  
   * @param categoryno 카테고리 번호
   * @param col 검색 컬럼
   * @param word 검색어
   * @param nowPage 현재페이지
   * @param offset skip할 레코드 갯수
   * @param recordPerPage 페이지당 출력할 레코드 갯수
   * @return 검색 목록
   */
  public ArrayList<Pds4VO> list_category(
      int categoryno, 
      String col, 
      String word, 
      int nowPage,
      int recordPerPage) {
    ArrayList<Pds4VO> list = new ArrayList<Pds4VO>();
 
    col = Tool.checkNull(col);
    word = Tool.checkNull(word);
    int offset  = (nowPage - 1) * recordPerPage; // skip할 레코드 수
    
    list = pds4DAO.list_category(categoryno, col, word, offset, recordPerPage);
    
    return list;
  }
  
  /**
   * 카테고리별 레코드 갯수
   * 
   * @return
   */
  public int countByCategory(int categoryno) {
    int count = 0;
    
    count = pds4DAO.countByCategory(categoryno);
    
    return count;
  }
}

 