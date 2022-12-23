# ✨ matbooking (맛북킹) ✨

> 기다림을 줄여주는 가게 예약 어플

### 사용된 기술 👉
SwiftUI, Combine, Web Socket, Alamofire, Auth0, REST API

### 라이브러리 관리 👉
CocoaPods

### 사용된 디자인 패턴 👉
MVVM

**주요기능:**
- [회원가입](#회원가입)
- [로그인&로그아웃](#로그인&로그아웃)
- [가게&nbsp;목록&nbsp;조회&검색&필터링](#가게&nbsp;목록&nbsp;조회&검색&필터링)
- [예약](#예약)
- [사장님과의 채팅](#사장님과의 채팅)

## 회원가입
<img src="https://user-images.githubusercontent.com/39786810/209323353-0c16cff6-0d69-47cc-a674-dc1550812377.gif" width="200" height="400"/>

〰️ Flow 〰️ </br>
[로그인&로그아웃](#로그인&로그아웃)의 3-a 이후 실행

1. 사용할 닉네임과 휴대폰 번호를 입력 후 완료 버튼 클릭
2. REST API 통신을 통해 맛북킹 자체의 회원으로 가입
3. [가게 목록 조회/검색](#가게 목록 조회/검색) 화면으로 이동

## 로그인&로그아웃
**✔️ 로그인**</br>
<img src="https://user-images.githubusercontent.com/39786810/209288354-bdbc5997-0398-4cad-8f95-f628e1e3c6de.gif" width="200" height="400"/>

〰️ Flow 〰️
1. '시작하기' 버튼 탭
2. Auth0에서 인증 토큰 받아오기</br>
  a. Auth0에 회원 정보가 없을 경우 : 로그인 실패</br>
  b. Auth0에 회원 정보가 있을 경우 : 3번으로 이동</br>
3. matbooking 회원 정보 확인</br>
  a. matbooking 회원 정보가 없을 경우 : [회원가입](#회원가입) 으로 이동</br>
  b. matbooking 회원 정보가 있을 경우 : 정상 로그인 및 [가게 목록 조회/검색](#가게 목록 조회/검색) 으로 이동</br>
  
**✔️ 로그아웃**</br>
<img src="https://user-images.githubusercontent.com/39786810/209324009-ac7a72b3-69ca-4b2d-baaa-c4ac72f8b9d2.gif" width="200" height="400"/>

〰️ Flow 〰️
1. 하단의 TabView 중 '마이페이지' 화면으로 이동
2. '로그아웃' 버튼 탭

## 가게&nbsp;목록&nbsp;조회&검색&필터링
**✔️ 이름으로 검색**</br>
<img src="https://user-images.githubusercontent.com/39786810/209310814-398b2157-1bbe-4a02-a6f0-b4693fa901ac.gif" width="200" height="400"/>

〰️ Flow 〰️
1. 하단의 TabView 중 '홈' 화면에서 가게 목록 조회
2. 상단의 검색란에 원하는 가게의 이름 입력

**✔️ 카테고리 필터링**</br>
<img src="https://user-images.githubusercontent.com/39786810/209325546-c2f5a6e3-3c1f-4fed-9e91-33ded91e7121.gif" width="200" height="400"/>

〰️ Flow 〰️
1. 하단의 TabView 중 '홈' 화면에서 가게 목록 조회
2. 상단 검색란 오른쪽의 아이콘 롱탭
3. 원하는 카테고리의 음식 종류 선택

## 예약
<img src="https://user-images.githubusercontent.com/39786810/209324726-4f05bef4-5450-4afc-adbe-85707b917c93.gif" width="200" height="400"/>

〰️ Flow 〰️
1. 원하는 가게의 Detail 화면 진입
2. '예약하기' 버튼 탭
3. 원하는 날짜, 시간, 인원 입력 후 '완료' 버튼 탭

## 사장님과의 채팅
**✔️ 최초 채팅 생성**</br>
<img src="https://user-images.githubusercontent.com/39786810/209326873-be247843-e50d-4780-9842-fed9009166e4.gif" width="200" height="400"/>

〰️ Flow 〰️
1. 원하는 가게의 Detail 화면 진입
2. '채팅하기' 버튼 탭
3. 하단의 입력창에 내용 입력 후 'send' 버튼 탭

**✔️ 채팅 발신**</br>
<img src="https://user-images.githubusercontent.com/39786810/209327467-a2ea8d36-f3ee-44cc-947b-311b76fecd86.gif" width="200" height="400"/>

〰️ Flow 〰️
1. 하단의 TabView 중 '채팅목록' 화면에서 채팅 목록 조회
2. 원하는 채팅 리스트 탭
3. 하단의 입력창에 내용 입력 후 'send' 버튼 탭

**✔️ 채팅 수신**</br>
