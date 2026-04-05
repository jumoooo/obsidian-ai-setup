# Obsidian Vault 자동 셋업 가이드

> **AI-Agnostic 공통 지침** — Cursor와 Claude Code 모두 이 파일을 참조합니다.
> 모든 단계를 순서대로 따르고, 이상이 있으면 즉시 중단 후 사용자에게 물어보세요.

---

## 사전 확인사항 (시작 전 반드시 체크)

아래 조건이 모두 충족되어야 셋업을 시작할 수 있습니다:

```bash
# 1. Obsidian CLI 동작 확인
obsidian version
# → 버전 번호가 출력되면 OK
# → 오류 시: "Obsidian이 실행 중인지, CLI가 PATH에 등록됐는지 확인해주세요" 안내

# 2. 현재 vault 인식 확인
obsidian vault
# → vault 이름이 출력되면 OK

# 3. 현재 설치된 플러그인 목록 조회 (나중에 비교용)
obsidian plugins:enabled
```

**전제 조건 실패 시**: 작업을 중단하고 사용자에게 다음을 안내합니다:
```
옵시디언이 실행 중인지 확인해주세요.
Settings → General → Command line interface → ON으로 켜져 있어야 해요.
터미널에서 `obsidian version`을 입력해보시고 버전 번호가 나오면 준비 완료!
```

---

## Step 1 — 환경 스캔

현재 설치된 플러그인과 vault-snapshot.md의 목록을 비교합니다.

```bash
obsidian plugins:enabled
```

결과를 바탕으로:
- **이미 설치된 플러그인** → 설치 목록에서 제외 (최소 작업 원칙)
- **미설치 플러그인** → 설치 대상으로 표시
- **테마 확인**: `obsidian theme` 로 현재 테마 확인

---

## Step 2 — 브리핑 출력

사용자에게 현재 상태와 진행할 작업을 알기 쉽게 설명합니다.
아래 형식을 그대로 사용하세요:

```
안녕하세요! 옵시디언 셋업을 도와드릴게요 😊

현재 상태를 확인했어요:
- 이미 설치된 플러그인: [N]개 (건너뜁니다)
- 새로 설치할 필수 플러그인: [N]개
- 테마: [현재 테마명 또는 "미설치"]

이제 몇 가지 여쭤볼게요. 원하는 것만 골라주시면 딱 그것만 설치할게요!
```

---

## Step 3 — 테마 선택 (객관식)

AskQuestion 도구 또는 번호 선택 방식으로 제시합니다:

**질문**: "어떤 디자인 스타일을 원하세요?"

| 선택지 | 설명 |
|---|---|
| 1. Things 테마 (현재 설정) | 깔끔하고 심플한 다크/라이트 전환 스타일 |
| 2. 기본 테마 | 옵시디언 순정 디자인 |
| 3. 나중에 직접 설정할게요 | 테마 설치 건너뜀 |

---

## Step 4 — 카테고리 선택 (다중 객관식)

**질문**: "어떤 기능 패키지를 원하세요? (여러 개 선택 가능)"

plugin-catalog.md의 카테고리 설명을 그대로 인용하여 보여줍니다:

| 선택지 | 포함 플러그인 수 | 한 줄 설명 |
|---|---|---|
| 📅 시간 관리 | 2개 | 일기·주간·월간 계획을 달력으로 관리 |
| ✏️ 편집 도구 | 5개 | 도구 버튼, 단축키, 이모지 빠른 입력 |
| 📋 노트 스타일 | 3개 | 예쁜 박스·카드·속성 표시 |
| 🔧 파일 정리 | 4개 | 자동 정리, 위치 기억, 파일 고정 |
| 🌐 외부 연동 | 2개 | 웹 저장, 다른 앱에서 가져오기 |
| 🤖 AI/개발자 | 2개 | AI 연동, 베타 플러그인 관리 |
| 아무것도 선택 안 함 | 0개 | 기본 필수만 설치 |

---

## Step 5 — 최종 컨펌

선택 결과를 보기 좋게 정리해서 보여주고 **반드시 사용자 확인을 받습니다**:

```
이렇게 진행할게요. 확인해주세요!

🟢 필수 설치 (5개):
  - Templater (템플릿 자동화)
  - Tag Wrangler (태그 정리)
  - Recent Files (최근 파일)
  - Settings Search (설정 검색)
  - Plugin Update Tracker (업데이트 알림)

🔵 선택 설치 ([N]개):
  - [사용자 선택 카테고리의 플러그인들 나열]

🎨 테마: [선택한 테마]

⚠️ 이미 설치됨 (건너뜀): [N]개

진행할까요? (예 / 취소)
```

**취소 선택 시**: 즉시 중단, "언제든 다시 말씀해주세요!" 안내

---

## Step 6 — Phase 1: 설정 파일 복원

Obsidian 없이도 실행 가능한 단계입니다.

체크할 파일 목록:
- `.obsidian/app.json`
- `.obsidian/appearance.json`
- `.obsidian/community-plugins.json`
- `.obsidian/core-plugins.json`
- `.obsidian/hotkeys.json`
- `.obsidian/templates.json`
- `.obsidian/graph.json`
- `.obsidian/canvas.json`
- `.obsidian/backlink.json`
- `.obsidian/daily-notes.json`
- `.obsidian/types.json`

파일이 모두 존재하면 건너뜁니다 (Git에서 이미 복원됨).
없는 파일만 vault-snapshot.md의 값으로 생성합니다.

scripts/phase1-config.ps1 실행:
```bash
powershell -ExecutionPolicy Bypass -File ".cursor/skills/obsidian-vault-setup/scripts/phase1-config.ps1"
```

---

## Step 7 — Phase 2: 플러그인 및 테마 설치

Obsidian이 실행 중이어야 합니다.

### 7a. 필수 플러그인 설치

```bash
obsidian plugin:install id="templater-obsidian"
obsidian plugin:install id="tag-wrangler"
obsidian plugin:install id="recent-files-obsidian"
obsidian plugin:install id="settings-search"
obsidian plugin:install id="obsidian-plugin-update-tracker"
```

### 7b. 선택 플러그인 설치 (사용자 선택에 따라)

plugin-catalog.md를 참조하여 선택된 카테고리의 플러그인만 설치합니다.

```bash
# 예: 카테고리 A 선택 시
obsidian plugin:install id="calendar"
obsidian plugin:install id="periodic-notes"
```

### 7c. 테마 설치 (Things 선택 시)

```bash
obsidian theme:install name="Things" enable
```

### 7d. 오류 발생 시

각 `plugin:install` 명령 후 오류가 발생하면:
- 해당 플러그인 이름과 오류 메시지를 기록
- **나머지 설치는 계속 진행** (한 개 실패가 전체를 멈추면 안 됨)
- 마지막에 실패 목록 보고

### 7e. 재인덱싱

```bash
obsidian reload
```

---

## Step 8 — 완료 보고

```
셋업이 완료됐어요! 🎉

✅ 설치 성공: [N]개
  [플러그인 이름 목록]

⚠️ 이미 설치됨 (건너뜀): [N]개

❌ 설치 실패: [N]개
  [플러그인 이름] — [오류 이유]
  → 나중에 옵시디언 설정에서 직접 설치하실 수 있어요

🎨 테마: [결과]

이제 옵시디언을 새로고침하면 모든 설정이 적용돼요!
```

---

## 중단 조건 (이 경우 즉시 멈추고 사용자에게 물어봄)

1. `obsidian version` 실패 → Obsidian CLI 미설정
2. `obsidian vault` 실패 → 올바른 vault가 열려 있지 않음
3. Phase 1에서 `.obsidian/` 폴더 자체가 없음 → 비정상 vault 상태
4. 사용자가 컨펌에서 "취소" 선택
5. 예상치 못한 오류 → 즉시 중단, 오류 내용 보고

---

## 최소 작업 원칙

- 이미 설치된 플러그인은 건너뜀
- 이미 적용된 테마는 재설치 안 함
- 이미 존재하는 설정 파일은 덮어쓰지 않음
- 사용자가 선택하지 않은 카테고리는 건드리지 않음
