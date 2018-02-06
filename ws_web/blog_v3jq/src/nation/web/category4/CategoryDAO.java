package nation.web.category4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class CategoryDAO {
  private Connection con = null;              // DBMS 연결   
  private PreparedStatement pstmt = null; // SQL 실행
  private ResultSet rs = null;                   // SELECT 결과를 저장
  private StringBuffer sql = null;              // SQL 저장
  
  private DBOpen dbopen = null;
  private DBClose dbclose = null;
  
  public CategoryDAO() {
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  /**
   * 카테고리 등록
   * @param categoryVO
   * @return 등록된 갯수 1 or 0
   */
  public int insert(CategoryVO categoryVO){ // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" INSERT INTO category(title, seqno, visible, ids, cnt)");
      sql.append(" VALUES(?, ?, ?, ?, 0)");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, categoryVO.getTitle());
      pstmt.setInt(2, categoryVO.getSeqno());
      pstmt.setString(3, categoryVO.getVisible());
      pstmt.setString(4, categoryVO.getIds());
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }  
 
  /**
   * 전체 목록
   * @return
   */
  public ArrayList<CategoryVO> list(){
    ArrayList<CategoryVO> list = new ArrayList<CategoryVO>();
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT categoryno, title, seqno, visible, ids, cnt");
      sql.append(" FROM category");
      // sql.append(" ORDER BY categoryno ASC");
      sql.append(" ORDER BY seqno ASC");
      
      pstmt = con.prepareStatement(sql.toString());
      rs = pstmt.executeQuery();
      while(rs.next()) { // 레코드 갯수만큼 vo 객체 생성
        CategoryVO categoryVO = new CategoryVO();
        categoryVO.setCategoryno(rs.getInt("categoryno"));
        categoryVO.setTitle(rs.getString("title"));
        categoryVO.setSeqno(rs.getInt("seqno"));
        categoryVO.setVisible(rs.getString("visible"));
        categoryVO.setIds(rs.getString("ids"));
        categoryVO.setCnt(rs.getInt("cnt"));
        list.add(categoryVO);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }
      
    return list;
  }  
  
  /**
   * 조회
   * @param categoryno Category 번호
   * @return
   */
  public CategoryVO read(int categoryno){
    CategoryVO categoryVO = new CategoryVO();
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT categoryno, title, seqno, visible, ids, cnt");
      sql.append(" FROM category");
      sql.append(" WHERE categoryno = ?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, categoryno);
      
      rs = pstmt.executeQuery();
      if (rs.next()) { // 레코드 갯수만큼 newsVO 객체 생성
        categoryVO.setCategoryno(rs.getInt("categoryno"));
        categoryVO.setTitle(rs.getString("title"));
        categoryVO.setSeqno(rs.getInt("seqno"));
        categoryVO.setVisible(rs.getString("visible"));
        categoryVO.setIds(rs.getString("ids"));
        categoryVO.setCnt(rs.getInt("cnt"));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }
      
    return categoryVO;
  }
   
  /**
   * Category 수정
   * @param CategoryVO
   * @return 등록한 갯수
   */
  public int update(CategoryVO categoryVO){ // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE category");
      sql.append(" SET title=?, seqno=?, visible=?, ids=?");
      sql.append(" WHERE categoryno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, categoryVO.getTitle());
      pstmt.setInt(2, categoryVO.getSeqno());
      pstmt.setString(3, categoryVO.getVisible());
      pstmt.setString(4, categoryVO.getIds());
      pstmt.setInt(5, categoryVO.getCategoryno());
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
   
  /**
   * Category 삭제
   * @param categoryno
   * @return 삭제한 갯수
   */
  public int delete(int categoryno){ 
    int count = 0;                         // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" DELETE FROM category");
      sql.append(" WHERE categoryno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, categoryno);
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }  
    
  /**
   * 우선순의 하향
   * @param categoryno
   * @return
   */
  public int low(int categoryno) { // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE category");
      sql.append(" SET seqno = seqno + 1");
      sql.append(" WHERE categoryno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, categoryno);
 
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
  /**
   * 우선순위 상향.  
   * @param categoryno
   * @return
   */
  public int high(int categoryno) { // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE category");
      sql.append(" SET seqno = seqno - 1");
      sql.append(" WHERE categoryno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, categoryno);
 
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
  /**
   * 게시판 출력
   * @param categoryno
   * @return 수정한 갯수
   */
  public int show(int categoryno){
    int count = 0;                     // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE category");
      sql.append(" SET visible='Y'");
      sql.append(" WHERE categoryno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, categoryno);
      
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
  /**
   * 게시판 숨김
   * @param categoryno
   * @return 수정한 갯수
   */
  public int hide(int categoryno){
    int count = 0;                     // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE category");
      sql.append(" SET visible='N'");
      sql.append(" WHERE categoryno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, categoryno);
      
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
 
  public int getMaxSeqno() {
    int seqno = 0;
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT MAX(seqno)+1 as seqno ");
      sql.append(" FROM category");
      
      pstmt = con.prepareStatement(sql.toString());
      
      rs = pstmt.executeQuery();
      if (rs.next()) { // 레코드 갯수만큼 newsVO 객체 생성
        seqno = rs.getInt("seqno");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }
      
    return seqno;
  }
   
  /**
   * 관련 게시판 글수의 증가
   * @param categoryno
   * @return
   */
  public int increaseCnt(int categoryno) { // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE category");
      sql.append(" SET cnt = cnt + 1");
      sql.append(" WHERE categoryno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, categoryno);
  
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
 
  /**
   * 관련 게시판 글수의 감소
   * @param categoryno
   * @return
   */
  public int decreaseCnt(int categoryno) { // call by reference
    int count = 0;                     // 처리된 레코드 갯수
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE category");
      sql.append(" SET cnt = cnt - 1");
      sql.append(" WHERE categoryno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, categoryno);
  
      count = pstmt.executeUpdate();
      
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
}



