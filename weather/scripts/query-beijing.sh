#!/usr/bin/env bash
# 查询北京市当天天气，输出一行：调用时间 + 当天天气
set -euo pipefail

CALL_TIME=$(date "+%Y-%m-%d %H:%M")
API="https://aider.meizu.com/app/weather/listWeather?cityIds=101010100"
RESP=$(curl -sL --max-time 10 "$API" || true)
if [[ -z "$RESP" ]]; then
  echo "${CALL_TIME} 北京天气查询失败，请稍后重试"
  exit 0
fi

python3 - "$RESP" "$CALL_TIME" <<'PY'
import json, sys

raw, call_time = sys.argv[1], sys.argv[2]

try:
    data = json.loads(raw)
except json.JSONDecodeError:
    print(f"{call_time} 北京天气查询失败，请稍后重试")
    sys.exit(0)

if data.get("code") != "200" or not data.get("value"):
    print(f"{call_time} 北京天气查询失败，请稍后重试")
    sys.exit(0)

rt = data["value"][0].get("realtime", {})
weather = rt.get("weather", "—")
temp = rt.get("temp", "—")
wind = rt.get("wD", "")
level = rt.get("wS", "")

parts = [f"{call_time} 北京：{weather}，{temp}℃"]
if wind or level:
    wind_text = f"{wind}{level}".strip()
    if wind_text:
        parts[0] += f"，{wind_text}"

print(parts[0])
PY
