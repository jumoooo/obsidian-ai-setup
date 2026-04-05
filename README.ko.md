<div align="right">

[English](README.md) | **한국어**

</div>

# 🧠 Obsidian AI 자동 셋업

> **AI 에이전트에게 말 한 마디로 Obsidian vault 셋업 완료.**
>
> **Cursor**와 **Claude Code** 모두 지원합니다. 직접 설정할 필요 없어요.

---

## ✨ 이게 뭔가요?

새 환경에서 Obsidian vault를 처음 세팅하는 건 번거롭습니다.  
플러그인 하나하나 찾아 설치하고, 테마 바꾸고, 설정 맞추고…

이 프로젝트는 그 과정을 **AI 에이전트가 대신 해주는 스킬 팩**입니다.

- ✅ **플러그인 설치** — 필요한 것만 골라서 설치
- ✅ **테마 적용** — 원하는 스타일로 바로 세팅
- ✅ **설정 파일 복원** — `.obsidian/*.json` 자동 복구
- ✅ **대화형 선택** — 뭘 할지 먼저 물어보고 진행

**무조건 설치하는 게 아닙니다.** 에이전트가 먼저 설명하고, 선택을 받고, 확인 후에만 작업합니다.

---

## 📋 필요한 것

| 항목 | 내용 |
|---|---|
| Obsidian | v1.8 이상 (Desktop 버전) |
| Obsidian CLI | v1.12+ — Settings → General → CLI에서 활성화 |
| AI 에이전트 | Cursor (Agent 모드) **또는** Claude Code |
| Git | 이 레포 클론용 |

> **CLI 활성화 방법:**
> Obsidian 열기 → 설정(⚙️) → General → 스크롤 → "Command line interface" → ON 토글
> → 안내에 따라 PATH 등록
>
> 확인: 터미널에서 `obsidian version` 입력 → 버전 번호가 나오면 완료 ✅

---

## 🚀 시작하기

### Step 1 — vault에 파일 복사

```bash
# 이 레포 클론
git clone https://github.com/jumoooo/obsidian-ai-setup.git

# vault 루트에 파일 복사
cp -r obsidian-ai-setup/.cursor   /내-vault-경로/
cp -r obsidian-ai-setup/.claude   /내-vault-경로/
```

또는 파일 탐색기에서 `.cursor/`와 `.claude/` 폴더를 vault 안으로 드래그하세요.

### Step 2 — vault 설정 파일 준비 (선택)

```bash
cd /내-vault-경로
cp .cursor/skills/obsidian-vault-setup/vault-snapshot.example.md \
   .cursor/skills/obsidian-vault-setup/vault-snapshot.md
```

`vault-snapshot.md`를 내 vault 이름, 폴더 구조, 원하는 설정으로 수정합니다.  
이 단계를 건너뛰면 에이전트가 기본값으로 진행합니다.

### Step 3 — Cursor 또는 Claude Code에서 vault 열기

Obsidian이 **실행 중**이고 vault가 열려 있어야 합니다.

### Step 4 — 셋업 실행

**Cursor에서:**
```
"옵시디언 셋업해줘"
"vault 초기화해줘"
"Set up my Obsidian vault"
```
`obsidian-vault-setup` 스킬이 자동으로 활성화됩니다.

**Claude Code에서:**
```
/project:vault-setup
```

---

## 🎯 어떻게 진행되나요?

에이전트가 아래 순서대로 단계별로 안내합니다:

```
1. 스캔    → 이미 설치된 것 확인 (중복 설치 없음)
2. 브리핑  → 무엇을 할지 쉬운 말로 설명
3. 테마    → 원하는 디자인 스타일 선택
4. 선택    → 플러그인 카테고리 메뉴 (필요한 것만 선택)
5. 확인    → 작업 목록 보여주고 최종 승인 받음
6. 설치    → 선택한 것만 설치
7. 보고    → 결과 정리해서 알려줌
```

**확인 없이는 아무것도 실행되지 않습니다.**

---

## 🔌 플러그인 카테고리

필요한 카테고리만 선택하세요. 에이전트가 각각을 쉽게 설명해줍니다.

| 카테고리 | 포함 플러그인 | 이런 분께 |
|---|---|---|
| 🟢 **기본 필수** (항상 설치) | Templater, Tag Wrangler, Recent Files, Settings Search, Plugin Update Tracker | 모든 사용자 |
| 📅 **시간 관리** | Calendar, Periodic Notes | 일기, 주간·월간 계획 쓰는 분 |
| ✏️ **편집 도구** | Editing Toolbar, Outliner, Emoji Shortcodes, Slash Commander, Commander | 도구 버튼·단축키를 원하는 분 |
| 📋 **노트 스타일** | Admonition, Pretty Properties, QuickAdd | 예쁜 박스·카드 표시 원하는 분 |
| 🔧 **파일 정리** | File Cleaner Redux, Remember Cursor Position, View Mode by Frontmatter, Pinned Notes | 자동 정리·위치 기억 원하는 분 |
| 🌐 **외부 연동** | Slurp, Importer | 웹 저장, 노션·에버노트 가져오기 |
| 🤖 **AI / 개발자** | BRAT, Claudian | AI 연동, 베타 플러그인 사용 |

---

## 🏗️ 에이전트의 판단 기준

```
플러그인 이미 설치됨 → 건너뜀
선택했고 미설치 → 설치
선택 안 했음 → 건드리지 않음
설정 파일 이미 있음 → 덮어쓰지 않음
설정 파일 없음 → 기본값으로 생성
설치 중 오류 → 나머지 계속 진행, 마지막에 보고
취소 선택 → 즉시 중단
```

---

## 📁 파일 구조

```
obsidian-ai-setup/                      ← 이 레포 클론
├── README.md                           ← 영어 문서
├── README.ko.md                        ← 한국어 문서 (지금 보는 파일)
├── .gitignore
├── .cursor/
│   ├── rules/
│   │   └── obsidian-vault.mdc          ← Cursor 항상 적용 규칙
│   └── skills/
│       └── obsidian-vault-setup/       ← 이식 가능한 스킬 팩
│           ├── SKILL.md                ← Cursor 진입점
│           ├── SETUP-GUIDE.md          ← 공통 셋업 로직 (AI-agnostic)
│           ├── plugin-catalog.md       ← 플러그인 목록 및 설명
│           ├── vault-snapshot.example.md ← 템플릿 (복사 후 수정)
│           └── scripts/
│               ├── phase1-config.ps1   ← 설정 파일 복원 (Windows)
│               └── phase2-cli.sh       ← CLI로 플러그인 설치
└── .claude/
    └── commands/
        └── vault-setup.md              ← Claude Code 진입점
```

### vault에 복사하면 이런 구조가 됩니다

```
내-vault/
├── .cursor/              ← 이 레포에서 복사
│   ├── rules/
│   └── skills/
│       └── obsidian-vault-setup/
│           └── vault-snapshot.md   ← 내 vault 전용 설정 (예시에서 복사)
├── .claude/              ← 이 레포에서 복사
│   └── commands/
└── ... 내 노트들 ...
```

---

## ⚙️ 내 vault에 맞게 커스터마이징

`vault-snapshot.example.md`를 복사해 `vault-snapshot.md`로 만든 뒤 수정하세요:

| 항목 | 수정 내용 |
|---|---|
| Vault 이름 | 실제 vault 이름 |
| 폴더 구조 | 내 PARA / ZK 구조 |
| 플러그인 목록 | 카테고리별 포함할 플러그인 |
| 앱 설정 | 기본 뷰 모드, 새 파일 위치 등 |
| 핫키 | 원하는 단축키 |

이 파일이 **내 vault 설정의 단일 진실 공급원**입니다.

---

## 🔄 여러 vault에서 사용하기

vault마다 `vault-snapshot.md`만 따로 만들면 됩니다. 나머지는 그대로:

```bash
# 업무용 vault
cp vault-snapshot.example.md 업무-vault/.cursor/skills/obsidian-vault-setup/vault-snapshot.md
# 업무 vault에 맞게 수정

# 개인용 vault
cp vault-snapshot.example.md 개인-vault/.cursor/skills/obsidian-vault-setup/vault-snapshot.md
# 개인 vault에 맞게 수정
```

---

## 🤖 AI 에이전트 호환성

| 기능 | Cursor | Claude Code |
|---|---|---|
| 스킬 활성화 | 자동 (키워드 감지) | `/project:vault-setup` |
| 객관식 UI | `AskQuestion` 도구 | 번호 선택지 |
| 작업 확인 | Plan 모드 스타일 | 인라인 확인 |
| 공통 로직 | ✅ 같은 `SETUP-GUIDE.md` | ✅ 같은 `SETUP-GUIDE.md` |

---

## 🛠️ 기술 세부 사항

### Phase 1 — 설정 파일 복원
Obsidian 없이 실행 가능합니다. PowerShell로 누락된 `.obsidian/*.json` 파일을 생성합니다.
이미 있는 파일은 덮어쓰지 않습니다.

### Phase 2 — 플러그인 및 테마 설치
Obsidian이 실행 중이어야 합니다. `obsidian plugin:install`, `obsidian theme:install` 사용.
하나가 실패해도 나머지는 계속 진행됩니다.

### 최소 작업 원칙
에이전트는 항상 필요한 최소한의 작업만 수행합니다.
이미 설치된 플러그인, 적용된 테마, 존재하는 설정 파일은 건드리지 않습니다.

---

## 📝 스크립트 직접 실행 (필요 시)

**Phase 1** — 설정 파일 복원 (Windows):
```bash
powershell -ExecutionPolicy Bypass \
  -File ".cursor/skills/obsidian-vault-setup/scripts/phase1-config.ps1" \
  -VaultPath "내-vault-경로"
```

**Phase 2** — CLI로 플러그인 설치:
```bash
# 특정 카테고리만 설치
bash .cursor/skills/obsidian-vault-setup/scripts/phase2-cli.sh \
  --essential --cat-a --cat-b --theme-things

# 전체 설치
bash .cursor/skills/obsidian-vault-setup/scripts/phase2-cli.sh --all
```

---

## 🌏 파일 언어 안내

| 파일 | 언어 |
|---|---|
| README.md | 영어 |
| README.ko.md | 한국어 |
| SETUP-GUIDE.md | 한국어 (에이전트용 지침) |
| plugin-catalog.md | 한국어 (플러그인명은 영어) |
| 스크립트 주석 | 한국어 |

---

## 🤝 기여하기

PR 환영합니다! 특히:

- 새 플러그인 카테고리 추가
- macOS / Linux용 Phase 1 스크립트
- 더 많은 테마 옵션
- 번역 개선

---

## 📄 라이선스

MIT — 자유롭게 사용, 포크, 공유하세요.
