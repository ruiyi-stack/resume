# 🚀 部署指南

本指南提供了多种将赛博朋克简历网站部署到云端服务器的方案。

## 📋 部署前准备

### 1. 确保代码已提交到 Git

```bash
# 检查当前状态
git status

# 如果没有初始化 Git，执行：
git init
git add .
git commit -m "Initial commit"

# 推送到 GitHub（需要先创建仓库）
git remote add origin https://github.com/你的用户名/cyberpunk-resume.git
git push -u origin main
```

---

## 方案一：Vercel 部署（推荐⭐）

Vercel 是 Next.js 的创建者提供的托管平台，提供最流畅的部署体验。

### 优势
- ✅ 零配置，自动识别 Next.js
- ✅ 全球 CDN 加速
- ✅ 自动 HTTPS
- ✅ 持续部署（每次推送到 GitHub 自动更新）
- ✅ 免费套餐足够个人项目使用

### 部署步骤

#### 方法一：通过 Vercel Dashboard

1. **访问 Vercel**
   - 前往 [vercel.com](https://vercel.com)
   - 使用 GitHub 账号登录

2. **导入项目**
   - 点击 "Add New Project"
   - 选择你的 GitHub 仓库
   - 点击 "Import"

3. **配置项目**（通常无需修改）
   - Framework Preset: Next.js（自动检测）
   - Root Directory: `./`
   - Build Command: `npm run build`
   - Output Directory: `.next`
   - Install Command: `npm install`

4. **环境变量**（如有需要）
   - 如需设置环境变量，在 "Environment Variables" 中添加

5. **部署**
   - 点击 "Deploy"
   - 等待 1-2 分钟完成部署
   - 获得自动生成的域名（如：`cyberpunk-resume.vercel.app`）

#### 方法二：通过 Vercel CLI

```bash
# 安装 Vercel CLI
npm i -g vercel

# 登录
vercel login

# 部署
vercel

# 生产环境部署
vercel --prod
```

### 自定义域名

1. 在 Vercel Dashboard 中进入项目设置
2. 点击 "Domains"
3. 添加你的域名
4. 按照提示配置 DNS 记录

---

## 方案二：Railway 部署

Railway 是一个现代化的部署平台，支持各种应用。

### 优势
- ✅ 简单易用
- ✅ 自动 HTTPS
- ✅ 支持环境变量管理
- ✅ 提供数据库等服务
- ✅ 免费试用额度

### 部署步骤

1. **访问 Railway**
   - 前往 [railway.app](https://railway.app)
   - 使用 GitHub 账号登录

2. **创建新项目**
   - 点击 "New Project"
   - 选择 "Deploy from GitHub repo"
   - 选择你的仓库

3. **配置部署**（通常自动检测）
   - Railway 会自动检测到 Next.js 项目
   - Build Command: `npm run build`
   - Start Command: `npm start`

4. **获取域名**
   - 部署完成后会自动生成域名
   - 可在 Settings > Domains 中自定义域名

---

## 方案三：Render 部署

Render 提供类似 Heroku 的部署体验。

### 优势
- ✅ 简单直观的界面
- ✅ 自动 HTTPS
- ✅ 持续部署
- ✅ 免费套餐

### 部署步骤

1. **访问 Render**
   - 前往 [render.com](https://render.com)
   - 使用 GitHub 账号登录

2. **创建 Web Service**
   - 点击 "New +" > "Web Service"
   - 连接你的 GitHub 仓库

3. **配置服务**
   - Name: `cyberpunk-resume`
   - Region: 选择最近的区域（如 Singapore）
   - Branch: `main`
   - Root Directory: `.`
   - Build Command: `npm install && npm run build`
   - Start Command: `npm start`

4. **部署**
   - 点击 "Create Web Service"
   - 等待部署完成
   - 获得 `.onrender.com` 域名

---

## 方案四：Netlify 部署

Netlify 也是一个流行的静态站点托管平台。

### 优势
- ✅ 优秀的静态站点支持
- ✅ 表单处理功能
- ✅ 免费套餐
- ✅ 持续部署

### 部署步骤

1. **访问 Netlify**
   - 前往 [netlify.com](https://netlify.com)
   - 使用 GitHub 账号登录

2. **导入项目**
   - 点击 "Add new site" > "Import an existing project"
   - 选择你的 GitHub 仓库

3. **配置构建**
   - Build command: `npm run build`
   - Publish directory: `.next`

4. **部署**
   - 点击 "Deploy site"
   - 等待完成

---

## 📝 部署后检查清单

- [ ] 网站可以正常访问
- [ ] 所有页面加载正常
- [ ] 图片和资源加载正确
- [ ] 移动端响应式设计正常
- [ ] HTTPS 证书自动配置
- [ ] 自定义域名（如需要）已配置

---

## 🔧 常见问题

### Q: 部署后图片不显示？

A: 确保图片路径正确，并且已提交到 Git 仓库。

### Q: 如何更新网站内容？

A: 修改代码后推送到 GitHub，平台会自动重新部署。

### Q: 如何查看部署日志？

A: 在各个平台的 Dashboard 中找到 "Deployments" 或 "Logs" 部分。

### Q: 免费套餐有限制吗？

A: 各平台免费套餐不同，建议查看官方文档。一般来说个人项目完全够用。

---

## 💡 推荐

对于 Next.js 项目，**强烈推荐使用 Vercel**：
- 原生支持 Next.js
- 零配置部署
- 全球边缘网络
- 最佳性能

---

## 📞 需要帮助？

如果遇到部署问题，可以：
1. 查看各平台的官方文档
2. 检查部署日志中的错误信息
3. 确保环境变量和依赖配置正确

---

**祝部署顺利！** 🎉

