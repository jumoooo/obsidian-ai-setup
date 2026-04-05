# 플러그인 카탈로그

> 이 파일은 셋업 시스템의 "메뉴판"입니다.
> 어떤 플러그인이 있고, 어떤 그룹에 속하는지 정의합니다.

---

## 🟢 기본 필수 (Essential) — 항상 설치, 묻지 않음

이 플러그인들은 vault 운영의 핵심입니다. 선택 없이 자동으로 설치됩니다.

| 플러그인 ID | 이름 | 역할 |
|---|---|---|
| `templater-obsidian` | Templater | 템플릿에서 날짜·변수 자동 입력 |
| `tag-wrangler` | Tag Wrangler | 태그 이름 바꾸기·합치기·정리 |
| `recent-files-obsidian` | Recent Files | 최근에 열었던 파일 빠르게 접근 |
| `settings-search` | Settings Search | 설정 화면에서 원하는 항목 검색 |
| `obsidian-plugin-update-tracker` | Plugin Update Tracker | 플러그인 업데이트 알림 |

---

## 📅 카테고리 A — 시간 관리 패키지

> 💬 쉬운 설명: "날짜별로 일기, 주간 계획, 월간 계획을 기록하고 싶은 분께 추천해요.
> 달력 보면서 그날 쓴 메모를 바로 열 수 있어요!"

| 플러그인 ID | 이름 | 역할 |
|---|---|---|
| `calendar` | Calendar | 달력 형태로 일일 노트 탐색 |
| `periodic-notes` | Periodic Notes | 일간·주간·월간·연간 노트 자동 생성 |

---

## ✏️ 카테고리 B — 편집 도구 패키지

> 💬 쉬운 설명: "글 쓸 때 도구 버튼이 있으면 편리하죠? 버튼 모음, 이모지 입력,
> 목록 정리를 키보드로 빠르게 할 수 있게 도와줘요!"

| 플러그인 ID | 이름 | 역할 |
|---|---|---|
| `editing-toolbar` | Editing Toolbar | 편집 화면 상단에 서식 도구 버튼 모음 |
| `obsidian-outliner` | Outliner | 목록(리스트)을 키보드로 쉽게 이동·정리 |
| `emoji-shortcodes` | Emoji Shortcodes | `:smile:` 식으로 이모지 빠르게 입력 |
| `slash-commander` | Slash Commander | `/` 입력으로 명령어 팔레트 빠르게 실행 |
| `cmdr` | Commander | 툴바·리본에 나만의 버튼 추가 |

---

## 📋 카테고리 C — 노트 스타일 패키지

> 💬 쉬운 설명: "중요한 내용을 예쁜 박스 안에 넣거나, 노트 속성(태그·날짜 등)을
> 깔끔하게 보이게 하고 싶다면 선택하세요!"

| 플러그인 ID | 이름 | 역할 |
|---|---|---|
| `obsidian-admonition` | Admonition | 경고·정보·팁 등을 예쁜 박스로 표시 |
| `pretty-properties` | Pretty Properties | 노트 상단 속성(frontmatter)을 예쁘게 표시 |
| `quickadd` | QuickAdd | 단축키 하나로 새 노트·항목 빠르게 추가 |

---

## 🔧 카테고리 D — 파일 정리 패키지

> 💬 쉬운 설명: "파일을 자동으로 정리해주거나, 어제 읽다 멈춘 위치를 기억해주고,
> 핀 기능으로 자주 쓰는 파일을 고정할 수 있어요!"

| 플러그인 ID | 이름 | 역할 |
|---|---|---|
| `file-cleaner-redux` | File Cleaner Redux | 안 쓰는 첨부 파일 자동 감지·정리 |
| `remember-cursor-position` | Remember Cursor Position | 파일 닫아도 마지막 커서 위치 기억 |
| `obsidian-view-mode-by-frontmatter` | View Mode by Frontmatter | 노트별로 읽기/편집 모드 자동 전환 |
| `pinned-notes` | Pinned Notes | 중요한 노트를 상단에 고정 |

---

## 🌐 카테고리 E — 외부 연동 패키지

> 💬 쉬운 설명: "웹 페이지를 클릭 한 번으로 노트에 저장하거나,
> 노션·에버노트 등 다른 앱의 메모를 옵시디언으로 가져올 수 있어요!"

| 플러그인 ID | 이름 | 역할 |
|---|---|---|
| `slurp` | Slurp | 웹 URL을 마크다운 노트로 즉시 저장 |
| `obsidian-importer` | Importer | 노션·에버노트 등에서 노트 가져오기 |

---

## 🤖 카테고리 F — AI/개발자 패키지

> 💬 쉬운 설명: "AI(Claude, ChatGPT 등)와 함께 옵시디언을 쓰거나,
> 아직 공식 출시 전인 새 플러그인을 미리 써보고 싶은 분께 추천해요!"

| 플러그인 ID | 이름 | 역할 |
|---|---|---|
| `obsidian42-brat` | BRAT | 깃허브에서 베타 플러그인 직접 설치·관리 |
| `claudian` | Claudian | Obsidian 내에서 Claude AI 직접 사용 |

---

## ➕ 카탈로그 커스터마이징

이 파일을 수정해서 자신만의 플러그인 목록을 만들 수 있습니다:

1. 원하는 플러그인을 위 카테고리에 추가하거나 새 카테고리 생성
2. `vault-snapshot.md`의 플러그인 목록도 함께 업데이트
3. `scripts/phase2-cli.sh`에 `install_plugin "플러그인-id" "이름"` 줄 추가
