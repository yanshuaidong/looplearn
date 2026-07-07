<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'

const currentSlide = ref(0)

const slides = [
  { id: 'cover' },
  { id: 'quotes' },
  { id: 'evolution' },
  { id: 'definition' },
  { id: 'inner-outer' },
  { id: 'pe-vs-le' },
  { id: 'six-elements' },
  { id: 'automations' },
  { id: 'worktrees' },
  { id: 'skills' },
  { id: 'connectors' },
  { id: 'subagents' },
  { id: 'memory' },
  { id: 'anatomy' },
  { id: 'risks' },
  { id: 'get-started' },
  { id: 'summary' },
]

const total = slides.length
const progress = computed(() => ((currentSlide.value + 1) / total) * 100)

function goTo(idx: number) {
  if (idx >= 0 && idx < total) currentSlide.value = idx
}
function next() { goTo(currentSlide.value + 1) }
function prev() { goTo(currentSlide.value - 1) }

function onKey(e: KeyboardEvent) {
  if (e.key === 'ArrowRight' || e.key === ' ' || e.key === 'ArrowDown') { e.preventDefault(); next() }
  if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') { e.preventDefault(); prev() }
}

onMounted(() => window.addEventListener('keydown', onKey))
onUnmounted(() => window.removeEventListener('keydown', onKey))
</script>

<template>
  <div class="deck">
    <!-- Progress bar -->
    <div class="progress-bar">
      <div class="progress-fill" :style="{ width: progress + '%' }"></div>
    </div>

    <!-- Slide counter -->
    <div class="slide-counter">{{ currentSlide + 1 }} / {{ total }}</div>

    <!-- Navigation arrows -->
    <button class="nav-btn nav-prev" @click="prev" :disabled="currentSlide === 0">‹</button>
    <button class="nav-btn nav-next" @click="next" :disabled="currentSlide === total - 1">›</button>

    <!-- Dot nav -->
    <div class="dot-nav">
      <button
        v-for="(_, i) in slides"
        :key="i"
        class="dot"
        :class="{ active: i === currentSlide }"
        @click="goTo(i)"
      ></button>
    </div>

    <!-- ─────────────── SLIDES ─────────────── -->
    <div class="slides-wrapper">

      <!-- 0. Cover -->
      <div class="slide slide-cover" :class="{ active: currentSlide === 0 }">
        <div class="cover-bg-grid"></div>
        <div class="cover-glow"></div>
        <div class="cover-content">
          <div class="cover-badge">AI 工程前沿 · 2026.06</div>
          <h1 class="cover-title">
            <span class="loop-text">Loop</span>
            <span class="eng-text">Engineering</span>
          </h1>
          <p class="cover-sub">循环工程</p>
          <p class="cover-desc">从「提示 Agent」到「设计驱动 Agent 的系统」</p>
          <div class="cover-meta">
            <span>⌨ 键盘 ← → 翻页</span>
            <span>· 空格键下一页</span>
          </div>
        </div>
      </div>

      <!-- 1. Two Quotes -->
      <div class="slide slide-quotes" :class="{ active: currentSlide === 1 }">
        <div class="slide-tag">起源</div>
        <h2 class="slide-title">两句引爆社区的话</h2>
        <p class="slide-subtitle">2026 年 6 月，两位核心开发者改变了大家对 AI 工作方式的认知</p>
        <div class="quotes-grid">
          <div class="quote-card quote-blue">
            <div class="quote-author">
              <div class="avatar av-blue">BC</div>
              <div>
                <div class="author-name">Boris Cherny</div>
                <div class="author-role">Claude Code 负责人 · Anthropic</div>
              </div>
            </div>
            <blockquote>
              "I don't prompt Claude anymore. I have <strong>loops running</strong> that prompt Claude and figure out what to do.
              <strong>My job is to write loops.</strong>"
            </blockquote>
            <div class="quote-zh">「我不再直接提示 Claude，有一套循环在运行，替我提示并决定下一步。我的工作是写循环。」</div>
          </div>
          <div class="quote-card quote-teal">
            <div class="quote-author">
              <div class="avatar av-teal">PS</div>
              <div>
                <div class="author-name">Peter Steinberger</div>
                <div class="author-role">OpenClaw 作者 · PSPDFKit 创始人</div>
              </div>
            </div>
            <blockquote>
              "You shouldn't be <strong>prompting</strong> coding agents anymore.
              You should be <strong>designing loops</strong> that prompt your agents."
            </blockquote>
            <div class="quote-zh">「你不该再手动提示 AI，你应该设计让 Agent 自己提示自己的循环。」</div>
          </div>
        </div>
        <div class="quote-stat">该帖子 <strong>7.8M 次</strong>浏览，数天内成为社区标准用语</div>
      </div>

      <!-- 2. Evolution -->
      <div class="slide" :class="{ active: currentSlide === 2 }">
        <div class="slide-tag">背景</div>
        <h2 class="slide-title">AI 工程的四次演进</h2>
        <p class="slide-subtitle">每一代的瓶颈，推动了下一代范式的出现</p>
        <div class="evo-chain">
          <div class="evo-step">
            <div class="evo-icon">✍️</div>
            <div class="evo-label">Prompt<br/>Engineering</div>
            <div class="evo-desc">怎么<strong>问</strong> AI</div>
            <div class="evo-pain">瓶颈：措辞</div>
          </div>
          <div class="evo-arrow">→</div>
          <div class="evo-step">
            <div class="evo-icon">📚</div>
            <div class="evo-label">Context<br/>Engineering</div>
            <div class="evo-desc">给 AI <strong>什么信息</strong></div>
            <div class="evo-pain">瓶颈：上下文质量</div>
          </div>
          <div class="evo-arrow">→</div>
          <div class="evo-step">
            <div class="evo-icon">⚙️</div>
            <div class="evo-label">Harness<br/>Engineering</div>
            <div class="evo-desc">如何<strong>组织</strong> AI 能力</div>
            <div class="evo-pain">瓶颈：单次运行</div>
          </div>
          <div class="evo-arrow evo-arrow-active">→</div>
          <div class="evo-step evo-step-active">
            <div class="evo-icon">🔄</div>
            <div class="evo-label">Loop<br/>Engineering</div>
            <div class="evo-desc">如何让 AI <strong>持续创造结果</strong></div>
            <div class="evo-pain evo-now">我们现在的位置</div>
          </div>
        </div>
        <div class="evo-tools">
          <div class="tool-badge">Claude Code</div>
          <div class="tool-badge">OpenAI Codex</div>
          <div class="tool-badge">Cursor</div>
          <div class="tool-badge">Grok</div>
          <span class="tool-note">第三代工具已内置 Loop 能力</span>
        </div>
      </div>

      <!-- 3. Definition -->
      <div class="slide" :class="{ active: currentSlide === 3 }">
        <div class="slide-tag">定义</div>
        <h2 class="slide-title">什么是 Loop Engineering？</h2>
        <div class="def-hero">
          <div class="def-quote">
            把你从「<span class="hl-red">提示 Agent 的人</span>」
            <br/>变成「设计<span class="hl-teal">驱动 Agent 的系统</span>」的工程师
          </div>
        </div>
        <div class="def-cards">
          <div class="def-card">
            <div class="def-card-icon">📌</div>
            <div class="def-card-title">Loop 是什么</div>
            <div class="def-card-body">一个<strong>递归目标系统</strong>：你定义目的，Agent 不断迭代，直到任务真正完成</div>
          </div>
          <div class="def-card">
            <div class="def-card-icon">🔁</div>
            <div class="def-card-title">Loop 做什么</div>
            <div class="def-card-body">自动<strong>发现工作 → 分派任务 → 检查结果 → 记录状态 → 决定下一步</strong></div>
          </div>
          <div class="def-card">
            <div class="def-card-icon">🧑‍💻</div>
            <div class="def-card-title">你做什么</div>
            <div class="def-card-body">你<strong>设计这套系统</strong>，而不是坐在旁边一轮一轮地手动触发 Agent</div>
          </div>
        </div>
      </div>

      <!-- 4. Inner vs Outer Loop -->
      <div class="slide" :class="{ active: currentSlide === 4 }">
        <div class="slide-tag">架构</div>
        <h2 class="slide-title">内循环 vs 外循环</h2>
        <p class="slide-subtitle">Loop Engineering 工作在 Agent 内循环的上一层</p>
        <div class="loop-diagram">
          <div class="loop-outer">
            <div class="loop-outer-label">外循环 — 你来设计</div>
            <div class="loop-outer-steps">
              <div class="ls ls-schedule">⏰ 按计划触发</div>
              <div class="ls-arrow">→</div>
              <div class="ls ls-dispatch">📋 发现 &amp; 分派</div>
              <div class="ls-arrow">→</div>
              <div class="ls ls-verify">✅ 验证结果</div>
              <div class="ls-arrow">→</div>
              <div class="ls ls-state">💾 记录状态</div>
            </div>
            <div class="loop-inner">
              <div class="loop-inner-label">内循环 — Agent 自带</div>
              <div class="loop-inner-steps">
                <span>感知</span><span>→</span>
                <span>推理</span><span>→</span>
                <span>行动</span><span>→</span>
                <span>观察</span>
              </div>
            </div>
          </div>
        </div>
        <div class="loop-insight">
          <strong>关键洞察：</strong>你不再为每一步打下一条指令，你在设计一套<strong>外部系统替你驾驶内循环</strong>
        </div>
      </div>

      <!-- 5. PE vs LE -->
      <div class="slide" :class="{ active: currentSlide === 5 }">
        <div class="slide-tag">对比</div>
        <h2 class="slide-title">Prompt Engineering vs Loop Engineering</h2>
        <div class="compare-table">
          <div class="ct-header">
            <div></div>
            <div class="ct-pe">Prompt Engineering</div>
            <div class="ct-le">Loop Engineering ✨</div>
          </div>
          <div class="ct-row">
            <div class="ct-dim">优化对象</div>
            <div>你手写的一条指令</div>
            <div class="ct-le-val">自动决定「提示什么/何时提示/是否可接受」的整套系统</div>
          </div>
          <div class="ct-row">
            <div class="ct-dim">工作单位</div>
            <div>一次手动对话</div>
            <div class="ct-le-val">跨多轮次、自动运行的完整工作流</div>
          </div>
          <div class="ct-row">
            <div class="ct-dim">成功衡量</div>
            <div>第一个回复的质量</div>
            <div class="ct-le-val">最终输出的结果质量</div>
          </div>
          <div class="ct-row">
            <div class="ct-dim">对 Agent 的视角</div>
            <div>你手持的工具</div>
            <div class="ct-le-val">你调度的长期运行进程</div>
          </div>
          <div class="ct-row">
            <div class="ct-dim">人的角色</div>
            <div>提问者</div>
            <div class="ct-le-val">规则制定者 / 系统设计者</div>
          </div>
        </div>
        <div class="compare-note">
          ⚠️ Prompt Engineering 没有消亡，一个 Loop 由多个 Prompt 组成。<strong>LE 是 PE 之上的层次</strong>，不是替代它。
        </div>
      </div>

      <!-- 6. Six Elements Overview -->
      <div class="slide" :class="{ active: currentSlide === 6 }">
        <div class="slide-tag">构成</div>
        <h2 class="slide-title">Loop 的六大构成要素</h2>
        <p class="slide-subtitle">缺一不可，Claude Code 和 Codex 均已原生支持全部五个核心组件</p>
        <div class="elements-grid">
          <div class="el-card el-1" @click="goTo(7)">
            <div class="el-num">01</div>
            <div class="el-icon">⏰</div>
            <div class="el-name">Automations</div>
            <div class="el-desc">自动触发器<br/>Loop 的心跳</div>
          </div>
          <div class="el-card el-2" @click="goTo(8)">
            <div class="el-num">02</div>
            <div class="el-icon">🌲</div>
            <div class="el-name">Worktrees</div>
            <div class="el-desc">并行隔离<br/>防止文件冲突</div>
          </div>
          <div class="el-card el-3" @click="goTo(9)">
            <div class="el-num">03</div>
            <div class="el-icon">📋</div>
            <div class="el-name">Skills</div>
            <div class="el-desc">技能文件<br/>固化项目知识</div>
          </div>
          <div class="el-card el-4" @click="goTo(10)">
            <div class="el-num">04</div>
            <div class="el-icon">🔌</div>
            <div class="el-name">Connectors</div>
            <div class="el-desc">MCP 连接器<br/>接入真实工具</div>
          </div>
          <div class="el-card el-5" @click="goTo(11)">
            <div class="el-num">05</div>
            <div class="el-icon">🤖</div>
            <div class="el-name">Sub-Agents</div>
            <div class="el-desc">子 Agent<br/>制作者 / 检查者</div>
          </div>
          <div class="el-card el-6" @click="goTo(12)">
            <div class="el-num">+</div>
            <div class="el-icon">💾</div>
            <div class="el-name">Memory</div>
            <div class="el-desc">持久记忆<br/>Loop 的脊柱</div>
          </div>
        </div>
        <div class="elements-hint">点击卡片或继续翻页查看每个要素详解</div>
      </div>

      <!-- 7. Automations -->
      <div class="slide slide-element" :class="{ active: currentSlide === 7 }">
        <div class="el-badge el-b-1">01 / Automations</div>
        <div class="el-title-row">
          <span class="el-big-icon">⏰</span>
          <div>
            <h2>自动触发器</h2>
            <p class="el-subtitle">让 Loop 成为真正的循环，而不只是你做了一次的操作</p>
          </div>
        </div>
        <div class="el-two-col">
          <div class="el-explain">
            <div class="el-point">
              <span class="dot-teal">●</span>
              <div>按<strong>计划自动触发</strong>，自行发现工作并分类，不需要人工介入</div>
            </div>
            <div class="el-point">
              <span class="dot-teal">●</span>
              <div><code>/loop</code> 按节奏循环运行，<code>/goal</code> 持续运行直到条件满足</div>
            </div>
            <div class="el-point">
              <span class="dot-teal">●</span>
              <div>每轮结束后，<strong>独立的小模型</strong>检查是否完成——不让写代码的模型给自己打分</div>
            </div>
            <div class="el-point">
              <span class="dot-teal">●</span>
              <div>发现内容进 <strong>Triage 收件箱</strong>，无发现自动归档</div>
            </div>
          </div>
          <div class="el-code">
            <div class="code-label">Claude Code 示例</div>
            <pre><code><span class="c"># 每天工作日早上 9 点触发</span>
/loop "Read yesterday's CI failures
and open issues, write findings
to TODO.md" \
--schedule "0 9 * * 1-5"

<span class="c"># 运行直到验证条件成立</span>
/goal "All tests in test/auth
pass and lint is clean"</code></pre>
          </div>
        </div>
      </div>

      <!-- 8. Worktrees -->
      <div class="slide slide-element" :class="{ active: currentSlide === 8 }">
        <div class="el-badge el-b-2">02 / Worktrees</div>
        <div class="el-title-row">
          <span class="el-big-icon">🌲</span>
          <div>
            <h2>并行隔离</h2>
            <p class="el-subtitle">让多个 Agent 并行工作而互不干扰</p>
          </div>
        </div>
        <div class="el-two-col">
          <div class="el-explain">
            <div class="el-point">
              <span class="dot-green">●</span>
              <div>两个 Agent 写同一文件 = 两个工程师未沟通就提交到同一行</div>
            </div>
            <div class="el-point">
              <span class="dot-green">●</span>
              <div>Git Worktree 为每个 Agent 提供<strong>独立的工作目录和分支</strong>，共享同一 Git 历史</div>
            </div>
            <div class="el-point">
              <span class="dot-green">●</span>
              <div>Claude Code 支持 <code>isolation: worktree</code>，完成后<strong>自动清理</strong></div>
            </div>
            <div class="el-point">
              <span class="dot-yellow">⚠</span>
              <div>消除了<strong>机械冲突</strong>，但你的 Review 带宽才是并行数量的真正上限</div>
            </div>
          </div>
          <div class="el-code">
            <div class="code-label">使用方式</div>
            <pre><code><span class="c"># 手动创建 worktree</span>
git worktree add \
  ../agent-fix-auth \
  feature/fix-auth-tests

<span class="c"># 子 Agent 配置（.claude/agents/）</span>
---
name: spec-reviewer
isolation: worktree  <span class="c"># 自动隔离</span>
---</code></pre>
          </div>
        </div>
      </div>

      <!-- 9. Skills -->
      <div class="slide slide-element" :class="{ active: currentSlide === 9 }">
        <div class="el-badge el-b-3">03 / Skills</div>
        <div class="el-title-row">
          <span class="el-big-icon">📋</span>
          <div>
            <h2>技能文件</h2>
            <p class="el-subtitle">让 Agent 不再每次会话都要重新推断你的项目上下文</p>
          </div>
        </div>
        <div class="el-two-col">
          <div class="el-explain">
            <div class="el-point">
              <span class="dot-orange">●</span>
              <div>一个包含 <code>SKILL.md</code> 的文件夹，写明项目约定、构建步骤、历史教训</div>
            </div>
            <div class="el-point">
              <span class="dot-orange">●</span>
              <div>Agent 每次运行都会加载，而不是每次都<strong>靠猜测重新推导</strong></div>
            </div>
            <div class="el-point">
              <span class="dot-orange">●</span>
              <div>把「只有你知道」的上下文变成「Agent 也知道」的<strong>结构化输入</strong></div>
            </div>
            <div class="el-point">
              <span class="dot-orange">●</span>
              <div>Skill 是<strong>编写格式</strong>，Plugin 是<strong>分发方式</strong>，打包后队友一次安装即可</div>
            </div>
          </div>
          <div class="el-code">
            <div class="code-label">SKILL.md 示例</div>
            <pre><code>---
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
- 不得提交真实密钥</code></pre>
          </div>
        </div>
      </div>

      <!-- 10. Connectors -->
      <div class="slide slide-element" :class="{ active: currentSlide === 10 }">
        <div class="el-badge el-b-4">04 / Connectors</div>
        <div class="el-title-row">
          <span class="el-big-icon">🔌</span>
          <div>
            <h2>MCP 连接器</h2>
            <p class="el-subtitle">把 Loop 从文件系统扩展到你的真实工具链</p>
          </div>
        </div>
        <div class="el-two-col">
          <div class="el-explain">
            <div class="el-point">
              <span class="dot-purple">●</span>
              <div>只能看文件系统的 Loop 是个<strong>微小的 Loop</strong></div>
            </div>
            <div class="el-point">
              <span class="dot-purple">●</span>
              <div>基于 MCP 协议，读取 Issue 追踪、查询数据库、调用 API、发 Slack 消息</div>
            </div>
            <div class="el-point">
              <span class="dot-purple">●</span>
              <div>Claude Code 和 Codex 均原生支持 MCP，<strong>连接器通常可以跨工具复用</strong></div>
            </div>
            <div class="el-highlight">
              <div class="hl-before">❌ Agent 说：「这里是修复方案」</div>
              <div class="hl-after">✅ Loop 自动：开 PR → 关联 Ticket → CI 通过后通知频道</div>
            </div>
          </div>
          <div class="connector-tools">
            <div class="ct-item">
              <span>📦</span> GitHub
            </div>
            <div class="ct-item">
              <span>📊</span> Linear
            </div>
            <div class="ct-item">
              <span>💬</span> Slack
            </div>
            <div class="ct-item">
              <span>🗄️</span> 数据库
            </div>
            <div class="ct-item">
              <span>🌐</span> Staging API
            </div>
            <div class="ct-item">
              <span>⚙️</span> CI / CD
            </div>
          </div>
        </div>
      </div>

      <!-- 11. Sub-Agents -->
      <div class="slide slide-element" :class="{ active: currentSlide === 11 }">
        <div class="el-badge el-b-5">05 / Sub-Agents</div>
        <div class="el-title-row">
          <span class="el-big-icon">🤖</span>
          <div>
            <h2>子 Agent：制作者 / 检查者</h2>
            <p class="el-subtitle">写代码的模型给自己打分时太宽容了</p>
          </div>
        </div>
        <div class="maker-checker">
          <div class="mc-card mc-maker">
            <div class="mc-title">🏗️ 制作者 (Maker)</div>
            <div class="mc-desc">探索 → 实现方案<br/>写代码、改文件</div>
            <div class="mc-model">快速模型 · 低成本</div>
          </div>
          <div class="mc-arrow">⟶</div>
          <div class="mc-card mc-checker">
            <div class="mc-title">🔍 检查者 (Checker)</div>
            <div class="mc-desc">运行测试、类型检查<br/>对照规范验证</div>
            <div class="mc-model">强模型 · 高置信</div>
          </div>
        </div>
        <div class="el-points-row">
          <div class="el-point">
            <span class="dot-pink">●</span>
            <div>这种分离也应用于<strong>停止条件</strong>：<code>/goal</code> 用独立模型判断是否完成</div>
          </div>
          <div class="el-point">
            <span class="dot-pink">●</span>
            <div>一个你真正信任的验证者，是你<strong>敢走开</strong>的唯一理由</div>
          </div>
          <div class="el-point">
            <span class="dot-yellow">⚠</span>
            <div>子 Agent 消耗更多 Token，只在<strong>第二意见值得付费</strong>的地方使用</div>
          </div>
        </div>
      </div>

      <!-- 12. Memory -->
      <div class="slide slide-element" :class="{ active: currentSlide === 12 }">
        <div class="el-badge el-b-6">+ / Memory</div>
        <div class="el-title-row">
          <span class="el-big-icon">💾</span>
          <div>
            <h2>持久记忆</h2>
            <p class="el-subtitle">模型在每次对话之间会完全遗忘，仓库不会</p>
          </div>
        </div>
        <div class="el-two-col">
          <div class="el-explain">
            <div class="el-point">
              <span class="dot-cyan">●</span>
              <div>没有外部记忆，每次 Loop 触发时 Agent 都<strong>从零开始</strong></div>
            </div>
            <div class="el-point">
              <span class="dot-cyan">●</span>
              <div>解决方案极简：<strong>把状态写在文件里，文件放在仓库里</strong></div>
            </div>
            <div class="el-point">
              <span class="dot-cyan">●</span>
              <div>TODO.md / STATE.md 记录：尝试了什么、通过了什么、还有什么未完成</div>
            </div>
            <div class="el-point">
              <span class="dot-cyan">●</span>
              <div>这是 Loop 的<strong>脊柱</strong>——第二天的运行可以从昨天停下的地方继续</div>
            </div>
          </div>
          <div class="el-code">
            <div class="code-label">TODO.md 示例</div>
            <pre><code><span class="c"># Loop 任务状态</span>
最后更新：2026-06-14（由 Loop 更新）

## 进行中
- [ ] login.spec.ts flaky test
  - 已尝试：隔离 DB 连接 → 无效
  - 下一步：检查 beforeEach cleanup

## 已完成
- [x] 修复 billing 500 错误 (PR #312)
- [x] Node.js 升级到 20.x (PR #307)</code></pre>
          </div>
        </div>
      </div>

      <!-- 13. Anatomy of a Loop -->
      <div class="slide" :class="{ active: currentSlide === 13 }">
        <div class="slide-tag">实例</div>
        <h2 class="slide-title">一个 Loop 长什么样？</h2>
        <p class="slide-subtitle">一个真实的「每日 CI 分类 Loop」把所有要素串联起来</p>
        <div class="anatomy-flow">
          <div class="af-step af-s1">
            <div class="af-icon">⏰</div>
            <div class="af-label">Automation</div>
            <div class="af-desc">每天早上触发<br/>调用分类 Skill</div>
          </div>
          <div class="af-arrow">→</div>
          <div class="af-step af-s2">
            <div class="af-icon">🔍</div>
            <div class="af-label">发现工作</div>
            <div class="af-desc">读 CI 失败<br/>未解决 Issue<br/>最近提交</div>
          </div>
          <div class="af-arrow">→</div>
          <div class="af-step af-s3">
            <div class="af-icon">🌲</div>
            <div class="af-label">Worktree</div>
            <div class="af-desc">为每个发现<br/>开独立分支</div>
          </div>
          <div class="af-arrow">→</div>
          <div class="af-step af-s4">
            <div class="af-icon">🏗️→🔍</div>
            <div class="af-label">双 Agent</div>
            <div class="af-desc">制作者起草修复<br/>检查者验证方案</div>
          </div>
          <div class="af-arrow">→</div>
          <div class="af-step af-s5">
            <div class="af-icon">🔌</div>
            <div class="af-label">Connectors</div>
            <div class="af-desc">自动开 PR<br/>关联 Ticket<br/>通知 Slack</div>
          </div>
          <div class="af-arrow">→</div>
          <div class="af-step af-s6">
            <div class="af-icon">💾</div>
            <div class="af-label">State 更新</div>
            <div class="af-desc">记录状态<br/>明天继续</div>
          </div>
        </div>
        <div class="anatomy-key">
          <strong>关键：</strong>你设计了<strong>一次</strong>，没有提示任何一个步骤。这就是 Steinberger 的整个观点。
        </div>
      </div>

      <!-- 14. Risks -->
      <div class="slide" :class="{ active: currentSlide === 14 }">
        <div class="slide-tag">风险</div>
        <h2 class="slide-title">Loop Engineering 的三大风险</h2>
        <p class="slide-subtitle">Loop 越好，这些问题就越尖锐——不是更容易</p>
        <div class="risks-grid">
          <div class="risk-card risk-1">
            <div class="risk-num">01</div>
            <div class="risk-title">⚠️ 验证仍然是你的责任</div>
            <div class="risk-body">无人值守运行的 Loop，也是<strong>无人值守地犯错</strong>的 Loop。「通过了验证」是声明，不是证明。</div>
            <div class="risk-action">→ 代码审查不能消失</div>
          </div>
          <div class="risk-card risk-2">
            <div class="risk-num">02</div>
            <div class="risk-title">📉 理解债（Comprehension Debt）</div>
            <div class="risk-body">Loop 交付代码越快，你实际理解的代码比例就越低。顺畅的 Loop <strong>加速了知识债的积累</strong>。</div>
            <div class="risk-action">→ 读 Loop 产出的代码</div>
          </div>
          <div class="risk-card risk-3">
            <div class="risk-num">03</div>
            <div class="risk-title">🧠 认知投降（Cognitive Surrender）</div>
            <div class="risk-body">当 Loop 自动运转时，接受它返回的任何结果是最舒适的选择。这是<strong>最隐性的危险</strong>。</div>
            <div class="risk-action">→ 带着判断力去设计，而非逃避思考</div>
          </div>
        </div>
        <div class="risks-footer">
          两个人可以构建完全相同的 Loop，却得到<strong>截然相反的结果</strong>。Loop 不知道区别，<strong>你知道。</strong>
        </div>
      </div>

      <!-- 15. Get Started -->
      <div class="slide" :class="{ active: currentSlide === 15 }">
        <div class="slide-tag">实践</div>
        <h2 class="slide-title">如何开始你的第一个 Loop？</h2>
        <p class="slide-subtitle">从最小可用的 Loop 开始，理解后再逐步扩展</p>
        <div class="steps-phases">
          <div class="phase phase-1">
            <div class="phase-badge">阶段 1 · 只读</div>
            <div class="phase-desc">发现问题 → 写 TODO.md</div>
            <div class="phase-human">人工：读 TODO 决定今天做什么</div>
          </div>
          <div class="phase-arrow">→</div>
          <div class="phase phase-2">
            <div class="phase-badge">阶段 2 · 草稿</div>
            <div class="phase-desc">起草修复 → 运行测试</div>
            <div class="phase-human">人工：审查 diff 再 push</div>
          </div>
          <div class="phase-arrow">→</div>
          <div class="phase phase-3">
            <div class="phase-badge">阶段 3 · 半自动</div>
            <div class="phase-desc">开 Draft PR → 通知 Slack</div>
            <div class="phase-human">人工：点击 Merge</div>
          </div>
          <div class="phase-arrow">→</div>
          <div class="phase phase-4">
            <div class="phase-badge">阶段 4 · 全自动</div>
            <div class="phase-desc">双 Agent + CI 绿自动合并</div>
            <div class="phase-human">人工：异常时介入</div>
          </div>
        </div>
        <div class="start-tip">
          <div class="tip-title">🚀 推荐第一个 Loop（零风险版）</div>
          <div class="tip-code">
            <code>/loop "Read yesterday's CI failures. Write a prioritized summary to TODO.md. Do NOT edit source files. Do NOT open PRs." --schedule "0 8 * * 1-5"</code>
          </div>
          <div class="tip-note">这个 Loop 每天早上帮你整理好问题清单，风险几乎为零，是理解 Loop 行为的最好起点。</div>
        </div>
      </div>

      <!-- 16. Summary -->
      <div class="slide slide-summary" :class="{ active: currentSlide === 16 }">
        <div class="summary-glow"></div>
        <div class="summary-content">
          <div class="slide-tag">总结</div>
          <h2 class="summary-title">Build the Loop.<br/>Stay the Engineer.</h2>
          <p class="summary-sub">构建循环。保持工程师的身份。</p>
          <div class="summary-points">
            <div class="sp">🔄 Loop Engineering = 设计驱动 Agent 的系统，而非直接提示 Agent</div>
            <div class="sp">🧱 六要素：Automations · Worktrees · Skills · Connectors · Sub-Agents · Memory</div>
            <div class="sp">⚡ 杠杆点移动了：从写提示词，到设计让 Agent 自主运行的控制系统</div>
            <div class="sp">🧠 Loop 设计比 Prompt 工程更难，不是更容易——因为你在设计整套系统</div>
            <div class="sp">⚠️ 设计 Loop 时带着判断力，而不是用它来逃避思考</div>
          </div>
          <div class="summary-quote">
            "Loop design is harder than prompt engineering, not easier.<br/>
            The leverage point moved."
            <span class="sq-author">— Addy Osmani · Google Chrome</span>
          </div>
          <div class="summary-resources">
            <div class="res-label">参考资源</div>
            <div class="res-links">
              <a href="https://addyosmani.com/blog/loop-engineering/" target="_blank">addyosmani.com</a>
              <a href="https://cobusgreyling.github.io/loop-engineering/" target="_blank">loop-engineering showcase</a>
              <a href="https://github.com/cobusgreyling/loop-engineering" target="_blank">GitHub Repo</a>
            </div>
          </div>
        </div>
      </div>

    </div><!-- /slides-wrapper -->
  </div><!-- /deck -->
</template>

<style>
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
  background: #0d1117;
  overflow: hidden;
  font-family: -apple-system, 'PingFang SC', 'Microsoft YaHei', 'Segoe UI', sans-serif;
}

/* ── Layout ── */
.deck {
  position: fixed; inset: 0;
  background: #0d1117;
  color: #e6edf3;
}

.slides-wrapper {
  width: 100%; height: 100%;
  position: relative;
}

.slide {
  position: absolute; inset: 0;
  display: flex; flex-direction: column;
  justify-content: center; align-items: center;
  padding: 60px 80px;
  opacity: 0; pointer-events: none;
  transform: translateX(40px);
  transition: opacity 0.4s ease, transform 0.4s ease;
}

.slide.active {
  opacity: 1; pointer-events: all;
  transform: translateX(0);
}

/* ── Progress & nav ── */
.progress-bar {
  position: fixed; top: 0; left: 0; right: 0; height: 3px;
  background: #21262d; z-index: 100;
}
.progress-fill {
  height: 100%; background: linear-gradient(90deg, #3ee8c5, #58a6ff);
  transition: width 0.4s ease;
}
.slide-counter {
  position: fixed; top: 16px; right: 24px;
  font-size: 13px; color: #6e7681; z-index: 100;
}
.nav-btn {
  position: fixed; top: 50%; transform: translateY(-50%);
  background: rgba(255,255,255,0.05); border: 1px solid #21262d;
  color: #8b949e; font-size: 28px; width: 44px; height: 44px;
  border-radius: 50%; cursor: pointer; z-index: 100;
  transition: all 0.2s; display: flex; align-items: center; justify-content: center;
}
.nav-btn:hover:not(:disabled) { background: rgba(255,255,255,0.1); color: #e6edf3; }
.nav-btn:disabled { opacity: 0.2; cursor: default; }
.nav-prev { left: 20px; }
.nav-next { right: 20px; }
.dot-nav {
  position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%);
  display: flex; gap: 6px; z-index: 100;
}
.dot {
  width: 6px; height: 6px; border-radius: 50%;
  background: #30363d; border: none; cursor: pointer;
  transition: all 0.2s;
}
.dot.active { background: #3ee8c5; width: 20px; border-radius: 3px; }

/* ── Shared ── */
.slide-tag {
  display: inline-block; font-size: 11px; font-weight: 600; letter-spacing: 2px;
  text-transform: uppercase; color: #3ee8c5;
  background: rgba(62,232,197,0.1); border: 1px solid rgba(62,232,197,0.3);
  padding: 4px 12px; border-radius: 20px; margin-bottom: 16px;
}
.slide-title {
  font-size: 36px; font-weight: 700; color: #e6edf3;
  line-height: 1.2; margin-bottom: 10px; text-align: center;
}
.slide-subtitle {
  font-size: 16px; color: #8b949e; margin-bottom: 32px; text-align: center;
}

/* ─── SLIDE 0: Cover ─── */
.slide-cover { background: #0d1117; overflow: hidden; }
.cover-bg-grid {
  position: absolute; inset: 0;
  background-image:
    linear-gradient(rgba(62,232,197,0.04) 1px, transparent 1px),
    linear-gradient(90deg, rgba(62,232,197,0.04) 1px, transparent 1px);
  background-size: 60px 60px;
}
.cover-glow {
  position: absolute; top: 30%; left: 50%; transform: translate(-50%,-50%);
  width: 600px; height: 400px;
  background: radial-gradient(ellipse, rgba(62,232,197,0.08) 0%, transparent 70%);
  pointer-events: none;
}
.cover-content { position: relative; text-align: center; }
.cover-badge {
  display: inline-block; font-size: 12px; letter-spacing: 2px; text-transform: uppercase;
  color: #3ee8c5; background: rgba(62,232,197,0.1); border: 1px solid rgba(62,232,197,0.3);
  padding: 6px 16px; border-radius: 20px; margin-bottom: 28px;
}
.cover-title {
  font-size: 80px; font-weight: 800; line-height: 1; margin-bottom: 8px;
  display: flex; gap: 20px; align-items: baseline; justify-content: center;
}
.loop-text { color: #3ee8c5; }
.eng-text { color: #58a6ff; }
.cover-sub {
  font-size: 28px; color: #8b949e; font-weight: 300; letter-spacing: 4px;
  margin-bottom: 20px;
}
.cover-desc {
  font-size: 18px; color: #6e7681; margin-bottom: 40px;
}
.cover-meta {
  font-size: 13px; color: #484f58; display: flex; gap: 8px; justify-content: center;
}

/* ─── SLIDE 1: Quotes ─── */
.quotes-grid {
  display: grid; grid-template-columns: 1fr 1fr; gap: 24px;
  width: 100%; max-width: 1100px;
}
.quote-card {
  border-radius: 12px; padding: 28px; border: 1px solid;
}
.quote-blue { background: rgba(88,166,255,0.05); border-color: rgba(88,166,255,0.2); }
.quote-teal { background: rgba(62,232,197,0.05); border-color: rgba(62,232,197,0.2); }
.quote-author { display: flex; align-items: center; gap: 14px; margin-bottom: 16px; }
.avatar { width: 44px; height: 44px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 14px; }
.av-blue { background: rgba(88,166,255,0.2); color: #58a6ff; }
.av-teal { background: rgba(62,232,197,0.2); color: #3ee8c5; }
.author-name { font-weight: 600; font-size: 15px; }
.author-role { font-size: 12px; color: #8b949e; }
blockquote { font-size: 15px; line-height: 1.7; color: #c9d1d9; font-style: italic; margin-bottom: 12px; }
blockquote strong { color: #e6edf3; font-style: normal; }
.quote-zh { font-size: 13px; color: #6e7681; line-height: 1.6; }
.quote-stat { margin-top: 20px; text-align: center; color: #6e7681; font-size: 14px; }
.quote-stat strong { color: #f0883e; }

/* ─── SLIDE 2: Evolution ─── */
.evo-chain {
  display: flex; align-items: center; gap: 0;
  margin: 8px 0 28px; width: 100%; max-width: 1000px;
}
.evo-step {
  flex: 1; text-align: center; padding: 20px 16px;
  background: #161b22; border: 1px solid #21262d; border-radius: 12px;
  transition: transform 0.2s;
}
.evo-step-active {
  background: rgba(62,232,197,0.07); border-color: rgba(62,232,197,0.4);
  box-shadow: 0 0 20px rgba(62,232,197,0.1);
}
.evo-icon { font-size: 28px; margin-bottom: 8px; }
.evo-label { font-weight: 700; font-size: 14px; color: #e6edf3; margin-bottom: 6px; }
.evo-desc { font-size: 12px; color: #8b949e; margin-bottom: 8px; }
.evo-pain { font-size: 11px; color: #6e7681; background: #0d1117; padding: 3px 8px; border-radius: 4px; }
.evo-now { color: #3ee8c5; background: rgba(62,232,197,0.1); }
.evo-arrow { font-size: 24px; color: #30363d; padding: 0 8px; flex-shrink: 0; }
.evo-arrow-active { color: #3ee8c5; }
.evo-tools { display: flex; align-items: center; gap: 10px; }
.tool-badge {
  padding: 6px 14px; border-radius: 20px;
  background: rgba(88,166,255,0.1); border: 1px solid rgba(88,166,255,0.2);
  color: #58a6ff; font-size: 13px;
}
.tool-note { font-size: 13px; color: #6e7681; margin-left: 8px; }

/* ─── SLIDE 3: Definition ─── */
.def-hero {
  background: linear-gradient(135deg, rgba(62,232,197,0.08), rgba(88,166,255,0.08));
  border: 1px solid rgba(62,232,197,0.2);
  border-radius: 16px; padding: 32px 48px; margin-bottom: 32px;
  text-align: center; max-width: 800px;
}
.def-quote { font-size: 22px; line-height: 1.7; color: #c9d1d9; }
.hl-red { color: #f97583; font-weight: 700; }
.hl-teal { color: #3ee8c5; font-weight: 700; }
.def-cards {
  display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px;
  width: 100%; max-width: 900px;
}
.def-card {
  background: #161b22; border: 1px solid #21262d; border-radius: 12px;
  padding: 24px; text-align: center;
}
.def-card-icon { font-size: 28px; margin-bottom: 10px; }
.def-card-title { font-weight: 600; font-size: 15px; color: #e6edf3; margin-bottom: 8px; }
.def-card-body { font-size: 14px; color: #8b949e; line-height: 1.6; }
.def-card-body strong { color: #c9d1d9; }

/* ─── SLIDE 4: Inner Outer ─── */
.loop-diagram { width: 100%; max-width: 860px; margin: 0 0 24px; }
.loop-outer {
  border: 2px solid rgba(62,232,197,0.3); border-radius: 16px;
  padding: 24px 24px 20px; position: relative;
  background: rgba(62,232,197,0.03);
}
.loop-outer-label {
  position: absolute; top: -12px; left: 24px;
  background: #0d1117; padding: 0 10px;
  font-size: 13px; color: #3ee8c5; font-weight: 600;
}
.loop-outer-steps {
  display: flex; align-items: center; gap: 8px; margin-bottom: 16px;
  flex-wrap: wrap; justify-content: center;
}
.ls {
  padding: 10px 16px; border-radius: 8px; font-size: 13px; font-weight: 500;
}
.ls-schedule { background: rgba(88,166,255,0.1); color: #58a6ff; border: 1px solid rgba(88,166,255,0.2); }
.ls-dispatch { background: rgba(240,136,62,0.1); color: #f0883e; border: 1px solid rgba(240,136,62,0.2); }
.ls-verify { background: rgba(62,232,197,0.1); color: #3ee8c5; border: 1px solid rgba(62,232,197,0.2); }
.ls-state { background: rgba(185,94,240,0.1); color: #b98eff; border: 1px solid rgba(185,94,240,0.2); }
.ls-arrow { color: #30363d; font-size: 20px; }
.loop-inner {
  border: 1.5px dashed rgba(88,166,255,0.3); border-radius: 10px;
  padding: 14px 20px; position: relative; background: rgba(88,166,255,0.03);
}
.loop-inner-label {
  position: absolute; top: -10px; left: 16px;
  background: #0d1117; padding: 0 8px;
  font-size: 12px; color: #58a6ff;
}
.loop-inner-steps {
  display: flex; align-items: center; gap: 8px;
  font-size: 13px; color: #6e7681; justify-content: center;
}
.loop-inner-steps span:nth-child(odd) { color: #8b949e; }
.loop-insight {
  background: #161b22; border: 1px solid #21262d; border-radius: 10px;
  padding: 16px 24px; font-size: 15px; color: #8b949e; max-width: 860px;
  width: 100%;
}
.loop-insight strong { color: #3ee8c5; }

/* ─── SLIDE 5: PE vs LE ─── */
.compare-table {
  width: 100%; max-width: 960px; border-radius: 12px;
  overflow: hidden; border: 1px solid #21262d; margin-bottom: 16px;
}
.ct-header, .ct-row {
  display: grid; grid-template-columns: 180px 1fr 1fr;
}
.ct-header {
  background: #161b22; padding: 12px 20px;
  font-size: 13px; font-weight: 600; border-bottom: 1px solid #21262d;
}
.ct-pe { color: #8b949e; }
.ct-le { color: #3ee8c5; }
.ct-row {
  padding: 14px 20px; font-size: 14px;
  border-bottom: 1px solid #21262d;
  transition: background 0.15s;
}
.ct-row:hover { background: rgba(255,255,255,0.02); }
.ct-row:last-child { border-bottom: none; }
.ct-dim { color: #6e7681; font-size: 13px; }
.ct-le-val { color: #c9d1d9; font-weight: 500; }
.compare-note {
  font-size: 14px; color: #6e7681; max-width: 960px; width: 100%;
  background: rgba(240,136,62,0.08); border: 1px solid rgba(240,136,62,0.2);
  border-radius: 8px; padding: 14px 18px;
}
.compare-note strong { color: #f0883e; }

/* ─── SLIDE 6: Elements Overview ─── */
.elements-grid {
  display: grid; grid-template-columns: repeat(6, 1fr); gap: 12px;
  width: 100%; max-width: 1100px; margin-bottom: 12px;
}
.el-card {
  background: #161b22; border: 1px solid #21262d; border-radius: 12px;
  padding: 20px 12px; text-align: center; cursor: pointer;
  transition: all 0.2s;
}
.el-card:hover { transform: translateY(-4px); border-color: rgba(62,232,197,0.4); }
.el-num { font-size: 11px; color: #484f58; margin-bottom: 8px; font-weight: 700; }
.el-icon { font-size: 30px; margin-bottom: 10px; }
.el-name { font-size: 13px; font-weight: 700; color: #e6edf3; margin-bottom: 6px; }
.el-desc { font-size: 11px; color: #6e7681; line-height: 1.5; }
.el-1:hover { border-color: rgba(88,166,255,0.5); background: rgba(88,166,255,0.05); }
.el-2:hover { border-color: rgba(62,232,197,0.5); background: rgba(62,232,197,0.05); }
.el-3:hover { border-color: rgba(240,136,62,0.5); background: rgba(240,136,62,0.05); }
.el-4:hover { border-color: rgba(185,94,240,0.5); background: rgba(185,94,240,0.05); }
.el-5:hover { border-color: rgba(249,117,131,0.5); background: rgba(249,117,131,0.05); }
.el-6:hover { border-color: rgba(88,214,255,0.5); background: rgba(88,214,255,0.05); }
.elements-hint { font-size: 13px; color: #484f58; }

/* ─── Element slides (7-12) ─── */
.slide-element { align-items: flex-start; padding: 50px 80px; }
.el-badge {
  display: inline-block; font-size: 11px; font-weight: 700; letter-spacing: 2px;
  text-transform: uppercase; padding: 4px 14px; border-radius: 20px; margin-bottom: 18px;
}
.el-b-1 { background: rgba(88,166,255,0.1); border: 1px solid rgba(88,166,255,0.3); color: #58a6ff; }
.el-b-2 { background: rgba(62,232,197,0.1); border: 1px solid rgba(62,232,197,0.3); color: #3ee8c5; }
.el-b-3 { background: rgba(240,136,62,0.1); border: 1px solid rgba(240,136,62,0.3); color: #f0883e; }
.el-b-4 { background: rgba(185,94,240,0.1); border: 1px solid rgba(185,94,240,0.3); color: #b98eff; }
.el-b-5 { background: rgba(249,117,131,0.1); border: 1px solid rgba(249,117,131,0.3); color: #f97583; }
.el-b-6 { background: rgba(88,214,255,0.1); border: 1px solid rgba(88,214,255,0.3); color: #58d6ff; }
.el-title-row { display: flex; align-items: center; gap: 18px; margin-bottom: 24px; }
.el-big-icon { font-size: 44px; }
.el-title-row h2 { font-size: 28px; font-weight: 700; color: #e6edf3; margin-bottom: 4px; }
.el-subtitle { font-size: 15px; color: #8b949e; }
.el-two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; width: 100%; }
.el-explain { display: flex; flex-direction: column; gap: 14px; }
.el-point { display: flex; gap: 10px; font-size: 14px; color: #8b949e; line-height: 1.6; align-items: flex-start; }
.el-point strong { color: #c9d1d9; }
.el-point code { background: rgba(255,255,255,0.08); padding: 1px 6px; border-radius: 4px; font-size: 13px; color: #3ee8c5; }
.dot-teal { color: #3ee8c5; flex-shrink: 0; }
.dot-green { color: #56d364; flex-shrink: 0; }
.dot-orange { color: #f0883e; flex-shrink: 0; }
.dot-purple { color: #b98eff; flex-shrink: 0; }
.dot-pink { color: #f97583; flex-shrink: 0; }
.dot-cyan { color: #58d6ff; flex-shrink: 0; }
.dot-yellow { color: #e3b341; flex-shrink: 0; }

.el-code {
  background: #0d1117; border: 1px solid #21262d; border-radius: 10px;
  overflow: hidden;
}
.code-label {
  padding: 8px 16px; background: #161b22; border-bottom: 1px solid #21262d;
  font-size: 12px; color: #6e7681;
}
.el-code pre { padding: 16px; overflow: auto; }
.el-code code { font-family: 'JetBrains Mono', 'Fira Code', monospace; font-size: 12px; color: #c9d1d9; line-height: 1.7; white-space: pre-wrap; }
.c { color: #6e7681; }

/* Connectors special */
.connector-tools {
  display: grid; grid-template-columns: repeat(2, 1fr); gap: 12px;
  align-content: start;
}
.ct-item {
  background: rgba(185,94,240,0.08); border: 1px solid rgba(185,94,240,0.2);
  border-radius: 8px; padding: 14px 18px; display: flex; align-items: center;
  gap: 10px; font-size: 14px; color: #c9d1d9;
}
.el-highlight {
  background: #161b22; border: 1px solid #21262d; border-radius: 10px;
  padding: 16px; margin-top: 4px;
}
.hl-before { color: #f97583; font-size: 13px; margin-bottom: 8px; }
.hl-after { color: #3ee8c5; font-size: 13px; }

/* Sub-Agents maker-checker */
.maker-checker {
  display: flex; align-items: center; gap: 20px;
  margin: 0 0 20px; width: 100%;
}
.mc-card {
  flex: 1; border-radius: 12px; padding: 24px; border: 1px solid;
}
.mc-maker { background: rgba(88,166,255,0.05); border-color: rgba(88,166,255,0.3); }
.mc-checker { background: rgba(62,232,197,0.05); border-color: rgba(62,232,197,0.3); }
.mc-title { font-size: 16px; font-weight: 700; color: #e6edf3; margin-bottom: 10px; }
.mc-desc { font-size: 14px; color: #8b949e; line-height: 1.6; margin-bottom: 12px; }
.mc-model {
  font-size: 12px; padding: 4px 10px; border-radius: 20px; display: inline-block;
}
.mc-maker .mc-model { background: rgba(88,166,255,0.1); color: #58a6ff; }
.mc-checker .mc-model { background: rgba(62,232,197,0.1); color: #3ee8c5; }
.mc-arrow { font-size: 36px; color: #3ee8c5; }
.el-points-row { display: flex; flex-direction: column; gap: 12px; width: 100%; }

/* ─── SLIDE 13: Anatomy ─── */
.anatomy-flow {
  display: flex; align-items: flex-start; gap: 0; width: 100%; max-width: 1100px;
  margin: 0 0 24px;
}
.af-step {
  flex: 1; text-align: center; padding: 20px 10px;
  background: #161b22; border: 1px solid #21262d; border-radius: 10px;
}
.af-icon { font-size: 24px; margin-bottom: 6px; }
.af-label { font-size: 12px; font-weight: 700; color: #e6edf3; margin-bottom: 4px; }
.af-desc { font-size: 11px; color: #6e7681; line-height: 1.5; }
.af-s1 { border-color: rgba(88,166,255,0.3); }
.af-s2 { border-color: rgba(240,136,62,0.3); }
.af-s3 { border-color: rgba(62,232,197,0.3); }
.af-s4 { border-color: rgba(249,117,131,0.3); }
.af-s5 { border-color: rgba(185,94,240,0.3); }
.af-s6 { border-color: rgba(88,214,255,0.3); }
.af-arrow { color: #30363d; font-size: 20px; display: flex; align-items: center; padding: 0 4px; flex-shrink: 0; }
.anatomy-key {
  background: rgba(62,232,197,0.05); border: 1px solid rgba(62,232,197,0.2);
  border-radius: 10px; padding: 16px 24px; font-size: 15px; color: #8b949e;
  max-width: 1100px; width: 100%;
}
.anatomy-key strong { color: #3ee8c5; }

/* ─── SLIDE 14: Risks ─── */
.risks-grid {
  display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px;
  width: 100%; max-width: 1050px; margin-bottom: 20px;
}
.risk-card {
  border-radius: 12px; padding: 24px; border: 1px solid;
}
.risk-1 { background: rgba(240,136,62,0.05); border-color: rgba(240,136,62,0.2); }
.risk-2 { background: rgba(249,117,131,0.05); border-color: rgba(249,117,131,0.2); }
.risk-3 { background: rgba(185,94,240,0.05); border-color: rgba(185,94,240,0.2); }
.risk-num { font-size: 32px; font-weight: 800; color: #30363d; margin-bottom: 8px; }
.risk-1 .risk-num { color: rgba(240,136,62,0.3); }
.risk-2 .risk-num { color: rgba(249,117,131,0.3); }
.risk-3 .risk-num { color: rgba(185,94,240,0.3); }
.risk-title { font-size: 15px; font-weight: 700; color: #e6edf3; margin-bottom: 12px; }
.risk-body { font-size: 13px; color: #8b949e; line-height: 1.7; margin-bottom: 12px; }
.risk-body strong { color: #c9d1d9; }
.risk-action { font-size: 13px; font-weight: 600; color: #3ee8c5; }
.risks-footer {
  font-size: 16px; color: #8b949e; text-align: center; max-width: 700px;
}
.risks-footer strong { color: #3ee8c5; }

/* ─── SLIDE 15: Get Started ─── */
.steps-phases {
  display: flex; align-items: center; gap: 0;
  width: 100%; max-width: 1000px; margin-bottom: 24px;
}
.phase {
  flex: 1; padding: 18px 14px; border-radius: 10px; border: 1px solid #21262d;
  background: #161b22; text-align: center;
}
.phase-badge {
  font-size: 11px; font-weight: 700; margin-bottom: 8px;
}
.phase-1 .phase-badge { color: #58a6ff; }
.phase-2 .phase-badge { color: #56d364; }
.phase-3 .phase-badge { color: #f0883e; }
.phase-4 .phase-badge { color: #3ee8c5; border: 1px solid rgba(62,232,197,0.3); padding: 2px 8px; border-radius: 4px; display: inline-block; }
.phase-desc { font-size: 13px; color: #c9d1d9; margin-bottom: 8px; line-height: 1.5; }
.phase-human { font-size: 11px; color: #6e7681; }
.phase-arrow { color: #30363d; font-size: 20px; padding: 0 6px; flex-shrink: 0; }
.start-tip {
  width: 100%; max-width: 1000px;
  background: rgba(56,139,253,0.08); border: 1px solid rgba(56,139,253,0.3);
  border-radius: 12px; padding: 20px 24px;
}
.tip-title { font-size: 14px; font-weight: 700; color: #58a6ff; margin-bottom: 12px; }
.tip-code {
  background: #0d1117; border-radius: 8px; padding: 12px 16px; margin-bottom: 10px;
  overflow: auto;
}
.tip-code code { font-family: monospace; font-size: 13px; color: #3ee8c5; line-height: 1.6; white-space: pre-wrap; }
.tip-note { font-size: 13px; color: #6e7681; line-height: 1.6; }

/* ─── SLIDE 16: Summary ─── */
.slide-summary { overflow: hidden; }
.summary-glow {
  position: absolute; top: 20%; left: 50%; transform: translate(-50%, -50%);
  width: 700px; height: 500px;
  background: radial-gradient(ellipse, rgba(62,232,197,0.06) 0%, transparent 70%);
  pointer-events: none;
}
.summary-content { position: relative; text-align: center; max-width: 800px; }
.summary-title {
  font-size: 48px; font-weight: 800; line-height: 1.2;
  background: linear-gradient(135deg, #3ee8c5, #58a6ff);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
  margin-bottom: 10px;
}
.summary-sub { font-size: 20px; color: #8b949e; margin-bottom: 28px; letter-spacing: 2px; }
.summary-points {
  text-align: left; display: flex; flex-direction: column; gap: 10px;
  margin-bottom: 24px;
}
.sp {
  font-size: 14px; color: #8b949e; line-height: 1.6;
  background: #161b22; border: 1px solid #21262d;
  padding: 10px 16px; border-radius: 8px;
}
.summary-quote {
  background: rgba(62,232,197,0.05); border-left: 3px solid #3ee8c5;
  padding: 16px 20px; border-radius: 0 10px 10px 0;
  font-size: 14px; color: #8b949e; font-style: italic;
  margin-bottom: 20px; text-align: left;
}
.sq-author { display: block; margin-top: 8px; font-style: normal; font-size: 13px; color: #3ee8c5; }
.summary-resources { text-align: center; }
.res-label { font-size: 12px; color: #484f58; margin-bottom: 10px; }
.res-links { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; }
.res-links a { font-size: 13px; color: #58a6ff; text-decoration: none; }
.res-links a:hover { color: #3ee8c5; text-decoration: underline; }
</style>
