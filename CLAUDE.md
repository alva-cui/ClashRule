# ClashRule 项目说明

## 项目概述

自用的 Clash Verge / mihomo 分流规则，专注于简洁实用、便于长期维护。

## 代理分组设计（17个）

### 基础分组（3个）
| 分组 | 类型 | 说明 |
|------|------|------|
| ✈️ 手动选择 | select | 手动指定节点 |
| ♻️ 自动选择 | url-test | 自动测速选最优（排除电信/联通/移动） |
| 🔯 故障转移 | fallback | 自动选择挂了后切换 |

### 业务分组（5个）
| 分组 | 类型 | 说明 |
|------|------|------|
| 🎯 国内流量 | select | DIRECT + 运营商节点 |
| 🚀 国外流量 | select | 主代理组 |
| 🧚 AI服务 | select | 优先美国节点 |
| 🛑 广告拦截 | select | REJECT 拦截广告 |
| 🐟 漏网之鱼 | select | 兜底规则 |

### 地区分组（7个，url-test 自动测速）
| 分组 | 筛选规则 |
|------|----------|
| 🇭🇰 香港节点 | (港\|HK\|Hong Kong) |
| 🇯🇵 日本节点 | (日\|JP\|Japan) |
| 🇺🇸 美国节点 | (美\|US\|United States) |
| 🇸🇬 新加坡 | (新加坡\|SG\|Singapore) |
| 🇹🇼 台湾节点 | (台\|TW\|Taiwan) |
| 🇰🇷 韩国节点 | (韩\|KR\|Korea) |
| 🇲🇴 澳门节点 | (澳门\|MO\|Macao) |

## 文件结构

```
ClashRule/
├── GeneralClashRule.ini      # 主配置（ruleset + proxy groups）
├── Back.ini                  # 备用配置（大陆节点回国用）
├── README.md                 # 使用说明
├── CLAUDE.md                 # 本文件
└── Rule/
    ├── AI.yaml               # AI 服务综合规则（100+ 域名）
    └── Claude.list           # Claude/Anthropic 规则
```

## 规则来源

| 来源 | 用途 | 链接格式 |
|------|------|----------|
| ACL4SSR | 国内直连规则 | 直接引用 .list |
| blackmatrix7 | 国外服务规则 | 需加 `clash-classic:` 前缀引用 .yaml |
| cutethotw | AI服务规则 | AI.yaml 需加前缀，Claude.list 直接引用 |

### 引用格式
```ini
; .list 文件直接引用
ruleset=🎯 国内流量,https://raw.githubusercontent.com/xxx/xxx.list

; .yaml 文件需加 clash-classic: 前缀
ruleset=🚀 国外流量,clash-classic:https://raw.githubusercontent.com/xxx/xxx.yaml
```

## AI 服务覆盖

AI 服务分组包含以下主流 AI 平台：

| 平台 | 规则来源 |
|------|----------|
| OpenAI / ChatGPT | AI.yaml + blackmatrix7/OpenAI.yaml |
| Anthropic / Claude | Claude.list + AI.yaml |
| Google AI / Gemini | AI.yaml + blackmatrix7/Google.yaml |
| Midjourney | AI.yaml |
| Perplexity | AI.yaml |
| xAI / Grok | AI.yaml |
| Cursor | AI.yaml |
| Copilot | AI.yaml |

## 本地规则文件说明

### Rule/AI.yaml
- 来源：[VPSDance/ai-proxy-rules](https://github.com/VPSDance/ai-proxy-rules)
- 内容：100+ AI 服务域名，覆盖主流 AI 平台
- 更新：定期从上游同步

### Rule/Claude.list
- 来源：自定义整理
- 内容：Claude/Anthropic 核心域名 + CDN + 监控 + IP段
- 特点：包含多个来源的规则合并

## 添加新规则

### 添加新的国外服务规则
在 `GeneralClashRule.ini` 的 `国外流量` 部分添加：
```ini
ruleset=🚀 国外流量,clash-classic:https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/服务名/服务名.yaml
```

### 添加新的 AI 服务规则
在 `GeneralClashRule.ini` 的 `AI服务` 部分添加：
```ini
ruleset=🧚 AI服务,clash-classic:https://raw.githubusercontent.com/xxx/xxx.yaml
```

### 添加自定义规则
在 `Rule/` 目录下创建新文件，然后在 `GeneralClashRule.ini` 中引用。

## 使用方式

远程配置地址：
```
https://raw.githubusercontent.com/cutethotw/ClashRule/main/GeneralClashRule.ini
```

在 [肥羊订阅转换前端](https://suburl.v1.mk/) 中使用此地址作为远程配置。

## 参考项目

- [ACL4SSR/ACL4SSR](https://github.com/ACL4SSR/ACL4SSR) - 国内直连规则
- [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script) - 国外服务规则
- [VPSDance/ai-proxy-rules](https://github.com/VPSDance/ai-proxy-rules) - AI 服务规则
- [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules) - 通用规则
