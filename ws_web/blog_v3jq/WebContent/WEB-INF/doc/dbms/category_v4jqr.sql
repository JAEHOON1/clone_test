-- title �˻�
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
WHERE title LIKE '%fall%'
ORDER BY categoryno ASC;
 
-- visible �˻�
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
WHERE visible LIKE '%Y%'
ORDER BY categoryno ASC;
 
-- ���� ���̵� �˻�
SELECT categoryno, title, seqno, visible, ids, cnt
FROM category
WHERE ids LIKE '%admin%'
ORDER BY categoryno ASC;
  