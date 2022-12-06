# CultureEventApp-Vapor
- Implement Vapor server(Models) and get data from server to app(CultureEventsApp)

## 1. Import data from Open API to Vapor Server

### 1) Preparing Open API 
#### <데이터 출처>
  - 서울시 열린데이터 광장(서울시 문화행사 정보)
    - https://data.seoul.go.kr/dataList/OA-15486/S/1/datasetView.do

#### <API 사용법>
  - 서울특별시 웹페이지 회원가입 및 로그인
  - 원하는 API 인증키 발급신청 및 요청 URL에 발급받은 인증키 삽입


### 2) Installing Vapor & PostMan on Mac
#### <Postman 설치>
       brew install --cask postman
       //필수 아님. 서버가 잘 돌아가는지 확인하기 위해 사용
       
#### <Vapor 설치>
      brew install vapor
      //이거 --cask로 깔면 다른 파일이 깔리기 때문에 꼭 --cask 뺘고 명령어 입력 필요
      
#### <Vapor 파일 생성>
      vapor filename
      //filename에 원하는 파일 이름을 생성해준다.
      
#### <Vapor 파일 열기>
      cd filename
      open Package.swift


### 3) Create data model to receive from open API
  - Vapor 파일의 Sources > App > 하위에 Models 폴더 만들기
  - Models 폴더 하위에 아래 2개의 파일 생성
    - URL을 기준으로 API서버에서 JSON데이터를 불러오는 코드 구현(WebService.swift)
    - 가져온 JSON를 사용가능한 데이터 형식으로 파싱시캬주는 구조 구현(EventList.swift)

## 2. Request the necessary data from CultureEventsApp to the Vapor server

### 1) Configuring the router on Vapor Server to receive data requests from CultureEventApp
  - Vapor 파일의 Sources > App 하위에 디폴트로 생성된 routes.swift 수정
  - 수정 시 APP으로부터 데이터 요청(depth : events)을 받았을 때 수행할 코드 구현(=Open API로부터 Vapor서버로 데이터를 가져옴)
  
  > 여기까지 했다면 서버 코드 실행(Xcode에서는 실행버튼 누르면 됨)


### 2) Request data from CultureEventApp to Vapor Server
  - 서버는 테스트용으로 로컬에서 만들 내용이기 때문에 서버 URL은 아래와 같다.
    - http://127.0.0.1:8080/events(주소 : 로컬/depth)
  - ContentView 로딩 시에 Task로 데이터 요청 실행


## 3. app demo
<img src="https://user-images.githubusercontent.com/55937627/205846678-14886a9e-2074-43ae-9e73-e1966af04f62.gif" width="300" height="600"/><img src="https://user-images.githubusercontent.com/55937627/205846692-0e5200f5-829e-43ec-b887-94a32e4e6f2a.gif" width="300" height="600"/>


