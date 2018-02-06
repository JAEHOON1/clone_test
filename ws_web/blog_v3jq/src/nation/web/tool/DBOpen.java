package nation.web.tool;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
  public Connection getConnection() {
    Connection con = null;              // DBMS ����   
    
    String className = "org.gjt.mm.mysql.Driver"; // MySQL ���� Drvier 
    String url = "jdbc:mysql://localhost:3306/javadb?useUnicode=true&characterEncoding=euckr"; 
    String user = "root"; 
    String pass = "1234";

    try {
      Class.forName(className); // memory�� Ŭ������ �о��, ��ü�� �������� ����.
      con = DriverManager.getConnection(url, user, pass);  // MySQL ����

    } catch (Exception e) {
      e.printStackTrace();
    }
    
    return con;
  }
}
 