# Deploy Cyberpunk Resume to GitHub
# Run this script: .\deploy-simple.ps1

Write-Host "Cyberpunk Resume Deployment Script" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
Write-Host "Checking Git installation..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>&1
    Write-Host "[OK] Git installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Git is not installed" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Git first:" -ForegroundColor Yellow
    Write-Host "1. Visit: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. Download and install Git for Windows" -ForegroundColor White
    Write-Host "3. Restart PowerShell and run this script again" -ForegroundColor White
    Read-Host "Press Enter to exit"
    exit
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Starting deployment process..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git repository exists
if (Test-Path .git) {
    Write-Host "[OK] Git repository exists" -ForegroundColor Green
} else {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    Write-Host "[OK] Git repository initialized" -ForegroundColor Green
}

Write-Host ""
Write-Host "Adding files to Git..." -ForegroundColor Yellow
git add .
Write-Host "[OK] Files added" -ForegroundColor Green

Write-Host ""
Write-Host "Committing code..." -ForegroundColor Yellow
git commit -m "Initial commit: Cyberpunk Resume"
Write-Host "[OK] Code committed" -ForegroundColor Green

Write-Host ""
Write-Host "Setting remote repository..." -ForegroundColor Yellow
# Check if remote already exists
$remoteExists = git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "Remote exists, updating URL..." -ForegroundColor Yellow
    git remote set-url origin https://github.com/ruiyi-stack/resume.git
} else {
    git remote add origin https://github.com/ruiyi-stack/resume.git
}
Write-Host "[OK] Remote repository set" -ForegroundColor Green

Write-Host ""
Write-Host "Renaming branch to main..." -ForegroundColor Yellow
git branch -M main
Write-Host "[OK] Branch renamed" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Ready to push to GitHub..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Target repository: https://github.com/ruiyi-stack/resume.git" -ForegroundColor White
Write-Host ""
Write-Host "If prompted for username and password:" -ForegroundColor Yellow
Write-Host "  - Username: Your GitHub username" -ForegroundColor White
Write-Host "  - Password: GitHub Personal Access Token" -ForegroundColor White
Write-Host "  Get Token: https://github.com/settings/tokens" -ForegroundColor White
Write-Host ""
$confirmation = Read-Host "Press Enter to continue push (or type 'q' to quit)"

if ($confirmation -eq 'q') {
    Write-Host "Push cancelled" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "[SUCCESS] Push completed!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next step: Deploy to Vercel" -ForegroundColor Cyan
    Write-Host "1. Visit: https://vercel.com" -ForegroundColor White
    Write-Host "2. Sign in with GitHub" -ForegroundColor White
    Write-Host "3. Click 'Add New Project'" -ForegroundColor White
    Write-Host "4. Select 'ruiyi-stack/resume' repository" -ForegroundColor White
    Write-Host "5. Click 'Deploy'" -ForegroundColor White
    Write-Host ""
    Write-Host "View repository: https://github.com/ruiyi-stack/resume" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "[ERROR] Push failed" -ForegroundColor Red
    Write-Host ""
    Write-Host "Possible reasons:" -ForegroundColor Yellow
    Write-Host "1. Wrong username or password" -ForegroundColor White
    Write-Host "2. Need to use Personal Access Token" -ForegroundColor White
    Write-Host "3. Network connection issue" -ForegroundColor White
    Write-Host ""
    Write-Host "Get Token: https://github.com/settings/tokens" -ForegroundColor Cyan
}

Write-Host ""
Read-Host "Press Enter to exit"

