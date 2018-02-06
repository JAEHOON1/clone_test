package nation.web.visitor4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class VisitorDAO {
  private Connection con = null;              // DBMS ����   
  private PreparedStatement pstmt = null; // SQL ����
  private ResultSet rs = null;                   // SELECT ����� ����
  private StringBuffer sql = null;              // SQL ����
  
  private DBOpen dbopen = null;
  private DBClose dbclose = null;
  
  public VisitorDAO() { // ������
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  public int insert(VisitorVO visitorVO) { // Call By Reference
    int count = 0; // ó���� ���ڵ� ����
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" INSERT INTO visitor(content, rname, passwd, home, email, rdate)");
      sql.append(" VALUES(?, ?, ?, ?, ?, now())");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setString(1,  visitorVO.getContent());
      pstmt.setString(2,  visitorVO.getRname());
      pstmt.setString(3,  visitorVO.getPasswd());
      pstmt.setString(4,  visitorVO.getHome());
      pstmt.setString(5,  visitorVO.getEmail());
      
      count = pstmt.executeUpdate();  // INSERT, UPDATE, DELETE SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
  
  // ArrayList<VisitorVO>: ArrayList�� ������ VisitorVO Ŭ������ ��ü�� ������.
  public ArrayList<VisitorVO> list() {
    ArrayList<VisitorVO> list = null; // ���� ����
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT visitorno, content, rname, passwd, home, email, substring(rdate, 1, 10) as rdate"); // �� �տ� ���� �� ĭ�� �־����.
      sql.append(" FROM visitor");
      sql.append(" ORDER BY visitorno DESC");

      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      rs = pstmt.executeQuery(); // SELECT SQL ����

      list = new ArrayList<VisitorVO>();
      while(rs.next()) { // ���ڵ� �̵�
        VisitorVO visitorVO = new VisitorVO(); // ���ڵ忡 ������ ��ü ����
        // DBMS �÷��� �� -> JAVA ������ ������ �����մϴ�.
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
   * �Ѱ��� ���ڵ� ��ȸ
   * @param visitorno ��ȣ
   * @return ��ȸ�� ���ڵ� ��ü
   */
  public VisitorVO read(int visitorno) {
    VisitorVO visitorVO = null; // ���� ����
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT visitorno, content, rname, passwd, home, email, substring(rdate, 1, 10) as rdate"); // �� �տ� ���� �� ĭ�� �־����.
      sql.append(" FROM visitor");
      sql.append(" WHERE visitorno = ?");
  
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setInt(1, visitorno);
      rs = pstmt.executeQuery(); // SELECT SQL ����
  
      while(rs.next()) { // ���ڵ� �̵�
        visitorVO = new VisitorVO(); // ���ڵ忡 ������ ��ü ����
        // DBMS �÷��� �� -> JAVA ������ ������ �����մϴ�.
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
   * �Ѱ��� ���ڵ� ����
   * @param visitorVO ������ ���ڵ� ��ü
   * @return
   */
  public int update (VisitorVO visitorVO) { // Call By Reference
    int count = 0; // ó���� ���ڵ� ����
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" UPDATE visitor");
      sql.append(" SET content = ?, rname = ?, home=?, email=? ");
      sql.append(" WHERE visitorno = ?");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setString(1,  visitorVO.getContent());
      pstmt.setString(2,  visitorVO.getRname());
      pstmt.setString(3,  visitorVO.getHome());
      pstmt.setString(4,  visitorVO.getEmail());
      pstmt.setInt(5,  visitorVO.getVisitorno());
      
      count = pstmt.executeUpdate();  // INSERT, UPDATE, DELETE SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }
 
  /**
   * �н����� üũ
   * @return 0:����ġ or 1: ��ġ
   */
  public int passwordCheck(int visitorno, String passwd) {
    int cnt = 0; // ó���� ���ڵ� ����
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt"); // �� �տ� ���� �� ĭ�� �־����.
      sql.append(" FROM visitor");
      sql.append(" WHERE visitorno=? AND passwd=?");
  
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setInt(1, visitorno);
      pstmt.setString(2, passwd);
      rs = pstmt.executeQuery(); // SELECT SQL ����
  
      if (rs.next()) { // ���ڵ� �̵�
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
   * �Ѱ��� ���ڵ� ����
   */
  public int delete (int visitorno) { // Call By Value
    int count = 0; // ó���� ���ڵ� ����
    
    try {
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" DELETE FROM visitor");
      sql.append(" WHERE visitorno = ?");
      
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setInt(1,  visitorno);
      
      count = pstmt.executeUpdate();  // INSERT, UPDATE, DELETE SQL ����
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt);
    }
    
    return count;
  }

  // ArrayList<VisitorVO>: ArrayList�� ������ VisitorVO Ŭ������ ��ü�� ������.
  public ArrayList<VisitorVO> list_home(int cnt) {
    ArrayList<VisitorVO> list = null; // ���� ����
    
    try {
      con = new DBOpen().getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT visitorno, content, rname, passwd, home, email, substring(rdate, 1, 10) as rdate"); // �� �տ� ���� �� ĭ�� �־����.
      sql.append(" FROM visitor");
      sql.append(" ORDER BY visitorno DESC");
      sql.append(" LIMIT ?");
  
      pstmt = con.prepareStatement(sql.toString()); // SQL ���� ��ü ����
      pstmt.setInt(1, cnt);
      rs = pstmt.executeQuery(); // SELECT SQL ����
  
      list = new ArrayList<VisitorVO>();
      while(rs.next()) { // ���ڵ� �̵�
        VisitorVO visitorVO = new VisitorVO(); // ���ڵ忡 ������ ��ü ����
        // DBMS �÷��� �� -> JAVA ������ ������ �����մϴ�.
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
