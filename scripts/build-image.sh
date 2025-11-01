#!/bin/bash
# 构建Docker镜像脚本

set -e

echo "================================================"
echo "  构建 class-learning-site 镜像"
echo "================================================"
echo ""

cd /Users/lsq/AIProjects/class

# 构建镜像
echo "📦 正在构建镜像..."
docker build -t class-learning-site:latest .

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 镜像构建成功！"
    echo ""
    echo "📊 镜像信息:"
    docker images | grep class-learning-site
    echo ""
    echo "🎯 下一步:"
    echo "   本地测试: docker-compose up -d"
    echo "   K8s部署:  导入镜像到K8s后部署"
else
    echo ""
    echo "❌ 镜像构建失败"
    exit 1
fi

