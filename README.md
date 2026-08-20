# 精简分流规则

自用的 Clash Verge Rev / Shadowrocket / 订阅转换分流规则，专注于简洁实用。

## 特点

- ✅ **简洁**：不过度细分
- ✅ **实用**：地区分组自动测速，不用手动选
- ✅ **易维护**：规则全部引用远程源，本地只维护分组逻辑
- ✅ **AI 专用**：独立分组，覆盖 40+ AI 服务
- ✅ **故障转移**：自动选择挂了有备用

## 分组

### 基础分组

| 分组 | 类型 | 说明 |
|------|------|------|
| ✈️ 手动选择 | select | 手动指定节点 |
| ♻️ 自动选择 | url-test | 自动测速选最优（排除运营商 / 信息节点） |
| 🔯 故障转移 | fallback | 自动选择挂了后按顺序切换 |

### 业务分组

| 分组 | 说明 |
|------|------|
| 🤖 AI自动 | AI 服务自动选择（美 / 新 / GPT 节点） |
| 🧚 AI服务 | AI 服务出口：AI自动 → 美国 → 新加坡 → 手动 |
| 🚀 国外流量 | 国外服务出口 |
| 🎯 国内流量 | 国内服务出口（直连优先） |
| 🛑 广告拦截 | REJECT / DIRECT |
| 🐟 漏网之鱼 | 全部流量的兜底出口 |

### 地区分组

按节点名正则自动归组，无需手动选择：

| 分组 | 匹配关键词 |
|------|-----------|
| 🇭🇰 香港节点 | 港 / HK / Hong Kong / 澳门 |
| 🇺🇸 美国节点 | 美 / US / United States |
| 🇸🇬 新加坡 | 新加坡 / SG / 狮城 / shiche |
| 🇯🇵 日本节点 | 日本 / JP / Japan |
| 🇨🇳 台湾节点 | 台湾 / TW / Taiwan |
| 🌍 其他 | 其余节点自动归入 |

## 使用方式

### Clash Verge Rev（推荐：本地配置合并双订阅）

1. 打开 [clash-verge.yaml](clash-verge.yaml)，把 `SUB1_TOKEN` / `SUB2_TOKEN` 替换为你的订阅 token（订阅地址末尾加 `&flag=clash` 转成 Clash 格式）
2. Clash Verge Rev → Profiles → + → 新建 **Local** → 粘贴内容 → 启用
3. 右键该配置 → **更新代理集 / 更新规则集**

### 订阅转换（subconverter）

```
# 默认（raw 源）
https://raw.githubusercontent.com/alva-cui/ClashRule/main/Rule.ini
# CDN 版（raw 源不通时用 jsdelivr）
https://cdn.jsdelivr.net/gh/alva-cui/ClashRule@main/RuleCdn.ini
```

### Shadowrocket

```
https://raw.githubusercontent.com/alva-cui/ClashRule/main/shadowrocket.conf
```

## 规则来源

| 来源 | 说明 |
|------|------|
| [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script) | 国外服务 + 国内直连规则，更新频繁 |
| [VPSDance/ai-proxy-rules](https://github.com/VPSDance/ai-proxy-rules) | AI 服务规则（收编至 [Rule/AI.yaml](Rule/AI.yaml)） |
| [ACL4SSR/ACL4SSR](https://github.com/ACL4SSR/ACL4SSR) | Shadowrocket 国外流量规则 |

## AI 服务覆盖

收编自 [VPSDance/ai-proxy-rules](https://github.com/VPSDance/ai-proxy-rules)，覆盖 40+ 家 AI 服务：
Anthropic (Claude)、OpenAI、Google AI (Gemini)、Microsoft Copilot、Cursor、Dify、Perplexity、Groq、
HuggingFace、Fireworks、Cerebras、ElevenLabs、Character.AI、Amazon Q 等。

## 参考项目

- [ACL4SSR/ACL4SSR](https://github.com/ACL4SSR/ACL4SSR)
- [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script)
- [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules)
- [VPSDance/ai-proxy-rules](https://github.com/VPSDance/ai-proxy-rules)
