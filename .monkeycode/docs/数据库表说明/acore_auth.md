# acore_auth 数据库表说明

`acore_auth` 是账号认证数据库，存储用户账号信息和服务器配置。

## 核心表

### account - 账号表
| 字段 | 类型 | 说明 |
|------|------|------|
| id | int | 主键，自增 |
| username | varchar(32) | 账号名 |
| salt | varbinary(32) | SRP6 盐值 |
| verifier | varbinary(32) | SRP6 验证器 |
| session_key | varbinary(40) | 会话密钥 |
| last_ip | varchar(15) | 最后登录 IP |
| last_attempt_ip | varchar(15) | 最后尝试 IP |
| failed_logins | int | 失败登录次数 |
| locked | tinyint | 账号是否锁定 |
| lock_country | varchar(2) | 锁定国家 |
| last_login | datetime | 最后登录时间 |
| online | tinyint | 是否在线 |
| expansion | tinyint | 资料片 (0=Classic, 2=WotLK) |
| mutetime | bigint | 禁言时间 |
| locale | tinyint | 客户端语言 |
| os | varchar(4) | 操作系统 |
| recruiter | int | 推荐人账号 ID |

### account_access - 账号权限
| 字段 | 类型 |说明 |
|------|------|------|
| accountId | int | 账号 ID (FK) |
| SecurityLevel | tinyint | 权限等级 (0-4) |
| Comment | varchar | 备注 |

### realmlist - 服务器列表
| 字段 | 类型 | 说明 |
|------|------|------|
| id | int | 主键 |
| name | varchar(32) | 服务器名 |
| address | varchar(32) | IP 地址 |
| localAddress | varchar(32) | 本地 IP |
| localSubmask | varchar(32) | 本地子网掩码 |
| port | smallint | 端口 |
| icon | tinyint | 图标类型 (0=Normal, 1=PVPr, 2=RP) |
| flag | tinyint | 标志 |
| timezone | tinyint | 时区 |
| allowedSecurityLevel | tinyint | 允许的最低权限 |
| population | float | 人口 (0=满) |
| gamebuild | int | 客户端构建号 |

### ip_banned - IP 封禁
| 字段 | 类型 | 说明 |
|------|------|------|
| ip | varchar(15) | IP 地址 |
| bandate | bigint | 封禁开始时间 |
| unbandate | bigint | 封禁结束时间 |
| bannedby | varchar(50) | 封禁者 |
| banreason | varchar(255) | 封禁原因 |

### account_banned - 账号封禁
| 字段 | 类型 | 说明 |
|------|------|------|
| id | int | 账号 ID |
| bandate | bigint | 封禁时间 |
| unbandate | bigint | 解封时间 |
| bannedby | varchar(50) | 封禁者 |
| banreason | varchar(255) | 原因 |
| active | tinyint | 是否生效 |

### logs - 日志表
| 字段 | 类型 | 说明 |
|------|------|------|
| time | time | 时间 |
| realm | int | Realm ID |
| type | varchar(50) | 日志类型 |
| level | tinyint | 级别 |
| string | text | 日志内容 |

### migration_history - 迁移历史
| 字段 | 类型 | 说明 |
|------|------|------|
| timestamp | datetime | 执行时间 |
| name | varchar(100) | 迁移名称 |
| checksum | varchar(40) | 文件校验和 |

---

## 常用修改场景

### 1. 手动创建账号
```sql
-- 直接插入账号（需要生成 salt 和 verifier）
INSERT INTO account (username, salt, verifier) 
VALUES ('playername', 0x..., 0x...);
```

### 2. 修改账号权限
```sql
UPDATE account_access SET SecurityLevel = 3 WHERE accountId = 1;
```

### 3. 封禁账号
```sql
INSERT INTO account_banned (id, bandate, unbandate, bannedby, banreason, active)
VALUES (1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+86400, 'Admin', 'Cheating', 1);
```

### 4. 封禁 IP
```sql
INSERT INTO ip_banned (ip, bandate, unbandate, bannedby, banreason)
VALUES ('192.168.1.1', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+86400, 'Admin', 'Abuse');
```

### 5. 添加新服务器
```sql
INSERT INTO realmlist (name, address, port, icon)
VALUES ('My Server', '127.0.0.1', 8085, 0);
```
