# Vault Setup

Obsidian vault를 표준 설정으로 자동 셋업합니다.
플러그인 설치, 테마 적용, 설정 복원을 단계별로 진행합니다.

## 실행

아래 파일들을 순서대로 읽고 지침을 따르세요:

1. `.cursor/skills/obsidian-vault-setup/SETUP-GUIDE.md` — 전체 실행 순서 (핵심)
2. `.cursor/skills/obsidian-vault-setup/plugin-catalog.md` — 플러그인 카탈로그
3. `.cursor/skills/obsidian-vault-setup/vault-snapshot.md` — 이 vault 설정값

## Claude Code 전용 UX 지침

### 객관식 선택 제시 방법

Step 3과 Step 4에서는 번호 선택지를 명확하게 제시합니다:

```
어떤 기능 패키지가 필요하세요?
(여러 개 고르실 수 있어요 — 번호를 쉼표로 구분해서 알려주세요)

1. 📅 시간 관리 — 일기, 주간/월간 계획을 달력으로 관리
2. ✏️ 편집 도구 — 도구 버튼, 단축키, 이모지 빠른 입력
3. 📋 노트 스타일 — 예쁜 박스·카드 표시
4. 🔧 파일 정리 — 자동 정리, 마지막 위치 기억
5. 🌐 외부 연동 — 웹 저장, 다른 앱에서 가져오기
6. 🤖 AI/개발자 — Claude AI 연동, 베타 플러그인
0. 기본 필수만 설치 (선택 없음)
```

사용자 응답을 받은 후 Step 5 최종 컨펌으로 넘어갑니다.

## 인수

$ARGUMENTS
