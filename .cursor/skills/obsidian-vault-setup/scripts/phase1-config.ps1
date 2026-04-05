# Phase 1: .obsidian 설정 파일 복원 스크립트
# Obsidian이 실행 중이지 않아도 동작합니다.
# 파일이 이미 존재하면 덮어쓰지 않습니다 (최소 작업 원칙).

param(
    [string]$VaultPath = ".",
    [switch]$Force  # -Force 플래그 시 기존 파일도 덮어씀
)

$obsidianDir = Join-Path $VaultPath ".obsidian"

# .obsidian 폴더 존재 확인
if (-not (Test-Path $obsidianDir)) {
    Write-Host "❌ .obsidian 폴더가 없습니다. 올바른 vault 경로인지 확인해주세요: $VaultPath" -ForegroundColor Red
    exit 1
}

Write-Host "✅ .obsidian 폴더 확인됨: $obsidianDir" -ForegroundColor Green

# 각 설정 파일의 기본값 정의
$configs = @{
    "app.json" = @{
        promptDelete        = $false
        attachmentFolderPath = "Files"
        alwaysUpdateLinks   = $true
        defaultViewMode     = "source"
        livePreview         = $true
        showLineNumber      = $true
        readableLineLength  = $false
        trashOption         = "local"
        newFileLocation     = "folder"
        newFileFolderPath   = "0. Inbox"
    }
    "appearance.json" = @{
        cssTheme = "Things"
        theme    = "obsidian"
    }
    "templates.json" = @{
        dateFormat = "YYYY년 MM월 DD일"
        timeFormat = "a hh시 m분"
    }
    "backlink.json" = @{
        backlinkInDocument = $true
    }
    "daily-notes.json" = @{
        folder = "Daily Notes"
    }
    "canvas.json" = @{
        snapToObjects       = $true
        snapToGrid          = $true
        newFileLocation     = "folder"
        newFileFolderPath   = "Inbox"
    }
}

$created = 0
$skipped = 0
$failed  = 0

foreach ($filename in $configs.Keys) {
    $targetPath = Join-Path $obsidianDir $filename

    if ((Test-Path $targetPath) -and -not $Force) {
        Write-Host "⏭️  건너뜀 (이미 존재): $filename" -ForegroundColor Yellow
        $skipped++
        continue
    }

    try {
        $configs[$filename] | ConvertTo-Json -Depth 10 | Set-Content -Path $targetPath -Encoding UTF8
        Write-Host "✅ 생성됨: $filename" -ForegroundColor Green
        $created++
    }
    catch {
        Write-Host "❌ 실패: $filename — $($_.Exception.Message)" -ForegroundColor Red
        $failed++
    }
}

# community-plugins.json 복원 (없을 때만)
$communityPluginsPath = Join-Path $obsidianDir "community-plugins.json"
if (-not (Test-Path $communityPluginsPath) -or $Force) {
    $pluginList = @(
        "templater-obsidian", "tag-wrangler", "recent-files-obsidian",
        "settings-search", "obsidian-plugin-update-tracker"
    )
    $pluginList | ConvertTo-Json | Set-Content -Path $communityPluginsPath -Encoding UTF8
    Write-Host "✅ 생성됨: community-plugins.json (기본 필수 플러그인만)" -ForegroundColor Green
    $created++
}
else {
    Write-Host "⏭️  건너뜀 (이미 존재): community-plugins.json" -ForegroundColor Yellow
    $skipped++
}

Write-Host ""
Write-Host "Phase 1 완료:" -ForegroundColor Cyan
Write-Host "  ✅ 생성: $created 개"
Write-Host "  ⏭️  건너뜀: $skipped 개"
Write-Host "  ❌ 실패: $failed 개"

if ($failed -gt 0) {
    exit 1
}
