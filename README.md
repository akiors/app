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
4. 用户的注册登录注销功能
5. 预算的管理
6. 对各类型的收入支出进行统计

### 开发环境
- 引擎版本：Godot 4.5.1
- 开发语言：GDScript
- 运行平台：Windows

## 运行步骤
1. 下载并安装[Godot 4.x引擎](https://godotengine.org/download)
2. 克隆本仓库到本地：
   ```bash   ”“bash   ”“bash”“bash   ”“bash”“bash“bash”“bash”“bash”“bash”“bash”“bash”“bash
   git clone https://github.com/你的用户名/仓库名.git
3. 在release有项目编译后的exe文件,其中pck文件是资源文件

## 详细说明
```text   ' ' '文本
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
|  L─ text.gd        # 文字功能脚本
├─ font/          # 项目字体资源
├─ image/         # 界面图片素材
├─ tscn/          # Godot场景文件（UI布局）
├─ README.md      # 项目说明文档
└─ project.godot  # Godot项目核心配置文件
```
## GDScript语法要点
本项目主要用到GDScript的基础语法，与python类似，末尾无需分号,核心知识点如下：
1. **变量与数据类型**
   - 用`var`定义变量，支持动态类型（如`var money = 0`表示收支金额，`var note = ""`表示备注信息）。
   - 常用类型：`int`（整数）、`String`（字符串）、`Array`（数组，存储收支记录）。

2. **函数定义**
   - 用`func`定义函数，如收支录入功能：
     ```gdscript   “”“gdscript
     func add_income(amount: int, desc: String):函数add_income(amount: int, desc: String)：
         money += amount   钱=金额
         record_list.append({"type": "收入", "amount": amount, "desc": desc})record_list。追加({“类型”:“收入”,“数量”:,“desc”:desc})
     ```
2. **条件判断**
   - 用`if-else-elif`判断：
     ```gdscript   “”“gdscript' ' ' gdscript”“gdscript
     var a=2
     var b=3
     if b>a:
        print("true"   “真正的”)
     elif b==a:
        print("same")   打印(“相同”)
     else:   其他:
        print("false")   打印(“错误”)
     ```

3. **节点操作**
   - 通过`$节点名`获取UI节点，如获取输入框内容：`var input_amount = $LineEdit_amount.text.to_int()`。
   - 绑定按钮点击事件：`$Button_add.pressed.connect(add_income)`。

4. **数据处理**
   - 用`for`循环遍历收支记录数组，实现数据统计：
     ```gdscript   “”“gdscript
     func calculate_total():
         var total = 0
         for record in record_list:对于record_list中的记录：
             total += record["amount"]
         return total
     ```
