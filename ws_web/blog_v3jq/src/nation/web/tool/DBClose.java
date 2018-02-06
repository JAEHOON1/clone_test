package nation.web.tool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBClose {
  // INSERT, UPDATE, DELETE
  public void close(Connection con, PreparedStatement pstmt) {
    try {
      pstmt.close();
    } catch (Exception e) { // 하나의 문장을 쓰는 건 하나의 문장을 잡는단 뜻.
    }

    try {
      con.close();
    } catch (Exception e) {
    }
  }
  
  // SELECT
  public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
    try {
      rs.close();
    } catch (Exception e) { // 하나의 문장을 쓰는 건 하나의 문장을 잡는단 뜻.
    }
    
    try {
      pstmt.close();
    } catch (Exception e) { // 하나의 문장을 쓰는 건 하나의 문장을 잡는단 뜻.
    }

    try {
      con.close();
    } catch (Exception e) {
    }
  }
  
}
  