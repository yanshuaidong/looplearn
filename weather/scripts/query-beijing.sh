#!/usr/bin/env bash
# 查询北京市天气（测试 Skill，仅支持北京）
set -euo pipefail

API="https://aider.meizu.com/app/weather/listWeather?cityIds=101010100"
RESP=$(curl -sL --max-time 10 "$API")

python3 - "$RESP" <<'PY'
import json, sys

raw = sys.argv[1]
try:
    data = json.loads(raw)
except json.JSONDecodeError:
    print("错误：接口返回非 JSON")
    sys.exit(1)

if data.get("code") != "200" or not data.get("value"):
    print(f"错误：接口异常 code={data.get('code')} message={data.get('message', '')}")
    sys.exit(1)

v = data["value"][0]
rt = v.get("realtime", {})
pm = v.get("pm25", {})

print(f"## 北京天气\n")
print(f"**实时**（{rt.get('time', '—')}）：{rt.get('weather', '—')}，"
      f"{rt.get('temp', '—')}℃（体感 {rt.get('sendibleTemp', '—')}℃），"
      f"{rt.get('wD', '—')} {rt.get('wS', '—')}")
print(f"\n**空气质量**：{pm.get('quality', '—')}，AQI {pm.get('aqi', '—')}")

print("\n### 未来预报")
print("| 日期 | 星期 | 白天 | 夜间 | 气温 |")
print("|------|------|------|------|------|")
for w in v.get("weathers", []):
    print(f"| {w.get('date','—')} | {w.get('week','—')} | {w.get('weather','—')} | "
          f"{w.get('nightWeather','—')} | {w.get('temp_day_c','—')}℃ / {w.get('temp_night_c','—')}℃ |")

alarms = v.get("alarms", [])
if alarms:
    print("\n### 预警")
    for a in alarms:
        print(f"- {a.get('alarmTypeDesc','—')}（{a.get('alarmLevelNoDesc','—')}）：{a.get('alarmDesc','—')}")

indexes = {i.get("name"): i for i in v.get("indexes", [])}
tips = []
for name in ("穿衣指数", "运动指数", "紫外线强度指数"):
    idx = indexes.get(name)
    if idx and idx.get("level"):
        tips.append(f"- {name}：{idx['level']} — {idx.get('content', '')}")
if tips:
    print("\n### 生活建议")
    print("\n".join(tips))
PY
