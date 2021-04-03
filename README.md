# <img src=".github/assets/logo.jpg" alt="gallerie" height="32px"> Gallerie

***Gallerie***는 SNS 사이트 *Instagram*을 모티브로 제작되었으며, *Instagram* 웹사이트에 구현되어 있지 않은 기능과 UX와 UI적인 요소를 추가하여 제작했습니다.

## 프로젝트 Summary
- 인원 : 4명
- 기간 : 2/15~3/12
- **주요 기술** : Spring, Mybatis, Oracle DB
- **주요 서비스** : 회원가입, 로그인, 프로필 편집, 로그인 위치 조회, 게시물 업로드/조회, 실시간 일대일 채팅
- [Use Case Diagram](.github/assets/use-case-diagram.jpg)
- [Entity Relationship Diagram(ERD)](.github/assets/entity-relationship-diagram.jpg)
- [Data Flow Diagram(DFD)](.github/assets/data-flow-diagram.jpg)

## 기술
- Java 8
- Spring
- Oracle DB
- Mybatis
- Maven
- HTML/CSS/Javascript
- jQuery (ajax)
- Git

## 기능
- 회원
    - 회원가입(비밀번호 암호화, 이메일 인증)
    - 로그인(Facebook 계정으로 로그인, 중복 로그인 방지, 자동 로그인)
    - 로그아웃
    - 아이디/패스워드 찾기
    - 프로필 수정
    - 팔로우/팔로워
    - 로그인 활동 기록(Google Map)

- 게시글
    - 사진 업로드
    - 좋아요
    - 댓글
    - 해시태그 활성화
    - 게시글 목록(유저, 해시태그, 좋아요/댓글순, 스크롤 페이징)
    - 게시글 상세

- 채팅
    - 실시간 일대일 채팅 (Spring-WebSocket)
    - 채팅 내용 저장 및 불러오기
    - 최근 채팅 유저 목록

