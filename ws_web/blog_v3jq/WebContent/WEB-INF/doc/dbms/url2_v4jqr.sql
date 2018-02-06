▷ /WebContent/WEB-INF/doc/dbms/url2_v4jqr.sql (version 4.0, jsp, mysql, relationship)  
-----------------------------------------------------------------------------------
1. url2 테이블 구조 
- URL2 구분을 위한 키값

1: JAVA
2: JSP
3: HTML5
4: CSS
5: Javascript
6. MySQL

 
1) url2 테이블의 생성
   - 저장소 만들기
   - PRIMARY KEY(url2no): url2no컬럼의 값이 2번이상 등록되는 것을 차단.
   
   CREATE TABLE url2( 
     url2no  INT                NOT NULL AUTO_INCREMENT, -- URL 번호
     code   INT                 NOT NULL, -- 구분 코드
     title    VARCHAR(100) NOT NULL, -- 웹 사이트 제목
     web    VARCHAR(200) NOT NULL, -- URL 주소
     rdate  DATETIME        NOT NULL, -- 등록일
     PRIMARY KEY(url2no)
   );  


2) 테이블 삭제
   DROP TABLE url2;

  
3) 등록(Primary Key가 적용된 컬럼은 생략할 것.)
   INSERT INTO url2(code, title, web, rdate)
   VALUES(1, 'Google', 'http://www.google.co.kr', now());

   INSERT INTO url2(code, title, web, rdate)
   VALUES(1, 'Oracle', 'http://www.oracle.com', now());
   
   INSERT INTO url2(code, title, web, rdate)
   VALUES(3, 'W3Schools', 'https://www.w3schools.com', now());
   
   INSERT INTO url2(code, title, web, rdate)
   VALUES(4, 'CSS', 'https://www.w3schools.com', now());
   
   INSERT INTO url2(code, title, web, rdate)
   VALUES(6, 'MySQL', 'https://www.mysql.com', now());
   
4) 목록
   SELECT url2no, code, title, web, rdate
   FROM url2 
   ORDER BY code ASC;

 url2no code title     web                       rdate
 ------ ---- --------- ------------------------- ---------------------
      1    1 Google    http://www.google.co.kr   2017-09-13 10:54:40.0
      2    1 Oracle    http://www.oracle.com     2017-09-13 10:55:20.0
      3    3 W3Schools https://www.w3schools.com 2017-09-13 10:56:39.0
      4    4 CSS       https://www.w3schools.com 2017-09-13 10:57:30.0
      5    6 MySQL     https://www.mysql.com     2017-09-13 10:57:57.0

5) 비정상적인 등록
   INSERT INTO url2(code, title, web, rdate)
   VALUES(100, 'Daum', 'http://www.daum.net', now());

   INSERT INTO url2(code, title, web, rdate)
   VALUES(150, 'KMA', 'http://www.kma.go.kr', now());

   SELECT url2no, code, title, web, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2 
   ORDER BY code ASC;

 url2no code title     web                       rdate
 ------ ---- --------- ------------------------- ----------------
      1    1 Google    http://www.google.co.kr   2017-09-13 10:54
      2    1 Oracle    http://www.oracle.com     2017-09-13 10:55
      3    3 W3Schools https://www.w3schools.com 2017-09-13 10:56
      4    4 CSS       https://www.w3schools.com 2017-09-13 10:57
      5    6 MySQL     https://www.mysql.com     2017-09-13 10:57
      6  100 Daum      http://www.daum.net       2017-09-13 11:03
      7  150 KMA       http://www.kma.go.kr      2017-09-13 11:04
 
6) 문제점

① DBA가 SQL상에서 자바 개발자가 정의한 6개의 코드를 무시한 값이 등록 가능한
    문제가 발생함.
- URL 구분을 위한 키값
1: JAVA
2: JSP
3: HTML5
4: CSS
5: Javascript
6. MySQL
100, 150 ???

   INSERT INTO url2(code, title, web, rdate)
   VALUES(2000000, 'Daum', 'http://www.daum.net', now());

   SELECT url2no, code, title, web, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2 
   ORDER BY code ASC;  

    url2no code    title     web                       rdate
 ------ ------- --------- ------------------------- ----------------
      1       1 Google    http://www.google.co.kr   2017-09-13 10:54
      2       1 Oracle    http://www.oracle.com     2017-09-13 10:55
      3       3 W3Schools https://www.w3schools.com 2017-09-13 10:56
      4       4 CSS       https://www.w3schools.com 2017-09-13 10:57
      5       6 MySQL     https://www.mysql.com     2017-09-13 10:57
      6     100 Daum      http://www.daum.net       2017-09-13 11:03
      7     150 KMA       http://www.kma.go.kr      2017-09-13 11:04
      8 2000000 Daum      http://www.daum.net       2017-09-13 11:43
      
   INSERT INTO url2(code, title, web, rdate)
   VALUES(2017, 'Daum', 'http://www.daum.net', now());

   SELECT url2no, code, title, web, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2 
   ORDER BY code ASC;  

    url2no code    title     web                       rdate
 ------ ------- --------- ------------------------- ----------------
      1       1 Google    http://www.google.co.kr   2017-09-13 10:54
      2       1 Oracle    http://www.oracle.com     2017-09-13 10:55
      3       3 W3Schools https://www.w3schools.com 2017-09-13 10:56
      4       4 CSS       https://www.w3schools.com 2017-09-13 10:57
      5       6 MySQL     https://www.mysql.com     2017-09-13 10:57
      6     100 Daum      http://www.daum.net       2017-09-13 11:03
      7     150 KMA       http://www.kma.go.kr      2017-09-13 11:04
      9    2017 Daum      http://www.daum.net       2017-09-13 11:45
      8 2000000 Daum      http://www.daum.net       2017-09-13 11:43
      
   INSERT INTO url2(code, title, web, rdate)
   VALUES(123456789, 'Daum', 'http://www.daum.net', now());

   SELECT url2no, code, title, web, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2 
   ORDER BY code ASC;  

    url2no code      title     web                       rdate
 ------ --------- --------- ------------------------- ----------------
      1         1 Google    http://www.google.co.kr   2017-09-13 10:54
      2         1 Oracle    http://www.oracle.com     2017-09-13 10:55
      3         3 W3Schools https://www.w3schools.com 2017-09-13 10:56
      4         4 CSS       https://www.w3schools.com 2017-09-13 10:57
      5         6 MySQL     https://www.mysql.com     2017-09-13 10:57
      6       100 Daum      http://www.daum.net       2017-09-13 11:03
      7       150 KMA       http://www.kma.go.kr      2017-09-13 11:04
      9      2017 Daum      http://www.daum.net       2017-09-13 11:45
      8   2000000 Daum      http://www.daum.net       2017-09-13 11:43
     10 123456789 Daum      http://www.daum.net       2017-09-13 11:47

② JSP에서는1 ~ 6까지 구분하여 출력시 1~6이 아니면 레코드 누락됨.
③ DBA가 SQL 등록시 code 번호가 무슨 목적인지 알 수 없음. 

7) 부모테이블, 자식 테이블로의 정규화
   DROP TABLE url2cate;
   
   CREATE TABLE url2cate( 
     url2cateno  INT          NOT NULL AUTO_INCREMENT, -- URL 번호
     title    VARCHAR(100) NOT NULL, -- 웹 사이트 제목
     rdate  DATETIME        NOT NULL, -- 등록일
     PRIMARY KEY(url2cateno)
   );
   
   INSERT INTO url2cate(title, rdate) VALUES('JAVA', now());
   INSERT INTO url2cate(title, rdate) VALUES('JSP', now());
   INSERT INTO url2cate(title, rdate) VALUES('HTML5', now());
   INSERT INTO url2cate(title, rdate) VALUES('CSS', now());
   INSERT INTO url2cate(title, rdate) VALUES('Javascript', now());
   INSERT INTO url2cate(title, rdate) VALUES('MySQL', now());
   
   SELECT url2cateno, title, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2cate
   ORDER BY url2cateno ASC;
   
 url2cateno title      rdate
 ---------- ---------- ----------------
          1 JAVA       2017-09-13 11:56
          2 JSP        2017-09-13 11:56
          3 HTML5      2017-09-13 11:56
          4 CSS        2017-09-13 11:56
          5 Javascript 2017-09-13 11:56
          6 MySQL      2017-09-13 11:56

8) 자식 테이블의 생성
   DROP TABLE url2;
   
   CREATE TABLE url2( 
     url2no  INT                NOT NULL AUTO_INCREMENT, -- URL 번호
     url2cateno  INT          NOT NULL, -- Category 번호, 구분 코드
     title    VARCHAR(100) NOT NULL, -- 웹 사이트 제목
     web    VARCHAR(200) NOT NULL, -- URL 주소
     rdate  DATETIME        NOT NULL, -- 등록일
     PRIMARY KEY(url2no),
     FOREIGN KEY(url2cateno) REFERENCES url2cate(url2cateno)
   ) COMMENT='URL 데이터';  

   INSERT INTO url2(url2cateno, title, web, rdate)
   VALUES(1, 'Google', 'http://www.google.co.kr', now());
   
   INSERT INTO url2(url2cateno, title, web, rdate)
   VALUES(1, 'Oracle', 'http://www.oracle.com', now());
   
   INSERT INTO url2(url2cateno, title, web, rdate)
   VALUES(2, 'Eclipse', 'http://www.eclipse.org', now());
   
   SELECT url2no, url2cateno, title, web, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2 
   ORDER BY url2cateno ASC;
   
 url2no url2cateno title   web                     rdate
 ------ ---------- ------- ----------------------- ----------------
      1          1 Google  http://www.google.co.kr 2017-09-13 12:10
      2          1 Oracle  http://www.oracle.com   2017-09-13 12:11
      3          2 Eclipse http://www.eclipse.org  2017-09-13 12:12

9) 등록되지 않은 url 코드의 사용
   INSERT INTO url2(url2cateno, title, web, rdate)
   VALUES(1000, 'Google', 'http://www.google.co.kr', now());

   INSERT INTO url2(url2cateno, title, web, rdate)
   VALUES(2017, 'Google', 'http://www.google.co.kr', now());
   
   Cannot add or update a child row: a foreign key constraint fails (`javadb`.`url2`, CONSTRAINT `url2_ibfk_1` FOREIGN KEY (`url2cateno`) REFERENCES `url2cate` (`url2cateno`))
   등록되지 않은 코드 사용으로 발생된 에러.
   
   따라서 사용하려는 코드가 없으면 먼저 부모 테이블(url2cate)에 코드를 등록하고
   자식 테이블(url2)에 데이터를 등록합니다. 
   
   DBA는 지정된 코드외에는 사용 불가능합니다.
   JSP 개발자는 코드를 다루는 JSP applicaton을 추가 제작해야합니다.

10) 부모 테이블의 레코드 삭제
  DELETE FROM url2cate WHERE url2cateno = 1;
  Cannot delete or update a parent row: a foreign key constraint fails (`javadb`.`url2`, CONSTRAINT `url2_ibfk_1` FOREIGN KEY (`url2cateno`) REFERENCES `url2cate` (`url2cateno`))

부모테이블의 코드가 쓰이고 있으면 삭제가 안됨으로 쓰이는 곳을 전부 찾아 삭제합니다.
이런 문제로 실무에서는 대부분 삭제 처리가 여러 절차를 거치도록합니다. 데이터 관리를위해 삭제를
제한한 경우도 많습니다.

① FK 자식 테이블 삭제
   DELETE FROM url2 WHERE url2cateno = 1;

② PK 부모 테이블 삭제
   DELETE FROM url2cate WHERE url2cateno=1;

③ PK 부모 테이블 목록
   SELECT url2cateno, title, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2cate
   ORDER BY url2cateno ASC;
   
 url2cateno title      rdate
 ---------- ---------- ----------------
          2 JSP        2017-09-13 11:56
          3 HTML5      2017-09-13 11:56
          4 CSS        2017-09-13 11:56
          5 Javascript 2017-09-13 11:56
          6 MySQL      2017-09-13 11:56
  
11) JAVA 관련 URL만 보고 싶은 경우
   SELECT url2no, url2cateno, title, web, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2 
   WHERE url2cateno = 1
   ORDER BY url2cateno ASC;

12) JSP 관련 URL만 보고 싶은 경우
   SELECT url2no, url2cateno, title, web, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2 
   WHERE url2cateno = 2
   ORDER BY url2cateno ASC;

13) CSS 관련 URL만 보고 싶은 경우
   SELECT url2no, url2cateno, title, web, SUBSTRING(rdate, 1, 16) as rdate
   FROM url2 
   WHERE url2cateno = 3
   ORDER BY url2cateno ASC;   
   
  
-----------------------------------------------------------------------------------
   
   