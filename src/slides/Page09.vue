<script setup lang="ts">
import { computed } from 'vue'
import { renderMarkdown } from '@/lib/markdown'
import usageMd from './content/page09-usage.md?raw'

defineProps<{ active: boolean }>()

const usageHtml = computed(() => renderMarkdown(usageMd))
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-two-col">
      <div class="summary-panel">
        <div class="el-badge el-b-2">02 / Worktrees</div>
        <div class="el-title-row">
          <div>
            <h2>并行隔离</h2>
            <p class="el-subtitle">让多个 Agent 并行工作而互不干扰。</p>
          </div>
        </div>
        <div class="core-statement">
          Worktree 让并行变得可控：每个 Agent 有自己的工作目录、自己的分支、共享同一段历史。
        </div>
        <div class="concept-list">
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
            <span class="dot dot-yellow">●</span>
            <div>消除了<strong>机械冲突</strong>，但你的 Review 带宽才是并行数量的真正上限</div>
          </div>
        </div>
      </div>
      <div class="usage-panel">
        <div class="illus-code usage-block">
          <div class="code-label">使用方式 — Worktree 并行隔离演示</div>
          <div class="usage-markdown" v-html="usageHtml" />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dot-green { color: #4E6750; flex-shrink: 0; }
.dot-yellow { color: #C28E2D; flex-shrink: 0; }

.concept-list {
  margin-top: 18px;
  display: flex;
  flex-direction: column;
  gap: 9px;
}

.usage-panel {
  display: flex;
  flex-direction: column;
  min-width: 0;
  min-height: 0;
  align-self: stretch;
}

.usage-block {
  display: flex;
  flex-direction: column;
  flex: 1;
  min-height: 0;
  border-color: rgba(78, 103, 80, 0.55) !important;
  box-shadow: 0 0 0 1px rgba(78, 103, 80, 0.15), var(--illus-shadow) !important;
}

.usage-markdown {
  flex: 1;
  max-height: min(62vh, 560px);
  overflow-y: auto;
  padding: 14px 16px 16px;
  font-size: 13px;
  line-height: 1.65;
  color: rgba(255, 247, 223, 0.88);
}

.usage-markdown :deep(h2) {
  margin: 0 0 10px;
  font-size: 15px;
  font-weight: 700;
  color: #FFF7DF;
  letter-spacing: 0.02em;
}

.usage-markdown :deep(h2:not(:first-child)) {
  margin-top: 18px;
  padding-top: 14px;
  border-top: 1px solid rgba(255, 252, 242, 0.1);
}

.usage-markdown :deep(p) {
  margin: 0 0 10px;
  color: rgba(255, 247, 223, 0.82);
}

.usage-markdown :deep(strong) {
  color: #FFF7DF;
  font-weight: 700;
}

.usage-markdown :deep(hr) {
  border: none;
  border-top: 1px solid rgba(255, 252, 242, 0.12);
  margin: 14px 0;
}

.usage-markdown :deep(ul),
.usage-markdown :deep(ol) {
  margin: 0 0 10px;
  padding-left: 1.25em;
}

.usage-markdown :deep(li) {
  margin-bottom: 4px;
}

.usage-markdown :deep(li > p) {
  margin-bottom: 4px;
}

.usage-markdown :deep(table) {
  width: 100%;
  border-collapse: collapse;
  margin: 0 0 12px;
  font-size: 12px;
}

.usage-markdown :deep(th),
.usage-markdown :deep(td) {
  border: 1px solid rgba(255, 252, 242, 0.14);
  padding: 7px 10px;
  text-align: left;
  vertical-align: top;
}

.usage-markdown :deep(th) {
  background: rgba(255, 252, 242, 0.08);
  color: #FFF7DF;
  font-weight: 700;
}

.usage-markdown :deep(code) {
  font-family: 'JetBrains Mono', 'Fira Code', monospace;
  font-size: 0.92em;
  background: rgba(78, 103, 80, 0.18);
  color: rgba(226, 187, 112, 0.95);
  padding: 1px 5px;
  border-radius: 4px;
}

.usage-markdown :deep(pre) {
  margin: 0 0 12px;
  padding: 12px 14px;
  background: rgba(0, 0, 0, 0.28);
  border: 1px solid rgba(255, 252, 242, 0.1);
  border-radius: 6px;
  overflow-x: auto;
}

.usage-markdown :deep(pre code) {
  display: block;
  background: none;
  padding: 0;
  color: #FFF7DF;
  font-size: 11px;
  line-height: 1.55;
  white-space: pre;
}
</style>
