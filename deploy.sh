#!/bin/bash
# GAAAP 小红书封面生成器 — 部署脚本
# 支持 Surge.sh 快速部署

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
HTML_FILE="$PROJECT_DIR/index.html"
SURGE_DOMAIN="${SURGE_DOMAIN:-gaaap-cover.surge.sh}"

echo "========================================"
echo "  GAAAP 小红书封面生成器 — 部署工具"
echo "========================================"
echo ""

# 检查 HTML 文件是否存在
if [ ! -f "$HTML_FILE" ]; then
    echo "❌ 错误：找不到 $HTML_FILE"
    echo "   请确保 index.html 在当前目录中"
    exit 1
fi

echo "✅ HTML 文件已就绪：$HTML_FILE"
echo ""

# 检查 surge 是否安装
if ! command -v surge &> /dev/null; then
    echo "🚀 Surge CLI 未安装，正在安装..."
    echo ""
    npm install -g surge
    echo ""
    echo "✅ Surge CLI 安装完成"
else
    echo "✅ Surge CLI 已安装：$(surge --version 2>/dev/null || echo '已安装')"
fi

echo ""
echo "🌐 部署域名：$SURGE_DOMAIN"
echo ""

# 部署
echo "🚀 正在部署到 Surge.sh..."
echo ""

surge "$PROJECT_DIR" "$SURGE_DOMAIN" --token "${SURGE_TOKEN:-}"

echo ""
echo "========================================"
echo "  ✅ 部署成功！"
echo "========================================"
echo ""
echo "🔗 在线访问地址："
echo "   https://$SURGE_DOMAIN"
echo ""
echo "📌 使用说明："
echo "   1. 每次更新 index.html 后，重新运行此脚本"
echo "   2. 域名自动保持，无需重新配置"
echo ""
echo "📌 自定义域名："
echo "   方式1：修改本文件中的 SURGE_DOMAIN 变量"
echo "   方式2：运行前设置环境变量："
echo "          export SURGE_DOMAIN=your-domain.surge.sh"
echo "          ./deploy.sh"
echo ""
echo "========================================"
