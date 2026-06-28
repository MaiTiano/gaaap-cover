# GAAAP 小红书封面生成器 — 部署指南

> 部署方式：Surge.sh（免费静态网站托管）
> 域名：gaaap-cover.surge.sh（可自定义）

---

## 一、快速部署（首次）

### 第1步：安装 Surge CLI（仅需一次）

打开终端，运行：

```bash
npm install -g surge
```

> 提示：如果提示权限不足，Mac 用户用 `sudo npm install -g surge`

### 第2步：部署到线上

```bash
cd /Users/shenyuan/Documents/Kimi/Workspaces/健身项目/gaaap-deploy
./deploy.sh
```

首次运行会要求：
- 输入邮箱（作为账号）
- 输入密码（新用户自动创建）
- 确认域名（默认 `gaaap-cover.surge.sh`）

### 第3步：访问

部署完成后，浏览器打开：

```
https://gaaap-cover.surge.sh
```

---

## 二、每次更新后的操作（简单）

### 方法1：手动更新（推荐）

每次你修改了 `index.html` 后，重新运行：

```bash
cd /Users/shenyuan/Documents/Kimi/Workspaces/健身项目/gaaap-deploy
./deploy.sh
```

### 方法2：自动部署（高级）

如果你想每次修改后自动部署，可以设置一个文件监听：

```bash
# 安装文件监听工具（仅需一次）
npm install -g chokidar-cli

# 监听文件变化并自动部署
chokidar "index.html" -c "./deploy.sh"
```

---

## 三、自定义域名

### 方案A：Surge.sh 免费子域名

修改 `deploy.sh` 中的域名，或运行前设置环境变量：

```bash
export SURGE_DOMAIN=yourname-gaaap.surge.sh
./deploy.sh
```

### 方案B：绑定自己的域名（如 gaaap.com）

1. 购买域名（如阿里云/GoDaddy）
2. 在域名管理后台添加 CNAME 记录：
   - 主机记录：`www` 或 `@`
   - 记录值：`na-west1.surge.sh`
3. 运行部署时指定域名：
   ```bash
   export SURGE_DOMAIN=www.gaaap.com
   ./deploy.sh
   ```

---

## 四、迁移到 GitHub Pages（可选，更稳定）

如果你已经有 GitHub 账号，可以迁移到 GitHub Pages（全球 CDN，更稳定）：

### 第1步：创建 GitHub 仓库

1. 打开 https://github.com/new
2. 仓库名：`gaaap-cover-generator`
3. 选择 Public
4. 创建

### 第2步：初始化本地仓库并推送

```bash
cd /Users/shenyuan/Documents/Kimi/Workspaces/健身项目/gaaap-deploy

git init
git add .
git commit -m "first commit"

# 替换为你的 GitHub 用户名
git remote add origin https://github.com/你的用户名/gaaap-cover-generator.git
git branch -M main
git push -u origin main
```

### 第3步：开启 GitHub Pages

1. 打开 GitHub 仓库页面
2. Settings → Pages
3. Source 选择 `Deploy from a branch`
4. Branch 选择 `main`，文件夹 `/ (root)`
5. 保存

### 第4步：访问

```
https://你的用户名.github.io/gaaap-cover-generator
```

### 每次更新

```bash
cd /Users/shenyuan/Documents/Kimi/Workspaces/健身项目/gaaap-deploy
git add .
git commit -m "更新封面生成器"
git push origin main
# 自动部署，1-2分钟后生效
```

---

## 五、目录结构

```
gaaap-deploy/
├── index.html          # 封面生成器主文件
├── deploy.sh           # Surge.sh 部署脚本
├── DEPLOY.md           # 本部署指南
└── .gitignore          # Git 忽略文件（可选）
```

---

## 六、常见问题

### Q1：Surge.sh 部署提示 token 过期？

```bash
# 重新登录
surge logout
surge login
# 然后重新部署
./deploy.sh
```

### Q2：想同时部署到 Surge 和 GitHub Pages？

完全可以，两者互不影响：
- Surge.sh 用于快速预览和分享
- GitHub Pages 用于长期稳定访问

### Q3：封面生成器更新后，怎么更新线上？

方法1：Surge.sh
```bash
cd /Users/shenyuan/Documents/Kimi/Workspaces/健身项目/gaaap-deploy
# 更新 index.html
./deploy.sh
```

方法2：GitHub Pages
```bash
cd /Users/shenyuan/Documents/Kimi/Workspaces/健身项目/gaaap-deploy
git add . && git commit -m "update" && git push
```

---

*部署指南生成：2026-06-20*
