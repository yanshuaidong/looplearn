---
name: beijing-weather
description: >-
  查询北京市实时天气、空气质量与未来 7 天预报。用户询问北京天气、气温、
  天气预报、穿衣建议时使用。测试 Skill，仅支持北京，不支持其他城市。
---

# 北京天气查询

测试用 Skill，**仅支持查询北京市**。

## 何时使用

- 用户问「北京天气」「北京今天多少度」「北京未来几天会下雨吗」
- 用户 @weather 或明确要求用本 Skill

## 城市限制

| 请求 | 处理 |
|------|------|
| 北京 / 北京市 | 正常查询 |
| 其他城市 | 礼貌说明：本 Skill 为测试用途，仅支持北京 |

北京固定 cityId：`101010100`（不要使用其他 ID）。

## 查询步骤

1. **优先**执行脚本：`bash weather/scripts/query-beijing.sh`
2. 若脚本不可用，用 Shell 工具请求 API（见下方）
3. 解析 JSON 的 `value[0]`
4. 按「输出模板」回复用户

## API

| 项 | 值 |
|----|-----|
| 地址 | `https://aider.meizu.com/app/weather/listWeather` |
| 方法 | GET |
| 参数 | `cityIds=101010100` |

```bash
curl -sL "https://aider.meizu.com/app/weather/listWeather?cityIds=101010100"
```

> 须使用 `https`，`http` 会 301 重定向。

## 响应结构

成功时 `code` 为 `"200"`，数据在 `value[0]`：

| 字段路径 | 含义 |
|----------|------|
| `city` | 城市名 |
| `realtime.weather` | 当前天气现象 |
| `realtime.temp` | 当前气温（℃） |
| `realtime.sendibleTemp` | 体感温度（℃） |
| `realtime.wD` / `realtime.wS` | 风向 / 风力 |
| `realtime.time` | 观测时间 |
| `pm25.quality` / `pm25.aqi` | 空气质量等级 / AQI |
| `weathers[]` | 未来 7 天预报 |
| `weathers[].date` / `week` | 日期 / 星期 |
| `weathers[].weather` / `nightWeather` | 白天 / 夜间天气 |
| `weathers[].temp_day_c` / `temp_night_c` | 白天 / 夜间气温 |
| `alarms[]` | 气象预警（可能为空） |
| `indexes[]` | 生活指数（穿衣、运动、紫外线等） |

## 输出模板

```markdown
## 北京天气

**实时**（{realtime.time}）：{realtime.weather}，{realtime.temp}℃（体感 {realtime.sendibleTemp}℃），{realtime.wD} {realtime.wS}

**空气质量**：{pm25.quality}，AQI {pm25.aqi}

### 未来预报
| 日期 | 星期 | 白天 | 夜间 | 气温 |
|------|------|------|------|------|
| {date} | {week} | {weather} | {nightWeather} | {temp_day_c}℃ / {temp_night_c}℃ |

### 生活建议（可选）
- 穿衣：{indexes 中「穿衣指数」的 level 与 content}
- 运动：{indexes 中「运动指数」的 level 与 content}

### 预警（有则展示）
- {alarmTypeDesc}（{alarmLevelNoDesc}）：{alarmDesc}
```

## 错误处理

- `code` ≠ `"200"` 或 `value` 为空：告知接口异常，可重试一次
- 网络失败：说明无法连接天气服务
- 非北京城市：说明本 Skill 仅支持北京
