DROP TABLE IF EXISTS category;

/**********************************/
/* Table Name: ī�װ� */
/**********************************/
CREATE TABLE category(
		categoryno                  	INT		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'ī�װ� ��ȣ',
		title                         		VARCHAR(30)		 NOT NULL COMMENT '����',
		seqno                         	INT		 NOT NULL COMMENT '��� ����',
		visible                       		CHAR		 NOT NULL COMMENT '��� ����',
		ids                           		VARCHAR(200)		 NOT NULL COMMENT '���� ����',
		cnt                           		INT		 NOT NULL COMMENT '��ϵ� �ۼ�'
) COMMENT='ī�װ�';

