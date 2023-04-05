# :pushpin: GIS 기반 리포팅 시스템 구축

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
![화면 캡처 2023-04-03 030845](https://user-images.githubusercontent.com/116694081/230062766-98945dd6-643c-4f55-9fd8-bb254f5b26d8.png)

</br>
  
## 4. 핵심 기능
- 파이썬을 이용하여 데이터를  자동적으로 DB에 입력
- OpenLayers 이용하여 지도 기능 표현(레이어 in 레이어, 레이어 set 레이어)
- 날짜 지역에 따른 정보를 geoserver에 전달 레이어 변경
- geoServer Sql문 이용 레이어 생성
- Range를 이용한 OpenLayers Opcity조절
- Mybaits 배열과 forEach문 이용 컬럼 생성

### 4.1. 구현한 JSP Page (WebContent/WEB-INf/jsp/egovframework/main)
- report  (JS. Jquery 구현)
- repott2 (Ajax 구현)

### 4.2. 구현한 Java Page (java Resources/src/business/)
- biz/report
- egov/cmmvo

### 4.3.핵심코드 리뷰
<details>
<summary><b>Python을 이용한 데이터 업데이트</b></summary>
<div markdown="1">
  
##### 4.2.1 폴더에 있는 폴더와, 파일명을 이용하여 데이터 입력(파일에 있는 날짜로 데이터넣기)
![Python폴더에서폴더이름숫자](https://user-images.githubusercontent.com/116694081/230078147-10c15244-7a54-4705-b6c8-390531a3a0b9.png)

</div>
</details>

</br>

<details>
<summary><b>MyBatis forEach문이용 컬럼 136개 만들</b></summary>
<div markdown="1">
  
##### 4.2.2 MyBatis에 파라미터 배열로 넘기기
![배열로파라미터 넘기고](https://user-images.githubusercontent.com/116694081/230078262-bafc0650-0ac5-45ea-976f-24782837e86b.png)

##### 4.2.2 MyBatis의 forEach문 이용 컬럼 136개 만들기
![MyBatis136개 컬럼구현(배열받기)](https://user-images.githubusercontent.com/116694081/230077902-c5fc88d0-5966-44a2-be6b-53826c8b1a2c.png)
  
</div>
</details>

</br>

<details>
<summary><b>DB데이터 수정하기</b></summary>
<div markdown="1">
  
##### 4.2.3 Controller에서 데이터가 있을 경우와 없을 경우 데이터 구분하여 각 방식에 맞게 데이터 수정
![데이터없을경우있을경우구분](https://user-images.githubusercontent.com/116694081/230078230-a35effe9-5d11-46c3-ba03-bec1d3905e2b.png)
 
</div>
</details>

</br>

<details>
<summary><b>Ajax를 이용한 HTML데이터 넣기</b></summary>
<div markdown="1">
  
##### 4.2.4 Ajax데이터 if와 each문 이용하여 모든 데이터 넣기 
![if문과 each문을 이용 Ajax값넣기](https://user-images.githubusercontent.com/116694081/230077842-ae6d14c9-661d-4153-8668-a5aac2b53555.png)

</div>
</details>

</br>








<details>
<summary><b>OpenLayer 코드 정리</b></summary>
<div markdown="1">
  
##### 4.2.5 2중배열과 forEach문을 이용하여 OpenLayer여러개 만들기 
![2중배열을이용한forEach문으로 지도만들기](https://user-images.githubusercontent.com/116694081/230077712-32431ca7-03b2-447c-916d-cec7bd8ef77c.png)

##### 4.2.5 Range를 이용하여 OpenLayers Opacity조절
![Range이용한Opacity조절](https://user-images.githubusercontent.com/116694081/230078195-45b31077-b014-4513-9cf6-bb44054b1171.png)

##### 4.2.5 OpenLayers 만들기 (레이어 in 레이어)
![OpenLayers레이어에 레이어겹치기](https://user-images.githubusercontent.com/116694081/230077971-bfe6333f-ffce-4a41-917a-7a110c2ad607.png)

##### 4.2.5 OpenLayers 만들기 (레이어 set 레이어)
![OpenLayers에서 객체로 지도 겹치기](https://user-images.githubusercontent.com/116694081/230078060-4c91e399-8a44-4b29-a7e1-4d1e9388018f.png)
  
</div>
</details>

</br>
