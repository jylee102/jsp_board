drop table board;

create table board (
    board_no number primary key,
    user_id varchar2(50) not null,
    title varchar2(255) not null,
    content clob not null,
    reg_date date not null,
    views number not null,
    img varchar2(255)
);

drop sequence board_seq;

create sequence board_seq
       increment by 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;

insert into board values(board_seq.nextval, 'user1', '월급날', '어쩌고 쩌저고', sysdate, 0, '/img/루피1.jpeg');
insert into board values(board_seq.nextval, 'user1', '버그 없이 한번에 될때 내표정', '어쩌고 쩌저고', sysdate, 0, '/img/루피2.png');
insert into board values(board_seq.nextval, 'user2', '주말까지...', '어쩌고 쩌저고', sysdate, 0, '/img/루피3.png');

commit;

select * from board;

SELECT BOARD_NO, TITLE, TO_CHAR(REG_DATE, 'yyyy.mm.dd') REG_DATE, VIEWS FROM BOARD;
SELECT BOARD_NO, TITLE, USER_ID, TO_CHAR(REG_DATE, 'yyyy.mm.dd') REG_DATE, VIEWS, CONTENT, IMG FROM BOARD WHERE BOARD_NO = 1;
UPDATE BOARD SET VIEWS = (VIEWS + 1) WHERE BOARD_NO = 1;
UPDATE BOARD SET TITLE = '수정', USER_ID = '수정id', CONTENT = '수정내용', IMG = '' WHERE BOARD_NO = 1;
DELETE FROM BOARD WHERE BOARD_NO = 5;