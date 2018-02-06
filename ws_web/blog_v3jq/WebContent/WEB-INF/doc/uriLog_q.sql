�� /WEB-INF/doc/uriLog_q.sql
-------------------------------------------------------------------------------------
DROP TABLE uriLog;
 
CREATE TABLE uriLog(
   urilogno INT NOT NULL AUTO_INCREMENT, -- �Ϸ� ��ȣ
   id          VARCHAR(50) DEFAULT 'guest' NOT NULL, -- ���̵�
   ip          VARCHAR(15)                 NOT NULL, -- 123.456.789.012
   uri         VARCHAR(100)                 NOT NULL, -- URI �ּ�
   uridate    VARCHAR(19)                 NOT NULL, -- ���� ��¥
   PRIMARY KEY(urilogno)
);
 
INSERT INTO uriLog(id, ip, uri, uridate)
VALUES('user1', '10.0.0.1','/bbs/create_form.jsp', now());
 
INSERT INTO uriLog(id, ip, uri, uridate)
VALUES('user1', '10.0.0.1','/bbs/create_form.jsp', now());
 
INSERT INTO uriLog(id, ip, uri, uridate)
VALUES('user1', '10.0.0.1','/bbs/create_form.jsp', now());
 
 
SELECT urilogno, id, ip, uri, uridate 
FROM uriLog
ORDER BY urilogno DESC;
 
 urilogno id    ip       uri                  uridate
 -------- ----- -------- -------------------- -------------------
        3 user1 10.0.0.1 /bbs/create_form.jsp 2017-03-09 16:14:16
        2 user1 10.0.0.1 /bbs/create_form.jsp 2017-03-09 16:14:15
        1 user1 10.0.0.1 /bbs/create_form.jsp 2017-03-09 16:14:14
 
  
-------------------------------------------------------------------------------------
  
  
2. Filter ���� java source
 
�� URILogFilter.java
-------------------------------------------------------------------------------------
package nation.web.tool;
 
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
public class URILogFilter implements Filter {
  private Connection con = null;
  private PreparedStatement pstmt = null;
  private String charSet = null;
  private DBOpen dbopen = null;
  private DBClose dbclose = null;
  
  public URILogFilter(){
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  // ��Ĺ ���۽� �ڵ� ����Ǿ� �ʱ�ȭ(�غ� �۾�) ����
  @Override
  public void init(FilterConfig config) throws ServletException {
    // /WEB-INF/web.xml������ <init-param>�±��� ��
    charSet = config.getInitParameter("charSet");
 
    System.out.println("������������������������");
    System.out.println(" URI Logger start...");
    System.out.println("������������������������");
  }
 
  // URL, �̹����� ���� ������ ������ �߻��ϸ� �ڵ� ����
  @Override
  public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest) servletRequest;
    
    // ------------------------------------------------------------------------------
    // session�� ��� ��
    // ------------------------------------------------------------------------------
    // ���ο� ������ ���������ʰ� ������ ���� ��ü�� ��ȯ
    HttpSession session = request.getSession(true);
    // System.out.println("session: " + session);
    
    String email = (String)session.getAttribute("email");
    if (email == null) {
      email = "Guest";
    }
    // ------------------------------------------------------------------------------
    
    // �ѱ� ���ڼ� ����
    request.setCharacterEncoding(charSet);
 
    // ��û uri ���� �κ�, �������� ������ �ּ�
    String uri = request.getRequestURI();
 
    String ip = request.getRemoteAddr();
    System.out.println("ip: " + ip);
 
    try {
      con = dbopen.getConnection();
 
      StringBuffer sql = new StringBuffer();
      sql.append(" INSERT INTO uriLog(id, ip, uri, uridate)");
      sql.append(" VALUES(?, ?, ?, now())");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setString(2, ip);
      pstmt.setString(3, uri);
 
      pstmt.executeUpdate();
    } catch (Exception e) {
      System.out.println(e.toString());
    } finally {
      dbclose.close(con, pstmt);
    }
 
    // �ٸ� ���� ����, ��û JSP ����
    chain.doFilter(request, response);
  }
 
  public void destroy() {
 
  }
}
   
 
-------------------------------------------------------------------------------------
 
 
3. Filter ���
�� /WEB-INF/web.xml
-------------------------------------------------------------------------------------
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns="http://xmlns.jcp.org/xml/ns/javaee" 
xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
 
  <display-name>filter</display-name>
  <welcome-file-list>
    <welcome-file>index.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- ***************** Filter***************** -->
  <filter>
    <filter-name>URILogFilter</filter-name>   <!-- ���� �̸� -->
    <filter-class>nation.web.tool.URILogFilter</filter-class> <!-- class �̸� -->
    <init-param>
      <param-name>charSet</param-name> <!-- ���ڼ� -->
      <param-value>utf-8</param-value>
    </init-param>
  </filter>
 
  <filter-mapping>
    <filter-name>URILogFilter</filter-name> <!-- ���� �̸� -->
    <url-pattern>/*</url-pattern> <!-- ��� ���� �ּҿ� ���Ͽ� �۵� -->
  </filter-mapping>
  <!-- ******************************************* -->
  
</web-app>
 
 

-------------------------------------------------------------------------------------
 
 
4. �α� ���� Ȯ��

SELECT urilogno, id, ip, uri, uridate 
FROM uriLog
ORDER BY urilogno DESC;
 
-------------------------------------------------------------------------------------

 urilogno id    ip              uri                                     uridate
 -------- ----- --------------- --------------------------------------- -------------------
 urilogno id    ip              uri                                      uridate
 -------- ----- --------------- ---------------------------------------- -------------------
       35 Guest 172.16.7.23     /travel_v1jq/pds4/storage/hc09.jpg       2017-03-09 17:05:25
       34 Guest 172.16.7.23     /travel_v1jq/pds4/read.jsp               2017-03-09 17:05:25
       33 Guest 172.16.7.23     /travel_v1jq/pds4/storage/hc09_t.jpg     2017-03-09 17:05:24
       32 Guest 172.16.7.23     /travel_v1jq/pds4/storage/apple001_t.jpg 2017-03-09 17:05:24
       31 Guest 172.16.7.23     /travel_v1jq/pds4/list_grid2.jsp         2017-03-09 17:05:24
       30 Guest 172.16.7.23     /travel_v1jq/pds4/storage/               2017-03-09 17:05:19
       29 Guest 172.16.7.23     /travel_v1jq/pds4/storage/ypr006.jpg     2017-03-09 17:05:19
       28 Guest 172.16.7.23     /travel_v1jq/pds4/read.jsp               2017-03-09 17:05:19
       27 Guest 172.16.7.23     /travel_v1jq/pds4/storage/ypr006_t.jpg   2017-03-09 17:05:18
       26 Guest 172.16.7.23     /travel_v1jq/pds4/list_grid2.jsp         2017-03-09 17:05:18
       25 Guest 172.16.7.23     /travel_v1jq/menu/images/top_image2.jpg  2017-03-09 17:05:17
       24 Guest 172.16.7.23     /travel_v1jq/menu/images/spring10.jpg    2017-03-09 17:05:17
       23 Guest 172.16.7.23     /travel_v1jq/news3/images/bu6.gif        2017-03-09 17:05:17
       22 Guest 172.16.7.23     /travel_v1jq/menu/images/spring08.jpg    2017-03-09 17:05:17
       21 Guest 172.16.7.23     /travel_v1jq/menu/images/spring09.jpg    2017-03-09 17:05:17
       20 Guest 172.16.7.23     /travel_v1jq/menu/images/spring07.jpg    2017-03-09 17:05:17
       19 Guest 172.16.7.23     /travel_v1jq/menu/images/back01.jpg      2017-03-09 17:05:17
       18 Guest 172.16.7.23     /travel_v1jq/menu/images/spring03.jpg    2017-03-09 17:05:16
       17 Guest 172.16.7.23     /travel_v1jq/menu/images/spring04.jpg    2017-03-09 17:05:16
       16 Guest 172.16.7.23     /travel_v1jq/menu/images/spring02.jpg    2017-03-09 17:05:16
       15 Guest 172.16.7.23     /travel_v1jq/menu/images/spring05.jpg    2017-03-09 17:05:16
       14 Guest 172.16.7.23     /travel_v1jq/menu/images/spring06.jpg    2017-03-09 17:05:16
       13 Guest 172.16.7.23     /travel_v1jq/menu/images/spring01.jpg    2017-03-09 17:05:16
       12 Guest 172.16.7.23     /travel_v1jq/css/style.css               2017-03-09 17:05:16
       11 Guest 172.16.7.23     /travel_v1jq/                            2017-03-09 17:05:16
       10 Guest 172.16.7.2      /travel_v1jq/menu/images/back01.jpg      2017-03-09 16:58:14
        9 Guest 172.16.7.2      /travel_v1jq/menu/images/top_image2.jpg  2017-03-09 16:58:14
        8 Guest 172.16.7.2      /travel_v1jq/css/style.css               2017-03-09 16:58:14
        7 Guest 172.16.7.2      /travel_v1jq/pds4/create_form.jsp        2017-03-09 16:58:14
        6 Guest 0:0:0:0:0:0:0:1 /travel_v1jq/admin1/login_ck_proc.jsp    2017-03-09 16:51:38
        5 Guest 0:0:0:0:0:0:0:1 /travel_v1jq/admin1/login_ck_form.jsp    2017-03-09 16:51:37
        4 Guest 0:0:0:0:0:0:0:1 /travel_v1jq/index.jsp                   2017-03-09 16:51:18
        3 user1 10.0.0.1        /bbs/create_form.jsp                     2017-03-09 16:14:16
        2 user1 10.0.0.1        /bbs/create_form.jsp                     2017-03-09 16:14:15
        1 user1 10.0.0.1        /bbs/create_form.jsp           

-------------------------------------------------------------------------------------
  