package nation.web.visitor4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class VisitorDAO {
  private Connection con = null;              // DBMS 연결   
  private PreparedStatement pstmt = null; // SQL 실행
  private ResultSet rs = null;                   // SELECT 결과를 저장
  private StringBuffer sql = null;              // SQL 저장
  
  private DBOpen dbopen = null;
  private DBClose dbclose = null;
  
  public VisitorDAO() { // 생성자
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  public int insert(VisitorVO visitorVO) { // Call By Reference
    int count = 0; // 처리된 레코드 갯수
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" INSERT INTO visitor(content, rname, passwd, home, email, rdate)");
      sql.append(" VALUES(?, ?, ?, ?, ?, now())");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
      pstmt.setString(1,  visitorVO.getContent());
      pstmt.setString(2,  visitorVO.getRname());
      pstmt.setString(3,  visitorVO.getPasswd());
      pstmt.setString(4,  visitorVO.getHome());
      pstmt.setString(5,  visitorVO.getEmail());
      
      count = pstmt.executeUpdate();  // INSERT, UPDATE, DELETE SQL 실행
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
  // ArrayList<VisitorVO>: ArrayList의 값으로 VisitorVO 클래스의 객체만 가능함.
  public ArrayList<VisitorVO> list() {
    ArrayList<VisitorVO> list = null; // 지역 변수
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT visitorno, content, rname, passwd, home, email, substring(rdate, 1, 10) as rdate"); // 맨 앞에 공백 한 칸이 있어야함.
      sql.append(" FROM visitor");
      sql.append(" ORDER BY visitorno DESC");

      pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
      rs = pstmt.executeQuery(); // SELECT SQL 실행

      list = new ArrayList<VisitorVO>();
      while(rs.next()) { // 레코드 이동
        VisitorVO visitorVO = new VisitorVO(); // 레코드에 대응할 객체 생성
        // DBMS 컬럼의 값 -> JAVA 변수의 값으로 대입합니다.
        visitorVO.setVisitorno(rs.getInt("visitorno"));
        visitorVO.setContent(rs.getString("content"));
        visitorVO.setRname(rs.getString("rname"));
        visitorVO.setPasswd(rs.getString("passwd"));
        visitorVO.setHome(rs.getString("home"));
        visitorVO.setEmail(rs.getString("email"));
        visitorVO.setRdate(rs.getString("rdate"));
        
        list.add(visitorVO);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }
    
    return list;
  }

  /**
   * 한건의 레코드 조회
   * @param visitorno 번호
   * @return 조회된 레코드 객체
   */
  public VisitorVO read(int visitorno) {
    VisitorVO visitorVO = null; // 지역 변수
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT visitorno, content, rname, passwd, home, email, substring(rdate, 1, 10) as rdate"); // 맨 앞에 공백 한 칸이 있어야함.
      sql.append(" FROM visitor");
      sql.append(" WHERE visitorno = ?");
  
      pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
      pstmt.setInt(1, visitorno);
      rs = pstmt.executeQuery(); // SELECT SQL 실행
  
      while(rs.next()) { // 레코드 이동
        visitorVO = new VisitorVO(); // 레코드에 대응할 객체 생성
        // DBMS 컬럼의 값 -> JAVA 변수의 값으로 대입합니다.
        visitorVO.setVisitorno(rs.getInt("visitorno"));
        visitorVO.setContent(rs.getString("content"));
        visitorVO.setRname(rs.getString("rname"));
        visitorVO.setPasswd(rs.getString("passwd"));
        visitorVO.setHome(rs.getString("home"));
        visitorVO.setEmail(rs.getString("email"));
        visitorVO.setRdate(rs.getString("rdate"));
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }
    
    return visitorVO;
  }

  /**
   * 한건의 레코드 변경
   * @param visitorVO 변경할 레코드 객체
   * @return
   */
  public int update (VisitorVO visitorVO) { // Call By Reference
    int count = 0; // 처리된 레코드 갯수
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE visitor");
      sql.append(" SET content = ?, rname = ?, home=?, email=? ");
      sql.append(" WHERE visitorno = ?");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
      pstmt.setString(1,  visitorVO.getContent());
      pstmt.setString(2,  visitorVO.getRname());
      pstmt.setString(3,  visitorVO.getHome());
      pstmt.setString(4,  visitorVO.getEmail());
      pstmt.setInt(5,  visitorVO.getVisitorno());
      
      count = pstmt.executeUpdate();  // INSERT, UPDATE, DELETE SQL 실행
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
 
  /**
   * 패스워드 체크
   * @return 0:불일치 or 1: 일치
   */
  public int passwordCheck(int visitorno, String passwd) {
    int cnt = 0; // 처리된 레코드 갯수
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt"); // 맨 앞에 공백 한 칸이 있어야함.
      sql.append(" FROM visitor");
      sql.append(" WHERE visitorno=? AND passwd=?");
  
      pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
      pstmt.setInt(1, visitorno);
      pstmt.setString(2, passwd);
      rs = pstmt.executeQuery(); // SELECT SQL 실행
  
      if (rs.next()) { // 레코드 이동
        cnt = rs.getInt("cnt");
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }
    
    return cnt;
  }

  /**
   * 한건의 레코드 삭제
   */
  public int delete (int visitorno) { // Call By Value
    int count = 0; // 처리된 레코드 갯수
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" DELETE FROM visitor");
      sql.append(" WHERE visitorno = ?");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
      pstmt.setInt(1,  visitorno);
      
      count = pstmt.executeUpdate();  // INSERT, UPDATE, DELETE SQL 실행
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }

  // ArrayList<VisitorVO>: ArrayList의 값으로 VisitorVO 클래스의 객체만 가능함.
  public ArrayList<VisitorVO> list_home(int cnt) {
    ArrayList<VisitorVO> list = null; // 지역 변수
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT visitorno, content, rname, passwd, home, email, substring(rdate, 1, 10) as rdate"); // 맨 앞에 공백 한 칸이 있어야함.
      sql.append(" FROM visitor");
      sql.append(" ORDER BY visitorno DESC");
      sql.append(" LIMIT ?");
  
      pstmt = con.prepareStatement(sql.toString()); // SQL 실행 객체 생성
      pstmt.setInt(1, cnt);
      rs = pstmt.executeQuery(); // SELECT SQL 실행
  
      list = new ArrayList<VisitorVO>();
      while(rs.next()) { // 레코드 이동
        VisitorVO visitorVO = new VisitorVO(); // 레코드에 대응할 객체 생성
        // DBMS 컬럼의 값 -> JAVA 변수의 값으로 대입합니다.
        visitorVO.setVisitorno(rs.getInt("visitorno"));
        visitorVO.setContent(rs.getString("content"));
        visitorVO.setRname(rs.getString("rname"));
        visitorVO.setPasswd(rs.getString("passwd"));
        visitorVO.setHome(rs.getString("home"));
        visitorVO.setEmail(rs.getString("email"));
        visitorVO.setRdate(rs.getString("rdate"));
        
        list.add(visitorVO);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }
    
    return list;
  }

}
