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
- [가게 목록 조회/검색](#가게 목록 조회/검색)
- [예약](#예약)
- [사장님과의 채팅](#사장님과의 채팅)

### 회원가입

### 로그인&로그아웃
<img src="https://user-images.githubusercontent.com/39786810/209288354-bdbc5997-0398-4cad-8f95-f628e1e3c6de.gif" width="200" height="400"/>

〰️ Flow 〰️
1. '시작하기' 버튼 탭
2. Auth0에서 인증 토큰 받아오기</br>
  a. Auth0에 회원 정보가 없을 경우 : 로그인 실패</br>
  b. Auth0에 회원 정보가 있을 경우 : 3번으로 이동</br>
3. matbooking 회원 정보 확인</br>
  a. matbooking 회원 정보가 없을 경우 : [회원가입](#회원가입) 으로 이동</br>
  b. matbooking 회원 정보가 있을 경우 : 정상 로그인 및 [가게 목록 조회/검색](#가게 목록 조회/검색) 으로 이동</br>

### 가게 목록 조회/검색

### 예약

### 사장님과의 채팅
