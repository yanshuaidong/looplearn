<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-badge el-b-6">+ / Memory</div>
    <div class="el-title-row">
      <div class="el-icon-wrap" style="background:#CFFAFE"><IllusIcon name="memory" :size="32" color="#0891B2" /></div>
      <div>
        <h2>持久记忆</h2>
        <p class="el-subtitle">模型在每次对话之间会完全遗忘，仓库不会</p>
      </div>
    </div>
    <div class="el-two-col">
      <div class="el-explain">
        <div class="el-point">
          <span class="dot dot-cyan">●</span>
          <div>没有外部记忆，每次 Loop 触发时 Agent 都<strong>从零开始</strong></div>
        </div>
        <div class="el-point">
          <span class="dot dot-cyan">●</span>
          <div>解决方案极简：<strong>把状态写在文件里，文件放在仓库里</strong></div>
        </div>
        <div class="el-point">
          <span class="dot dot-cyan">●</span>
          <div>TODO.md / STATE.md 记录：尝试了什么、通过了什么、还有什么未完成</div>
        </div>
        <div class="el-point">
          <span class="dot dot-cyan">●</span>
          <div>这是 Loop 的<strong>脊柱</strong>——第二天的运行可以从昨天停下的地方继续</div>
        </div>
      </div>
      <div class="illus-code">
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
</template>

<style scoped>
.dot-cyan { color: #0891B2; flex-shrink: 0; }
</style>
