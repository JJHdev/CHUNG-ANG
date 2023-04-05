# :pushpin: GIS 기반 리포팅 시스템 구축
![image](https://user-images.githubusercontent.com/116694081/230061549-8ad2d994-104c-4e21-83bf-707d9391c25f.png)

> 지역에 따른 데이터를 취합 후 관련 정보를 Python으로 DB 입력
> 입력된 DB를 이용하여 Geoserver, OpenLayers를 이용하여 지도 표현

</br>

## 1. 제작 기간 & 참여 인원
- 2023년 3월 13일 ~ 4월 13일
- 개인 프로젝트

</br>

## 2. 사용 기술
#### Skill 
  - egovframework
  - Ptython
  - PostgreSQL
  - Apache Tomcat 9.0
  - Geoserver
  - Java 1.8
  - JSP
  - JavaScript
  - Jquery
  - Html5/CSS3
  - Mybatis
  - SVN
  - Qgis,PostGis
  - Openlayers

</br>

## 3. ERD 설계
![ERDClude](https://user-images.githubusercontent.com/116694081/229997011-844b20ed-1bff-4c19-a299-c24567a97ca0.png)


</br>
  
## 4. 핵심 기능
사원과 부서를 추가 삭제할 수 있으며 쪽지를 보내고 삭제할 수 있습니다.
그리고 삭제 할 경우 체크박스에 체크하여 삭제하면 한번에 모든 사원, 쪽지를 삭제 할 수 있습니다. 
사원 삭제, 쪽지 보기탭에서 조회, 페이징 처리가 되어 있습니다. 

### 4.1. 구현한 JSP Page (Webcontent/view)
- deletemypage
- dept
- emp (select_*)제외
- message
- modeul
- mypage
- updateMypage

### 4.2. 구현한 Java Page (java Resources/src)
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
