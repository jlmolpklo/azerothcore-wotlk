# AzerothCore-wotlk 项目文档

本文档提供 AzerothCore-wotlk 项目的完整目录、文件和数据库表说明，方便开发者在使用时快速定位和修改功能。

## 文档索引

### 1. 目录详解
- [src/common 目录](./目录详解/src_common.md) - 共享基础库
- [src/server/game 目录](./目录详解/src_server_game.md) - 核心游戏逻辑
- [src/server/scripts 目录](./目录详解/src_server_scripts.md) - 内容脚本
- [src/server/database 目录](./目录详解/src_server_database.md) - 数据库层
- [src/server/shared 目录](./目录详解/src_server_shared.md) - 共享代码
- [src/server/apps 目录](./目录详解/src_server_apps.md) - 服务器应用程序
- [deps 目录](./目录详解/deps.md) - 第三方依赖库
- [data 目录](./目录详解/data.md) - 数据文件

### 2. 数据库表说明
- [acore_auth 数据库](./数据库表说明/acore_auth.md) - 账号认证数据库
- [acore_characters 数据库](./数据库表说明/acore_characters.md) - 角色数据数据库
- [acore_world 数据库](./数据库表说明/acore_world.md) - 游戏内容数据库

### 3. 快速修改指南
- [常见功能修改位置](./常见修改位置.md)

---

## 项目概述

**AzerothCore-wotlk** 是一个开源的 MMORPG 服务器模拟器，为《魔兽世界》巫妖王之怒（3.3.5a）版本构建。

### 核心架构
- **authserver** (端口 3724): 处理账号认证
- **worldserver** (端口 8085): 处理所有游戏逻辑

### 技术栈
- C++ / CMake
- MySQL 数据库
- Boost、Asio 网络库
- GPL v2 协议
