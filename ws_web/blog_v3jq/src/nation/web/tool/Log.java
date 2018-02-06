package nation.web.tool;
 
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
 
import javax.servlet.http.HttpServletRequest;
 
import jdk.nashorn.internal.ir.RuntimeNode.Request;
 
public class Log {
  /**
   * 일반 클래스에서의 로그 기록
   * @param str
   */
  public static synchronized void w(String str){
    String os = System.getProperty("os.name");
    String path = "";
    
    if (os.indexOf("Window") >= 0){
      path = "C:/kor1/ws_web/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/blog_v3jq/log";
    }else{
      path="/home/hosting_users/자신의 cafe24 계정/tomcat/webapps/ROOT/log";
    }
    File dir = new File(path);
    if (dir.exists() == false) {
      dir.mkdir(); // 폴더 생성
    }
    
    String file = path + "/" + "log.txt"; // 로그 파일
    String Enter = System.getProperty("line.separator"); // Enter
    FileWriter fw = null; // 파일 기록 
    
    try {
      fw = new FileWriter(file, true); // true: 추가 모드
      fw.write(new Date().toLocaleString() + Enter);
      fw.write(str + Enter);
      fw.write("----------------------------------------------------------------------" + Enter);
      fw.flush(); // 파일 기록
    } catch (IOException e) {
      e.printStackTrace();
    } finally{
      try {
        fw.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
 
  /**
   * JSP등 웹에서의 로그 기록
   * @param request
   * @param str
   */
  public static synchronized void w(HttpServletRequest request, String str){
    // /log 폴더의 경로 산출
    String path = request.getServletContext().getRealPath("/log");
    File dir = new File(path);
    if (dir.exists() == false) {
      dir.mkdir();
    }
    
    String file = path + "/" + "log.txt"; // 로그 파일
    System.out.println("file: " + file);
    String Enter = System.getProperty("line.separator"); // Enter
    FileWriter fw = null; // 파일 기록 
    
    try {
      fw = new FileWriter(file, true); // true: 추가 모드
      fw.write(new Date().toLocaleString() + " IP: " + request.getRemoteAddr() + Enter);
      fw.write(str + Enter);
      fw.write("----------------------------------------------------------------------" + Enter);
      fw.flush();
    } catch (IOException e) {
      e.printStackTrace();
    } finally{
      try {
        fw.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
  
  public static void main(String[] args) {
    // 클래스가 위치하는 곳의 경로 산출
    String path = Log.class.getResource("").getPath();
    System.out.println("--> path: " + path);
    // /C:/iot1/ws_web/admin_v1jq/build/classes/web/tool/
    
    System.out.println(System.getProperty("os.name"));
    // Windows 7, Windows 10
    
    w("금요일 11시 박근혜 대통령 탄핵 심판 선고");
  }
 
}
  