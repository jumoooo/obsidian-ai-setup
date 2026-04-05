#!/usr/bin/env bash
# Phase 2: Obsidian CLI 플러그인·테마 설치 스크립트
# Obsidian이 실행 중이고 vault가 열려 있어야 합니다.
#
# 사용법:
#   ./phase2-cli.sh [카테고리 옵션...]
#
# 카테고리 옵션 (공백으로 구분):
#   --essential   기본 필수 플러그인 (기본 포함, 항상 설치)
#   --cat-a       📅 시간 관리 (calendar, periodic-notes)
#   --cat-b       ✏️  편집 도구
#   --cat-c       📋 노트 스타일
#   --cat-d       🔧 파일 정리
#   --cat-e       🌐 외부 연동
#   --cat-f       🤖 AI/개발자
#   --theme-things  Things 테마 설치
#   --all         전체 설치
#
# 예시:
#   ./phase2-cli.sh --essential --cat-a --cat-b --theme-things

set -euo pipefail

# ─── 색상 출력 ───────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

# ─── 카운터 ──────────────────────────────────────────────────
SUCCESS=0
SKIPPED=0
FAILED=0
FAILED_PLUGINS=()

# ─── Obsidian CLI 확인 ────────────────────────────────────────
check_cli() {
    if ! command -v obsidian &>/dev/null; then
        echo -e "${RED}❌ obsidian 명령어를 찾을 수 없습니다.${NC}"
        echo "   Obsidian Settings → General → Command line interface → ON"
        echo "   설정 후 PATH를 등록해주세요."
        exit 1
    fi

    echo -e "${GREEN}✅ Obsidian CLI 확인됨: $(obsidian version)${NC}"
}

# ─── 플러그인 설치 함수 ───────────────────────────────────────
install_plugin() {
    local plugin_id="$1"
    local plugin_name="$2"

    # 이미 설치된 경우 건너뜀
    if obsidian plugins:enabled 2>/dev/null | grep -q "\"$plugin_id\""; then
        echo -e "${YELLOW}⏭️  건너뜀 (이미 설치됨): $plugin_name${NC}"
        ((SKIPPED++)) || true
        return
    fi

    echo -e "   📦 설치 중: $plugin_name..."
    if obsidian plugin:install id="$plugin_id" 2>/dev/null; then
        echo -e "${GREEN}   ✅ 완료: $plugin_name${NC}"
        ((SUCCESS++)) || true
    else
        echo -e "${RED}   ❌ 실패: $plugin_name${NC}"
        FAILED_PLUGINS+=("$plugin_name")
        ((FAILED++)) || true
    fi
}

# ─── 인수 파싱 ───────────────────────────────────────────────
INSTALL_ESSENTIAL=true  # 필수는 항상
INSTALL_CAT_A=false
INSTALL_CAT_B=false
INSTALL_CAT_C=false
INSTALL_CAT_D=false
INSTALL_CAT_E=false
INSTALL_CAT_F=false
INSTALL_THEME_THINGS=false

for arg in "$@"; do
    case $arg in
        --all)
            INSTALL_CAT_A=true; INSTALL_CAT_B=true; INSTALL_CAT_C=true
            INSTALL_CAT_D=true; INSTALL_CAT_E=true; INSTALL_CAT_F=true
            INSTALL_THEME_THINGS=true
            ;;
        --cat-a) INSTALL_CAT_A=true ;;
        --cat-b) INSTALL_CAT_B=true ;;
        --cat-c) INSTALL_CAT_C=true ;;
        --cat-d) INSTALL_CAT_D=true ;;
        --cat-e) INSTALL_CAT_E=true ;;
        --cat-f) INSTALL_CAT_F=true ;;
        --theme-things) INSTALL_THEME_THINGS=true ;;
        --essential) ;; # 기본 포함이라 무시
    esac
done

# ─── 메인 실행 ───────────────────────────────────────────────
echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}  Obsidian Vault 플러그인 셋업 시작     ${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

check_cli

# 기본 필수 플러그인
echo ""
echo -e "${CYAN}🟢 기본 필수 플러그인 설치 중...${NC}"
install_plugin "templater-obsidian"            "Templater"
install_plugin "tag-wrangler"                  "Tag Wrangler"
install_plugin "recent-files-obsidian"         "Recent Files"
install_plugin "settings-search"               "Settings Search"
install_plugin "obsidian-plugin-update-tracker" "Plugin Update Tracker"

# 카테고리 A — 시간 관리
if [ "$INSTALL_CAT_A" = true ]; then
    echo ""
    echo -e "${CYAN}📅 카테고리 A: 시간 관리 패키지 설치 중...${NC}"
    install_plugin "calendar"        "Calendar"
    install_plugin "periodic-notes"  "Periodic Notes"
fi

# 카테고리 B — 편집 도구
if [ "$INSTALL_CAT_B" = true ]; then
    echo ""
    echo -e "${CYAN}✏️  카테고리 B: 편집 도구 패키지 설치 중...${NC}"
    install_plugin "editing-toolbar"   "Editing Toolbar"
    install_plugin "obsidian-outliner" "Outliner"
    install_plugin "emoji-shortcodes"  "Emoji Shortcodes"
    install_plugin "slash-commander"   "Slash Commander"
    install_plugin "cmdr"              "Commander"
fi

# 카테고리 C — 노트 스타일
if [ "$INSTALL_CAT_C" = true ]; then
    echo ""
    echo -e "${CYAN}📋 카테고리 C: 노트 스타일 패키지 설치 중...${NC}"
    install_plugin "obsidian-admonition" "Admonition"
    install_plugin "pretty-properties"   "Pretty Properties"
    install_plugin "quickadd"            "QuickAdd"
fi

# 카테고리 D — 파일 정리
if [ "$INSTALL_CAT_D" = true ]; then
    echo ""
    echo -e "${CYAN}🔧 카테고리 D: 파일 정리 패키지 설치 중...${NC}"
    install_plugin "file-cleaner-redux"                "File Cleaner Redux"
    install_plugin "remember-cursor-position"          "Remember Cursor Position"
    install_plugin "obsidian-view-mode-by-frontmatter" "View Mode by Frontmatter"
    install_plugin "pinned-notes"                      "Pinned Notes"
fi

# 카테고리 E — 외부 연동
if [ "$INSTALL_CAT_E" = true ]; then
    echo ""
    echo -e "${CYAN}🌐 카테고리 E: 외부 연동 패키지 설치 중...${NC}"
    install_plugin "slurp"             "Slurp"
    install_plugin "obsidian-importer" "Importer"
fi

# 카테고리 F — AI/개발자
if [ "$INSTALL_CAT_F" = true ]; then
    echo ""
    echo -e "${CYAN}🤖 카테고리 F: AI/개발자 패키지 설치 중...${NC}"
    install_plugin "obsidian42-brat" "BRAT"
    install_plugin "claudian"        "Claudian"
fi

# 테마 설치
if [ "$INSTALL_THEME_THINGS" = true ]; then
    echo ""
    echo -e "${CYAN}🎨 Things 테마 설치 중...${NC}"
    if obsidian theme 2>/dev/null | grep -q "Things"; then
        echo -e "${YELLOW}⏭️  건너뜀: Things 테마 이미 적용됨${NC}"
    else
        if obsidian theme:install name="Things" enable 2>/dev/null; then
            echo -e "${GREEN}✅ Things 테마 설치 및 적용 완료${NC}"
        else
            echo -e "${RED}❌ Things 테마 설치 실패 (나중에 수동으로 설치해주세요)${NC}"
        fi
    fi
fi

# vault 재인덱싱
echo ""
echo "🔄 vault 재인덱싱 중..."
obsidian reload 2>/dev/null || true

# ─── 최종 보고 ───────────────────────────────────────────────
echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}  설치 완료 보고                        ${NC}"
echo -e "${CYAN}========================================${NC}"
echo -e "  ${GREEN}✅ 성공: ${SUCCESS}개${NC}"
echo -e "  ${YELLOW}⏭️  건너뜀 (이미 설치됨): ${SKIPPED}개${NC}"
echo -e "  ${RED}❌ 실패: ${FAILED}개${NC}"

if [ ${#FAILED_PLUGINS[@]} -gt 0 ]; then
    echo ""
    echo -e "${RED}실패한 플러그인 목록:${NC}"
    for p in "${FAILED_PLUGINS[@]}"; do
        echo -e "  - $p"
    done
    echo "  → 옵시디언 설정 > 커뮤니티 플러그인에서 직접 설치하실 수 있어요."
fi

echo ""
echo -e "${GREEN}옵시디언을 재시작하면 모든 설정이 적용돼요! 🎉${NC}"
