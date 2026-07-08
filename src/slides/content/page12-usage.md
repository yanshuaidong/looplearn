## 这个实验在验证什么

| 角色 | 作用 |
|------|------|
| **主 Agent（你对话的这个）** | 调度员：先派 Maker、再派 Checker，自己不改文件 |
| **制作者 (Maker)** | 快速实现功能、写代码 |
| **检查者 (Checker)** | 独立审查：跑 type-check、找边界问题 |

**核心现象**：Maker 往往会说「完成了」，Checker 可能发现 NaN 未处理、文档缺失等问题——这就是「自己给自己打分太宽容」。

## 动手前（30 秒）

1. 在项目根目录打开 Claude Code
2. 建议先提交或 stash 当前改动，实验完也好还原
3. 实验会新建 `src/lib/celsiusToFahrenheit.ts`，不影响现有幻灯片

## 第一步：确认子 Agent 配置

项目里已准备好两个配置文件（无需再建）：

- `.claude/agents/maker-demo.md` — 制作者，实现温度转换函数
- `.claude/agents/checker-demo.md` — 检查者，只读审查 + 跑 `yarn type-check`

## 第二步：给主 Agent 的提示词（复制即用）

```text
请做一个 Maker/Checker 子 Agent 演示，对应 Page 12「制作者 / 检查者」。

规则：
1. 你自己不要改任何文件，只负责调度
2. 先启动 maker-demo 子 Agent，等它完成
3. 再启动 checker-demo 子 Agent（只读审查）
4. 汇总给我：
   - Maker 的自评结论
   - Checker 的 PASS/FAIL 和具体问题
   - yarn type-check 的实际输出
5. 如果 Checker 发现问题，不要自动修复——我只观察分离效果
```

## 实验结束后，你应该看到什么

在终端可以自查：

```bash
# 1. 看 Maker 产出的文件
cat src/lib/celsiusToFahrenheit.ts

# 2. 类型检查（Checker 也会跑这个）
yarn type-check

# 3. 手动验证公式（0°C 应该是 32°F）
node -e "import('./src/lib/celsiusToFahrenheit.ts').then(m => console.log(m.celsiusToFahrenheit(0)))"
```

**典型预期：**

- Maker 汇报：「函数已实现，自评完成 ✅」
- Checker 汇报：「FAIL — 未处理 NaN 输入、缺少边界测试」
- `yarn type-check`：可能通过（类型没问题，但逻辑/健壮性有问题）

这就说明：**type-check 通过 ≠ 任务真正完成**，需要独立的 Checker 才敢「走开」。

## 关系一句话

```
你（主 Agent）
  ├── Maker  → 写 src/lib/celsiusToFahrenheit.ts → 「我觉得完成了」
  └── Checker → 只读审查 + type-check          → 「其实还有问题」
```

Page 12 那句「只在第二意见值得付费的地方使用子 Agent」在这里的意思是：**写代码便宜，独立验收贵，但验收才是你敢 Loop 无人值守的前提。**
