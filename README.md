# 양도 제공 웹사이트 **제작 토이프로젝트**

- **개발 기간** : 2021.08.29. ~ 2021.09.30.
- **참여 인원** : 4명

## **1)** 프로젝트 소개

- **기획 의도**

부득이하게 식사, 숙박, 티켓을 사용하지 못할 경우, 취소 수수료를 최소화 하기 위해 다른 이용자에게 양도할 수 있는 사이트로 제작방향을 설정하였습니다. 레이아웃 구조는 [여기어때]를 벤치마킹하였습니다.

## 2) **담당 업무**

- **`이벤트`**, **`FAQ`**, **`QNA`**  기능(이미지 업로드 및 페이징 처리) 및 화면구현

## 3) **개발환경 및 사용기술**

- **`OS`** Windows 10
- **`Language`** JAVA 11
- **`DBMS`** Oracle 18c
- **`Server`** Apache Tomcat v9.0
- **`Back-end`** Java, Spring Framework, MyBatis, JSP
- **`Front-end`** HTML5, CSS3, JavaScript, jQuery

## 4) **시스템 설계**

![양도1](https://user-images.githubusercontent.com/85205124/176147954-c65fec59-c614-458a-acd0-aee26c5e181f.png)

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

![양도2](https://user-images.githubusercontent.com/85205124/176148007-d5accd3b-1177-4f6c-96df-81ee4b9f9bda.png)

- **양도 글 보기(숙박/티켓/식사) :** 양도정보 확인 가능(양도 내역 없을 시 디폴트 값 지정)

![양도3](https://user-images.githubusercontent.com/85205124/176148036-4a91fa17-8236-4cab-9ff4-6ea4a694694d.png)

- **양도하기 :** 항목 입력 후 양도 진행 및 양도완료 시 상세정보 확인 가능

![양도4](https://user-images.githubusercontent.com/85205124/176148065-566ebafd-3aa9-4c65-bb13-886cf2146aea.png)

![양도5](https://user-images.githubusercontent.com/85205124/176148091-73b1ef7b-067a-4403-940f-17faa681a166.png)

- **타회원이 올린** **양도정보 상세보기 및 결제하기 :** 양도정보 확인 및 결제 가능

![양도6](https://user-images.githubusercontent.com/85205124/176148135-6e155292-dec7-40b0-a274-92a432c7fea5.png)

![양도7](https://user-images.githubusercontent.com/85205124/176148153-215bf550-73fb-45cc-bd00-3b746b40f390.png)

- **내정보 > 이용내역 :** 양도완료 된 상세정보 확인 가능

![양도8](https://user-images.githubusercontent.com/85205124/176148177-dd610a47-62cc-4008-af4b-486bb31515ad.png)

- **타회원이 올린** **양도정보 상세보기 및 결제하기 :** 양도정보 확인 및 결제 가능

![양도9](https://user-images.githubusercontent.com/85205124/176148205-0674027e-60f2-426d-a0d2-9c53e5c976c5.png)

- **이벤트 :** 이벤트 리스트 확인 가능 및 관리자 등급에 한정하여 등록,수정,삭제 가능

![양도10](https://user-images.githubusercontent.com/85205124/176148227-76b403d9-c1cf-49d9-b18b-b45de798cd66.png)

- **QNA :** QNA 리스트 및 CRUD 가능 /  본인의 작성 내역은 [내 문의내역]에서 확인 가능
- 
![양도11](https://user-images.githubusercontent.com/85205124/176148249-927cc7a7-98a9-49f2-8369-9e18bfbc3fff.png)

![양도12](https://user-images.githubusercontent.com/85205124/176148272-90b201ae-8cc2-46a0-8a38-629529db4117.png)
