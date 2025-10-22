# 部署脚本 - Cyberpunk Resume 到 GitHub
# 使用说明：右键以管理员身份运行 PowerShell，然后执行: .\deploy.ps1

Write-Host "🚀 Cyberpunk Resume 部署脚本" -ForegroundColor Cyan
Write-Host ""

# 检查 Git 是否安装
Write-Host "检查 Git 安装状态..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>&1
    Write-Host "✓ Git 已安装: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git 未安装" -ForegroundColor Red
    Write-Host ""
    Write-Host "请先安装 Git:" -ForegroundColor Yellow
    Write-Host "1. 访问: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. 下载并安装 Git for Windows" -ForegroundColor White
    Write-Host "3. 重启 PowerShell 后再次运行此脚本" -ForegroundColor White
    Read-Host "按 Enter 退出"
    exit
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "开始部署流程..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查是否已经是 Git 仓库
if (Test-Path .git) {
    Write-Host "✓ Git 仓库已存在" -ForegroundColor Green
} else {
    Write-Host "初始化 Git 仓库..." -ForegroundColor Yellow
    git init
    Write-Host "✓ Git 仓库初始化完成" -ForegroundColor Green
}

Write-Host ""
Write-Host "添加文件到 Git..." -ForegroundColor Yellow
git add .
Write-Host "✓ 文件已添加" -ForegroundColor Green

Write-Host ""
Write-Host "提交代码..." -ForegroundColor Yellow
git commit -m "Initial commit: Cyberpunk Resume"
Write-Host "✓ 代码已提交" -ForegroundColor Green

Write-Host ""
Write-Host "设置远程仓库..." -ForegroundColor Yellow
# 检查是否已有远程仓库
$remoteExists = git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "远程仓库已存在，更新 URL..." -ForegroundColor Yellow
    git remote set-url origin https://github.com/ruiyi-stack/resume.git
} else {
    git remote add origin https://github.com/ruiyi-stack/resume.git
}
Write-Host "✓ 远程仓库已设置" -ForegroundColor Green

Write-Host ""
Write-Host "重命名分支为 main..." -ForegroundColor Yellow
git branch -M main
Write-Host "✓ 分支已重命名" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "准备推送到 GitHub..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "目标仓库: https://github.com/ruiyi-stack/resume.git" -ForegroundColor White
Write-Host ""
Write-Host "如果要求输入用户名和密码：" -ForegroundColor Yellow
Write-Host "  - 用户名: 你的 GitHub 用户名" -ForegroundColor White
Write-Host "  - 密码: GitHub Personal Access Token" -ForegroundColor White
Write-Host "  获取 Token: https://github.com/settings/tokens" -ForegroundColor White
Write-Host ""
$confirmation = Read-Host "按 Enter 继续推送 (或输入 'q' 退出)"

if ($confirmation -eq 'q') {
    Write-Host "已取消推送" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "正在推送到 GitHub..." -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ 推送成功！" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "下一步：部署到 Vercel" -ForegroundColor Cyan
    Write-Host "1. 访问: https://vercel.com" -ForegroundColor White
    Write-Host "2. 使用 GitHub 账号登录" -ForegroundColor White
    Write-Host "3. 点击 'Add New Project'" -ForegroundColor White
    Write-Host "4. 选择 'ruiyi-stack/resume' 仓库" -ForegroundColor White
    Write-Host "5. 点击 'Deploy'" -ForegroundColor White
    Write-Host ""
    Write-Host "查看仓库: https://github.com/ruiyi-stack/resume" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "✗ 推送失败" -ForegroundColor Red
    Write-Host ""
    Write-Host "可能的原因：" -ForegroundColor Yellow
    Write-Host "1. 用户名或密码错误" -ForegroundColor White
    Write-Host "2. 需要使用 Personal Access Token" -ForegroundColor White
    Write-Host "3. 网络连接问题" -ForegroundColor White
    Write-Host ""
    Write-Host "获取 Token: https://github.com/settings/tokens" -ForegroundColor Cyan
}

Write-Host ""
Read-Host "按 Enter 退出"

