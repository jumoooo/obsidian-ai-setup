# Vault 설정 스냅샷 — [YOUR VAULT NAME]

> 이 파일은 **vault 전용** 설정값입니다.
>
> **사용 방법:**
> 1. 이 파일을 `vault-snapshot.md`로 복사합니다.
> 2. 아래 내용을 내 vault에 맞게 수정합니다.
> 3. `vault-snapshot.md`는 `.gitignore`에 등록되어 있어 git에 올라가지 않습니다.
>    개인 설정 파일이므로 각자 로컬에서 관리합니다.

---

## 기본 정보

| 항목 | 값 |
|---|---|
| Vault 이름 | my-vault ← 실제 vault 이름으로 변경 |
| 테마 | Things ← 원하는 테마로 변경 |
| 운영 방식 | PARA / ZK / 기타 ← 설명 |

---

## 폴더 구조

아래는 예시입니다. 실제 vault 구조로 수정하세요.

```
vault-root/
├── 0. Inbox/           # 빠른 수집함
├── 1. Projects/        # PARA: 기한 있는 프로젝트
├── 2. Areas/           # PARA: 지속 관리 영역
├── 3. Resources/       # PARA: 참고 자료
├── 4. Archive/         # PARA: 완료·보관
├── 5. Zettelkasten/
│   ├── 00. Inbox/
│   ├── 10. Literature/
│   └── 20. Permanent/
└── 6. Templates/
```

---

## 설치할 커뮤니티 플러그인

아래에서 원하는 플러그인 ID를 남기고 필요 없는 것은 지우세요.
각 플러그인 설명은 `plugin-catalog.md`를 참고하세요.

### 기본 필수 (Essential — 삭제하지 마세요)
```
templater-obsidian
tag-wrangler
recent-files-obsidian
settings-search
obsidian-plugin-update-tracker
```

### 카테고리 A — 📅 시간 관리
```
calendar
periodic-notes
```

### 카테고리 B — ✏️ 편집 도구
```
editing-toolbar
obsidian-outliner
emoji-shortcodes
slash-commander
cmdr
```

### 카테고리 C — 📋 노트 스타일
```
obsidian-admonition
pretty-properties
quickadd
```

### 카테고리 D — 🔧 파일 정리
```
file-cleaner-redux
remember-cursor-position
obsidian-view-mode-by-frontmatter
pinned-notes
```

### 카테고리 E — 🌐 외부 연동
```
slurp
obsidian-importer
```

### 카테고리 F — 🤖 AI/개발자
```
obsidian42-brat
claudian
```

---

## 코어 플러그인 설정 (core-plugins.json)

활성화 권장:
- file-explorer, global-search, switcher, graph, backlink, canvas
- outgoing-link, tag-pane, properties, page-preview
- templates, note-composer, command-palette, slash-command
- editor-status, bookmarks, outline, word-count
- file-recovery, bases

---

## 앱 설정 (app.json) — 필요 시 수정

```json
{
  "promptDelete": false,
  "attachmentFolderPath": "Files",
  "alwaysUpdateLinks": true,
  "defaultViewMode": "source",
  "livePreview": true,
  "showLineNumber": true,
  "readableLineLength": false,
  "trashOption": "local",
  "newFileLocation": "folder",
  "newFileFolderPath": "0. Inbox"
}
```

---

## 테마 설정

```json
{
  "cssTheme": "Things",
  "theme": "obsidian"
}
```

Things 외 다른 테마: `cssTheme` 값을 원하는 테마명으로 변경하세요.

---

## 핫키 (선택 — 필요 없으면 이 섹션 삭제)

| 단축키 | 기능 |
|---|---|
| Ctrl+Shift+1 | 오늘 일간 노트 열기 |
| Ctrl+Shift+2 | 이번 주 주간 노트 열기 |
| Ctrl+Shift+3 | 이번 달 월간 노트 열기 |
| Ctrl+Q | 새 캔버스 만들기 |
| Ctrl+Shift+P | 빠른 열기 (Switcher) |
