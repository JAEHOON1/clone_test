package test;
 
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;  // Interface
import java.util.Vector;
 
public class EnumerationTest {
 
  public static void main(String[] args) {
    // Iterator만 지원
    ArrayList<String> list = new ArrayList<String>();
    list.add("베테랑");
    list.add("스타워즈");
    list.add("극비수사");
    
    Iterator<String> iter = list.iterator(); // Iterator 객체 생성
    
    while(iter.hasNext()){ // 다음 요소가 있는지 체크
      System.out.println(iter.next()); // 다음 요소 산출
    }
    
    System.out.println("--------------------");
 
    // Enumeration, Vector 지원
    Vector<String> list2 = new Vector<String>();
    list2.add("베테랑");
    list2.add("스타워즈");
    list2.add("극비수사");
 
    Enumeration<String> enumeration = list2.elements();
    
    while(enumeration.hasMoreElements()){  // 다음 요소가 있는지 체크
      System.out.println(enumeration.nextElement());  // 다음 요소 산출
    }
  }
 
}