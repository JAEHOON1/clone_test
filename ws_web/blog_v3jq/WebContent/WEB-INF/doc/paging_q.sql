1) 실습 테이블 생성
 
CREATE TABLE month(
  monthno INT         NOT NULL PRIMARY KEY,
  title   VARCHAR(20) NOT NULL -- 월 이름
);
 
INSERT INTO month(monthno, title) VALUES(1, 'January');
INSERT INTO month(monthno, title) VALUES(2, 'February');
INSERT INTO month(monthno, title) VALUES(3, 'March');
INSERT INTO month(monthno, title) VALUES(4, 'April');
INSERT INTO month(monthno, title) VALUES(5, 'May');
INSERT INTO month(monthno, title) VALUES(6, 'June');
INSERT INTO month(monthno, title) VALUES(7, 'July');
INSERT INTO month(monthno, title) VALUES(8, 'August');
INSERT INTO month(monthno, title) VALUES(9, 'September');
INSERT INTO month(monthno, title) VALUES(10, 'October');
INSERT INTO month(monthno, title) VALUES(11, 'November');
INSERT INTO month(monthno, title) VALUES(12, 'December');
INSERT INTO month(monthno, title) VALUES(13, 'none');
 
 
2) 페이징 실습
-- MySQL
-- LIMIT 제외할 레코드의 갯수, 출력할 레코드의 갯수
 
-- 1년을 5개의 레코드로 분할하여 출력하세요.
SELECT monthno, title
FROM month
ORDER BY monthno ASC
LIMIT 0, 5;
 
 monthno title
 ------- --------
       1 January
       2 February
       3 March
       4 April
       5 May
 
       
SELECT monthno, title
FROM month
ORDER BY monthno ASC
LIMIT 5, 5;
       
 monthno title
 ------- ---------
       6 June
       7 July
       8 August
       9 September
      10 October
 
      
SELECT monthno, title
FROM month
ORDER BY monthno ASC
LIMIT 10, 5;
 
 monthno title
 ------- --------
      11 November
      12 December
      13 none
 
 
 
3) 검색된 전체 레코드 수
SELECT COUNT(pdsno) as cnt 
FROM pds4
WHERE rname LIKE '%왕눈이%';
 
 cnt
 ---
  17
   
4) 페이징
SELECT pdsno, categoryno, rname, email, title, content, passwd, cnt, 
          SUBSTRING(rdate, 1, 10) as rdate, web, file1, fstor1,
          thumb, size1, map, youtube, mp3, mp4, ip, visible 
FROM pds4
WHERE rname LIKE '%왕눈이%'
ORDER BY pdsno DESC
LIMIT 0, 5;


4) 카테고리별 페이징
SELECT pdsno, categoryno, rname, email, title, content, passwd, cnt, 
          SUBSTRING(rdate, 1, 10) as rdate, web, file1, fstor1,
          thumb, size1, map, youtube, mp3, mp4, ip, visible 
FROM pds4
WHERE categoryno = 1 AND rname LIKE '%왕눈이%'
ORDER BY pdsno DESC
LIMIT 0, 5;