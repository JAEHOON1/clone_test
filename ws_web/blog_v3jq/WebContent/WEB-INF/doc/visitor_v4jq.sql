1) news 테이블의 생성 
   - 기존의 테이블 삭제
     DROP TABLE visitor;
   
   CREATE TABLE visitor( 
     visitorno  INT     NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 방명록 번호
     content   VARCHAR(1000)  NOT NULL, -- 내용, 1000 자
     rname     VARCHAR(15)    NOT NULL, -- 등록자
     passwd   VARCHAR(15)    NOT NULL, -- 패스워드
     home     VARCHAR(200)          NULL, -- Homepage
     email     VARCHAR(100)           NULL, -- Email
     rdate     DATETIME         NOT NULL  -- 등록일
   );  

    
2) 테이블 삭제
   DROP TABLE visitor;


3) 등록
   INSERT INTO visitor(content, rname, passwd, home, email, rdate)
   VALUES('내일은 구름 조금', '왕눈이', '123', 'http://www.kma.go.kr', 'mail1', now());

   INSERT INTO visitor(content, rname, passwd, home, email, rdate)
   VALUES('추운 가을 날씨', '왕눈이', '123', 'http://www.kma.go.kr', 'mail1', now());

   INSERT INTO visitor(content, rname, passwd, home, email, rdate)
   VALUES('기상 이변', '왕눈이', '123', 'http://www.kma.go.kr', 'mail1', now());

    
4) 목록
   SELECT visitorno, content, rname, passwd, home, email, rdate
   FROM visitor 
   ORDER BY visitorno ASC;
   
 visitorno content   rname passwd home                 email rdate
 --------- --------- ----- ------ -------------------- ----- ---------------------
         1 내일은 구름 조금 왕눈이   123    http://www.kma.go.kr mail1 2017-08-30 17:10:42.0
         2 추운 가을 날씨  왕눈이   123    http://www.kma.go.kr mail1 2017-08-30 17:10:43.0
         3 기상 이변     왕눈이   123    http://www.kma.go.kr mail1 2017-08-30 17:10:44.0

   SELECT visitorno, content, rname, passwd, home, email, rdate
   FROM visitor 
   ORDER BY visitorno DESC;

 visitorno content   rname passwd home                 email rdate
 --------- --------- ----- ------ -------------------- ----- ---------------------
         3 기상 이변     왕눈이   123    http://www.kma.go.kr mail1 2017-08-30 17:10:44.0
         2 추운 가을 날씨  왕눈이   123    http://www.kma.go.kr mail1 2017-08-30 17:10:43.0
         1 내일은 구름 조금 왕눈이   123    http://www.kma.go.kr mail1 2017-08-30 17:10:42.0
  
5) 조회
   SELECT visitorno, content, rname, passwd, home, email, rdate
   FROM visitor 
   WHERE visitorno = 1;
   
 visitorno content   rname passwd home                 email rdate
 --------- --------- ----- ------ -------------------- ----- ---------------------
         1 내일은 구름 조금 왕눈이   123    http://www.kma.go.kr mail1 2017-08-30 17:10:42.0

6) 패스워드 검사
   SELECT COUNT(*)
   FROM visitor
   WHERE visitorno=1 AND passwd='123';
   
   COUNT(*) ← 컬럼명
   -------------------
            1
   -- cnt: 임시로 만들어진 컬럼명 
   SELECT COUNT(*) as cnt  
   FROM visitor
   WHERE visitorno=1 AND passwd='1293';
   
   cnt
   ----
     1    ← 레코드가 없거나 일치하지않으면 0
         
7) 수정
   UPDATE visitor
   SET content = '내용 2', rname = '아로미', home='http://~', email='maeil1' 
   WHERE visitorno = 1;

8) 삭제
① 하나의 레코드 삭제
    DELETE FROM visitor
    WHERE visitorno = 1;

② 모든 레코드 삭제(주의)
    DELETE FROM visitor;
    
9. LIMIT
   SELECT visitorno, content, rname, passwd, home, email, rdate
   FROM visitor 
   ORDER BY visitorno ASC
   LIMIT 3;
     
 
  