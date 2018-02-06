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
  
  // 톰캣 시작시 자동 실행되어 초기화(준비 작업) 진행
  @Override
  public void init(FilterConfig config) throws ServletException {
    // /WEB-INF/web.xml파일의 <init-param>태그의 값
    charSet = config.getInitParameter("charSet");
 
    System.out.println("────────────");
    System.out.println(" URI Logger start...");
    System.out.println("────────────");
  }
 
  // URL, 이미지등 파일 형태의 접근이 발생하면 자동 실행
  @Override
  public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest) servletRequest;
    
    // ------------------------------------------------------------------------------
    // session의 사용 ★
    // ------------------------------------------------------------------------------
    // 새로운 세션을 생성하지않고 기존의 세션 객체를 반환
    HttpSession session = request.getSession(true);
    // System.out.println("session: " + session);
    
    String email = (String)session.getAttribute("email");
    if (email == null) {
      email = "Guest";
    }
    // ------------------------------------------------------------------------------
    
    // 한글 문자셋 변경
    request.setCharacterEncoding(charSet);
 
    // 요청 uri 추출 부분, 도메인을 제거한 주소
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
 
    // 다른 필터 실행, 요청 JSP 실행
    chain.doFilter(request, response);
  }
 
  public void destroy() {
 
  }
}
   