# Loop Engineering 说明

> 本文档整理自 `src/slides` 各页 PPT 文案，每页独立一节。

---

## Page 01 · 封面

**主标题**

Loop Engineering

**副标题**

循环工程

---

## Page 02 · Loop Engineering 从哪里来？

**标题**

Loop Engineering 从哪里来？

**导语**

Loop Engineering（循环工程）是 2026 年 6 月在 AI 编程社区迅速传播的一个新概念。

**正文**

Google 工程师 **Addy Osmani** 对这一趋势做了系统整理；与此同时，Anthropic Claude Code 负责人 **Boris Cherny** 和开发者 **Peter Steinberger** 在公开场合分别提出了相同观点：

> 工程师的核心工作，正在从「写好一次提示词」转向「设计能持续提示、执行、观察和修正的循环」。

本文将带你从零理解什么是 Loop Engineering、它与 Prompt Engineering 的本质区别、构成一个完整 Agent Loop 的六大要素，以及如何设计自己的第一个可运行 Loop。

---

## Page 03 · AI 工程的四次演进

**标签**

AI 工程的四次演进

**标题**

从提示词，到持续交付结果的循环系统

**导语**

过去两年，AI 开发的重点正在不断变化。

**正文**

从研究如何写好提示词（Prompt），逐步发展到组织上下文（Context）、编排工具与流程（Harness），再到构建能够自主运行、持续交付结果的循环系统（Loop）。

> 这不是简单的工具升级，而是 AI 开发者工作重心的迁移：从一次性表达意图，走向设计可观察、可修正、可反复创造结果的工作循环。

---

## Page 04 · 什么是 Loop Engineering？

**标签**

定义

**标题**

什么是 Loop Engineering？

**副标题**

它不是把提示词写得更漂亮，而是把 Agent 放进一个能持续推进结果的系统。

**核心陈述**

把你从「**提示 Agent 的人**」变成「设计**驱动 Agent 的系统**」的工程师。

**卡片 · Loop 是什么**

一个**递归目标系统**：你定义目的，Agent 不断迭代，直到任务真正完成。

**卡片 · Loop 做什么**

自动**发现工作 → 分派任务 → 检查结果 → 记录状态 → 决定下一步**。

**卡片 · 你做什么**

你**设计这套系统**，而不是坐在旁边一轮一轮地手动触发 Agent。

---

## Page 05 · 内循环 vs 外循环

**标签**

架构

**标题**

内循环 vs 外循环

**副标题**

Loop Engineering 工作在 Agent 内循环的上一层。

**核心陈述**

你不再为每一步打一条指令，而是在设计一套**外部系统**替你驾驶 Agent 的内循环。

**外循环 — 你来设计**

按计划触发 → 发现 & 分派 → 验证结果 → 记录状态

**内循环 — Agent 自带**

感知 → 推理 → 行动 → 观察

---

## Page 06 · Prompt Engineering vs Loop Engineering

**标签**

对比

**标题**

Prompt Engineering vs Loop Engineering

**副标题**

Prompt 没有消亡。Loop 是 Prompt 之上的系统层。

**核心陈述**

杠杆点从「写好第一句话」移动到「设计能自己判断下一步的工作循环」。

| 维度 | Prompt Engineering | Loop Engineering |
|------|-------------------|------------------|
| 优化对象 | 一条指令 | **整套决策系统** |
| 工作单位 | 一次手动对话 | **跨多轮自动工作流** |
| 成功衡量 | 第一个回复 | **最终输出结果** |
| Agent 视角 | 手持工具 | **长期运行进程** |
| 人的角色 | 提问者 | **规则制定者 / 系统设计者** |

---

## Page 07 · Loop 的六大构成要素

**标签**

构成

**标题**

Loop 的六大构成要素

**副标题**

每个要素都在回答同一个问题：怎样让 Agent 不靠人工推动，也能持续交付结果？

**核心陈述**

Automations 提供心跳，Memory 提供连续性，中间四项把工作隔离、知识、工具和验证串起来。

**要素列表**

| # | 名称 | 说明 |
|---|------|------|
| 01 | Automations | 自动触发器 · Loop 的心跳 |
| 02 | Worktrees | 并行隔离 · 防止文件冲突 |
| 03 | Skills | 技能文件 · 固化项目知识 |
| 04 | Connectors | MCP 连接器 · 接入真实工具 |
| 05 | Sub-Agents | 子 Agent · 制作者 / 检查者 |
| + | Memory | 持久记忆 · Loop 的脊柱 |

**提示**

点击右侧条目或继续翻页查看每个要素详解

---

## Page 08 · 01 / Automations

**标签**

01 / Automations

**标题**

自动触发器

**副标题**

让 Loop 成为真正的循环，而不只是你做了一次的操作。

**核心陈述**

Automation 是 Loop 的心跳：它负责按节奏唤醒系统，让 Agent 自己发现下一轮工作。

**要点**

- 按**计划自动触发**，自行发现工作并分类，不需要人工介入
- `/loop` 按节奏循环运行，`/goal` 持续运行直到条件满足
- 每轮结束后，**独立的小模型**检查是否完成——不让写代码的模型给自己打分
- 发现内容进 **Triage 收件箱**，无发现自动归档

**Claude Code 示例**

```
# 每天工作日早上 9 点触发
/loop "Read yesterday's CI failures
and open issues, write findings
to TODO.md" \
--schedule "0 9 * * 1-5"

# 运行直到验证条件成立
/goal "All tests in test/auth
pass and lint is clean"
```

---

## Page 09 · 02 / Worktrees

**标签**

02 / Worktrees

**标题**

并行隔离

**副标题**

让多个 Agent 并行工作而互不干扰。

**核心陈述**

Worktree 让并行变得可控：每个 Agent 有自己的工作目录、自己的分支、共享同一段历史。

**要点**

- 两个 Agent 写同一文件 = 两个工程师未沟通就提交到同一行
- Git Worktree 为每个 Agent 提供**独立的工作目录和分支**，共享同一 Git 历史
- Claude Code 支持 `isolation: worktree`，完成后**自动清理**
- ⚠ 消除了**机械冲突**，但你的 Review 带宽才是并行数量的真正上限

**使用方式**

```
# 手动创建 worktree
git worktree add \
  ../agent-fix-auth \
  feature/fix-auth-tests

# 子 Agent 配置（.claude/agents/）
---
name: spec-reviewer
isolation: worktree  # 自动隔离
---
```

---

## Page 10 · 03 / Skills

**标签**

03 / Skills

**标题**

技能文件

**副标题**

让 Agent 不再每次会话都要重新推断你的项目上下文。

**核心陈述**

Skill 把团队约定、构建步骤和历史教训固化下来，让每一次 Loop 都从更好的起点开始。

**要点**

- 一个包含 `SKILL.md` 的文件夹，写明项目约定、构建步骤、历史教训
- Agent 每次运行都会加载，而不是每次都**靠猜测重新推导**
- 把「只有你知道」的上下文变成「Agent 也知道」的**结构化输入**
- Skill 是**编写格式**，Plugin 是**分发方式**，打包后队友一次安装即可

**SKILL.md 示例**

```
---
name: project-conventions
description: 代码规范和构建步骤
---

## 技术栈
- Node.js 20 + TypeScript + Fastify
- 测试框架：Vitest

## 构建命令
- pnpm test
- pnpm typecheck

## 禁止事项
- 不得在业务层直接写 SQL
- 不得提交真实密钥
```

---

## Page 11 · 04 / Connectors

**标签**

04 / Connectors

**标题**

MCP 连接器

**副标题**

把 Loop 从文件系统扩展到你的真实工具链。

**核心陈述**

Connector 让 Loop 能读取任务系统、调用 API、发通知，把结果送回真实工作流。

**要点**

- 只能看文件系统的 Loop 是个**微小的 Loop**
- 基于 MCP 协议，读取 Issue 追踪、查询数据库、调用 API、发 Slack 消息
- Claude Code 和 Codex 均原生支持 MCP，**连接器通常可以跨工具复用**

**对比**

- ❌ Agent 说：「这里是修复方案」
- ✅ Loop 自动：开 PR → 关联 Ticket → CI 通过后通知频道

**支持工具**

GitHub · Linear · Slack · 数据库 · Staging API · CI / CD

---

## Page 12 · 05 / Sub-Agents

**标签**

05 / Sub-Agents

**标题**

子 Agent：制作者 / 检查者

**副标题**

写代码的模型给自己打分时太宽容了。

**核心陈述**

把「做事」和「验收」拆开，Loop 才有资格无人值守地往前走。

**制作者 (Maker)**

探索 → 实现方案 · 写代码、改文件 · 快速模型 · 低成本

**检查者 (Checker)**

运行测试、类型检查 · 对照规范验证 · 强模型 · 高置信

**要点**

- 这种分离也应用于**停止条件**：`/goal` 用独立模型判断是否完成
- 一个你真正信任的验证者，是你**敢走开**的唯一理由
- ⚠ 子 Agent 消耗更多 Token，只在**第二意见值得付费**的地方使用

---

## Page 13 · + / Memory

**标签**

+ / Memory

**标题**

持久记忆

**副标题**

模型在每次对话之间会完全遗忘，仓库不会。

**核心陈述**

Memory 不是神秘能力，最可靠的形态往往就是仓库里的状态文件。

**要点**

- 没有外部记忆，每次 Loop 触发时 Agent 都**从零开始**
- 解决方案极简：**把状态写在文件里，文件放在仓库里**
- TODO.md / STATE.md 记录：尝试了什么、通过了什么、还有什么未完成
- 这是 Loop 的**脊柱**——第二天的运行可以从昨天停下的地方继续

**TODO.md 示例**

```
# Loop 任务状态
最后更新：2026-06-14（由 Loop 更新）

## 进行中
- [ ] login.spec.ts flaky test
  - 已尝试：隔离 DB 连接 → 无效
  - 下一步：检查 beforeEach cleanup

## 已完成
- [x] 修复 billing 500 错误 (PR #312)
- [x] Node.js 升级到 20.x (PR #307)
```

---

## Page 14 · 一个 Loop 长什么样？

**标签**

实例

**标题**

一个 Loop 长什么样？

**副标题**

一个真实的「每日 CI 分类 Loop」把所有要素串联起来。

**核心陈述**

你设计了一次，然后系统每天自己触发、发现、隔离、验证、通知和记录。

**流程步骤**

| 步骤 | 说明 |
|------|------|
| Automation | 每天早上触发 · 调用分类 Skill |
| 发现工作 | 读 CI 失败 · 未解决 Issue · 最近提交 |
| Worktree | 为每个发现开独立分支 |
| 双 Agent | 制作者起草修复 · 检查者验证方案 |
| Connectors | 自动开 PR · 关联 Ticket · 通知 Slack |
| State 更新 | 记录状态 · 明天继续 |

---

## Page 15 · Loop Engineering 的三大风险

**标签**

风险

**标题**

Loop Engineering 的三大风险

**副标题**

Loop 越好，这些问题就越尖锐，不是更容易。

**核心陈述**

两个人可以构建完全相同的 Loop，却得到截然相反的结果。Loop 不知道区别，**你知道。**

**风险 01 · 验证仍然是你的责任**

无人值守运行的 Loop，也是**无人值守地犯错**的 Loop。「通过了验证」是声明，不是证明。

→ 代码审查不能消失

**风险 02 · 理解债（Comprehension Debt）**

Loop 交付代码越快，你实际理解的代码比例就越低。顺畅的 Loop **加速了知识债的积累**。

→ 读 Loop 产出的代码

**风险 03 · 认知投降（Cognitive Surrender）**

当 Loop 自动运转时，接受它返回的任何结果是最舒适的选择。这是**最隐性的危险**。

→ 带着判断力去设计，而非逃避思考

---

## Page 16 · 如何开始你的第一个 Loop？

**标签**

实践

**标题**

如何开始你的第一个 Loop？

**副标题**

从最小可用的 Loop 开始，理解后再逐步扩展。

**核心陈述**

第一条规则：先让 Loop 只读、只记录。等你理解它的行为，再逐步交给它写代码和开 PR。

**阶段 1 · 只读**

发现问题 → 写 TODO.md

人工：读 TODO 决定今天做什么

**阶段 2 · 草稿**

起草修复 → 运行测试

人工：审查 diff 再 push

**阶段 3 · 半自动**

开 Draft PR → 通知 Slack

人工：点击 Merge

**阶段 4 · 全自动**

双 Agent + CI 绿自动合并

人工：异常时介入

**推荐第一个 Loop（零风险版）**

```
/loop "Read yesterday's CI failures. Write a prioritized summary to TODO.md. Do NOT edit source files. Do NOT open PRs." --schedule "0 8 * * 1-5"
```

这个 Loop 每天早上帮你整理好问题清单，风险几乎为零，是理解 Loop 行为的最好起点。

---

## Page 17 · 总结

**标签**

总结

**标题**

Build the Loop. Stay the Engineer.

**副标题**

构建循环。保持工程师的身份。

**引用**

Loop design is harder than prompt engineering, not easier. The leverage point moved.

— Addy Osmani · Google Chrome

**要点**

- Loop Engineering = 设计驱动 Agent 的系统，而非直接提示 Agent
- 六要素：Automations · Worktrees · Skills · Connectors · Sub-Agents · Memory
- 杠杆点移动了：从写提示词，到设计让 Agent 自主运行的控制系统
- Loop 设计比 Prompt 工程更难，因为你在设计整套系统
- 设计 Loop 时带着判断力，而不是用它来逃避思考

**参考资源**

- [addyosmani.com](https://addyosmani.com/blog/loop-engineering/)
- [loop-engineering showcase](https://cobusgreyling.github.io/loop-engineering/)
- [GitHub Repo](https://github.com/cobusgreyling/loop-engineering)
