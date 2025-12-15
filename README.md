爪哇部落后端组第一次考核项目，用godot做的记账管理小程序

# Godot记账管理小程序
基于Godot 4.x引擎开发的简易记账工具，是我学习Godot引擎的练手项目，实现了个人日常收支记录的基础功能。

## 项目介绍
### 开发背景
作为Godot引擎的学习实践项目，主要目的是熟悉GDScript语法、Godot的UI节点操作和简单数据处理逻辑。

### 核心功能
1. 手动录入收入/支出记录（支持填写金额、收支类型、备注信息）
2. 实时统计总收支、月度收支数据
3. 收支记录的查看、删除操作

### 开发环境
- 引擎版本：Godot 4.2.1（可替换为你的实际版本）
- 开发语言：GDScript
- 运行平台：Windows（若支持其他平台可补充）

## 运行步骤
1. 下载并安装[Godot 4.x引擎](https://godotengine.org/download)
2. 克隆本仓库到本地：
   ```bash   ”“bash
   git clone https://github.com/你的用户名/仓库名.git
godot-account-book/
├─ code/          # GDScript脚本目录（核心逻辑代码）
│  |─ add_money.gd   # 记账管理界面功能脚本
|  |─ buffet.gd      # 预算管理界面功能脚本 
|  |─ come_back.gd   # 返回主界面按钮事件功能脚本
|  |─ creat_user.gd  # 注册用户界面功能脚本
|  |─ data.gd        # 存储数据的Resource类定义脚本
|  |─ load_user.gd   # 用户登录界面功能脚本
|  |─ manager.gd     # 统计查询界面功能脚本
|  |─ meue.gd        # 主界面功能脚本
|  |─ statemanger.gd # 全局数据管理脚本
|  |─ text.gd        # 文字功能脚本
├─ font/          # 项目字体资源
├─ image/         # 界面图片素材
├─ tscn/          # Godot场景文件（UI布局）
├─ README.md      # 项目说明文档
└─ project.godot  # Godot项目核心配置文件
