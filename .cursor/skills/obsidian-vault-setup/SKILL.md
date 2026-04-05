---
name: obsidian-vault-setup
description: Obsidian vault를 자동으로 셋업합니다. 플러그인 설치, 테마 적용, 설정 복원을 사용자와 대화하며 단계별로 진행합니다. "옵시디언 셋업", "vault 초기화", "setup obsidian", "플러그인 설치", "새 환경 셋업", "set up my vault" 요청 시 사용합니다.
---

# Obsidian Vault 자동 셋업 (Cursor 스킬)

## 참조 파일 (순서대로 읽으세요)

1. **[SETUP-GUIDE.md](SETUP-GUIDE.md)** — 전체 실행 순서와 판단 기준 (핵심 로직)
2. **[plugin-catalog.md](plugin-catalog.md)** — 플러그인 카탈로그와 카테고리 설명
3. **[vault-snapshot.md](vault-snapshot.md)** — 이 vault의 목표 설정값
   - 없으면 `vault-snapshot.example.md` 를 대신 읽어 기본값으로 진행

## Cursor 전용 UX 지침

### AskQuestion 도구 사용

Step 3 (테마)과 Step 4 (카테고리)에서 **반드시 AskQuestion 도구**를 사용하세요:

```
Step 3: allow_multiple: false  (테마 단일 선택)
Step 4: allow_multiple: true   (카테고리 다중 선택)
Step 5: allow_multiple: false  (예/취소 컨펌)
```

## 실행 시작

SETUP-GUIDE.md의 "사전 확인사항"부터 시작합니다.
