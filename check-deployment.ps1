# Deployment Check Script
# 检查部署状态

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Cyberpunk Resume 部署状态检查" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. 检查本地 Git 状态
Write-Host "1. 检查本地 Git 仓库..." -ForegroundColor Yellow
if (Test-Path .git) {
    Write-Host "   [OK] Git 仓库已初始化" -ForegroundColor Green
    
    $commitCount = (git log --oneline | Measure-Object).Count
    Write-Host "   [OK] 本地提交数: $commitCount" -ForegroundColor Green
    
    $fileCount = (git ls-files | Measure-Object).Count
    Write-Host "   [OK] 已跟踪文件数: $fileCount" -ForegroundColor Green
} else {
    Write-Host "   [ERROR] Git 仓库未初始化" -ForegroundColor Red
}

Write-Host ""

# 2. 检查远程仓库
Write-Host "2. 检查远程仓库..." -ForegroundColor Yellow
$remoteUrl = git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "   [OK] 远程仓库: $remoteUrl" -ForegroundColor Green
    
    Write-Host "   尝试连接远程仓库..." -ForegroundColor Yellow
    try {
        $remoteBranches = git ls-remote --heads origin 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "   [OK] 代码已推送到 GitHub" -ForegroundColor Green
            Write-Host "   远程分支: $remoteBranches" -ForegroundColor White
        } else {
            Write-Host "   [WARNING] 无法连接到 GitHub（可能是网络问题）" -ForegroundColor Yellow
            Write-Host "   建议: 使用浏览器上传文件到 GitHub" -ForegroundColor White
        }
    } catch {
        Write-Host "   [WARNING] 无法验证 GitHub 状态" -ForegroundColor Yellow
    }
} else {
    Write-Host "   [ERROR] 未设置远程仓库" -ForegroundColor Red
}

Write-Host ""

# 3. 检查项目文件
Write-Host "3. 检查项目文件..." -ForegroundColor Yellow
$requiredFiles = @(
    "package.json",
    "next.config.ts",
    "src/app/page.tsx",
    "src/data/cn.ts",
    "README.md"
)

$allFilesExist = $true
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "   [OK] $file" -ForegroundColor Green
    } else {
        Write-Host "   [ERROR] $file 不存在" -ForegroundColor Red
        $allFilesExist = $false
    }
}

if ($allFilesExist) {
    Write-Host "   [OK] 所有必需文件都存在" -ForegroundColor Green
}

Write-Host ""

# 4. 生成部署状态报告
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "部署状态总结" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "下一步操作建议:" -ForegroundColor Yellow
Write-Host ""

Write-Host "如果代码已在 GitHub:" -ForegroundColor Cyan
Write-Host "  1. 访问: https://vercel.com" -ForegroundColor White
Write-Host "  2. 登录并选择 'Add New Project'" -ForegroundColor White
Write-Host "  3. 选择 'ruiyi-stack/resume' 仓库" -ForegroundColor White
Write-Host "  4. 点击 'Deploy'" -ForegroundColor White
Write-Host ""

Write-Host "如果代码还未推送到 GitHub:" -ForegroundColor Cyan
Write-Host "  1. 访问: https://github.com/ruiyi-stack/resume" -ForegroundColor White
Write-Host "  2. 点击 'uploading an existing file'" -ForegroundColor White
Write-Host "  3. 上传项目文件（参考 浏览器上传指南.md）" -ForegroundColor White
Write-Host "  4. 完成上传后，再执行上面的 Vercel 部署步骤" -ForegroundColor White
Write-Host ""

Write-Host "验证部署成功:" -ForegroundColor Cyan
Write-Host "  1. 访问你的 Vercel 项目页面" -ForegroundColor White
Write-Host "  2. 查看是否有 'Ready' 状态的部署" -ForegroundColor White
Write-Host "  3. 点击部署链接访问网站" -ForegroundColor White
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Read-Host "按 Enter 退出"

