# 会员系统实现任务清单

Feature Name: member-system
Updated: 2026-04-18

## 阶段 1: 基础框架

- [x] 1.1 创建模块目录结构
  - [x] 创建 `src/server/scripts/Custom/MemberSystem/` 目录
  - [x] 创建 `src/server/scripts/Custom/MemberSystem/hooks/` 目录
  
- [x] 1.2 创建 MemberSystem 核心类头文件
  - [x] 定义 `MemberSystem` 单例类
  - [x] 定义 `MemberData` 数据结构
  - [x] 定义 `MemberTier` 枚举
  
- [x] 1.3 创建 MemberSystem 核心类实现文件
  - [x] 实现构造函数和单例方法
  - [x] 实现 `LoadConfig()` 配置加载
  - [x] 实现 `LoadFromDB()` 数据库加载
  - [x] 实现会员数据访问方法
  
- [x] 1.4 创建数据库迁移脚本
  - [x] 创建 `vip_member.sql` 会员信息表
  - [x] 创建 `vip_skill_access.sql` 技能权限表
  - [x] 创建数据库更新说明文档

## 阶段 2: 配置文件

- [x] 2.1 创建 vip.conf.dist 配置文件模板
  - [x] 配置会员系统开关
  - [x] 配置各等级掉落率加成
  - [x] 配置各等级天赋点数加成
  
- [x] 2.2 集成到 CMake 构建系统
  - [x] 修改 `custom_script_loader.cpp`
  - [x] 创建 MemberSystem_loader.cpp

## 阶段 3: 核心功能钩子

- [x] 3.1 实现掉落率加成钩子
  - [x] 查找掉落率计算相关代码位置
  - [x] 实现 `OnAfterCalculateLootGroupAmount` 钩子
  - [x] 在钩子系统中注册

- [x] 3.2 实现天赋点数加成钩子
  - [x] 查找天赋点数计算相关代码位置
  - [x] 实现 `OnCalculateTalentsPoints` 钩子
  - [x] 在钩子系统中注册

- [x] 3.3 实现技能学习权限钩子
  - [x] 查找技能学习检查相关代码位置
  - [x] 实现 `OnBeforeLearnSpell` 钩子
  - [x] 在钩子系统中注册

## 阶段 4: GM 命令

- [x] 4.1 实现 GM 命令处理器
  - [x] 创建 `cs_vip.cpp` 命令脚本
  - [x] 实现 `.vip set` 命令
  - [x] 实现 `.vip info` 命令
  - [x] 实现 `.vip reload` 命令

- [x] 4.2 注册 GM 命令到命令系统
  - [x] 修改 `cs_script_loader.cpp`
  - [x] 添加 vip 命令注册

## 阶段 5: 集成测试

- [ ] 5.1 编译测试
  - [ ] 执行 CMake 配置
  - [ ] 编译项目确保无错误
  
- [ ] 5.2 单元测试
  - [ ] 测试 MemberSystem 配置加载
  - [ ] 测试会员数据访问方法
  - [ ] 测试 GM 命令解析

- [ ] 5.3 集成测试准备
  - [ ] 执行数据库迁移脚本
  - [ ] 部署配置文件
  - [ ] 启动服务器测试

## 阶段 6: 部署文档

- [x] 6.1 创建部署指南
  - [x] 编写安装步骤
  - [x] 编写配置说明
  - [x] 编写数据库迁移说明
  
- [x] 6.2 创建使用说明
  - [x] 编写 GM 命令使用示例
  - [x] 编写技能配置示例
  - [x] 编写常见问题解答
