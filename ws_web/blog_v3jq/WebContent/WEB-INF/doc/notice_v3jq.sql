�� /WebContent/WEB-INF/doc/notice_v3jq.sql(q: MySQL) 
-----------------------------------------------------------------------------------
1. notice ���̺� ����

CREATE TABLE notice(
  noticeno INT                NOT NULL AUTO_INCREMENT COMMENT '��ȣ',
  title       VARCHAR(100) NOT NULL COMMENT '����',
  rname    VARCHAR(15)  NOT NULL COMMENT '����',
  rdate     DATETIME       NOT NULL COMMENT '�����',
  PRIMARY KEY(noticeno)
);

2. ���̺� ����
DROP TABLE notice;

3. ���
- PK �÷��� ������.
INSERT INTO notice(title, rname, rdate)
VALUES('������ ���� ����', '�մ���', now());

INSERT INTO notice(title, rname, rdate)
VALUES('4�� ���� ����', '�Ʒι�', now());

INSERT INTO notice(title, rname, rdate)
VALUES('3�� �޿� �ȳ�', '�մ���', now());

4. ���
SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC;

 noticeno title     rname rdate
 -------- --------- ----- ---------------------
        1 ������ ���� ���� �մ���   2017-08-21 12:14:50.0
        2 4�� ���� ����  �Ʒι�   2017-08-21 12:15:28.0
        3 3�� �޿� �ȳ�  �մ���   2017-08-21 12:15:45.0

-- �ϳ��� �÷��� �ƴ϶� ���ڵ� ��ü�� ������ �̵���.        
SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno DESC; 

 noticeno title     rname rdate
 -------- --------- ----- ---------------------
        3 3�� �޿� �ȳ�  �մ���   2017-08-21 12:15:45.0
        2 4�� ���� ����  �Ʒι�   2017-08-21 12:15:28.0
        1 ������ ���� ���� �մ���   2017-08-21 12:14:50.0

5. ��ȸ
SELECT noticeno, title, rname, rdate
FROM notice
WHERE noticeno = 1;

 noticeno title     rname rdate
 -------- --------- ----- ---------------------
        1 ������ ���� ���� �մ���   2017-08-21 12:21:40.0

6. ����
1) ��� ���ڵ� ����(����)
UPDATE notice
SET title='�ڹ� �ҽ�', rname = '����';

 noticeno title rname rdate
 -------- ----- ----- ---------------------
        3 �ڹ� �ҽ� ����    2017-08-21 12:21:42.0
        2 �ڹ� �ҽ� ����    2017-08-21 12:21:41.0
        1 �ڹ� �ҽ� ����    2017-08-21 12:21:40.0

2) 1�� ���ڵ常 ����(����)
UPDATE notice
SET title='�ʿ���', rname = '�Ʒι�'
WHERE noticeno = 1;

SELECT noticeno, title, rname, rdate
FROM notice
WHERE noticeno = 1;

 noticeno title rname rdate
 -------- ----- ----- ---------------------
        1 �ʿ���   �Ʒι�   2017-08-21 12:21:40.0
        
7. ����
1) �ϳ��� ���ڵ常 ����(����)
DELETE FROM notice
WHERE noticeno = 1;

SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC;

 noticeno title rname rdate
 -------- ----- ----- ---------------------
        2 �ڹ� �ҽ� ����    2017-08-21 12:21:41.0
        3 �ڹ� �ҽ� ����    2017-08-21 12:21:42.0

2) ��� ���ڵ� ����(����)        
DELETE FROM notice;

3) ���ڵ� ����
SELECT COUNT(*) as cnt
FROM notice;

 cnt
 ---
   0
  
8. LIMIT
1) ��Ȯ�� �ǽ������Ͽ� ���̺��� ������ �ٽ� �����մϴ�.

2) �ǽ� ������ �߰�
INSERT INTO notice(title, rname, rdate) VALUES('1. ������ ���� ����', '�մ���', now());
INSERT INTO notice(title, rname, rdate) VALUES('2. ���� ����', '�Ʒι�', now());
INSERT INTO notice(title, rname, rdate) VALUES('3. �޿� �ȳ�', '�մ���', now());
INSERT INTO notice(title, rname, rdate) VALUES('4. �޿� �ȳ�', '�մ���', now());
INSERT INTO notice(title, rname, rdate) VALUES('5. �޿� �ȳ�', '�մ���', now());
 
3) ��ü ���ڵ�
SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC;

 noticeno title        rname rdate
 -------- ------------ ----- ---------------------
        1 1. ������ ���� ���� �մ���   2018-01-24 13:21:45.0
        2 2. ���� ����     �Ʒι�   2018-01-24 13:21:46.0
        3 3. �޿� �ȳ�     �մ���   2018-01-24 13:21:47.0
        4 4. �޿� �ȳ�     �մ���   2018-01-24 13:21:48.0
        5 5. �޿� �ȳ�     �մ���   2018-01-24 13:21:49.0

4) 3���� ���ڵ� ���
- LIMIT ����� ���ڵ� ����
- LIMIT SKIP�� ���ڵ� ����, ����� ���ڵ� ����

SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC
LIMIT 3;       
        
 noticeno title        rname rdate
 -------- ------------ ----- ---------------------
        1 1. ������ ���� ���� �մ���   2018-01-24 13:21:45.0
        2 2. ���� ����     �Ʒι�   2018-01-24 13:21:46.0
        3 3. �޿� �ȳ�     �մ���   2018-01-24 13:21:47.0

SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC
LIMIT 0, 3;   

 noticeno title        rname rdate
 -------- ------------ ----- ---------------------
        1 1. ������ ���� ���� �մ���   2018-01-24 13:21:45.0
        2 2. ���� ����     �Ʒι�   2018-01-24 13:21:46.0
        3 3. �޿� �ȳ�     �մ���   2018-01-24 13:21:47.0

SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC
LIMIT 1, 3;   

 noticeno title    rname rdate
 -------- -------- ----- ---------------------
        2 2. ���� ���� �Ʒι�   2018-01-24 13:21:46.0
        3 3. �޿� �ȳ� �մ���   2018-01-24 13:21:47.0
        4 4. �޿� �ȳ� �մ���   2018-01-24 13:21:48.0
        
SELECT noticeno, title, rname, rdate
FROM notice
ORDER BY noticeno ASC
LIMIT 3, 3;   

 noticeno title    rname rdate
 -------- -------- ----- ---------------------
        4 4. �޿� �ȳ� �մ���   2018-01-24 13:21:48.0
        5 5. �޿� �ȳ� �մ���   2018-01-24 13:21:49.0

 
        
-----------------------------------------------------------------------------------







 