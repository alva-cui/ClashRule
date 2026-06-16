# 精简分流规则

自用的 Clash Verge / mihomo 分流规则，专注于简洁实用。

## 特点

- ✅ **简洁**：17个分组，不过度细分
- ✅ **实用**：地区分组自动测速，不用手动选
- ✅ **易维护**：规则全部引用远程源，更新 .ini 即可
- ✅ **AI专用**：独立分组，优先美国节点
- ✅ **故障转移**：自动选择挂了有备用

## 分组结构

### 基础分组
| 分组 | 类型 | 说明 |
|------|------|------|
| ✈️ 手动选择 | select | 手动指定节点 |
| ♻️ 自动选择 | url-test | 自动测速选最优（排除运营商节点） |
| 🔯 故障转移 | fallback | 自动选择挂了后切换 |

### 业务分组
| 分组 | 类型 | 说明 |
|------|------|------|
| 🎯 国内流量 | select | DIRECT + 运营商节点 |
| 🚀 国外流量 | select | 主代理组 |
| 🧚 AI服务 | select | AI专用，优先美国节点 |
| 🛑 广告拦截 | select | REJECT 拦截广告 |
| 🐟 漏网之鱼 | select | 兜底规则 |

### 地区分组（url-test 自动测速）
| 分组 | 筛选规则 |
|------|----------|
| 🇭🇰 香港节点 | (港\|HK\|Hong Kong) |
| 🇯🇵 日本节点 | (日\|JP\|Japan) |
| 🇺🇸 美国节点 | (美\|US\|United States) |
| 🇸🇬 新加坡 | (新加坡\|SG\|Singapore) |
| 🇹🇼 台湾节点 | (台\|TW\|Taiwan) |
| 🇰🇷 韩国节点 | (韩\|KR\|Korea) |
| 🇲🇴 澳门节点 | (澳门\|MO\|Macao) |

## 使用方式

在 Clash Verge 的订阅转换中使用本仓库的远程配置地址：

```
https://raw.githubusercontent.com/cutethotw/ClashRule/main/GeneralClashRule.ini
```

## 规则来源

| 来源 | 说明 |
|------|------|
| [ACL4SSR](https://github.com/ACL4SSR/ACL4SSR) | 国内直连规则，稳定可靠 |
| [blackmatrix7](https://github.com/blackmatrix7/ios_rule_script) | 国外服务规则，更新频繁 |
| [cutethotw](https://github.com/cutethotw/ClashRule) | AI服务规则，自定义 |

## AI服务覆盖

AI服务分组包含以下主流 AI 平台：

| 平台 | 规则来源 |
|------|----------|
| OpenAI / ChatGPT | AI.yaml + blackmatrix7/OpenAI |
| Anthropic / Claude | Claude.list + AI.yaml |
| Google AI / Gemini | AI.yaml + blackmatrix7/Google |
| Midjourney | AI.yaml |
| Perplexity | AI.yaml |
| xAI / Grok | AI.yaml |
| Cursor | AI.yaml |
| Copilot | AI.yaml |
| 其他 AI 服务 | AI.yaml（100+ 域名） |

## 参考项目

- [ACL4SSR/ACL4SSR](https://github.com/ACL4SSR/ACL4SSR)
- [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script)
- [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules)
