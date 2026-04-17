# src/server/database 目录详解

`src/server/database` 是 AzerothCore 的数据库抽象层，负责所有与 MySQL 数据库的交互。

## 目录结构

```
src/server/database/
├── CMakeLists.txt
├── Database/
│   ├── Database.h          # 数据库基类
│   ├── Database.cpp        # MySQL 连接实现
│   ├── PreparedStatement.h # 预处理语句
│   ├── Transaction.h       # 事务支持
│   └── MySQL/
│       ├── MySQLConnection.h
│       ├── MySQLEngine.h
│       └── MySQLPreparedStatement.h
├── Environment.h
└── Types.h
```

## 各文件详解

### Database/ - 数据库核心实现

| 文件 | 功能 |
|------|------|
| `Database.h` | 数据库连接池基类，定义 `Database` 类接口 |
| `Database.cpp` | MySQL 连接池实现，支持多线程并发访问 |
| `PreparedStatement.h` | 预处理语句封装，用于安全执行 SQL |
| `Transaction.h` | 事务封装，支持原子性操作 |
| `Field.h` | 数据库字段包装器，提供类型安全的字段访问 |

### Database/MySQL/ - MySQL 特定实现

| 文件 | 功能 |
|------|------|
| `MySQLConnection.h` | MySQL 连接实现类 |
| `MySQLEngine.h` | MySQL 引擎定义 |
| `MySQLPreparedStatement.h` | MySQL 预处理语句实现 |

### Types.h - 数据库类型定义

| 类型 | 说明 |
|------|------|
| `DatabaseType` | 数据库类型枚举（MySQL 等） |
| `QueryResult` | 查询结果智能指针 |
| `PreparedStatement` | 预处理语句基类 |

---

## 主要功能

### 1. 连接池管理
```cpp
// 创建指定数量的连接
Database.Execute("SELECT ...");  // 自动从池中获取连接
```

### 2. 预处理语句
```cpp
// 安全的参数化查询，防止 SQL 注入
PreparedStatement* stmt = new PreparedStatement(0);
stmt->SetAppend(0, playerGuid);
Database.Execute stmt);
```

### 3. 事务支持
```cpp
// 原子性操作
Transaction t;
t.Append("UPDATE ...");
t.Append("DELETE ...");
Database.CommitTransaction t);
```

---

## 数据库配置

配置文件中的数据库连接设置：
```ini
# worldserver.conf
LoginDatabaseInfo     = "127.0.0.1;3306;acore;acore;acore_auth"
WorldDatabaseInfo     = "127.0.0.1;3306;acore;acore;acore_world"
CharacterDatabaseInfo = "127.0.0.1;3306;acore;acore;acore_characters"
```

格式：`主机;端口;用户名;密码;数据库名`

---

## 三个主要数据库

| 数据库 | 连接名 | 用途 |
|--------|--------|------|
| acore_auth | `LoginDatabase` | 账号认证 |
| acore_world | `WorldDatabase` | 游戏内容 |
| acore_characters | `CharacterDatabase` | 角色数据 |

---

## 常见修改位置

### 添加新表的操作
1. 在 `data/sql/base/db_world/` 创建 `.sql` 文件
2. 定义表结构
3. 更新数据库时执行

### 修改现有表的字段
1. 在 `data/sql/updates/` 创建更新 `.sql` 文件
2. 使用 `ALTER TABLE` 语句

### 查询执行示例
```cpp
// 世界服务器中执行查询
WorldDatabase.Query("SELECT * FROM creature_template WHERE entry = {}", entry);

// 字符数据库执行
CharacterDatabase.PExecute("DELETE FROM characters WHERE guid = {}", guid);

// 认证数据库执行
LoginDatabase.Query("SELECT * FROM account WHERE username = '{}'", username);
```
