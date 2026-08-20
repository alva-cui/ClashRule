#!/usr/bin/env bash
# 检查所有配置引用的远程规则集 URL 是否有效
# 用法: bash scripts/check_rules_urls.sh
set -uo pipefail

FAIL=0

# 提取配置中引用的所有 URL，去重
urls=$(
  grep -rhoE 'https?://[^ ,`)+"'"'"']+' \
    Rule.ini RuleCdn.ini shadowrocket.conf clash-verge.yaml 2>/dev/null \
  | sort -u \
  | grep -E 'raw\.githubusercontent|cdn\.jsdelivr|github\.com' \
  | grep -vE 'generate_204|47\.112\.97\.173|suu\.sujieok|baidu\.com' \
  || true
)

[ -z "$urls" ] && { echo "没有找到需要检查的 URL"; exit 1; }

echo "共 $(echo "$urls" | wc -l) 个规则集 URL，开始检查..."
for u in $urls; do
  code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 20 -L "$u" || echo "000")
  if [ "$code" != "200" ]; then
    echo "❌ [$code] $u"
    FAIL=1
  else
    echo "✅ $u"
  fi
done

if [ $FAIL -eq 0 ]; then
  echo "全部规则集 URL 有效 ✓"
else
  echo "存在失效的规则集 URL，请及时修复！"
fi
exit $FAIL
