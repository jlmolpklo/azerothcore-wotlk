# src/server/apps 目录详解

`src/server/apps` 包含两个服务器应用程序：authserver 和 worldserver。

## 目录结构

```
src/server/apps/
├── CMakeLists.txt
├── authserver/           # 认证服务器
│   ├── CMakeLists.txt
│   ├── Main.cpp          # 程序入口
│   ├── authserver.cpp    # 主逻辑
│   └── authserver.h
└── worldserver/          # 世界服务器
    ├── Main.cpp          # 程序入口
    ├── WorldServer.cpp   # 主逻辑
    └── worldserver.h
```

## authserver - 认证服务器

| 文件 | 功能 |
|------|------|
| `Main.cpp` | 程序入口点 |
| `authserver.cpp` | 认证服务器主逻辑 |
| `authserver.h` | 头文件 |

### 主要职责
- 监听端口 **3724**
- 处理账号登录（SRP6 加密认证）
- 提供 realm 列表
- 管理账号 ban 列表

### 配置文件
- `authserver.conf` - 认证服务器配置

### 相关数据库表
- `acore_auth.account` - 账号信息
- `acore_auth.realmlist` - 服务器列表
- `acore_auth.account_access` - 账号权限
- `acore_auth.ip_banned` - IP 封禁

---

## worldserver - 世界服务器

| 文件 | 功能 |
|------|------|
| `Main.cpp` | 程序入口点 |
| `WorldServer.cpp` | 世界服务器主逻辑 |
| `WorldServer.h` | 头文件 |

### 主要职责
- 监听端口 **8085**
- 处理所有游戏逻辑
- 管理玩家会话
- 运行地图和副本
- 执行脚本

### 配置文件
- `worldserver.conf` - 世界服务器配置

### 关联数据库
- `acore_world` - 游戏内容数据
- `acore_characters` - 角色数据

---

## 启动流程

### authserver 启动
```
Main.cpp
  -> authserver::Main()
      -> InitSSL()
      -> RunRealms()  // 监听 3724
```

### worldserver 启动
```
Main.cpp
  -> worldserver::Main()
      -> SignalHandlers()
      -> WorldServer::Main()
          -> InitServer()
          -> LoadConfig()
          -> InitDatabase()
          -> LoadModules()
          -> StartNetwork()
          -> WorldLoop()  // 主循环
```

---

## 常用修改位置

### 添加新的 authserver 命令
在 authserver 内部通常不需要添加命令，它主要是网络服务。

### worldserver 启动时的初始化
`WorldServer.cpp` 中的 `Start` 函数是主要的初始化入口。

### 添加新的配置项
在 `worldserver.conf` 中添加，然后：
```cpp
// WorldServer.cpp
sConfigMgr->GetOption<std::string>("ConfigName", "default");
```
