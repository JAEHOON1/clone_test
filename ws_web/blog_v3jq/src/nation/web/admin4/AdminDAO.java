package nation.web.admin4;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;
 
public class AdminDAO {
  private Connection con = null;              // DBMS ����   
  private PreparedStatement pstmt = null; // SQL ����
  private ResultSet rs = null;                   // SELECT ����� ����
  private StringBuffer sql = null;              // SQL ����
  
  private DBOpen dbopen = null;
  private DBClose dbclose = null;
  
  public AdminDAO() {
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  /**
   * �˻��� ���ڵ� ������ ���մϴ�.
   * @param col �˻� �÷�
   * @param word �˻���
   * @return �˻��� ����
   */
  public int count(String col, String word){ 
    int count = 0;
    
    try {
      con = dbopen.getConnection();
  
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt ");
      sql.append(" FROM admin4");
     
      if (col.equals("email")) {
        sql.append(" WHERE email = ?");
      }
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, word);
  
      rs = pstmt.executeQuery(); // SELECT
  
      if (rs.next() == true) {
        count = rs.getInt("cnt");
      }
  
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }
  
    return count;
    
  }
  
  /**
   * Master ������ �ִ��� �˻��մϴ�.
   * @return 1: ������ ���� ����, 0: �������� ����.
   */
  public int isMaster(){
    int count = 0;              // ���ڵ� ����
 
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt ");
      sql.append(" FROM admin4 ");
      sql.append(" WHERE act='M'");
        
      pstmt = con.prepareStatement(sql.toString());
      rs= pstmt.executeQuery();  // SELECT
      rs.next();  // ù��° ���ڵ�� �̵�, 0 or 
      count = rs.getInt("cnt");     
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return count;
  }
  
 
  /**
   * ������ ���
   * @param admin4VO ������ ����
   * @return 1: ��� ����, 0: ��� ����
   */
  public int insert(Admin4VO admin4VO){
    int count = 0;
    
    try {
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" INSERT INTO admin4(email, passwd, auth, act, confirm, mdate)");
      sql.append(" VALUES(?, ?, ?, ?, ?, now())");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, admin4VO.getEmail());
      pstmt.setString(2, admin4VO.getPasswd());
      pstmt.setString(3, admin4VO.getAuth());
      pstmt.setString(4, admin4VO.getAct());
      pstmt.setString(5, admin4VO.getConfirm());
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  
  /**
   * ����ڰ� ȸ�� ���� �̸��� ��ũ�� ������ ����� ó��
   * @param email �̸���
   * @param auth ���� �ڵ�
   * @return ó���� ���ڵ� ����
   */
  public int confirm(String email, String auth){
    int count = 0;
    
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" UPDATE admin4");
      sql.append(" SET confirm = 'Y'");
      sql.append(" WHERE email=? AND auth=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setString(2, auth);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }  
  /**
   * �ܼ� ����� ���մϴ�.
   * @return ���
   */
  public ArrayList<Admin4VO> list(){
    ArrayList<Admin4VO> list = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin4no, email, auth, act, confirm, mdate ");
      sql.append(" FROM admin4 ");
      sql.append(" ORDER BY email ASC");
        
      pstmt = con.prepareStatement(sql.toString());
      rs= pstmt.executeQuery();  // SELECT
      
      list = new ArrayList<Admin4VO>();
      while(rs.next() == true){
        Admin4VO admin4VO = new Admin4VO();
        admin4VO.setAdmin4no(rs.getInt("admin4no"));
        admin4VO.setEmail(rs.getString("email"));
        admin4VO.setAuth(rs.getString("auth"));
        admin4VO.setAct(rs.getString("act"));
        admin4VO.setConfirm(rs.getString("confirm"));
        admin4VO.setMdate(rs.getString("mdate"));
        
        list.add(admin4VO);
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return list;
  }
  
  /**
   * ������ �����մϴ�.
   * @param admin4no ������ ȸ�� ��ȣ
   * @param act ����
   * @return ����� ���ڵ� ��
   */
  public int updateAct(int admin4no, String act){
    int count = 0;            // ó���� ���ڵ� ����
 
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" UPDATE admin4");
      sql.append(" SET act = ?");
      sql.append(" WHERE admin4no=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, act);
      pstmt.setInt(2, admin4no);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  /**
   * �н����尡 ��ġ�ϴ��� Ȯ���մϴ�.
   * @param admin4no ȸ�� ��ȣ
   * @param passwd �н�����
   * @return 1: ��ġ, 0: ����ġ
   */
  public int countPasswd(int admin4no, String passwd){
    int count = 0;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt ");
      sql.append(" FROM admin4 ");
      sql.append(" WHERE admin4no=? AND passwd=?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin4no);
      pstmt.setString(2, passwd);
      
      rs= pstmt.executeQuery();  // SELECT
      rs.next();  // ù��° ���ڵ�� �̵�, 0 or 
      count = rs.getInt("cnt");     
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return count;
  }  
 
 
 /**
   * �н����带 �����մϴ�.
   * @param admin4no ������ ȸ�� ��ȣ
   * @param passwd ������ �н�����
   * @return 1: ���� ����, 2: ���� ����
   */
  public int updatePasswd(int admin4no, String passwd){
    int count = 0;
    
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" UPDATE admin4");
      sql.append(" SET passwd=?");
      sql.append(" WHERE admin4no=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, passwd);
      pstmt.setInt(2, admin4no);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * @param admin4no ��ȸ�� ��ȣ
   * @return
   */
  public Admin4VO read(int admin4no){
    Admin4VO vo = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin4no, email, passwd, auth, act, confirm, mdate ");
      sql.append(" FROM admin4 ");
      sql.append(" WHERE admin4no = ?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin4no);
      rs= pstmt.executeQuery();  // SELECT
      
      vo = new Admin4VO();
      if(rs.next() == true){
        vo.setAdmin4no(rs.getInt("admin4no"));
        vo.setEmail(rs.getString("email"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setAuth(rs.getString("auth"));
        vo.setAct(rs.getString("act"));
        vo.setConfirm(rs.getString("confirm"));
        vo.setMdate(rs.getString("mdate"));
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return vo;
  }
 
  /**
   * ȸ�� ������ �����մϴ�.
   * @param admin4no ȸ�� ��ȣ
   * @param email ������ �̸���
   * @return ����� ���ڵ� ����
   */
  public int update(int admin4no, String email){
    int count = 0;
    
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" UPDATE admin4");
      sql.append(" SET email=?");
      sql.append(" WHERE admin4no=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setInt(2, admin4no);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  /**
   * ȸ���� �����մϴ�.
   * @param admin4no ������ ȸ�� ��ȣ
   * @return �赥�� ���ڵ� ����
   */
  public int delete(int admin4no){
    int count = 0;
    
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" DELETE FROM admin4");
      sql.append(" WHERE admin4no=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin4no);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  
  /**
   * �α��� ó��
   * @param email �̸���
   * @param passwd �н�����
   * @return ���ڵ� ����
   */
  public int login(String email, String passwd){
    int count = 0;              // ���ڵ� ����
 
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt ");
      sql.append(" FROM admin4 ");
      sql.append(" WHERE email=? AND passwd=?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setString(2, passwd);
      
      rs= pstmt.executeQuery();  // SELECT
      rs.next();  // ù��° ���ڵ�� �̵�, 0 or 
      count = rs.getInt("cnt");     
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return count;
  }
 
 
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * @param email ��ȸ�� �̸���
   * @return
   */
  public Admin4VO read(String email){
    Admin4VO admin4VO = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin4no, email, passwd, auth, act, confirm, mdate ");
      sql.append(" FROM admin4 ");
      sql.append(" WHERE email = ?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      rs= pstmt.executeQuery();  // SELECT
      
      admin4VO = new Admin4VO();
      if(rs.next() == true){
        admin4VO.setAdmin4no(rs.getInt("admin4no"));
        admin4VO.setEmail(rs.getString("email"));
        admin4VO.setPasswd(rs.getString("passwd"));
        admin4VO.setAuth(rs.getString("auth"));
        admin4VO.setAct(rs.getString("act"));
        admin4VO.setConfirm(rs.getString("confirm"));
        admin4VO.setMdate(rs.getString("mdate"));
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return admin4VO;
  }
}
 