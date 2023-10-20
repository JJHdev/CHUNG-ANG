# :pushpin: Auction
> 경매사이트 (명품물건을 경매로 올려 구매자들이 구매할 수 있도록 구현)

</br>

## 1. 제작 기간 & 참여 인원
- 2023년 2월 20일 ~ 3월 10일
- 팀 프로젝트

</br>

#### Skill 
  - Spring
  - Oracle
  - Apache Tomcat 9.0
  - Java 1.8
  - JSP
  - Ajax
  - JavaScript
  - Jquery
  - Html5/CSS3
  - Mybatis
  - Github

</br>

## 3. ERD 설계
![화면 캡처 2023-04-03 004102](https://user-images.githubusercontent.com/116694081/230029046-470154ec-6da6-4f07-b1bf-5f8a4e00e886.png)

</br>
  
## 4. 핵심 기능
- 다중 image 업로드 기능
- JS와 Jquery를 이용하여 각 경매 제품마다 경매종료일 까지 카운트다운 기능
- Ajax를 이용하여 판매자가 판매등록시 판매탭에 비동기적으로 업데이트 구현
- Ajax를 이용하여 판매물품에 대한 구매가 있을경우 구매목록리스트 클릭시 구매자 금액 순으로 구현
- @scheduler를 이용하여 주기적으로 종료 된 경매물품 check 하여 자동 쪽지 발송
- 발송 된 쪽지 결재 기능 구현

### 4.1. 구현한 JSP Page (src/webapp/WebInf/views)
- acutionGoods
- module
- emp (select_*)제외
- message
- modeul

### 4.2. 구현한 Java Page (java Resources/src/main/java/com/mycom/auction)
- auth
- emp (select* 제외)
- mypage


### 4.3.핵심코드 리뷰
<details>
<summary><b>스케쥴러 기능 구현</b></summary>
<div markdown="1">
  
##### 4.2.1 스케쥴러 기능 구현코드
![스케쥴러](https://user-images.githubusercontent.com/116694081/230059488-2873822c-ac45-44eb-a8f1-c38f20c5f093.png)
  
</div>
</details>

</br>

<details>
<summary><b>실시간 시간</b></summary>
<div markdown="1">
  
##### 4.2.2 실시간 시간 JS코드
![시간 실시간으로 나오게 하기](https://user-images.githubusercontent.com/116694081/230059564-8b7209e5-8f69-4a40-9f1c-24563a91abe7.png)
  
</div>
</details>

</br>

<details>
<summary><b>Ajax이용한 실시간 카운드 다운, 테이블생성</b></summary>
<div markdown="1">
  
##### 4.2.3 실 시간 카운드 다운, 테이블 생성 코
![실시간 시간 count과 ajax테이블 생성](https://user-images.githubusercontent.com/116694081/230059630-9c012db6-6420-44b5-b7d2-392834ee2ea7.png)
  
</div>
</details>

</br>

<details>
<summary><b>이미지 업로드 구현</b></summary>
<div markdown="1">
  
##### 4.2.4 이미지 업로드시 이미지파일, 데이터 드구분코드
![이미지 업로드](https://user-images.githubusercontent.com/116694081/230059866-523cc430-cb08-4914-aa7d-6cc7c7da821f.png)

</div>
</details>

</br>

<details>
<summary><b>경매시간 종료 후 countDown, 메세지 발송 구현 코드</b></summary>
<div markdown="1">
  
##### 4.2.5 Repository에서 경매시간 종료 후 코드 구현
![판매완료 상품 메세지 발송 번호바꾸기](https://user-images.githubusercontent.com/116694081/230059925-5d7964ae-0821-4763-bfbd-523e84644ac4.png)
  
</div>
</details>
