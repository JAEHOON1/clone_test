DROP TABLE IF EXISTS category;

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE category(
		categoryno                  	INT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리 번호',
		title                         		VARCHAR(30)		 NOT NULL COMMENT '제목',
		seqno                         	INT		 NOT NULL COMMENT '출력 순서',
		visible                       		CHAR		 NOT NULL COMMENT '출력 여부',
		ids                           		VARCHAR(200)		 NOT NULL COMMENT '접근 계정',
		cnt                           		INT		 NOT NULL COMMENT '등록된 글수'
) COMMENT='카테고리';

