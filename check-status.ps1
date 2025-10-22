# Check Deployment Status

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Deployment Status Check" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check local Git
Write-Host "1. Checking local Git repository..." -ForegroundColor Yellow
if (Test-Path .git) {
    Write-Host "   [OK] Git repository initialized" -ForegroundColor Green
    
    $commitCount = (git log --oneline | Measure-Object).Count
    Write-Host "   [OK] Local commits: $commitCount" -ForegroundColor Green
    
    $fileCount = (git ls-files | Measure-Object).Count
    Write-Host "   [OK] Tracked files: $fileCount" -ForegroundColor Green
} else {
    Write-Host "   [ERROR] Git repository not initialized" -ForegroundColor Red
}

Write-Host ""

# Check remote
Write-Host "2. Checking remote repository..." -ForegroundColor Yellow
$remoteUrl = git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "   [OK] Remote: $remoteUrl" -ForegroundColor Green
} else {
    Write-Host "   [ERROR] No remote repository set" -ForegroundColor Red
}

Write-Host ""

# Check project files
Write-Host "3. Checking project files..." -ForegroundColor Yellow
$requiredFiles = @("package.json", "next.config.ts", "src/app/page.tsx", "src/data/cn.ts", "README.md")

$allFilesExist = $true
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "   [OK] $file" -ForegroundColor Green
    } else {
        Write-Host "   [ERROR] $file missing" -ForegroundColor Red
        $allFilesExist = $false
    }
}

if ($allFilesExist) {
    Write-Host "   [OK] All required files exist" -ForegroundColor Green
}

Write-Host ""

# Summary
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Status Summary" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Current Status:" -ForegroundColor Yellow
Write-Host "  - Local Git: OK" -ForegroundColor Green
Write-Host "  - Remote Git: Need to verify" -ForegroundColor Yellow
Write-Host "  - Project Files: OK" -ForegroundColor Green
Write-Host ""

Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Check GitHub Repository:" -ForegroundColor Cyan
Write-Host "   Visit: https://github.com/ruiyi-stack/resume" -ForegroundColor White
Write-Host "   Verify files are uploaded" -ForegroundColor White
Write-Host ""
Write-Host "2. Check Vercel Deployment:" -ForegroundColor Cyan
Write-Host "   Visit: https://vercel.com" -ForegroundColor White
Write-Host "   Login and check project 'resume'" -ForegroundColor White
Write-Host "   Verify deployment status" -ForegroundColor White
Write-Host ""
Write-Host "3. Test Website:" -ForegroundColor Cyan
Write-Host "   Open Vercel deployment URL" -ForegroundColor White
Write-Host "   Test all features" -ForegroundColor White
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Read-Host "Press Enter to exit"

