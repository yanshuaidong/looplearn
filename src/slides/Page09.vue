<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-badge el-b-2">02 / Worktrees</div>
    <div class="el-title-row">
      <div class="el-icon-wrap" style="background:#CCFBF1"><IllusIcon name="tree" :size="32" color="#0D9488" /></div>
      <div>
        <h2>并行隔离</h2>
        <p class="el-subtitle">让多个 Agent 并行工作而互不干扰</p>
      </div>
    </div>
    <div class="el-two-col">
      <div class="el-explain">
        <div class="el-point">
          <span class="dot dot-green">●</span>
          <div>两个 Agent 写同一文件 = 两个工程师未沟通就提交到同一行</div>
        </div>
        <div class="el-point">
          <span class="dot dot-green">●</span>
          <div>Git Worktree 为每个 Agent 提供<strong>独立的工作目录和分支</strong>，共享同一 Git 历史</div>
        </div>
        <div class="el-point">
          <span class="dot dot-green">●</span>
          <div>Claude Code 支持 <code>isolation: worktree</code>，完成后<strong>自动清理</strong></div>
        </div>
        <div class="el-point">
          <span class="dot dot-yellow">⚠</span>
          <div>消除了<strong>机械冲突</strong>，但你的 Review 带宽才是并行数量的真正上限</div>
        </div>
      </div>
      <div class="illus-code">
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
</template>

<style scoped>
.dot-green { color: #16A34A; flex-shrink: 0; }
.dot-yellow { color: #CA8A04; flex-shrink: 0; }
</style>
