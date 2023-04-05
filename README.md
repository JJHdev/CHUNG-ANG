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
<summary><b>Form 안에 submit2개 요청 처리</b></summary>
<div markdown="1">
  
##### 4.2.1 JSP에서 1개의 form태그에서 2개의 submit 버튼으로 보내기
![2개 submit jsp](https://user-images.githubusercontent.com/116694081/230015412-643b9691-2b00-4f9e-b9a1-1354c6702f83.png)

##### 4.2.1 Controller에서 1개의 form태그에서 2개의 submit 버튼 구분하기
![2개 submit con](https://user-images.githubusercontent.com/116694081/230015245-c1e98b03-981c-4e1d-b6bc-79723c2dbd8e.png)
  
</div>
</details>

</br>

<details>
<summary><b>유효성 검사하기</b></summary>
<div markdown="1">
  
##### 4.2.2 html에서의 유효성검사
![html에서의 유효성검사](https://user-images.githubusercontent.com/116694081/230015658-fc6d5469-b55c-45e5-8856-96b6a234842a.png)

##### 4.2.2 script에서의 유효성 검사
![script에서의 유효성 검사](https://user-images.githubusercontent.com/116694081/230015830-7010ab6b-b119-47af-9615-f36081638e7b.png)
  
##### 4.2.2 Java에서의 유효성 검사
![자바에서의 유효성 검사](https://user-images.githubusercontent.com/116694081/230016153-2583b369-eedb-4e65-b298-29f1b2250e2e.png)
  
</div>
</details>

</br>

<details>
<summary><b>Controller에서 4가지의 요청방식 처리하기</b></summary>
<div markdown="1">
  
##### 4.2.3 Controller에서 4가지의 요청리처리
![접근방식에 따라 처리하기 (처음, 사원조회, 삭제하기, 조회)](https://user-images.githubusercontent.com/116694081/230016198-042fbcfd-eabf-4296-a194-bc0e965c3549.png)
  
</div>
</details>

</br>

<details>
<summary><b>부서삭제시 ajax처리</b></summary>
<div markdown="1">
  
##### 4.2.4 JSP Ajax처
![부서삭제시 ajax처리](https://user-images.githubusercontent.com/116694081/230016017-d26510e5-e6bf-459d-95eb-6920e13c938b.png)

</div>
</details>

</br>

<details>
<summary><b>삭제할 쪽지 배열로 받고 한번에 삭제하기</b></summary>
<div markdown="1">
  
##### 4.2.5 Controller에서 배열요청 처리
![삭제할 쪽지 배열로 받고 한번에 삭제하기](https://user-images.githubusercontent.com/116694081/230015949-a682e3d7-5c55-472c-be31-c52d13357eb4.png)
  
</div>
</details>

</br>

<details>
<summary><b>DB요청 후 여러개의 로직 수행시 트렌젝션 처리</b></summary>
<div markdown="1">
  
##### 4.2.6 DB 접근 처리시 트렌젝션 처리
![여러개의 DB 접근 처리시 트렌젝션 처리](https://user-images.githubusercontent.com/116694081/230016076-93bb0d50-2f82-47c5-b0e4-ecb14b2a39a0.png)
  
</div>
</details>
