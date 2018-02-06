▷ /WebContent/WEB-INF/doc/category_v4jq.sql
-------------------------------------------------------------------------------------
DROP TABLE IF EXISTS category;

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE category(
categoryno  INT             NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리번호',
title            VARCHAR(30) NOT NULL COMMENT '게시판 제목',
seqno         INT             DEFAULT 0       NOT NULL COMMENT '출력 순서',
visible         CHAR(1)     DEFAULT 'Y'     NOT NULL COMMENT '출력 선택',
ids             VARCHAR(200) DEFAULT 'admin' NOT NULL COMMENT '접근 계정',
cnt             INT             DEFAULT 0       NOT NULL COMMENT '등록된 자료수'
) COMMENT='카테고리';

1) INSERT


2) SELECT


3) 


4)


5)











-------------------------------------------------------------------------------------