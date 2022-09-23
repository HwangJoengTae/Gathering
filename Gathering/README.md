# Gathering

양식 통일

file:///c:/GatheringFileSave/

모임 만들기, 모임리스트,모임 삭제, 상세, 수정 (윤)
모임 가입하기, 관심있는 모임, 내가 가입한 모임, 내가 만든 모임 삭제 찜하기 (윤)


모임공지에 관련된
공지 등록, 삭제, 리스트, 수정, 상세  (성현)




모임앨범, 수다 관련
모임 수다방, 모임앨범, 앨범 댓글, 앨범 사진첨부, (정태)





--컬럼 변경 
ALTER TABLE group_info ADD kind VARCHAR2(20);

--컬럼 속성 변경
ALTER TABLE group_info MODIFY brief VARCHAR2(100);

commit;


-- 테이블변경(group_notice)

CREATE TABLE group_notice (
	group_notice_seq	NUMBER PRIMARY KEY,
	group_seq	        NUMBER,
	type	            VARCHAR2(20),
	title	            VARCHAR2(30),
	content	            VARCHAR2(1000),
	filename	        VARCHAR2(50),
	regDate	            DATE DEFAULT SYSDATE,
	jungmo_date	        VARCHAR2(50),
	jungmo_place	    VARCHAR2(100),
        cnt                 NUMBER default 0,
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq)
);

--테이블 변경 사항 (황정태)

--comments 테이블에 suda_seq 추가 

ALTER TABLE comments ADD suda_seq NUMBER;


--notice테이블 filename 삭제 

CREATE TABLE notice(
notice_seq  NUMBER PRIMARY KEY,
user_id     VARCHAR2(20),
title       VARCHAR2(50),
content     VARCHAR2(1000),
cnt         NUMBER,
FOREIGN KEY(user_id) REFERENCES user_info(user_id)
);


--그룹앨범  변경 (like 삭제-> user_id 추가 외래키 참조)
CREATE TABLE group_album (
	group_album_seq	NUMBER PRIMARY KEY,
	group_seq	    NUMBER,
	title	        VARCHAR2(50),
	filename	    VARCHAR2(50),
	user_id	        VARCHAR2(20),
    FOREIGN KEY(group_seq) REFERENCES group_info(group_seq),
    FOREIGN KEY(user_id) REFERENCES user_info(user_id)
);

--files 테이블 추가(uploadPath, uuid 컬럼추가)

ALTER TABLE files add uploadPath varchar(200);
commit;

ALTER TABLE files add uuid varchar(100);
commit;

