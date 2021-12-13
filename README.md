# CoCoa Updates

****

21.11.29 추가

* 회원가입 (성공시 alert / 중복확인 / 비번일치확인)
* 로그인 (성공시 우측상단 변경 / 실패시 alert)
* 로그아웃 (성공시 우측상단 변경)
* 마이페이지는 아직 버튼만 존재
* home.jsp 중간에 카테고리 버튼 생성 * 테마 아직 적용 x
* loginForm, joinForm 테마 갈색으로 변경

***

21.11.30 추가

* 코치 글, 프로젝트 글 작성 = db에 추가 구현
(아직 validation 부족 & 파일업로드 너무 복잡)
* 코치, 프로젝트 주제별 작성 버튼 show & hide
* coachWriteForm / projectWriteForm 완성

***

21.12.1 추가

* 코드 전체 리뷰 및 리팩토링
* Git으로 협업하는 법 완벽히 익히기
* 로그인 여부에 따라 [글 작성] 버튼 숨김 / 표시
* [/id/coachNO]로 dest 설정 : 같은 파일명 충돌 x
* db에서 임의로 삭제 후 새로 생성시 생기는 충돌은 삭제 로직에서 조절

***

21.12.2 추가

* coachInfo.jsp / projectInfo.jsp 생성
* 전체적인 css 보완
* coachInfo 수정 (본인이면 수정 버튼 활성화, 누르면 수정 가능) 구현 완료 - 타인 완벽 배제
* projectInfo 삭제 (본인이면 삭제 버튼 활성화) 구현 완료 - 문제점 : 타인이 본인글 수정 가능
* home.jsp에서 카탈로그 조회하면 coach랑 project가 겹치는 부분 회의 필요

***

21.12.3 추가

* coachInfo 삭제 + projectInfo 수정 구현 완료 - 본인 검증 문제 해결 - UI에서 공간 벌어지는건 아직
* c글작성 / p글작성 시 뜨는 좌측 프로필의 coach, leader를 member.id로 뜨게 구현
* 본인이면 대화하기 / 요청서 작성 숨김 구현
* profileInfo.jsp / myPageProfile.jsp 생성 = jsp:include로 생성
* 앞의 coachInfo, projectInfo 처럼 수정 누르면 disabled가 풀리고 수정 가능한 형태로 구현
* 수정시 마이페이지에서는 로그아웃했다가 다시 로그인해야 반영 = 해결

***

21.12.7 추가

* myPageInfo.jsp 생성
* 마이페이지 회원정보 수정, 삭제 구현
* 사이드바 클릭 이벤트 구현
* loginForm.jsp / joinForm.jsp / 마이페이지 css 보완
* home.jsp에서 코칭 / 프로젝트 클릭시 조건 조회 구현 = 카탈로그 부분은 쿼리문 필요할듯
* textarea - resize:none; - 스크롤 고정 구현
* 회원 정보 CASCADE로 연계 수정 및 삭제 = 테이블 생성시 쿼리문에 추가
* jsp 파일에 태그 id, name 중복 안되게 조심!!

***

21.12.8 추가

* requestTBL 테이블 생성 = req res FK 없애고, reqNO PK로 추가
* reqWriteForm.jsp / myPageSent.jsp / myPageGot.jsp 생성
* sentReqWait.jsp / gotReqWait.jsp 생성 = jsp:include로 load가 안됌
* 요청서 작성 구현
* 보낸 요청, 받은 요청 조회 구현 = myPageProfile로 정보 전달 방식
* home.jsp 페이징 구현 = 코칭만 가능, 아직 조건 조회가 없어서 뒤섞이는 문제 = Criteria, PageMaker VO로 작성

***

21.12.9 추가

* myPageSent.jsp에서 [대기] 상태의 요청 클릭 시 sentReqWait.jsp 이동 후 해당 요청서 조회 구현
* sentReqWait.jsp 이동 후 하단 3개 버튼(수정, 철회, 목록으로) 구현
* myPageGot.jsp에서 [대기] 상태의 요청 클릭 시 gotReqWait.jsp 이동 후 해당 요청서 조회 구현
* gotReqWait.jsp 이동 후 하단 3개 버튼(수락, 거절, 목록으로) UI만 구현
* jsp:include 처리 방식 수정 = 별개로 나눔
* 회원정보 수정시 유효성 검증 JS 추가
* 모든 jsp 파일 코드 리팩토링 = 쓸모없는 라인 삭제 + 상단 / 하단바 jsp:include 처리
* home.jsp 와 coachCate.jsp로 카테고리별 이동 결정 = 각 화면 페이징까지 구현
* 미완 ) 세부 카테고리 이동 및 페이징은 아직 구현 x
* 미완 ) 보낸 요청 리스트 / 받은 요청 리스트에도 아직 페이징 구현 x
* sentWait.jsp / gotWait.jsp / profile.jsp UI 보완 필요
* 받은 요청 하단 다운로드 링크 구현
* 모든 jsp 파일 폴더로 정리 분담 예정

***

21.12.10 추가

* jsp 그룹화 완료
* gotWaitNo.jsp / gotWaitYes.jsp / sentNo.jsp / sentYes.jsp 생성
* 받은 요청 대기글에서 수락 클릭시 수락 전송 화면 이동 구현
* 받은 요청 대기글에서 거절 클릭시 거절 전송 화면 이동 구현
* 보낸 요청 거절글, 수락글 이동 구현
* Coaching / Project 카테고리 하위 3개씩 조건조회 및 페이징 구현
* 상위 주제 디폴트는 Project / 하위 주제 디폴트는 C, Beginner = 표시만 C/C++로 설정
* 보낸 요청 / 받은 요청 제목이 공란이면 링크도 안뜨는 현상 해결 = JS) nullCheck 추가

***

21.12.13 추가

* 계층 3단계로 추가 = 조건 조회 및 페이징 작업 중 (불완전)
* UI 검토작업 진행중 = 유효성 검증이나 빠진 요소들 보완
* 보낸 요청 / 받은 요청 목록 페이징 구현 완료 = 병합대기

***

