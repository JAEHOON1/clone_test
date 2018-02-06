▷ /WebContent/WEB-INF/doc/notice_v3jq.sql(q: MySQL) 
-----------------------------------------------------------------------------------
1. notice 테이블 생성

CREATE TABLE notice(
  noticeno INT                NOT NULL AUTO_INCREMENT COMMENT '번호',
  title       VARCHAR(100) NOT NULL COMMENT '내용',
  rname    VARCHAR(15)  NOT NULL COMMENT '성명',
  rdate     DATETIME       NOT NULL COMMENT '등록일',
  PRIMARY KEY(noticeno)
);

2. 테이블 삭제
DROP TABLE notice;

3. 등록
- PK 컬럼은 생략함.
INSERT INTO notice(title, rname, rdate)
VALUES('내일은 구름 조금', '왕눈이', now());

INSERT INTO notice(title, rname, rdate)
VALUES('4월 개발 일정', '아로미', now());

INSERT INTO notice(title, rname, rdate)
VALUES('3월 급여 안내', '왕눈이', now());

4. 목록
SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC;

 noticeno title     rname rdate
 -------- --------- ----- ---------------------
        1 내일은 구름 조금 왕눈이   2017-08-21 12:14:50.0
        2 4월 개발 일정  아로미   2017-08-21 12:15:28.0
        3 3월 급여 안내  왕눈이   2017-08-21 12:15:45.0

-- 하나의 컬럼이 아니라 레코드 전체의 순서가 이동됨.        
SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno DESC; 

 noticeno title     rname rdate
 -------- --------- ----- ---------------------
        3 3월 급여 안내  왕눈이   2017-08-21 12:15:45.0
        2 4월 개발 일정  아로미   2017-08-21 12:15:28.0
        1 내일은 구름 조금 왕눈이   2017-08-21 12:14:50.0

5. 조회
SELECT noticeno, title, rname, rdate
FROM notice
WHERE noticeno = 1;

 noticeno title     rname rdate
 -------- --------- ----- ---------------------
        1 내일은 구름 조금 왕눈이   2017-08-21 12:21:40.0

6. 수정
1) 모든 레코드 수정(주의)
UPDATE notice
SET title='자바 소식', rname = '투투';

 noticeno title rname rdate
 -------- ----- ----- ---------------------
        3 자바 소식 투투    2017-08-21 12:21:42.0
        2 자바 소식 투투    2017-08-21 12:21:41.0
        1 자바 소식 투투    2017-08-21 12:21:40.0

2) 1번 레코드만 수정(권장)
UPDATE notice
SET title='늦여름', rname = '아로미'
WHERE noticeno = 1;

SELECT noticeno, title, rname, rdate
FROM notice
WHERE noticeno = 1;

 noticeno title rname rdate
 -------- ----- ----- ---------------------
        1 늦여름   아로미   2017-08-21 12:21:40.0
        
7. 삭제
1) 하나의 레코드만 삭제(권장)
DELETE FROM notice
WHERE noticeno = 1;

SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC;

 noticeno title rname rdate
 -------- ----- ----- ---------------------
        2 자바 소식 투투    2017-08-21 12:21:41.0
        3 자바 소식 투투    2017-08-21 12:21:42.0

2) 모든 레코드 삭제(주의)        
DELETE FROM notice;

3) 레코드 갯수
SELECT COUNT(*) as cnt
FROM notice;

 cnt
 ---
   0
  
8. LIMIT
1) 정확한 실습을위하여 테이블을 삭제후 다시 제작합니다.

2) 실습 데이터 추가
INSERT INTO notice(title, rname, rdate) VALUES('1. 내일은 구름 조금', '왕눈이', now());
INSERT INTO notice(title, rname, rdate) VALUES('2. 개발 일정', '아로미', now());
INSERT INTO notice(title, rname, rdate) VALUES('3. 급여 안내', '왕눈이', now());
INSERT INTO notice(title, rname, rdate) VALUES('4. 급여 안내', '왕눈이', now());
INSERT INTO notice(title, rname, rdate) VALUES('5. 급여 안내', '왕눈이', now());
 
3) 전체 레코드
SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC;

 noticeno title        rname rdate
 -------- ------------ ----- ---------------------
        1 1. 내일은 구름 조금 왕눈이   2018-01-24 13:21:45.0
        2 2. 개발 일정     아로미   2018-01-24 13:21:46.0
        3 3. 급여 안내     왕눈이   2018-01-24 13:21:47.0
        4 4. 급여 안내     왕눈이   2018-01-24 13:21:48.0
        5 5. 급여 안내     왕눈이   2018-01-24 13:21:49.0

4) 3개의 레코드 출력
- LIMIT 출력할 레코드 갯수
- LIMIT SKIP할 레코드 개수, 출력할 레코드 갯수

SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC
LIMIT 3;       
        
 noticeno title        rname rdate
 -------- ------------ ----- ---------------------
        1 1. 내일은 구름 조금 왕눈이   2018-01-24 13:21:45.0
        2 2. 개발 일정     아로미   2018-01-24 13:21:46.0
        3 3. 급여 안내     왕눈이   2018-01-24 13:21:47.0

SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC
LIMIT 0, 3;   

 noticeno title        rname rdate
 -------- ------------ ----- ---------------------
        1 1. 내일은 구름 조금 왕눈이   2018-01-24 13:21:45.0
        2 2. 개발 일정     아로미   2018-01-24 13:21:46.0
        3 3. 급여 안내     왕눈이   2018-01-24 13:21:47.0

SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC
LIMIT 1, 3;   

 noticeno title    rname rdate
 -------- -------- ----- ---------------------
        2 2. 개발 일정 아로미   2018-01-24 13:21:46.0
        3 3. 급여 안내 왕눈이   2018-01-24 13:21:47.0
        4 4. 급여 안내 왕눈이   2018-01-24 13:21:48.0
        
SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC
LIMIT 3, 3;   

 noticeno title    rname rdate
 -------- -------- ----- ---------------------
        4 4. 급여 안내 왕눈이   2018-01-24 13:21:48.0
        5 5. 급여 안내 왕눈이   2018-01-24 13:21:49.0

 
        
-----------------------------------------------------------------------------------







 