----------------------------------------------------------------------
-- 공지사항 테이블
create table notice (
    notice_num number not null,                  -- 공지사항 글번호
    name varchar2(30) not null,                  -- 이름 
    id varchar2(30) not null,                    -- 아이디
    grade number,                                -- 회원 등급(0: 관리자, 1: 일반회원)
    notice_subject varchar2(250) not null,       -- 공지사항 제목
    notice_content varchar2(4000) not null,      -- 공지사항 내용
    notice_logtime date                          -- 공지사항 등록일
);
-- 테이블 삭제
drop table notice purge;
-- 테이블 확인
select * from tab;

-- 시퀀스 객체 생성 
create sequence seq_notice nocache nocycle;
-- 시퀀스 객체 삭제
drop sequence seq_notice;

-- 데이터 저장
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
insert into notice values
(seq_notice.nextval, '관리자', 'admin', '0','공지 테스트', '공지 테스트 내용', sysdate);
-- 데이터 확인
select * from notice;
select * from notice where notice_num = 1;
-- 데이터 삭제
delete notice where notice_num = 2;
-- 데이터 수정
update notice set notice_subject = '공지 수정 테스트', 
notice_content = '공지 수정 테스트 내용'
where notice_num = 2;

-- 인덱스 뷰
select * from
(select rownum rn, tt.* from
(select * from notice order by notice_num desc) tt)
where rn>=1 and rn<=5;

select notice_num, name, id, grade, notice_subject, notice_content, 
to_char(notice_logtime, 'YYYY.MM.DD') as logtime from 
(select rownum rn, tt.* from
(select * from notice order by notice_num desc) tt) 
where rn>=1 and rn<=10;

-- 총 데이터 수 구하기
select count(*) as cnt from notice;

-- DB 저장
commit;


---------------------------------------------------------------------------
-- FAQ 테이블
create table faq (
    faq_num number not null,                     -- FAQ 글번호
    name varchar2(30) not null,                  -- 이름 
    id varchar2(30) not null,                    -- 아이디
    grade number,                                -- 회원 등급(0: 관리자, 1: 일반회원)
    faq_category number not null,                -- FAQ 분류
    faq_subject varchar2(250) not null,          -- FAQ 제목
    faq_content varchar2(4000) not null          -- FAQ 내용
);
-- 테이블 삭제
drop table faq purge;
-- 테이블 확인
select * from tab;

-- 시퀀스 객체 생성 
create sequence seq_faq nocache nocycle;
-- 시퀀스 객체 삭제
drop sequence seq_faq;

-- 데이터 저장
insert into faq values
(seq_faq.nextval, '관리자', 'admin', 0, 1, 'top7', 'top7 내용');
insert into faq values
(seq_faq.nextval, '관리자', 'admin', 0, 4, '회원정보', '회원정보 내용');
insert into faq values
(seq_faq.nextval, '관리자', 'admin', 0, 2, '이용문의 안내', '이용문의 내용 참고');
-- 데이터 확인
select * from faq;
select * from faq where faq_category = 2;
select * from faq where faq_num = 9;
-- 데이터 삭제
delete faq where faq_category = 2;
delete faq;
-- 데이터 수정
update faq set faq_category = 2, 
faq_subject = '이용문의 안내', faq_content = '자세한 문의는 qna 추천'
where faq_num = 9;

-- 인덱스 뷰
select * from
(select rownum rn, tt.* from
(select * from faq order by faq_num asc) tt)
where rn>=1 and rn<=10;

select * from
(select rownum rn, tt.* from
(select * from faq order by faq_num asc) tt);

select faq_num, name, id, grade, faq_category, faq_subject, faq_content from 
(select rownum rn, tt.* from
(select * from faq order by faq_num asc) tt) 
where rn>=1 and rn<=10;

-- 총 데이터 수 구하기
select count(*) as cnt from faq;

-- DB 저장
commit;


---------------------------------------------------------------------------
-- QnA 테이블
create table qna (
    qna_num number not null,                    -- QnA 글번호
    name varchar2(30) not null,                 -- 이름 
    id varchar2(30) not null,                   -- 아이디
    grade number,                               -- 회원 등급(0: 관리자, 1: 일반회원)
    qna_type varchar2(250) not null,            -- QnA 문의 유형
    qna_category varchar2(250) not null,        -- QnA 카테고리
    qna_result number not null,                 -- QnA 답변 여부(0: 답변X, 1: 답변0)
    qna_subject varchar2(250) not null,         -- QnA 제목
    qna_content varchar2(1000)  not null,       -- QnA 내용
    qna_logtime date  not null,                 -- QnA 작성일
    qna_reply varchar2(1000),                   -- QnA 답변
    qna_redate date,                            -- QnA 답변 작성일
    qna_public number not null                  -- QnA 공개여부(0: 공개, 1: 비공개)
);
-- 테이블 삭제
drop table qna purge;
-- 테이블 확인
select * from tab;

-- 시퀀스 객체 생성 
create sequence seq_qna nocache nocycle;
-- 시퀀스 객체 삭제
drop sequence seq_qna;

-- 데이터 저장
insert into qna values
(seq_qna.nextval, '서건', 'seokun', '1', '이용문의', '호텔', 0, '양도권 올릴때',
'호텔, 모텔 기준이 뭔가요?', sysdate, null, null, 0);
insert into qna values
(seq_qna.nextval, '장우선', 'jus5372', '1', '결제', '스포츠', 0, '야구 관람권이 결제가 안돼요.',
'다른 스포츠 종목은 다 되는데 야구 관람권만 결제가 안돼요.', sysdate, null, null, 0);
insert into qna values
(seq_qna.nextval, '오성숙', 'oss573', '1', '결제', '영화', 0, '영화권 결제요',
'무통장입금도 가능한가요?', sysdate, null, null, 1);
insert into qna values
(seq_qna.nextval, '탁호진', 'thj532', '1', '회원정보', '기타', 0, '제가 개명을 했는데요',
'이름 어떻게 바꿔야 해요?', sysdate, null, null, 0);
insert into qna values
(seq_qna.nextval, '복성훈', 'bjh21', '1', '이벤트', '호텔', 0, '사용 가능 영업 시간',
'사용가능 영업시간은 어디에서 확인해야 하나요?', sysdate, null, null, 0);
insert into qna values
(seq_qna.nextval, '배시원', 'bsw21', '1', '기타', '기타', 0, '홈페이지에 있는 양그림이요',
'홈페이지에 있는 양그림 말인데요, 
혹시 제 과제에 사용해도 될까요?', sysdate, null, null, 0);
insert into qna values
(seq_qna.nextval, '최경선', 'cks75', '1', '이용문의', '모텔', 0, '대실 이용문의',
'대실만 따로 계산할 수 있나요?', sysdate, null, null, 0);
insert into qna values
(seq_qna.nextval, '홍푸름', 'hbr95', '1', '회원정보', '기타', 0, '이메일이 안와요',
'이메일로 확인 문자가 안오는데 어떻게 해야 하나요?', sysdate, null, null, 0);
insert into qna values
(seq_qna.nextval, '고꽃', 'kk164', '1', '기타', '식사권', 0, '식사권을 양도하려는데요',
'제가 가지고 있는 식사권이 실물인데 어떻게 거래해야 하나요?', sysdate, null, null, 1);
insert into qna values
(seq_qna.nextval, '송새론', 'ssr156', '1', '이벤트', '레스토랑', 0, '이번 이벤트요',
'사용 가능한 레스토랑은 어디에 있나요?', sysdate, null, null, 0);

insert into qna values
(seq_qna.nextval, '이웅', 'lee29', '1', '회원정보', '기타', 0, '제가 개명을 했는데요',
'이름은 어떻게 수정하면 되나요?', sysdate, null, null, 1);

-- 데이터 확인
select * from qna;
select * from qna where qna_num = 2;
-- 데이터 삭제
delete qna where id= 'hong';
-- 데이터 수정
update qna set 
qna_type = '회원정보', qna_category = '기타', qna_public = 1,
qna_subject = '회원탈퇴', qna_content='회원 탈퇴는 어디에 있나요?'
where qna_num = 12;
-- 데이터 수정(답글 작성)
update qna set
qna_result = 1, 
qna_reply = '이메일 재전송해 드렸습니다. 확인 부탁드립니다.', qna_redate = sysdate
where qna_num = 17;

-- 인덱스 뷰
select qna_num, name, id, grade, qna_type, 
qna_category, qna_result, qna_public, qna_subject, 
qna_content, qna_reply, qna_public,        
to_char(qna_logtime, 'YYYY.MM.DD') as qna_logtime,
to_char(qna_redate, 'YYYY.MM.DD') as qna_redate from 
(select rownum rn, tt.* from
(select * from qna order by qna_num desc) tt) 
where rn>=1 and rn<=10;
-- 총 데이터 수 구하기
select count(*) as cnt from qna;

-- DB 저장
commit;
---------------------------------------------------------------------------
-- 이벤트 테이블
create table event (
    event_num number not null,                  -- 이벤트 글번호
    name varchar2(30) not null,                 -- 이름 
    id varchar2(30) not null,                   -- 아이디
    grade number,                               -- 회원 등급(0: 관리자, 1: 일반회원)
    event_image varchar2(250),                  -- 이벤트 이미지
    event_subject varchar2(250) not null,       -- 이벤트 제목
    event_start varchar2(250) not null,         -- 이벤트 시작일
    event_end varchar2(250) not null,           -- 이벤트 종료일
    event_content varchar2(4000) not null,      -- 이벤트 내용
    event_logtime date not null                 -- 이벤트 작성일
);
-- 테이블 삭제
drop table event purge;
-- 테이블 확인
select * from tab;

-- 시퀀스 객체 생성 
create sequence seq_event nocache nocycle;
-- 시퀀스 객체 삭제
drop sequence seq_event;

-- 데이터 저장
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img4.jpg', '숙박대전', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img5.jpg', '파라다이스 부산 공동구매 어워즈', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img6.jpg', '연말 인기숙소 예약 특가', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img7.jpg', '전주 여행 특가', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img8.jpg', '서울 지역 숙박 할인', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img9.jpg', '액티비티 스파 특집', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img10.jpg', '강원도 여행 특가', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img11.jpg', '우리 아이를 위한 여행', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img12.jpg', '바이러스 케어룸', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);
insert into event values
(seq_event.nextval, '관리자', 'admin', '0', 'event_img13.png', '반려동물 특집 이벤트', '2021-11-08', '2021-11-20', 
'숙박 예약자 추첨 후 상품', sysdate);

-- 데이터 확인
select * from event;
select * from event where event_num = 2;
-- 데이터 삭제
delete event where event_num = 4;
-- 데이터 수정
update event set 
event_image = 'event_img2.png', event_subject = '리서치 이벤트', 
event_start = '2021-11-10', event_end = '2021-11-31', 
event_content = '리서치에 참여하고 경품 받아가세요!'
where event_num = 7;

update event set 
event_subject = '근시 안경 도수 여행', 
event_start = '2021-12-01', event_end = '2021-12-05', 
event_content = '근시 안경을 쓴 자들을 위한 여행.. 당신을 초대합니다..'
where event_num = 13;

update event set 
event_image = 'event_img2.png', event_subject = '가을 억새 축제', 
event_start = '2021-11-01', event_end = '2021-12-30', 
event_content = '가을 억새 축제가 민둥산에서 열립니다.'
where event_num = 3;

update event set 
event_subject = '전주 전통 축제', 
event_start = '2021-09-10', event_end = '2021-09-20', 
event_content = '전주 한옥 마을에서 즐겁게 놀다 가세요!'
where event_num = 8;

-- 인덱스 뷰
select * from
(select rownum rn, tt.* from
(select * from event order by event_num desc) tt)
where rn>=1 and rn<=10;

select event_num, name, id, grade, event_image, event_subject, 
event_start, event_end, event_content, 
to_char(event_logtime, 'YYYY.MM.DD') as event_logtime from 
(select rownum rn, tt.* from
(select * from event order by event_num desc) tt) 
where rn>=1 and rn<=10;
-- 총 데이터 수 구하기
select count(*) as cnt from event;

-- DB 저장
commit;
---------------------------------------------------------------------------
-- 회원 테이블
create table member (
    name varchar2(30) not null,     -- 이름 
    id varchar2(30) primary key,    -- 아이디
    pwd varchar2(30) not null,      -- 비밀번호
    nickname varchar2(30) not null, -- 닉네임
    email varchar2(20),             -- 이메일
    emai2 varchar2(20),             -- 이메일
    tel varchar2(30),               -- 전화번호
    post varchar2(10),              -- 우편
    addr1 varchar2(50),             -- 도로명 주소
    addr2 varchar2(50),             -- 세부 주소
    grade number,                   -- 회원 등급(0: 관리자, 1: 일반회원)
    logtime date                    -- 가입 날짜
);
-- 테이블 삭제
drop table member purge;
-- 테이블 확인
select * from tab;

-- 데이터 저장
insert into member values
('관리자', 'admin2', '1234', 'admin2', 'null', 
'null', 'null', 'null', 'null', 'null', '0', sysdate);

insert into member values
('홍길동', 'hong2', '1234', 'hong2', 'null', 
'null', 'null', 'null', 'null', 'null', '1', sysdate);

-- 데이터 확인
select * from member;
select * from member where grade = 1;
select * from member where id = 'hong';
-- 데이터 삭제
delete event where id = 'hong';

-- 총 데이터 수 구하기
select count(*) as cnt from member;

-- DB 저장
commit;

---------------------------------------------------------------
-- 양도 게시판 테이블
create table yangdo_list (
    seq number primary key,
    id varchar2(30),            -- 아이디
    res_start_date date,            -- 예약 시작 일자
    res_end_date date,      -- 예약 종료 일자
    res_region varchar2(50),    -- 예약 지역
    yangdo_kind varchar2(30),   -- 양도 종류
    res_spot varchar2(50),      -- 예약한 장소
    res_seat varchar2(30),      -- 예약 좌석 or 방 종류 등
    res_price varchar2(30),           -- 원래 예약한 금액
    res_total varchar2(30),           -- 총 이용금액
    yangdo_due_date varchar2(30),     -- 양도 마감일
    yangdo_price varchar2(30),        -- 양도 금액
    yangdo_fee varchar2(30),        -- 양도 수수료
    yangdo_total_price varchar2(30),        -- 양도성사시 환불금액
    yangdo_status varchar2(30), -- 양도 상태
    yangdo_reason varchar2(200),-- 양도 사유
    yangdo_res_count varchar2(30), -- 예약 수
    yangdo_people varchar2(30) -- 예약 인원
);
select * from tab;
select * from yangdo_list;
drop table yangdo_list purge;

delete yangdo_list;
select * from yangdo_list;
-- 시퀀스 객체 생성 
create sequence seq nocache nocycle;
-- 시퀀스 객체 삭제
drop sequence seq;

insert into yangdo_list values 
(seq.nextval, 'hong', '21/11/19', '21/11/21', '경기 오산시', 
'식사 > 호텔식사권 ', '신라호텔', '조식2인', '100000', '100000', 
'2021-11-24', '50000', '2500', '47500', '대기중', '개인사유', '1', '2');

select count(*) as cnt from yangdo_list 
where yangdo_kind like '%호텔%' and yangdo_status like '대기중';

select * from yangdo_list where seq=802;

select * from yangdo_list where id='hong' and seq=802;

update yangdo_list set res_start_date='21/11/19', 
res_end_date='21/11/21', res_region='경기 수원시',
yangdo_kind='식사 > 호텔식사권', res_spot='신라호텔', res_seat='조식2인', 
res_price='100000', res_total='100000', yangdo_due_date='2021-11-24', 
yangdo_price='50000', yangdo_fee='2500', yangdo_total_price='47500', 
yangdo_reason='개인사유', yangdo_res_count='1', yangdo_people='2' 
where seq=802;

update yangdo_list set yangdo_status='양도완료' where seq=802;

delete yangdo_list where seq=802;

select count(*) as cnt from yangdo_list where id=hong;

delete from yangdo_list where seq=824;

commit;
