▷ /WEB-INF/doc/prev_next_q.sql
----------------------------------------------------------------------------------- 
이전글(◀) 다음글(▶)이 등장하는 조회 페이지는 3번의 SQL 실행이 필요합니다. 
CREATE TABLE prenext(
  prenextno  INT(7) NOT NULL, AUTO_INCREMENT,
  grp           INT(7) NOT NULL,
  title          VARCHAR(100) NOT NULL,
  PRIMARY KEY(prenextno)
);
 
INSERT INTO prenext(prenextno, grp, title)
VALUES(1, 1, '내일 눈 많이 옵니다.');
 
INSERT INTO prenext(prenextno, grp, title)
VALUES(2, 1, '크리스 마스 트리 제작');
 
INSERT INTO prenext(prenextno, grp, title)
VALUES(3, 1, '내일 초강력 강추위 옵니다.');
 
INSERT INTO prenext(prenextno, grp, title)
VALUES(4, 2, '드디어 따뜻한 봄입니다.');
 
INSERT INTO prenext(prenextno, grp, title)
VALUES(5, 2, '봄날 벗꽃 여행 갑니다.');
 
INSERT INTO prenext(prenextno, grp, title)
VALUES(6, 2, '봄 캠핑갑니다.');
 
SELECT prenextno, grp, title 
FROM prenext 
ORDER BY prenextno ASC;
 
 PRENEXTNO GRP TITLE
 --------- --- ---------------
         1   1 내일 눈 많이 옵니다.
         2   1 크리스 마스 트리 제작
         3   1 내일 초강력 강추위 옵니다.
         4   2 드디어 따뜻한 봄입니다.
         5   2 봄날 벗꽃 여행 갑니다.
         6   2 봄 캠핑갑니다.
 
-- 현재글
SELECT MAX(prenextno) as prenextno
FROM prenext
WHERE grp = 1 AND prenextno = 3;
 
PRENEXTNO
 ---------
         2
 
 
-- 이전글
SELECT MAX(prenextno) as prenextno
FROM prenext
WHERE grp = 1 AND prenextno < 2;
 
 PRENEXTNO
 ---------
         1
 
SELECT MIN(prenextno) as prenextno
FROM prenext
WHERE grp = 1 AND prenextno > 3;
 
 PRENEXTNO
 ---------
         3