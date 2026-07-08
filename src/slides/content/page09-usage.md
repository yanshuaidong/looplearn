## 这个实验在验证什么

| 角色 | 作用 |
|------|------|
| **主 Agent（你对话的这个）** | 调度员：同时派两个子 Agent，自己不改文件 |
| **子 Agent 1 / 2** | 各干各的：改同一个文件，但内容不同 |
| **Worktree** | 给每个子 Agent 单独开「分身文件夹 + 分支」，避免抢同一块地 |

**有 worktree 时**：两个都成功，各在自己的分支里；你主目录里的 `Page09.vue` 可能还是原来的「并行隔离」。

**没有 worktree 时**：两个改同一行，容易互相覆盖或冲突。

## 动手前（30 秒）

1. 在项目根目录打开 Claude Code
2. 建议先提交或 stash 当前改动，实验完也好还原
3. 只改这一处（第 12 行）：

```vue
<h2>并行隔离</h2>
```

## 第一步：建两个带 worktree 的子 Agent 配置

在 `.claude/agents/` 下新建两个文件：

**`.claude/agents/worktree-demo-1.md`**

```markdown
---
name: worktree-demo-1
description: Worktree 隔离演示 - Agent 1
isolation: worktree
---

你是 worktree 隔离演示的 Agent 1。

任务：
1. 打开 src/slides/Page09.vue
2. 把第 12 行 <h2>并行隔离</h2> 改成 <h2>并行隔离agent1</h2>
3. 只改这一处，不要动其他文件
4. 完成后简要汇报：当前分支名、文件里 h2 的最终内容
```

**`.claude/agents/worktree-demo-2.md`**

```markdown
---
name: worktree-demo-2
description: Worktree 隔离演示 - Agent 2
isolation: worktree
---

你是 worktree 隔离演示的 Agent 2。

任务：
1. 打开 src/slides/Page09.vue
2. 把第 12 行 <h2>并行隔离</h2> 改成 <h2>并行隔离agent2</h2>
3. 只改这一处，不要动其他文件
4. 完成后简要汇报：当前分支名、文件里 h2 的最终内容
```

`isolation: worktree` 是关键——Claude Code 会为每个子 Agent 自动开独立 worktree，干完再清理。

## 第二步：给主 Agent 的提示词（复制即用）

```text
请做一个 Worktree 并行隔离演示，不要你自己改文件。

同时、并行启动这两个子 Agent：
- worktree-demo-1
- worktree-demo-2

要求：
1. 必须在同一条消息里并行启动，不要串行
2. 两个子 Agent 都会改同一个文件 src/slides/Page09.vue 的同一行
3. 等两个都完成后，汇总给我：
   - 各自所在的分支名 / worktree 路径（如果能看到）
   - 各自改后的 h2 文案
   - 我主工作区里的 Page09.vue 第 12 行现在是什么（应该还是「并行隔离」）
4. 不要 merge，不要帮我把改动合进当前分支——我只做观察实验
```

## 实验结束后，你应该看到什么

在终端可以自查：

```bash
# 1. 主目录文件：大概率仍是原文案
grep "并行隔离" src/slides/Page09.vue

# 2. 若 worktree 还在（自动清理前）
git worktree list

# 3. 看有没有 demo 相关分支
git branch | grep -E 'worktree|demo|agent'
```

**预期现象：**

- 子 Agent 1 汇报：`并行隔离agent1`
- 子 Agent 2 汇报：`并行隔离agent2`
- 你主目录：`并行隔离`（未变）
- 两个子 Agent **没有互相覆盖**

这就说明：**并行 + 同文件 + worktree 隔离 = 各改各的，最后由你决定 merge 哪一个（或都不要）。**

## 关系一句话

```
你（主 Agent）
  ├── 子 Agent 1 → worktree A → 分支 A → Page09 = "并行隔离agent1"
  └── 子 Agent 2 → worktree B → 分支 B → Page09 = "并行隔离agent2"

主工作区 → 仍是 "并行隔离"（直到你主动合并）
```

Page 9 那句「消除了机械冲突，但 Review 带宽才是上限」在这里的意思是：worktree 解决了**文件打架**；但两个分支改完后，**审哪一份、合哪一份**，还是你的事。
