<script setup lang="ts">
import { computed } from 'vue'
import { renderMarkdown } from '@/lib/markdown'
import usageMd from './content/page12-usage.md?raw'

defineProps<{ active: boolean }>()

const usageHtml = computed(() => renderMarkdown(usageMd))
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-two-col">
      <div class="summary-panel">
        <div class="el-badge el-b-5">05 / Sub-Agents</div>
        <div class="el-title-row">
          <div>
            <h2>子 Agent：制作者 / 检查者</h2>
            <p class="el-subtitle">写代码的模型给自己打分时太宽容了。</p>
          </div>
        </div>
        <div class="core-statement">
          把“做事”和“验收”拆开，Loop 才有资格无人值守地往前走。
        </div>
        <div class="concept-list">
          <div class="maker-checker">
            <div class="mc-card mc-maker">
              <div class="mc-title">制作者 (Maker)</div>
              <div class="mc-desc">探索 → 实现方案<br/>写代码、改文件</div>
              <div class="mc-model">快速模型 · 低成本</div>
            </div>
            <div class="mc-arrow">→</div>
            <div class="mc-card mc-checker">
              <div class="mc-title">检查者 (Checker)</div>
              <div class="mc-desc">运行测试、类型检查<br/>对照规范验证</div>
              <div class="mc-model">强模型 · 高置信</div>
            </div>
          </div>
          <div class="el-point">
            <span class="dot dot-pink">●</span>
            <div>这种分离也应用于<strong>停止条件</strong>：<code>/goal</code> 用独立模型判断是否完成</div>
          </div>
          <div class="el-point">
            <span class="dot dot-pink">●</span>
            <div>一个你真正信任的验证者，是你<strong>敢走开</strong>的唯一理由</div>
          </div>
          <div class="el-point">
            <span class="dot dot-yellow">●</span>
            <div>子 Agent 消耗更多 Token，只在<strong>第二意见值得付费</strong>的地方使用</div>
          </div>
        </div>
      </div>
      <div class="usage-panel">
        <div class="illus-code usage-block">
          <div class="code-label">使用方式 — Maker / Checker 演示</div>
          <div class="usage-markdown" v-html="usageHtml" />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dot-pink { color: #A8463E; flex-shrink: 0; }
.dot-yellow { color: #C28E2D; flex-shrink: 0; }

.concept-list {
  margin-top: 18px;
  display: flex;
  flex-direction: column;
  gap: 9px;
}

.maker-checker {
  display: flex;
  align-items: center;
  gap: 14px;
  width: 100%;
  margin-bottom: 6px;
}
.mc-card {
  flex: 1;
  border-radius: 8px;
  padding: 14px 16px;
  border: 1.5px solid rgba(93, 67, 33, 0.16);
  background: rgba(255, 252, 242, 0.68);
  box-shadow: 0 8px 18px rgba(68, 54, 28, 0.06);
}
.mc-title { font-size: 14px; font-weight: 700; color: #171512; margin-bottom: 8px; }
.mc-desc { font-size: 13px; color: #3A342B; line-height: 1.55; margin-bottom: 10px; }
.mc-model {
  font-size: 11px;
  padding: 3px 9px;
  border-radius: 999px;
  display: inline-block;
  font-weight: 700;
}
.mc-maker .mc-model { background: rgba(226, 187, 112, 0.24); color: #8A5A2D; }
.mc-checker .mc-model { background: rgba(78, 103, 80, 0.13); color: #4E6750; }
.mc-arrow { font-size: 24px; color: #4E6750; flex-shrink: 0; }

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
  border-color: rgba(168, 70, 62, 0.55) !important;
  box-shadow: 0 0 0 1px rgba(168, 70, 62, 0.15), var(--illus-shadow) !important;
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
  background: rgba(168, 70, 62, 0.18);
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
