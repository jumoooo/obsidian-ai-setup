# 🧠 Obsidian AI Auto Setup

> **AI 에이전트 하나로 Obsidian 환경을 자동 완성하는 시스템**
>
> 새 컴퓨터에서 Obsidian을 설치했을 때, 에이전트에게 "셋업해줘" 한 마디면  
> 플러그인 설치부터 테마, 설정까지 알아서 해결됩니다.

<br>

## ✨ 무엇을 해주나요?

| 기능 | 설명 |
|---|---|
| 🔍 **현재 상태 스캔** | 이미 설치된 플러그인을 파악해 중복 작업 없음 |
| 📋 **셋업 브리핑** | 무엇을 설치할지 쉬운 말로 먼저 알려줌 |
| 🎛️ **맞춤 선택** | 원하는 카테고리만 골라서 설치 |
| ⚡ **자동 설치** | Obsidian CLI로 플러그인·테마 한 번에 설치 |
| 🛡️ **안전 우선** | 실패하면 즉시 중단 후 사용자에게 보고 |

<br>

## 🤖 지원하는 AI 에이전트

| 에이전트 | 실행 방법 |
|---|---|
| **Cursor** | `"옵시디언 셋업해줘"` 또는 `"setup obsidian"` |
| **Claude Code** | `/project:vault-setup` |

<br>

## 📋 사전 조건

시작하기 전에 아래 3가지를 확인해주세요.

```
1. Obsidian v1.8 이상 설치됨
2. Obsidian CLI 활성화:
   Settings → General → Command line interface → ON
3. 터미널에서 확인: obsidian version
   → 버전 번호가 나오면 준비 완료!
```

<br>

## 🚀 설치 방법 (3단계)

### Step 1 — 이 레포를 vault에 복사

```bash
# vault 폴더로 이동
cd your-vault-folder

# .cursor와 .claude 폴더를 복사
# (아래 중 하나를 선택)

# 방법 A: git clone 후 복사
git clone https://github.com/your-username/obsidian_ai_setup temp_setup
cp -r temp_setup/.cursor ./
cp -r temp_setup/.claude ./
rm -rf temp_setup

# 방법 B: 직접 다운로드 후 .cursor, .claude 폴더만 vault에 복사
```

### Step 2 — vault 설정 커스터마이징 (선택사항)

```
.cursor/skills/obsidian-vault-setup/vault-snapshot.md
```

이 파일을 열어서 본인 vault의 폴더 구조와 원하는 플러그인 목록으로 수정합니다.  
수정하지 않으면 기본 예시 설정으로 진행됩니다.

### Step 3 — 에이전트 실행

```
Cursor에서:   "옵시디언 셋업해줘"
Claude에서:   /project:vault-setup
```

<br>

## 🎛️ 셋업 진행 흐름

에이전트가 자동으로 아래 단계를 따릅니다:

```
① 환경 스캔       → 현재 설치 상태 파악
② 브리핑         → 할 일을 쉬운 말로 설명
③ 테마 선택       → 원하는 테마 고르기 (객관식)
④ 기능 선택       → 원하는 카테고리 선택 (다중 선택)
⑤ 최종 확인       → 설치 목록 검토 후 승인
⑥ 자동 설치       → 플러그인 + 테마 설치
⑦ 완료 보고       → 성공/실패/건너뜀 결과 출력
```

<br>

## 📦 플러그인 카탈로그

### 🟢 기본 필수 — 항상 자동 설치

| 플러그인 | 역할 |
|---|---|
| Templater | 템플릿에서 날짜·변수 자동 입력 |
| Tag Wrangler | 태그 이름 변경·합치기·정리 |
| Recent Files | 최근 파일 빠른 접근 |
| Settings Search | 설정 화면 내 검색 |
| Plugin Update Tracker | 플러그인 업데이트 알림 |

### 🎛️ 선택 카테고리 — 원하는 것만 고르기

<details>
<summary>📅 <b>시간 관리 패키지</b> (2개)</summary>

> 일기, 주간·월간 계획을 달력으로 관리하고 싶다면

| 플러그인 | 역할 |
|---|---|
| Calendar | 달력 형태로 일일 노트 탐색 |
| Periodic Notes | 일간·주간·월간·연간 노트 자동 생성 |

</details>

<details>
<summary>✏️ <b>편집 도구 패키지</b> (5개)</summary>

> 글 쓸 때 도구 버튼과 단축키를 편리하게 쓰고 싶다면

| 플러그인 | 역할 |
|---|---|
| Editing Toolbar | 편집 화면 서식 도구 버튼 모음 |
| Outliner | 목록을 키보드로 쉽게 이동·정리 |
| Emoji Shortcodes | `:smile:` 방식 이모지 빠른 입력 |
| Slash Commander | `/`로 명령어 팔레트 빠르게 실행 |
| Commander | 툴바에 나만의 버튼 추가 |

</details>

<details>
<summary>📋 <b>노트 스타일 패키지</b> (3개)</summary>

> 중요한 내용을 예쁜 박스·카드로 꾸미고 싶다면

| 플러그인 | 역할 |
|---|---|
| Admonition | 경고·정보·팁을 예쁜 박스로 표시 |
| Pretty Properties | frontmatter 속성을 예쁘게 표시 |
| QuickAdd | 단축키로 새 노트·항목 빠르게 추가 |

</details>

<details>
<summary>🔧 <b>파일 정리 패키지</b> (4개)</summary>

> 파일 자동 정리, 마지막 읽던 위치 기억이 필요하다면

| 플러그인 | 역할 |
|---|---|
| File Cleaner Redux | 미사용 첨부 파일 자동 정리 |
| Remember Cursor Position | 마지막 커서 위치 기억 |
| View Mode by Frontmatter | 노트별 읽기/편집 모드 자동 전환 |
| Pinned Notes | 중요 노트 상단 고정 |

</details>

<details>
<summary>🌐 <b>외부 연동 패키지</b> (2개)</summary>

> 웹 저장, 다른 앱에서 노트 가져오기가 필요하다면

| 플러그인 | 역할 |
|---|---|
| Slurp | 웹 URL을 마크다운 노트로 즉시 저장 |
| Importer | 노션·에버노트 등에서 노트 가져오기 |

</details>

<details>
<summary>🤖 <b>AI/개발자 패키지</b> (2개)</summary>

> AI와 함께 쓰거나 베타 플러그인을 테스트하고 싶다면

| 플러그인 | 역할 |
|---|---|
| BRAT | 깃허브에서 베타 플러그인 관리 |
| Claudian | Obsidian 내에서 Claude AI 사용 |

</details>

<br>

## 📁 파일 구조

```
obsidian_ai_setup/
│
├── 📄 README.md
│
├── .cursor/
│   ├── rules/
│   │   └── obsidian-vault.mdc          # Cursor 항상 적용 규칙
│   └── skills/
│       └── obsidian-vault-setup/        ← 이식 가능한 셋업 패키지
│           ├── SKILL.md                 # Cursor 진입점
│           ├── SETUP-GUIDE.md           # 공통 셋업 로직 (AI-agnostic)
│           ├── plugin-catalog.md        # 플러그인 카탈로그 + 설명
│           ├── vault-snapshot.md        # vault 설정 템플릿 (수정 필요)
│           └── scripts/
│               ├── phase1-config.ps1    # 설정 파일 복원 (Windows)
│               └── phase2-cli.sh        # CLI 플러그인 설치
│
└── .claude/
    └── commands/
        └── vault-setup.md               # Claude Code slash command
```

### 각 파일의 역할

| 파일 | 역할 | 수정 필요? |
|---|---|---|
| `SKILL.md` | Cursor 진입점 | ❌ 그대로 사용 |
| `SETUP-GUIDE.md` | 셋업 핵심 로직 (AI-agnostic) | ❌ 그대로 사용 |
| `plugin-catalog.md` | 플러그인 카탈로그 | 선택적 (커스텀 시) |
| `vault-snapshot.md` | **내 vault 설정값** | ✅ **반드시 수정** |
| `phase1-config.ps1` | `.obsidian` 설정 복원 스크립트 | ❌ 그대로 사용 |
| `phase2-cli.sh` | 플러그인 설치 CLI 스크립트 | ❌ 그대로 사용 |
| `vault-setup.md` | Claude Code slash command | ❌ 그대로 사용 |
| `obsidian-vault.mdc` | Cursor 항상 적용 규칙 | 선택적 |

<br>

## 🔄 다른 vault에 적용하기

이 시스템은 어떤 vault에든 복사해서 재사용할 수 있습니다.

```
1. .cursor/skills/obsidian-vault-setup/ 폴더 전체 복사
2. .claude/commands/vault-setup.md 복사
3. vault-snapshot.md를 새 vault 설정으로 수정
4. 완료!
```

`vault-snapshot.md` **하나만 바꾸면** 어디서든 동작합니다.

<br>

## 🛠️ 커스터마이징 가이드

### 플러그인 추가하기

**1. `plugin-catalog.md`에 플러그인 정보 추가**
```markdown
| `your-plugin-id` | 플러그인 이름 | 역할 설명 |
```

**2. `vault-snapshot.md`의 플러그인 목록에 추가**
```
your-plugin-id
```

**3. `scripts/phase2-cli.sh`에 설치 명령 추가**
```bash
install_plugin "your-plugin-id" "플러그인 이름"
```

### 새 카테고리 만들기

`SETUP-GUIDE.md`의 Step 4 선택지에 새 항목을 추가하고,
`phase2-cli.sh`에 해당 카테고리 설치 블록을 추가합니다.

<br>

## ❓ 자주 묻는 질문

<details>
<summary><b>Q. Obsidian이 실행 중이 아니어도 되나요?</b></summary>

Phase 1 (설정 파일 복원)은 Obsidian 없이도 동작합니다.  
하지만 Phase 2 (플러그인 설치)는 Obsidian이 실행 중이어야 합니다.  
CLI가 Obsidian과 IPC로 통신하기 때문입니다.

</details>

<details>
<summary><b>Q. 이미 설치된 플러그인은 어떻게 되나요?</b></summary>

자동으로 건너뜁니다. 중복 설치나 덮어쓰기가 발생하지 않습니다.  
최소 작업 원칙에 따라 꼭 필요한 것만 실행합니다.

</details>

<details>
<summary><b>Q. Windows / macOS 둘 다 되나요?</b></summary>

- Phase 1 (`phase1-config.ps1`): Windows PowerShell 전용
- Phase 2 (`phase2-cli.sh`): macOS/Linux/Windows(Git Bash) 공통

macOS 사용자는 Phase 1 대신 에이전트가 직접 파일을 작성합니다.

</details>

<details>
<summary><b>Q. 설치 중 오류가 나면?</b></summary>

에이전트가 즉시 중단하고 어떤 플러그인이 실패했는지 알려줍니다.  
실패한 플러그인은 Obsidian 설정 → 커뮤니티 플러그인에서 직접 설치할 수 있습니다.

</details>

<br>

## 🤝 기여하기

플러그인 카탈로그 추가, 새 카테고리 제안, 버그 리포트 모두 환영합니다!

1. 이 레포를 Fork
2. 변경사항 작성
3. Pull Request 열기

<br>

## 📄 라이선스

MIT License — 자유롭게 사용·수정·배포하세요.

<br>

---

<div align="center">

**Obsidian + AI = 지식 관리의 새로운 차원**

*Obsidian CLI v1.8+ | Cursor | Claude Code*

</div>
