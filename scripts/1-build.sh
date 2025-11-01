#!/bin/bash
# 步骤1: 构建并导出镜像

set -e

echo "================================================"
echo "  构建并导出镜像"
echo "================================================"
echo ""

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# 构建镜像
echo "📦 正在构建镜像..."
docker build -t class-learning-site:latest .
echo "✅ 镜像构建完成"
echo ""

# # 导出镜像
# echo "📦 正在导出镜像..."
# docker save class-learning-site:latest -o /tmp/class-learning-site.tar
# echo "✅ 镜像已导出到: /tmp/class-learning-site.tar"
# echo ""

# # 显示镜像信息
# echo "📊 镜像信息:"
# ls -lh /tmp/class-learning-site.tar
# docker images | grep class-learning-site
# echo ""

echo "================================================"
echo "  ✅ 构建完成！"
echo "================================================"
echo ""
echo "🎯 K8s部署步骤:"
echo ""
echo "   1️⃣  将镜像传输到K8s节点:"
echo "      scp /tmp/class-learning-site.tar user@k8s-node:/tmp/"
echo ""
echo "   2️⃣  在K8s节点导入镜像:"
echo "      ssh user@k8s-node 'sudo k3s ctr images import /tmp/class-learning-site.tar'"
echo ""
echo "   3️⃣  给节点打标签 (选择运行Pod的节点):"
echo "      kubectl label nodes <节点名> app=class-learning --overwrite"
echo ""
echo "   4️⃣  部署到K8s:"
echo "      kubectl apply -f /Users/lsq/GolandProjects/k3s-script-new/route/class-route.yaml"
echo ""
echo "   5️⃣  查看部署状态:"
echo "      kubectl get all -n class-learning -o wide"
echo ""
echo "📍 访问地址: https://www.liaosiqian.com/v1/class"
echo ""


