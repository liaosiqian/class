# 📚 小学学习资源导航

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/docker-ready-brightgreen.svg)](Dockerfile)
[![Mobile](https://img.shields.io/badge/mobile-optimized-success.svg)](class.html)

> 一个精心整理的小学学习资源导航网站，包含国家同步课程、宇神奥数全集、B站优质课程等免费资源。

## ✨ 特性

- 🎯 **宇神奥数全集** - 320+节完整奥数课程，涵盖3-6年级
- 📖 **国家同步课程** - 教育部官方智慧教育平台资源直达
- 📺 **B站免费课程** - 精选优质奥数教学视频
- 📚 **学习指南** - 科学的学习路径规划建议
- 📱 **移动端优化** - 完美适配手机、平板等各种设备

## 🚀 快速开始

### 在线访问

直接打开 `class.html` 即可使用，无需任何服务器配置。

### 本地运行

```bash
# 克隆仓库
git clone https://github.com/liaosiqian/class.git
cd class

# 直接打开
open class.html  # macOS
start class.html # Windows
xdg-open class.html # Linux
```

### Docker部署

```bash
# 构建镜像
docker build -t class-resources .

# 运行容器
docker run -d -p 8080:80 --name class class-resources

# 访问
open http://localhost:8080
```

或使用 Docker Compose：

```bash
docker-compose up -d
```

## 📖 文档

- [项目结构说明](PROJECT_STRUCTURE.md) - 详细的目录结构
- [文件整理说明](FILE_ORGANIZATION.md) - 文件分类导航
- [整理报告](ORGANIZATION_REPORT.md) - 项目整理详情

更多文档请查看 [docs/](docs/) 目录：
- [快速开始指南](docs/guides/QUICK_START.md)
- [Docker部署指南](docs/guides/README_DOCKER.md)
- [爬取完成报告](docs/reports/重新爬取完成报告.md)

## 📂 项目结构

```
class/
├── 📄 class.html              # 主页面（核心）
├── 🐳 Dockerfile              # Docker镜像配置
├── 🐳 docker-compose.yml      # Docker编排配置
│
├── 📁 docs/                   # 文档目录
│   ├── reports/              # 项目报告
│   ├── guides/               # 使用指南
│   └── archives/             # 历史文档
│
├── 📁 scripts/               # 脚本目录
│   ├── *.py                  # Python脚本
│   ├── *.sh                  # Shell脚本
│   └── *.js                  # JavaScript工具
│
├── 📁 data/                  # 数据目录
│   ├── progress_*.json       # 课程数据
│   ├── all_courses_*.json    # 汇总数据
│   └── grade_subject_links.json # 配置数据
│
└── 📁 logs/                  # 日志目录
```

## 🎯 资源内容

### 1. 宇神奥数全集（16个系列，320+节课）

#### 高思导引刷题班系列
- ✅ 三年级：23讲完整课程（视频+PDF）
- ✅ 四年级：24讲完整课程（视频+PDF）
- ✅ 五年级：24讲完整课程（视频+PDF）
- ✅ 六年级：23讲完整课程（视频+PDF）

#### 专题模块系列
- 数论模块（18课）
- 行程专题（15课）
- 方程体系（10课）
- 几何模型（5课）

#### 总复习与冲刺
- 七大模块体系总复习 A+班
- 七大模块体系总复习 S+班
- 小升初分班考冲刺班
- 北京18所名校真题讲解
- 八少八素神测冲刺班

### 2. 国家同步课程

- 1-6年级全科目同步教材
- 教育部官方权威资源
- 9万+条免费学习资源

### 3. B站优质课程

- 王乃向《图说数学·小学奥数112讲》
- 乐乐课堂高思数学系列（动画精讲）

## 🔧 技术栈

- **前端**: HTML5 + CSS3 + JavaScript
- **响应式设计**: 完美支持移动端（@media queries）
- **部署**: Docker + Nginx
- **数据爬取**: Python + Playwright

## 📱 移动端适配

- ✅ 支持手机（≤480px）
- ✅ 支持平板（≤768px）
- ✅ 响应式布局
- ✅ 触摸友好的交互设计

## 🛠️ 开发

### 数据更新

```bash
# 运行爬虫脚本（如需要）
cd scripts/
python3 crawl_all_final.py

# 生成课程列表
python3 generate_course_lists.py
```

### 本地构建

```bash
# 使用构建脚本
cd scripts/
./1-build.sh

# 或手动构建
docker build -t class-resources .
```

## 📊 数据统计

- **文档**: 21个（报告7 + 指南6 + 归档8）
- **脚本**: 16个（Python 8 + Shell 7 + JS 1）
- **数据**: 36个JSON文件
- **课程**: 320+节完整课程资源

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

[MIT License](LICENSE)

## 🙏 致谢

- 教育部国家智慧教育平台
- 宇神老师的优质奥数课程
- B站优秀教育UP主们

## 📮 联系方式

如有问题或建议，欢迎通过以下方式联系：

- GitHub Issues: [提交Issue](https://github.com/liaosiqian/class/issues)
- Email: liaosiqian@example.com

---

**⭐ 如果这个项目对您有帮助，欢迎给个Star！**

最后更新：2025-11-01
