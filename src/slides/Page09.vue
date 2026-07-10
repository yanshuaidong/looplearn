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
          <span class="term-tip" tabindex="0">
            Worktree
            <span class="term-tip-body" role="tooltip">
              <span class="tip-lead">同一 Git 仓库开出多个工作目录，各检出一个分支，共享提交历史。</span>
              <span class="tip-row tip-before"><strong>之前</strong>：给人用——手动 <code>git worktree add</code>，在不同分支上并行开发。</span>
              <span class="tip-row tip-now"><strong>现在</strong>：给 Agent 用——每个子 Agent 自动获得独立目录 + 分支，改完再清理。</span>
            </span>
          </span>
          让并行变得可控：每个 Agent 有自己的工作目录、自己的分支、共享同一段历史。
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
            <div>Claude Code 支持
              <span class="term-tip term-tip--code" tabindex="0">
                <code>isolation: worktree</code>
                <span class="term-tip-body term-tip-body--below" role="tooltip">
                  <span class="tip-lead">子 Agent 的 YAML 配置项，写在 <code>.claude/agents/*.md</code> 头部。</span>
                  <span class="tip-row tip-before"><strong>之前</strong>：子 Agent 默认和主会话共用工作区，并行时容易改同一文件。</span>
                  <span class="tip-row tip-now"><strong>现在</strong>：加上这项，Claude Code 自动开 worktree + 分支，任务结束自动清理。</span>
                </span>
              </span>，完成后<strong>自动清理</strong></div>
          </div>
          <div class="el-point">
            <span class="dot dot-yellow">●</span>
            <div>
              <span class="term-tip term-tip--phrase" tabindex="0">
                消除了<strong>机械冲突</strong>，但你的 Review 带宽才是并行数量的真正上限
                <span class="term-tip-body" role="tooltip">
                  <span class="tip-lead">Worktree 解决了<strong>文件打架</strong>——并行 Agent 不会互相覆盖同一行。</span>
                  <span class="tip-row">但两个分支都改完后，<strong>审哪一份、合哪一份</strong>，还是你的事；你能同时 review 几条，才是并行的真正上限。</span>
                </span>
              </span>
            </div>
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

.core-statement {
  overflow: visible;
}

.term-tip {
  position: relative;
  cursor: help;
  color: #8A5A2D;
  border-bottom: 1.5px dashed rgba(194, 142, 45, 0.55);
  outline: none;
}

.term-tip:hover,
.term-tip:focus-visible {
  color: #6B4518;
  border-bottom-color: rgba(194, 142, 45, 0.85);
}

.term-tip-body {
  position: absolute;
  left: 0;
  bottom: calc(100% + 10px);
  z-index: 20;
  width: min(320px, 78vw);
  padding: 12px 14px;
  border-radius: 8px;
  border: 1.5px solid rgba(93, 67, 33, 0.18);
  background: #FFF7DF;
  box-shadow: 0 10px 28px rgba(68, 54, 28, 0.14);
  font-size: 13px;
  font-weight: 500;
  line-height: 1.55;
  color: #3A342B;
  text-align: left;
  pointer-events: none;
  opacity: 0;
  transform: translateY(4px);
  transition: opacity 0.15s ease, transform 0.15s ease;
}

.term-tip:hover .term-tip-body,
.term-tip:focus-visible .term-tip-body {
  opacity: 1;
  transform: translateY(0);
}

.tip-lead {
  display: block;
  margin-bottom: 8px;
  color: #2D291F;
  font-weight: 600;
}

.tip-row {
  display: block;
  margin-top: 6px;
  font-size: 12px;
  line-height: 1.5;
}

.tip-row strong {
  font-weight: 700;
}

.tip-before {
  color: #A8463E;
}

.tip-now {
  color: #4E6750;
}

.term-tip-body code {
  font-family: 'JetBrains Mono', 'Fira Code', monospace;
  font-size: 0.92em;
  background: rgba(78, 103, 80, 0.12);
  padding: 1px 4px;
  border-radius: 3px;
  color: #4E6750;
  font-weight: 600;
}

.term-tip--code {
  color: inherit;
  border-bottom: none;
}

.term-tip--code code {
  cursor: help;
  border-bottom: 1.5px dashed rgba(78, 103, 80, 0.45);
}

.term-tip--code:hover code,
.term-tip--code:focus-visible code {
  border-bottom-color: rgba(78, 103, 80, 0.85);
}

.term-tip-body--below {
  bottom: auto;
  top: calc(100% + 10px);
  transform: translateY(-4px);
}

.term-tip--code:hover .term-tip-body--below,
.term-tip--code:focus-visible .term-tip-body--below {
  transform: translateY(0);
}

.term-tip--phrase {
  border-bottom: 1.5px dashed rgba(194, 142, 45, 0.45);
}

.term-tip--phrase:hover,
.term-tip--phrase:focus-visible {
  border-bottom-color: rgba(194, 142, 45, 0.85);
}

.concept-list {
  margin-top: 18px;
  display: flex;
  flex-direction: column;
  gap: 9px;
  overflow: visible;
}

.el-two-col {
  align-items: stretch;
}

.usage-panel {
  display: flex;
  flex-direction: column;
  min-width: 0;
  min-height: 0;
}

.usage-block {
  display: flex;
  flex-direction: column;
  flex: 1;
  min-height: 0;
  border-color: rgba(78, 103, 80, 0.55) !important;
  box-shadow: 0 0 0 1px rgba(78, 103, 80, 0.15), var(--illus-shadow) !important;
}

.usage-block .code-label {
  flex-shrink: 0;
}

.usage-markdown {
  flex: 1 1 0;
  min-height: 0;
  overflow-y: auto;
  overscroll-behavior: contain;
  padding: 14px 16px;
  font-size: 13px;
  line-height: 1.65;
  color: rgba(255, 247, 223, 0.88);
  scrollbar-gutter: stable;
  scrollbar-width: thin;
  scrollbar-color: rgba(194, 142, 45, 0.44) transparent;
}

.usage-markdown::-webkit-scrollbar {
  width: 5px;
}

.usage-markdown::-webkit-scrollbar-track {
  background: transparent;
  margin: 6px 0;
}

.usage-markdown::-webkit-scrollbar-thumb {
  background: rgba(194, 142, 45, 0.4);
  border-radius: 999px;
}

.usage-markdown::-webkit-scrollbar-thumb:hover {
  background: rgba(226, 187, 112, 0.55);
}

.usage-markdown :deep(> *:last-child) {
  margin-bottom: 0;
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
  scrollbar-width: thin;
  scrollbar-color: rgba(194, 142, 45, 0.32) transparent;
}

.usage-markdown :deep(pre)::-webkit-scrollbar {
  height: 4px;
}

.usage-markdown :deep(pre)::-webkit-scrollbar-track {
  background: transparent;
}

.usage-markdown :deep(pre)::-webkit-scrollbar-thumb {
  background: rgba(194, 142, 45, 0.28);
  border-radius: 999px;
}

.usage-markdown :deep(pre)::-webkit-scrollbar-thumb:hover {
  background: rgba(226, 187, 112, 0.42);
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
