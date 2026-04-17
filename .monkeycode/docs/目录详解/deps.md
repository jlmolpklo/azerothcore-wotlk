# deps 目录详解

`deps` 目录包含 AzerothCore 项目依赖的所有第三方库。

## 目录结构

```
deps/
├── acore-mysql/           # MySQL 客户端库
├── argparse/              # 命令行参数解析
├── argon2/                # 密码哈希算法
├── boost/                 # Boost C++ 库
├── bzip2/                 # 压缩库
├── fmt/                   # 格式化库
├── g3dlite/               # 几何库
├── jemalloc/              # 内存分配器
├── libmpq/                # MPQ 压缩格式支持
├── openssl/               # OpenSSL 加密库
├── recastnavigation/      # 导航网格库
├── sqlite/                # SQLite 库
├── utf8cpp/               # UTF-8 处理
├── zlib/                  # 压缩库
└── CMakeLists.txt
```

## 各库详解

### acore-mysql/ - MySQL 客户端
**用途**：连接 MySQL 数据库

### argparse/ - 命令行参数
**用途**：解析命令行参数

### argon2/ - 密码哈希
**用途**：安全的密码哈希存储

### boost/ - Boost 库
**用途**：提供智能指针、文件系统、线程等功能

### bzip2/ - 压缩
**用途**：压缩游戏资源文件

### fmt/ - 格式化
**用途**：字符串格式化（C++20 std::format 的前身）

### g3dlite/ - 几何库
**用途**：3D 几何计算，用于碰撞检测

### jemalloc/ - 内存分配
**用途**：高效的内存管理，减少内存碎片

### libmpq/ - MPQ 格式
**用途**：读取 MPQ 压缩包（客户端数据）

### openssl/ - SSL/TLS
**用途**：网络通信加密

### recastnavigation/ - 导航网格
**用途**：寻路算法实现

### sqlite/ - SQLite
**用途**：轻量级数据库（用于配置等）

### utf8cpp/ - UTF-8 处理
**用途**：处理 UTF-8 编码字符串

### zlib/ - 压缩
**用途**：数据压缩和解压
