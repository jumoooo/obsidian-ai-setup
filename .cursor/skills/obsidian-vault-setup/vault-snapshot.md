# Vault 설정 스냅샷 — 템플릿

> ⚠️ **이 파일은 여러분의 vault에 맞게 수정해야 합니다.**
> 각 항목을 실제 설정에 맞게 채워주세요.
>
> 아래 내용은 PARA + Zettelkasten 혼합 방식 vault의 예시입니다.

---

## 기본 정보

| 항목 | 값 |
|---|---|
| Vault 이름 | (your-vault-name) |
| 테마 | Things |
| 운영 방식 | PARA + Zettelkasten 혼합 |

---

## 폴더 구조 (예시 — PARA + ZK)

아래는 권장 폴더 구조입니다. 자유롭게 수정하세요.

```
vault-root/
├── 0. Inbox/           # 빠른 수집함
├── 1. Projects/        # PARA: 기한 있는 프로젝트
├── 2. Areas/           # PARA: 지속 관리 영역
├── 3. Resources/       # PARA: 참고 자료
├── 4. Archive/         # PARA: 완료·보관
├── 5. Zettelkasten/    # ZK 지식 시스템
│   ├── 00. Inbox/
│   ├── 10. Literature/
│   └── 20. Permanent/
├── 6. Templates/       # 템플릿 파일
└── 7. Attachments/     # 이미지·PDF 등
```

---

## 설치할 플러그인 목록

아래는 이 시스템이 설치하는 플러그인 전체 목록입니다.
필요 없는 항목은 삭제하고, 원하는 것을 추가하세요.

### 기본 필수 (5개 — 항상 설치)
```
templater-obsidian
tag-wrangler
recent-files-obsidian
settings-search
obsidian-plugin-update-tracker
```

### 카테고리 A — 시간 관리 (2개)
```
calendar
periodic-notes
```

### 카테고리 B — 편집 도구 (5개)
```
editing-toolbar
obsidian-outliner
emoji-shortcodes
slash-commander
cmdr
```

### 카테고리 C — 노트 스타일 (3개)
```
obsidian-admonition
pretty-properties
quickadd
```

### 카테고리 D — 파일 정리 (4개)
```
file-cleaner-redux
remember-cursor-position
obsidian-view-mode-by-frontmatter
pinned-notes
```

### 카테고리 E — 외부 연동 (2개)
```
slurp
obsidian-importer
```

### 카테고리 F — AI/개발자 (2개)
```
obsidian42-brat
claudian
```

---

## 앱 설정 (app.json 예시)

```json
{
  "promptDelete": false,
  "attachmentFolderPath": "7. Attachments",
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

`Things` 대신 원하는 테마 이름으로 변경하세요.
테마 이름은 Obsidian 커뮤니티 플러그인 → 테마 검색에서 확인할 수 있습니다.

---

## 코어 플러그인 설정 (활성화 권장)

| 플러그인 | 활성화 |
|---|---|
| file-explorer | ✅ |
| global-search | ✅ |
| switcher | ✅ |
| graph | ✅ |
| backlink | ✅ |
| canvas | ✅ |
| outgoing-link | ✅ |
| tag-pane | ✅ |
| properties | ✅ |
| page-preview | ✅ |
| templates | ✅ |
| note-composer | ✅ |
| command-palette | ✅ |
| bookmarks | ✅ |
| outline | ✅ |
| word-count | ✅ |
| file-recovery | ✅ |
| bases | ✅ |

---

## 핫키 설정 (예시)

| 단축키 | 기능 |
|---|---|
| Ctrl+Shift+1 | 오늘 일간 노트 열기 |
| Ctrl+Shift+2 | 이번 주 주간 노트 열기 |
| Ctrl+Shift+3 | 이번 달 월간 노트 열기 |
| Ctrl+Q | 새 캔버스 만들기 |
| Ctrl+Shift+P | 빠른 열기(Switcher) |
