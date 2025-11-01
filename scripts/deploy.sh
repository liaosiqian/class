#!/bin/bash
# 小学学习资源导航 - K3s部署脚本（固定节点版本）

set -e

echo "================================================"
echo "  小学学习资源导航 - K3s部署脚本"
echo "================================================"
echo ""

# 切换到项目目录
cd /Users/lsq/AIProjects/class

# 0. 检查并选择节点
echo "📋 步骤0: 检查可用节点..."
echo ""
kubectl get nodes
echo ""

# 获取第一个Ready的worker节点
TARGET_NODE=$(kubectl get nodes --no-headers -o custom-columns=NAME:.metadata.name,STATUS:.status.conditions[-1].type | grep Ready | head -n 1 | awk '{print $1}')

if [ -z "$TARGET_NODE" ]; then
    echo "❌ 未找到可用节点"
    exit 1
fi

echo "🎯 将使用节点: $TARGET_NODE"
echo ""
read -p "是否使用此节点？(Y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]] && [[ ! -z $REPLY ]]; then
    read -p "请输入节点名称: " TARGET_NODE
fi

echo "✅ 已选择节点: $TARGET_NODE"
echo ""

# 1. 给节点打标签
echo "🏷️  步骤1: 给节点添加标签..."
kubectl label nodes $TARGET_NODE app=class-learning --overwrite
echo "✅ 节点标签添加完成"
echo ""

# 2. 构建Docker镜像
echo "📦 步骤2: 构建Docker镜像..."
docker build -t class-learning-site:latest .
echo "✅ 镜像构建完成"
echo ""

# 3. 导入镜像到K3s节点
echo "📦 步骤3: 导入镜像到K3s..."
docker save class-learning-site:latest | sudo k3s ctr images import -
echo "✅ 镜像导入完成"
echo ""

# 4. 验证镜像是否导入成功
echo "🔍 步骤4: 验证镜像..."
sudo k3s crictl images | grep class-learning-site || echo "⚠️  未找到镜像，请检查"
echo ""

# 5. 应用K3s配置
echo "🚀 步骤5: 部署到K3s..."
kubectl apply -f /Users/lsq/GolandProjects/k3s-script-new/route/class-route.yaml
echo "✅ K3s配置已应用"
echo ""

# 6. 等待部署完成
echo "⏳ 步骤6: 等待Pod启动..."
kubectl wait --for=condition=ready pod -l app=class-learning -n class-learning --timeout=60s || {
    echo "⚠️  Pod启动超时，查看详情："
    kubectl get pods -n class-learning
    kubectl describe pod -l app=class-learning -n class-learning
    exit 1
}
echo "✅ Pod已就绪"
echo ""

# 7. 查看部署状态
echo "📊 部署状态:"
echo ""
kubectl get all -n class-learning -o wide
echo ""

# 8. 验证Pod是否调度到指定节点
POD_NODE=$(kubectl get pod -l app=class-learning -n class-learning -o jsonpath='{.items[0].spec.nodeName}')
echo "📍 Pod已调度到节点: $POD_NODE"
if [ "$POD_NODE" = "$TARGET_NODE" ]; then
    echo "✅ 节点调度正确"
else
    echo "⚠️  节点调度异常，预期: $TARGET_NODE, 实际: $POD_NODE"
fi
echo ""

# 9. 显示访问信息
echo "================================================"
echo "  ✅ 部署完成！"
echo "================================================"
echo ""
echo "📍 访问地址:"
echo "   https://www.liaosiqian.com/v1/class"
echo ""
echo "🏷️  节点标签:"
echo "   $TARGET_NODE: app=class-learning"
echo ""
echo "🔍 查看日志:"
echo "   kubectl logs -f -l app=class-learning -n class-learning"
echo ""
echo "🗑️  删除部署:"
echo "   kubectl delete -f /Users/lsq/GolandProjects/k3s-script-new/route/class-route.yaml"
echo "   kubectl label nodes $TARGET_NODE app-"
echo ""

