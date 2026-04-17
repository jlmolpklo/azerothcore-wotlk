# src/server/shared 目录详解

`src/server/shared` 是 authserver 和 worldserver 之间共享的代码模块。

## 目录结构

```
src/server/shared/
├── DataStores/          # 共享数据存储
├── Network/            # 网络基础
│   ├── Socket.h        # Socket 基类
│   ├── Socket.cpp
│   ├── TCPStorage.h    # TCP 存储
│   └── # listeners/     # 监听器
├── Packets/             # 网络数据包
│   ├── ByteBuffer.h     # 字节缓冲区
│   ├── PacketHeader.h   # 数据包头
│   └── Opcodes.h        # 操作码定义
├── Realms/              # Realm 定义
│   ├── Realm.h
│   └── RealmList.h
├── Secrets/             # 密钥管理
│   └── # SecretManager.h
├── SharedDefines.h      # 共享常量和枚举 (204KB)
├── SharedDefines.cpp
└── enuminfo_SharedDefines.cpp
```

## 各子目录详解

### DataStores/ - 共享数据存储
| 文件 | 功能 |
|------|------|
| `DataStore.h` | 数据存储基类 |

**用途**：存储 authserver 和 worldserver 共享的游戏数据

---

### Network/ - 网络基础
| 文件 | 功能 |
|------|------|
| `Socket.h` | Socket 连接基类，处理 TCP 连接 |
| `Socket.cpp` | Socket 实现，异步 IO 处理 |
| `TCPStorage.h` | TCP 连接存储管理 |

**用途**：处理网络连接、收发数据

---

### Packets/ - 网络数据包
| 文件 | 功能 |
|------|------|
| `ByteBuffer.h` | 字节缓冲区，用于序列化/反序列化网络包 |
| `PacketHeader.h` | 数据包头部定义 |
| `Opcodes.h` | 所有客户端/服务器操作码定义 |

**用途**：编解码网络通信数据

---

### Realms/ - Realm 服务器
| 文件 | 功能 |
|------|------|
| `Realm.h` | 单个 Realm（服务器）定义 |
| `RealmList.h` | Realm 列表管理 |

**用途**：authserver 向客户端提供可登录的服务器列表

---

### Secrets/ - 密钥管理
| 文件 | 功能 |
|------|------|
| `SecretManager.h` | 密钥管理接口 |

**用途**：安全存储敏感配置信息

---

### SharedDefines.h - 共享常量（非常重要）

这是最核心的文件，**204KB**，包含所有共享定义：

| 类别 | 说明 |
|------|------|
| `enum AccountTypes` | 账号权限等级 (SEC_PLAYER, SEC_MODERATOR, SEC_ADMIN 等) |
| `enum ConnectionType` | 连接类型 (CONNECTION_TYPE_REALM, CONNECTION_TYPE_INSTANCE) |
| `enum ChatMsg` | 聊天消息类型 |
| `enum Gender` | 性别 |
| `enum Race` | 种族 (RACE_HUMAN, RACE_ORC 等) |
| `enum Class` | 职业 (CLASS_WARRIOR, CLASS_MAGE 等) |
| `enum GameobjectTypes` | 游戏对象类型 |
| `enum HighGuid` | 对象高位 GUID 类型 |
| `struct WorldPacket` | 世界数据包结构 |
| `uint32 MAX_...` | 各种最大值的常量 |

---

## SharedDefines.h 重要枚举速查

### 账号权限等级
```cpp
enum AccountTypes
{
    SEC_PLAYER       = 0,    // 普通玩家
    SEC_MODERATOR    = 1,    // 版主
    SEC_GAMEMASTER   = 2,    // 游戏master
    SEC_ADMINISTRATOR = 3,   // 管理员
    SEC_CONSOLE     = 4     // 控制台 (最高权限)
};
```

### 种族
```cpp
enum Race
{
    RACE_HUMAN    = 1,
    RACE_ORC      = 2,
    RACE_DWARF    = 3,
    RACE_NIGHTELF = 4,
    RACE_UNDEAD   = 5,
    RACE_TAUREN   = 6,
    RACE_GNOME    = 7,
    RACE_TROLL    = 8,
    RACE_BLOODELF = 10,
    RACE_DRAENEI  = 11
};
```

### 职业
```cpp
enum Class
{
    CLASS_WARRIOR   = 1,
    CLASS_PALADIN   = 2,
    CLASS_HUNTER    = 3,
    CLASS_ROGUE     = 4,
    CLASS_PRIEST    = 5,
    CLASS_DEATH_KNIGHT = 6,
    CLASS_SHAMAN    = 7,
    CLASS_MAGE      = 8,
    CLASS_WARLOCK   = 9,
    CLASS_DRUID     = 11
};
```

---

## enuminfo_SharedDefines.cpp

包含所有枚举值的字符串名称映射，用于日志输出和调试：
```cpp
// 例如
char const* GetnameofRace(Race race) { ... }
char const* GetnameofClass(Class class_) { ... }
```
