# 精简分流规则

自用的 Clash Verge / Shadowrocket 分流规则，专注于简洁实用。

## 特点

- ✅ **简洁**：不过度细分
- ✅ **实用**：地区分组自动测速，不用手动选
- ✅ **易维护**：规则全部引用远程源
- ✅ **AI专用**：独立分组
- ✅ **故障转移**：自动选择挂了有备用

### 基础分组
| 分组 | 类型 | 说明 |
|------|------|------|
| ✈️ 手动选择 | select | 手动指定节点 |
| ♻️ 自动选择 | url-test | 自动测速选最优（排除运营商节点） |
| 🔯 故障转移 | fallback | 自动选择挂了后切换 |

## 使用方式

在 Clash Verge 的订阅转换中使用本仓库的远程配置地址：
```
https://raw.githubusercontent.com/cutethotw/ClashRule/main/Rule.ini
```

在 Shadowrocket 的订阅转换中使用本仓库的远程配置地址：
```
https://raw.githubusercontent.com/cutethotw/ClashRule/main/shadowrocket.conf
```

## 规则来源

| 来源 | 说明 |
|------|------|
| [ACL4SSR](https://github.com/ACL4SSR/ACL4SSR) | 国内直连规则，稳定可靠 |
| [blackmatrix7](https://github.com/blackmatrix7/ios_rule_script) | 国外服务规则，更新频繁 |
| [cutethotw](https://github.com/cutethotw/ClashRule) | AI服务规则，自定义 |

## AI服务覆盖

## 参考项目

- [ACL4SSR/ACL4SSR](https://github.com/ACL4SSR/ACL4SSR)
- [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script)
- [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules)
