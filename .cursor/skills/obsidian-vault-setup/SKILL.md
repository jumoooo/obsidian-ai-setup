---
name: obsidian-vault-setup
description: Obsidian vault를 자동으로 셋업합니다. 새 환경 초기화, 플러그인 설치, 테마 적용, 설정 복원 작업을 사용자와 대화하며 단계별로 진행합니다. "옵시디언 셋업", "vault 초기화", "setup obsidian", "플러그인 설치", "새 환경 셋업" 요청 시 사용합니다.
---

# Obsidian Vault 자동 셋업 (Cursor 스킬)

이 스킬을 시작하면 아래 순서대로 진행합니다.

## 참조 파일

모든 셋업 로직은 아래 파일을 따릅니다. 반드시 먼저 읽으세요:

1. **[SETUP-GUIDE.md](SETUP-GUIDE.md)** — 전체 실행 순서와 판단 기준 (핵심)
2. **[plugin-catalog.md](plugin-catalog.md)** — 플러그인 목록과 카테고리 설명
3. **[vault-snapshot.md](vault-snapshot.md)** — 이 vault의 목표 설정값

## Cursor 전용 UX 지침

### AskQuestion 적극 활용

Step 3 (테마 선택)과 Step 4 (카테고리 선택)에서는 반드시 **AskQuestion 도구**를 사용합니다:

```
Step 3: 단일 선택 (allow_multiple: false)
Step 4: 다중 선택 (allow_multiple: true)
Step 5: 컨펌 (단일 선택 — 예/취소)
```

### Plan Mode 활용

Step 2 브리핑과 Step 5 컨펌은 Plan Mode 스타일로 명확하게 제시합니다.

## 실행 시작

SETUP-GUIDE.md의 "사전 확인사항"부터 시작합니다.
모든 판단과 오류 처리는 SETUP-GUIDE.md의 규칙을 따릅니다.
