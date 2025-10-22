# 杨毅睿 - 赛博朋克风简历网站

一个现代化的单页式简历网站，采用赛博朋克视觉风格，展示物流管理专业背景与数据分析技能。

## ✨ 特性

- 🎨 **赛博朋克视觉** - 深色主题、霓虹高光、网格背景、扫描线动效
- 📱 **移动优先** - 响应式设计，完美适配各种设备
- 🚀 **现代技术栈** - Next.js 15 + TypeScript + Tailwind CSS + Framer Motion
- 🌐 **SEO优化** - 完整的meta标签、Open Graph支持
- ♿ **无障碍友好** - 支持键盘导航、屏幕阅读器
- 🎭 **流畅动画** - 基于Framer Motion的轻量级动效

## 🛠️ 技术栈

- **框架**: Next.js 15 (App Router)
- **语言**: TypeScript
- **样式**: Tailwind CSS
- **动画**: Framer Motion
- **图标**: Lucide React
- **字体**: Oxanium, Rajdhani, Inter
- **部署**: Vercel

## 🚀 快速开始

### 环境要求

- Node.js 18+ 
- npm 或 yarn

### 安装依赖

```bash
npm install
# 或
yarn install
```

### 启动开发服务器

```bash
npm run dev
# 或
yarn dev
```

访问 [http://localhost:3000](http://localhost:3000) 查看效果。

### 构建生产版本

```bash
npm run build
# 或
yarn build
```

## 📁 项目结构

```
cyberpunk-resume/
├── src/
│   ├── app/
│   │   ├── globals.css      # 全局样式
│   │   ├── layout.tsx       # 根布局
│   │   └── page.tsx         # 主页
│   ├── components/          # 可复用组件
│   │   ├── Navbar.tsx       # 导航栏
│   │   ├── Hero.tsx         # 英雄区域
│   │   ├── Section.tsx      # 通用区块
│   │   ├── Timeline.tsx     # 时间线
│   │   ├── Card.tsx         # 卡片
│   │   ├── Badge.tsx        # 标签
│   │   ├── GlowDivider.tsx  # 发光分隔线
│   │   └── Footer.tsx       # 页脚
│   └── data/
│       └── cn.ts            # 中文内容数据
├── public/
│   └── resume.pdf           # 简历PDF文件
├── tailwind.config.ts       # Tailwind配置
└── package.json
```

## 🎨 自定义内容

### 更新个人信息

编辑 `src/data/cn.ts` 文件来更新个人信息：

```typescript
export const profile = {
  name: "你的姓名",
  role: "你的职位",
  // ... 其他信息
};
```

### 修改主题色彩

在 `tailwind.config.ts` 中自定义霓虹主题色：

```typescript
colors: {
  primary: '#00F0FF',  // 青色霓虹
  accent: '#FF3CF7',   // 粉色霓虹
  warning: '#F5D300',  // 黄色霓虹
  // ...
}
```

### 关闭动画效果

在 `src/app/globals.css` 中已包含减少动画偏好的媒体查询：

```css
@media (prefers-reduced-motion: reduce) {
  /* 自动减少动画 */
}
```

## 📱 响应式设计

- **移动端**: 单列布局，优化触摸交互
- **平板端**: 适中的间距和字体大小
- **桌面端**: 双列布局，充分利用屏幕空间

## 🎭 动效说明

- **入场动画**: 各区块依次淡入上浮
- **悬停效果**: 卡片微倾斜，边框发光
- **霓虹呼吸**: 按钮外发光脉冲效果
- **电流流动**: 边框流光动画
- **扫描线**: 背景扫描线效果

## 🔧 开发说明

### 添加新组件

1. 在 `src/components/` 创建新组件
2. 使用 TypeScript 定义 props 接口
3. 集成 Framer Motion 动画
4. 遵循赛博朋克设计规范

### 样式规范

- 使用 Tailwind CSS 工具类
- 霓虹效果使用 `.neon-text` 和 `.neon-glow`
- 玻璃效果使用 `.glass` 类
- 悬停效果使用 `.hover-lift` 类

## 🚀 部署

### 快速部署（推荐 Vercel）

本项目支持多种云端部署方案，请查看 **[DEPLOYMENT.md](./DEPLOYMENT.md)** 获取详细部署指南。

#### Vercel 一键部署

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/你的用户名/cyberpunk-resume)

或通过 Vercel CLI：

```bash
npm i -g vercel
vercel
```

#### 其他平台

- **Railway**: 使用 `railway.json` 配置
- **Render**: 使用 `render.yaml` 配置
- **Netlify**: 使用现有配置

详细步骤请参考 `DEPLOYMENT.md` 文件。

## 📄 许可证

MIT License

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📞 联系方式

- 邮箱: 1839916100@qq.com
- 电话: +86 19939891295
- 地址: 中国 · 上海

---

**Built with ❤️ using Next.js & Tailwind CSS**