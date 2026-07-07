# PNG 插画风格生成指南

本指南用于后续为 Loop Engineering 演示文稿生成 PNG 插画资产。除非另有说明，所有新插画都应遵循这里的风格。

## 核心风格

- 形式：透明背景 PNG，主体独立，不带纸张底、不带色块背景。
- 气质：温和、轻松、友好、像编辑插画或绘本插画。
- 线条：手绘感细线，不要硬朗科技线框，也不要过度写实。
- 上色：柔和水彩、轻微颗粒、低饱和度，不要高对比、高饱和、塑料感。
- 细节：保留可识别的主题细节，但要简化成符号化表达。
- 情绪：安静、聪明、可亲近，避免恐怖、压迫、攻击性。

## 视觉基准

参考当前资产：

`src/assets/loop-ouroboros-infinity.png`

这张图的关键特征：

- 透明背景。
- 轮廓清楚，适合放在暖色纸张页面上。
- 角色表情柔和，不恐怖。
- 水彩填色和手绘线条兼具，但不追求真实生物质感。
- 主题符号明确：蛇咬尾形成横向 8 / infinity。

## 色彩

推荐使用：

- sage green / 灰绿色
- muted teal / 低饱和青绿
- warm ochre / 暖赭色
- pale yellow / 淡黄
- charcoal ink / 炭黑线条
- soft clay / 柔和陶土色

避免使用：

- 纯荧光色
- 大面积深黑
- 血红、危险红
- 冷硬霓虹蓝紫
- 强烈科技渐变

## 透明 PNG 要求

生成时优先要求透明背景。如果工具不能直接生成透明背景，则使用纯色抠图流程：

1. 生成在纯 `#00ff00` 背景上的主体。
2. 要求背景是完全平面色，无阴影、无渐变、无纹理。
3. 主体中不要出现 `#00ff00`。
4. 生成后移除绿色背景，导出 RGBA PNG。
5. 检查四角 alpha 是否为 0。

## 通用提示词模板

```text
Use case: illustration-story
Asset type: transparent PNG illustration for a Loop Engineering presentation
Primary request: <说明要画的主体和概念>
Scene/backdrop: transparent background. If native transparency is unavailable, use a perfectly flat solid #00ff00 chroma-key background for background removal.
Subject: <主体> in a gentle symbolic form, clear silhouette, friendly expression or non-threatening posture.
Style/medium: soft editorial illustration, hand-drawn ink outline, muted watercolor fills, slight paper-like pigment texture on the subject only.
Composition/framing: centered single subject with generous padding, clean readable silhouette, no text.
Lighting/mood: calm, thoughtful, warm, approachable.
Color palette: sage green, muted teal, warm ochre, pale yellow, charcoal linework, low saturation.
Constraints: transparent final PNG, crisp subject edges, no background panel, no cast shadow unless very subtle and transparent-safe.
Avoid: photorealism, horror mood, aggressive expression, fangs, blood, high contrast, neon colors, glossy 3D render, flat corporate vector style, text, watermark, logo.
```

## 中文版提示词模板

```text
为 Loop Engineering 演示文稿生成一张透明背景 PNG 插画。
主体是：<主体和概念>。
风格是温和的编辑插画/绘本插画：手绘墨线轮廓、柔和水彩填色、低饱和、轻微颜料颗粒。
构图要求：主体居中，留出足够边距，轮廓清晰，适合放在暖色纸张风格幻灯片上。
颜色使用灰绿色、低饱和青绿、暖赭色、淡黄、炭黑线条。
情绪要安静、聪明、友好，不要恐怖、不要攻击性、不要写实生物压迫感。
不要文字、不要水印、不要 logo、不要背景板、不要纸张底。
如果不能直接透明背景，请放在纯 #00ff00 背景上，主体中不要出现绿色，方便后续抠成透明 PNG。
```

## 负面约束清单

生成时应明确避免：

- 逼真动物摄影感
- 恐怖、惊悚、威胁、攻击
- 张嘴露牙、尖牙、血液、阴森眼神
- 复杂背景、纸张背景、矩形贴片
- 过度精细鳞片或毛发造成压迫感
- 3D 卡通玩具质感
- 扁平企业插画风
- 高饱和绿色边缘残留
- 文字、签名、水印

## 使用规范

- 插画文件放在 `src/assets/`。
- 文件名使用语义化英文小写，例如 `loop-ouroboros-infinity.png`。
- 在 Vue 中以 import 方式引用，不写远程 URL。
- 页面背景由 CSS 负责，PNG 插画本身不携带背景。
- 插画需要和页面文字保持呼吸感，不要撑满整个页面。
- 如果插画用于右侧主视觉，建议宽度控制在 `min(55vw, 620px)` 左右。

## 验收标准

一张合格的 PNG 插画应满足：

- 是 RGBA PNG。
- 四角透明。
- 放在浅色、暖纸张、白色背景上都没有明显色边。
- 主体一眼可读。
- 情绪温和，不吓人。
- 风格和 `loop-ouroboros-infinity.png` 一致。
