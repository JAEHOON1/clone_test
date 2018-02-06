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
  