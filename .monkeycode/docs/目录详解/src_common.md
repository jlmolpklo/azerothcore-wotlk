# AzerothCore src/common 目录详解

本文档详细介绍 AzerothCore 项目中 `src/common` 目录的结构、功能以及各模块如何被其他组件使用。

## 目录概述

`src/common` 是 AzerothCore 的核心公共库，为 authserver 和 worldserver 提供共享的基础设施。该库采用模块化设计，包含了从网络通信、密码学、配置管理到碰撞检测等游戏服务器所需的各种功能。

---

## 1. 根目录核心文件

### 1.1 基础定义文件

| 文件 | 功能说明 |
|------|----------|
| **Common.h** | 主公共头文件，定义账户类型枚举（SEC_PLAYER、SEC_MODERATOR 等）、本地化常量（LOCALE_enUS 等）、账户标志位（ACCOUNT_FLAG_*）、通用 API 声明和字符串清理函数 |
| **Define.h** | 核心类型定义和宏定义，包括 uint8/uint16/uint32/uint64/int8/int16/int32/int64 类型别名，平台和编译器检测宏（AC_PLATFORM、AC_COMPILER），API 导出宏（AC_COMMON_API、AC_API_EXPORT） |
| **CompilerDefs.h** | 编译器特性定义，检测 Windows/Unix/Apple/Intel 平台，检测 MSVC/GNU/Borland/Intel 编译器 |
| **Common.cpp** | 公共函数实现，包含本地化名称验证、按名称获取本地化常量等功能 |
| **Banner.cpp/.h** | 服务器启动横幅，显示版本信息、构建信息等 |
| **GitRevision.cpp/.h** | Git 版本信息，提供编译时 Git 提交哈希和分支信息 |

---

## 2. Asio 网络库封装

Asio 是一个跨平台的 C++ 网络库，提供了异步 I/O 操作能力。

### 2.1 目录结构

```
Asio/
├── AsioHacksFwd.h    # Asio 前向声明和兼容性hack
├── IoContext.h       # IO上下文封装
├── IpAddress.h       # IP地址封装
├── IpNetwork.h       # IP网络封装
├── Resolver.h        # 异步域名解析
├── SteadyTimer.h     # 精确定时器
└── Strand.h          # 线程 Strand 封装
```

### 2.2 核心功能

| 文件 | 功能说明 |
|------|----------|
| **IoContext.h** | 封装 boost::asio::io_context，提供 run()、stop() 等方法，是整个异步 IO 的核心上下文 |
| **Resolver.h** | 提供异步 DNS 解析功能，将域名解析为 IP 地址 |
| **IpAddress.h** | IP 地址处理封装 |
| **IpNetwork.h** | IP 网络（IP段）处理，用于 CIDR 格式的 IP 匹配 |
| **SteadyTimer.h** | 基于 steady_clock 的高精度定时器 |
| **Strand.h** | 封装 boost::asio::strand，用于串行化异步操作 |

### 2.3 使用方式

```cpp
#include <Asio/IoContext.h>
Acore::Asio::IoContext ioContext;
ioContext.run();
```

---

## 3. Configuration 配置管理

配置文件系统负责读取和管理服务器配置文件。

### 3.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **Config.h** | 配置管理器单例类声明，提供 GetOption<T>() 模板方法获取配置项，支持配置重载和环境变量覆盖 |
| **Config.cpp** | 配置加载和解析实现，支持.conf 格式配置文件 |
| **ConfigValueCache.h** | 配置值缓存，优化频繁访问配置项的性能 |
| **BuiltInConfig.cpp/.h** | 内置默认配置 |

### 3.2 核心功能

```cpp
#include <Config/Config.h>
// 获取配置
std::string value = sConfigMgr->GetOption<std::string>("ServerSettings.BindIP", "0.0.0.0");
int port = sConfigMgr->GetOption<int>("ServerSettings.Port", 8085);
```

---

## 4. Cryptography 密码学

提供游戏认证和通信所需的加密功能。

### 4.1 目录结构

```
Cryptography/
├── Authentication/     # 认证相关加密
│   ├── AuthCrypt.cpp/.h    # 认证加密（ARC4）
│   ├── AuthDefines.h       # 认证相关定义
│   └── SRP6.cpp/.h          # SRP6 密码学协议实现
├── AES.cpp/.h          # AES 对称加密
├── ARC4.cpp/.h         # ARC4 流加密
├── Argon2.cpp/.h       # Argon2 密码哈希
├── BigNumber.cpp/.h    # 大数运算
├── CryptoConstants.h    # 密码学常量
├── CryptoGenerics.h    # 通用密码学模板
├── CryptoHash.h        # MD5/SHA1/SHA256 哈希
├── CryptoRandom.cpp/.h # 加密安全随机数
├── HMAC.h              # HMAC 消息认证码
├── OpenSSLCrypto.cpp/.h # OpenSSL 初始化
└── SessionKeyGenerator.h # 会话密钥生成
├── TOTP.cpp/.h         # TOTP 时间一次性密码
```

### 4.2 核心功能

| 文件 | 功能说明 |
|------|----------|
| **SRP6.h** | 安全远程密码协议实现，用于WOW认证登录 |
| **CryptoHash.h** | 提供 MD5、SHA1、SHA256 哈希计算 |
| **BigNumber.h** | 大整数运算，用于密码学计算 |
| **AES.h** | AES 加密算法实现 |
| **Argon2.h** | Argon2 密码哈希算法（用于安全存储密码） |
| **TOTP.h** | Time-based One-Time Password，实现双因素认证 |

### 4.3 使用方式

```cpp
#include <Cryptography/CryptoHash.h>
using namespace Acore::Crypto;
SHA256::Digest hash = SHA256::GetDigestOf(data, length);

#include <Cryptography/Authentication/SRP6.h>
auto [salt, verifier] = SRP6::MakeRegistrationData(username, password);
```

---

## 5. DataStores 数据存储

负责加载和管理游戏数据文件。

### 5.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **DBCFileLoader.cpp/.h** | DBC（Database Client）文件加载器，用于解析魔兽世界客户端数据文件 |

### 5.2 DBC 文件格式

DBCFileLoader 负责解析 DBC 格式文件，这是魔兽世界客户端使用的表格数据格式：

```cpp
#include <DataStores/DBCFileLoader.h>
DBCFileLoader loader;
loader.Load("Map.dbc", "iniiss");
```

---

## 6. Debugging 调试支持

提供错误处理和崩溃报告功能。

### 6.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **Errors.h** | 断言和错误处理宏：ASSERT、WPFatal、WPError、WPWarning、ABORT |
| **Errors.cpp** | 错误处理实现 |
| **WheatyExceptionReport.cpp/.h** | Windows 平台的崩溃报告生成器 |

### 6.2 错误处理宏

```cpp
#include <Debugging/Errors.h>
// 断言（发布版生效）
ASSERT(player != nullptr, "Player pointer is null!");

// 致命错误（总是终止程序）
WPFatal(condition, "Critical error message");

// 警告（仅记录日志）
WPWarning(condition, "Warning message");
```

---

## 7. Dynamic 动态容器

提供高级数据结构和对象管理机制。

### 7.1 目录结构

```
Dynamic/
├── LinkedList.h        # 双向链表实现
├── LinkedReference/    # 引用计数系统
│   ├── Reference.h       # 引用对象
│   └── RefMgr.h          # 引用管理器
├── FactoryHolder.h     # 工厂模式 Holder
├── ObjectRegistry.h    # 对象注册表
├── TypeContainer.h     # 类型容器
├── TypeContainerFunctions.h    # 类型容器操作函数
├── TypeContainerFunctionsPtr.h # 指针版本类型容器
├── TypeContainerVisitor.h      # 类型容器访问器
└── TypeList.h          # 类型列表
```

### 7.2 核心功能

| 文件 | 功能说明 |
|------|----------|
| **LinkedList.h** | 双向链表实现，支持 O(1) 插入/删除 |
| **LinkedReference/** | 引用计数智能指针系统，类似 COM 的引用计数 |
| **ObjectRegistry.h** | 对象注册表，用于脚本等对象的自动注册 |
| **FactoryHolder.h** | 工厂模式 Holder，用于管理对象工厂 |

---

## 8. Encoding 编码转换

提供数据编码和解码功能。

### 8.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **Base64.cpp/.h** | Base64 编码/解码 |
| **Base32.cpp/.h** | Base32 编码/解码 |
| **BaseEncoding.h** | 通用编码接口和实现 |

### 8.2 使用方式

```cpp
#include <Encoding/Base64.h>
std::string encoded = Acore::Encoding::Base64::Encode(data);
auto decoded = Acore::Encoding::Base64::Decode(encoded);
```

---

## 9. IPLocation IP地理定位

提供 IP 地址到地理位置的映射。

### 9.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **IPLocation.cpp/.h** | IP 地理位置存储和查询 |

### 9.2 使用方式

```cpp
#include <IPLocation/IPLocation.h>
IpLocationRecord const* record = sIPLocation->GetLocationRecord("192.168.1.1");
std::string countryCode = record->CountryCode;
```

---

## 10. Logging 日志系统

统一的日志记录系统。

### 10.1 目录结构

```
Logging/
├── Appender.h/.cpp         # 日志输出器基类
├── AppenderConsole.h/.cpp  # 控制台输出器
├── AppenderFile.h/.cpp    # 文件输出器
├── Log.h/.cpp             # 日志主类
├── LogCommon.h             # 日志级别和标志定义
├── LogMessage.h/.cpp      # 日志消息结构
├── LogOperation.h/.cpp    # 日志操作（异步）
├── Logger.h/.cpp           # 日志记录器
├── enuminfo_AppenderConsole.cpp # 控制台Appender枚举信息
└── enuminfo_LogCommon.cpp      # LogCommon枚举信息
```

### 10.2 日志级别

| 级别 | 宏定义 | 用途 |
|------|--------|------|
| FATAL | LOG_FATAL() | 致命错误，程序即将终止 |
| ERROR | LOG_ERROR() | 错误 |
| WARN | LOG_WARN() | 警告 |
| INFO | LOG_INFO() | 信息 |
| DEBUG | LOG_DEBUG() | 调试信息 |
| TRACE | LOG_TRACE() | 跟踪信息 |

### 10.3 使用方式

```cpp
#include <Logging/Log.h>
#define sLog Log::instance()

LOG_INFO("server.worldserver", "Server started successfully");
LOG_ERROR("server.database", "Failed to connect to database");
```

---

## 11. Metric 性能指标

性能监控和指标收集系统。

### 11.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **Metric.h/.cpp** | 指标收集器，支持 InfluxDB 格式输出 |

### 11.2 核心功能

支持记录数值指标和事件，可用于性能分析：

```cpp
#include <Metric/Metric.h>
// 记录数值
METRIC_VALUE("player.online", playerCount, METRIC_TAG("realm", realmName));

// 记录事件
METRIC_EVENT("server", "Server Start", "Worldserver initialized");

// 计时器
METRIC_TIMER("database.query", METRIC_TAG("query", "character_load"));
```

---

## 12. Navigation 导航系统

寻路导航相关功能。

### 12.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **DetourExtended.h/.cpp** | 扩展 Detour 寻路算法，提供更丰富的寻路查询接口 |

### 12.2 功能

封装 recastnavigation 库的 Detour 寻路算法，提供：
- 网格查询
- 路径规划
- 碰撞检测

---

## 13. Platform 平台特定代码

Windows 平台特定功能。

### 13.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **ServiceWin32.h/.cpp** | Windows 服务安装/卸载/运行功能 |

---

## 14. Threading 多线程

多线程编程支持。

### 14.1 目录结构

```
Threading/
├── AsyncCallbackProcessor.h # 异步回调处理器
├── ByteConverter.h          # 字节序转换
├── CircularBuffer.h          # 循环缓冲区
├── Containers.h             # 线程安全容器
├── DataMap.h                # 数据映射
├── Duration.h               # 时间duration封装
├── EnumFlag.h               # 枚举标志位操作
├── EventEmitter.h           # 事件发射器
├── EventMap.h/.cpp          # 事件映射表
├── EventProcessor.h/.cpp   # 事件处理器
├── Geometry.h               # 几何计算
├── IteratorPair.h           # 迭代器对
├── MathUtil.h               # 数学工具
├── MessageBuffer.h           # 消息缓冲区
├── Optional.h               # 可选值封装
├── Physics.h                # 物理计算
├── Random.cpp/.h            # 随机数生成
├── SFMTRand.cpp/.h          # SFMT 伪随机数生成器
├── SignalHandler.h           # 信号处理器
├── SmartEnum.h              # 智能枚举
├── StartProcess.cpp/.h      # 进程启动
├── StringConvert.h          # 字符串转换
├── StringFormat.cpp/.h       # 字符串格式化
├── Systemd.cpp/.h           # Systemd 支持
├── TaskScheduler.h/.cpp      # 任务调度器
├── Timer.h/.cpp              # 定时器
├── Tokenize.cpp/.h          # 字符串分词
├── Tuples.h                 # 元组工具
├── Types.h                  # 类型定义
├── Util.cpp/.h              # 通用工具函数
└── advstd.h                 # 标准库扩展
```

### 14.2 核心功能

| 文件 | 功能说明 |
|------|----------|
| **Threading.h** | 线程封装（Thread 类）、Runnable 接口、线程优先级 |
| **LockedQueue.h** | 线程安全的锁定队列 |
| **MPSCQueue.h** | 无锁多生产者单消费者队列（Dmitry Vyukov 算法） |
| **PCQueue.h** | 生产者-消费者队列 |
| **ProcessPriority.cpp/.h** | 进程优先级设置 |
| **ThreadingModel.h** | 线程模型定义 |
| **TaskScheduler.h** | 任务调度器，支持延迟任务、周期任务、分组管理 |
| **Timer.h** | 高精度定时器 |

### 14.3 使用方式

```cpp
#include <Threading/Threading.h>
// 创建线程
Acore::Thread thread(new MyRunnable);

// 线程安全的队列
#include <Threading/MPSCQueue.h>
Acore::Impl::MPSCQueue<Task*> queue;
queue.Enqueue(new Task);
```

---

## 15. Collision 碰撞检测系统

游戏中的碰撞检测和视线检测。

### 15.1 目录结构

```
Collision/
├── BoundingIntervalHierarchy.cpp/.h/.h    # 包围盒层次结构
├── BoundingIntervalHierarchyWrapper.h     # BIH包装器
├── DynamicTree.cpp/.h                     # 动态碰撞树
├── RegularGrid.h                          # 规则网格
├── VMapDefinitions.h                     # VMap定义
├── VMapTools.h                            # VMap工具
├── Management/                            # VMAP管理器
│   ├── IVMapMgr.h                          # VMap管理器接口
│   ├── MMapMgr.cpp/.h                      # MMAP管理器
│   ├── VMapFactory.cpp/.h                  # VMap工厂
│   ├── VMapMgr2.cpp/.h                    # VMap管理器实现
│   └── WorldModelStore.cpp/.h              # 世界模型存储
├── Maps/                                  # 静态地图
│   ├── MapDefines.h                        # 地图定义
│   ├── MapTree.cpp/.h                      # 地图四叉树
│   └── TileAssembler.cpp/.h              # 地图数据组装
└── Models/                               # 游戏物体模型
    ├── GameObjectModel.cpp/.h             # 游戏物体模型
    ├── ModelIgnoreFlags.h                 # 模型忽略标志
    ├── ModelInstance.cpp/.h               # 模型实例
    └── WorldModel.cpp/.h                  # 世界模型
```

### 15.2 核心功能

| 模块 | 功能说明 |
|------|----------|
| **DynamicMapTree** | 动态碰撞树，用于 GameObject 的碰撞检测 |
| **StaticMapTree** | 静态地图碰撞数据管理 |
| **VMapMgr2** | VMap（Visibility Map）管理器，提供视线检测（Line of Sight） |
| **MMapMgr** | MMap（Movement Map）管理器，提供导航网格 |
| **TileAssembler** | 编译地图数据文件 |

### 15.3 主要接口

```cpp
#include <Collision/DynamicTree.h>
DynamicMapTree collisionTree;
bool los = collisionTree.isInLineOfSight(x1, y1, z1, x2, y2, z2, phasemask, ignoreFlags);
float height = collisionTree.getHeight(x, y, z, maxDist, phasemask);
```

---

## 16. Utilities 工具函数库

通用工具函数集合。

### 16.1 文件列表

| 文件 | 功能说明 |
|------|----------|
| **Util.h/.cpp** | 核心工具函数：字符串处理、UTF-8 转换、时间转换、数学计算、PID 文件创建等 |
| **Containers.h** | 标准容器扩展和工具 |
| **StringFormat.h/.cpp** | printf 风格的字符串格式化 |
| **StringConvert.h** | 字符串编码转换 |
| **ByteConverter.h** | 字节序转换 |
| **MathUtil.h** | 数学工具：弧度/角度转换、Clamp 等 |
| **Random.h/.cpp** | 随机数生成器 |
| **SFMTRand.h/.cpp** | SFMT 伪随机数生成器（高质量） |
| **Timer.h/.cpp** | 计时器和时间计算 |
| **TaskScheduler.h/.cpp** | 任务调度器（见 Threading 部分） |
| **EventMap.h/.cpp** | 事件映射表，用于按时间触发事件 |
| **EventProcessor.h/.cpp** | 事件处理器 |
| **SignalHandler.h** | Unix 信号处理器 |
| **Optional.h** | 类似 std::optional 的封装 |
| **Geometry.h** | 几何计算工具 |
| **Types.h** | 基础类型定义 |

### 16.2 常用功能

```cpp
#include <Utilities/Util.h>
// 字符串处理
void utf8truncate(std::string& str, size_t length);
bool Utf8toWStr(std::string_view utf8, std::wstring& wstr);

// 时间处理
std::string secsToTimeString(uint64 seconds);
uint32 TimeStringToSecs(const std::string& timestring);

// 数学计算
template <class T>
T CalculatePct(T base, U pct);  // 计算百分比

// 随机数
uint32 rand_norm();             // 0-1 均匀分布
int32 irand(int32 min, int32 max);  // 整数随机
```

---

## 17. Collision 子目录详解

### 17.1 Management/ - VMAP 管理器

| 文件 | 功能说明 |
|------|----------|
| **IVMapMgr.h** | VMap 管理器抽象接口 |
| **VMapMgr2.h** | VMap 管理器实现，管理静态地图模型的加载和查询 |
| **MMapMgr.h** | MMavigaton Map 管理器，管理导航网格 |
| **VMapFactory.h** | VMap 工厂类 |

### 17.2 Maps/ - 静态地图数据

| 文件 | 功能说明 |
|------|----------|
| **MapTree.h** | 四叉树结构的地图空间索引 |
| **TileAssembler.h** | 将地图数据文件编译为 VMap 格式 |

### 17.3 Models/ - 游戏物体模型

| 文件 | 功能说明 |
|------|----------|
| **WorldModel.h** | 世界模型，表示游戏中的静态物体 |
| **ModelInstance.h** | 模型实例，在地图中的具体位置和旋转 |
| **GameObjectModel.h** | 游戏物体模型封装 |

---

## 18. Dynamic 子目录详解

### 18.1 LinkedReference/ - 引用计数系统

| 文件 | 功能说明 |
|------|----------|
| **Reference.h** | 引用对象基类，提供引用计数接口 |
| **RefMgr.h** | 引用管理器，处理引用计数的增减 |

这套引用计数系统用于需要手动引用管理的场景，类似 COM 的 IUnknown。

---

## 19. 公共库依赖关系

```
                    +-------------------------+
                    |   Boost Libraries       |
                    | (Asio, Thread, etc)    |
                    +------------+------------+
                                 |
                    +------------+------------+
                    |   OpenSSL Libraries    |
                    |  (Crypto, EVP, etc)    |
                    +------------+------------+
                                 |
+----------------------------------------------------------+
|                        common 库                          |
|  +----------+ +------------+ +-----------+ +-----------+  |
|  |   Asio   | |  Config   | |  Logging  | |  Thread   |  |
|  | (网络IO) | | (配置管理)| |  (日志)  | | (多线程)  |  |
|  +----------+ +------------+ +-----------+ +-----------+  |
|  +------------+ +----------+ +-----------+ +-----------+  |
|  | Cryptography| | Dynamic | |   Util    | | Collision |  |
|  |   (加密)   | | (容器)  | |  (工具)   | |  (碰撞)   |  |
|  +------------+ +----------+ +-----------+ +-----------+  |
+----------------------------------------------------------+
                    |                    |
          +---------+----------+  +-------+--------+
          |   authserver      |  |   worldserver   |
          |   (认证服务器)    |  |    (游戏世界)   |
          +-------------------+  +-----------------+
```

---

## 20. 如何被其他模块使用

### 20.1 CMake 链接方式

根据 `CMakeLists.txt`，common 库通过以下方式链接到其他目标：

```cmake
target_link_libraries(common
  PUBLIC
    boost
    argon2
    sfmt
    utf8cpp
    openssl
    threads
    jemalloc
    stdfs
    fmt)

# 当构建 worldserver 或 maps 工具时
target_link_libraries(common
  PUBLIC
    g3dlib
    Detour)
```

### 20.2 使用示例

#### 配置系统使用

```cpp
// 在 authserver 或 worldserver 中
#include <Configuration/Config.h>
bool LoadConfig()
{
    return sConfigMgr->LoadAppConfigs();
}
```

#### 日志系统使用

```cpp
#include <Logging/Log.h>
// 全局日志管理器
#define sLog Log::instance()

LOG_INFO("server", "Server initialized");
```

#### 密码学使用

```cpp
#include <Cryptography/Authentication/SRP6.h>
// 玩家登录验证
SRP6 server(username, salt, verifier);
auto sessionKey = server.VerifyChallengeResponse(A, clientM);
```

#### 线程系统使用

```cpp
#include <Threading/Threading.h>
#include <Threading/MPSCQueue.h>

class MyTask : public Acore::Runnable
{
    void run() override { /* 任务逻辑 */ }
};

Acore::Thread thread(new MyTask());
```

#### 碰撞检测使用

```cpp
#include <Collision/DynamicTree.h>
// 在 worldserver 中
DynamicMapTree* collisionTree = new DynamicMapTree();
bool canSee = collisionTree->isInLineOfSight(pos1, pos2, phasemask, ignoreFlags);
```

---

## 21. 总结

`src/common` 目录是 AzerothCore 的核心公共库，提供了：

| 类别 | 功能 |
|------|------|
| **网络通信** | Asio 封装，支持异步 I/O、域名解析、定时器 |
| **配置管理** | 统一的配置文件读取和热重载 |
| **密码学** | SRP6 认证、AES/ARC4 加密、哈希算法、TOTP |
| **日志系统** | 多输出目标（控制台/文件）、多级别日志 |
| **多线程** | 线程封装、无锁队列、任务调度器 |
| **碰撞检测** | VMap/MMap 导航网格、视线检测、高度查询 |
| **工具函数** | 字符串处理、编码转换、数学计算、事件系统 |
| **性能监控** | InfluxDB 指标收集和上报 |

这些模块通过统一的接口和单例模式（sConfigMgr、sLog、sMetric 等）被 authserver 和 worldserver 共享使用，实现了代码的最大复用和架构的清晰分离。
