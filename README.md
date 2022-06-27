# 양도 제공 웹사이트 **제작 토이프로젝트**

- **개발 기간** : 2021.08.29. ~ 2021.09.30.
- **참여 인원** : 4명

## **1)** 프로젝트 소개

- **기획 의도**

부득이하게 식사, 숙박, 티켓을 사용하지 못할 경우, 취소 수수료를 최소화 하기 위해 다른 이용자에게 양도할 수 있는 사이트로 제작방향을 설정하였습니다. 레이아웃 구조는 [여기어때]를 벤치마킹하였습니다.

## 2) **담당 업무**

- `**이벤트`, `FAQ`, `QNA`**  기능(이미지 업로드 및 페이징 처리) 및 화면구현

## 3) **개발환경 및 사용기술**

- **`OS`** Windows 10
- **`Language`** JAVA 11
- **`DBMS`** Oracle 18c
- **`Server`** Apache Tomcat v9.0
- **`Back-end`** Java, Spring Framework, MyBatis, JSP
- **`Front-end`** HTML5, CSS3, JavaScript, jQuery

## 4) **시스템 설계**

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/28ce3874-983f-4276-835b-c7be35813f61/Untitled.png)

## 5) 비즈니스 요구사항

**(1) 일반 회원**
   - 카테고리 별 양도정보 입력 및 [양도하기] 진행
   - 타 회원이 양도정보를 올려논 내용을 확인 후 [양도받기] 및 [결제] 진행
   - [이벤트], [자주 묻는 질문] 게시물 리스트 및 상세페이지 확인 가능
   - QNA 게시판을 통한 문의 작성 가능 및 [내정보] 내 문의사항에서 문의 내역 확인 가능

**(2) 관리자**
   -  [이벤트], [자주 묻는 질문] 게시물 관리 가능
   -  회원리스트 및 등급변경, 게시글관리, 양도글 관리, QNA 답변 관리 가능

## 6) 화면 구성

- **메인 :** 더보기/회원아이콘 마우스 오버 시, 서브 메뉴 노출

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4c75933f-c2f1-49dd-9d62-8e3b4a1229d9/Untitled.png)

- **양도 글 보기(숙박/티켓/식사) :** 양도정보 확인 가능(양도 내역 없을 시 디폴트 값 지정)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3396e0ba-f4c6-4eaa-bc56-a917ab5da4c1/Untitled.png)

- **양도하기 :** 항목 입력 후 양도 진행 및 양도완료 시 상세정보 확인 가능

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3d94b605-73d4-4679-8226-0951088bd274/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4708ec98-7989-4cfd-b39d-cb437509526a/Untitled.png)

- **타회원이 올린** **양도정보 상세보기 및 결제하기 :** 양도정보 확인 및 결제 가능

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/aa3ca2a9-e05a-4516-9f27-e4d4da976624/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/26567c37-f9ee-428e-9852-2e12f90160c2/Untitled.png)

- **내정보 > 이용내역 :** 양도완료 된 상세정보 확인 가능

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e7dc806f-df76-4761-8307-9c90b1de3c94/Untitled.png)

- **타회원이 올린** **양도정보 상세보기 및 결제하기 :** 양도정보 확인 및 결제 가능

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a5025dcc-35b1-4232-8c73-6fe9b32c84af/Untitled.png)

- **이벤트 :** 이벤트 리스트 확인 가능 및 관리자 등급에 한정하여 등록,수정,삭제 가능

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e3355219-7066-4478-9131-8db2867ef5fe/Untitled.png)

- **QNA :** QNA 리스트 및 CRUD 가능 /  본인의 작성 내역은 [내 문의내역]에서 확인 가능

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a04aaafb-0fec-4fa5-9d5e-453105fa5d59/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a943c6fb-ef16-4448-bc8a-0734c5728176/Untitled.png)
