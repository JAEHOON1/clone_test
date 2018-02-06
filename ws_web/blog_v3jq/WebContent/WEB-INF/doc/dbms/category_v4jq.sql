▷ /WebContent/WEB-INF/doc/dbms/category_v4jq.sql
-------------------------------------------------------------------------------------
DROP TABLE IF EXISTS category;

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE category(
categoryno  INT              NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
title            VARCHAR(30) NOT NULL COMMENT '게시판 제목',
seqno         INT              DEFAULT 0  NOT NULL COMMENT '출력 순서',
visible         CHAR(1)      DEFAULT 'Y'      NOT NULL COMMENT '출력 선택',
ids             VARCHAR(200) DEFAULT 'admin' NOT NULL COMMENT '접근 계정',
cnt             INT              DEFAULT 0        NOT NULL COMMENT '등록된 자료수'
) COMMENT='카테고리';

2) 테이블 삭제
DROP TABLE category;


3) 등록
INSERT INTO category(title, seqno, visible, ids, cnt)
VALUES('해외 영화', 1, 'Y', 'guest', 0);
INSERT INTO category(title, seqno, visible, ids, cnt)
VALUES('국내 영화', 2, 'Y', 'guest', 0);
INSERT INTO category(title, seqno, visible, ids, cnt)
VALUES('미드', 3, 'Y', 'guest', 0);


4) 목록
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
ORDER BY categoryno ASC;

 categoryno title seqno visible ids   cnt
 ---------- ----- ----- ------- ----- ---
          1 해외 영화     1 Y       guest   0
          2 국내 영화     2 Y       guest   0
          3 미드        3 Y       guest   0

          
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
ORDER BY seqno ASC;          
 categoryno title    seqno visible ids   cnt
 ---------- -------- ----- ------- ----- ---
          1 워킹데드         1 Y       guest   0
          2 피어더 워킹데드     2 Y       guest   0
          3 스타트랙         3 Y       guest   0
          4 Gallery      4 Y       guest   0
          5 방명록          9 Y       guest   0


           
5) 조회
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
WHERE categoryno = 1;

 categoryno title seqno visible ids   cnt
 ---------- ----- ----- ------- ----- ---
          1 워킹데드      1 Y       guest   0


6) 수정
UPDATE category
SET title = 'ABC', seqno=0, visible='Y', ids='guest'
WHERE categoryno=1;

-- 출력 변경
UPDATE category
SET visible='Y'
WHERE categoryno=1;

-- 접근 계정 지정
UPDATE category
SET ids='guest'
WHERE categoryno=1;

-- 등록된 글 수 증가
UPDATE category
SET cnt = cnt + 1
WHERE categoryno=1;

-- 등록된 글 수 감소
UPDATE category
SET cnt = cnt - 1
WHERE categoryno=1;

-- 출력순서의 낮춤
UPDATE category
SET seqno = seqno + 1
WHERE categoryno=1;

-- 출력 순서의 높임
UPDATE category
SET seqno = seqno - 1
WHERE categoryno=1;

-- 등록된 글수의 초기와
UPDATE category
SET cnt=0
WHERE categoryno=9;


8) 삭제
-- 모두 삭제
DELETE FROM category;

-- 특정 레코드 삭제
DELETE FROM category
WHERE categoryno=38;

-- FK 테이블에서 사용안되는 레코의 삭제
DELETE FROM category
WHERE categoryno=7;


9) 검색
-- title 검색
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
WHERE title LIKE '%fall%'
ORDER BY categoryno ASC;

-- visible 검색
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
WHERE visible LIKE '%Y%'
ORDER BY categoryno ASC;

-- 접근 아이디 검색
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
WHERE ids LIKE '%admin%'
ORDER BY categoryno ASC;


10) 페이징
   - 목록은 페이징 구현을 필수로 합니다.
   
-- 검색된 전체 레코드 수
SELECT COUNT(categoryno) as cnt 
FROM category
WHERE title LIKE '%fall%'

 cnt
 ---
   1
   
-- 페이징
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
WHERE title LIKE '%fall%'
ORDER BY seqno ASC
LIMIT 0, 5;
 
11) 최대값(그룹함수: 여러개의 레코드를 대상으로 값을 산출)
SELECT MAX(seqno)+1 as seqno 
FROM category;
 
 seqno
 -----
     4

     
-------------------------------------------------------------------------------------
   
