<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-badge el-b-1">01 / Automations</div>
    <div class="el-title-row">
      <div class="el-icon-wrap" style="background:#DBEAFE"><IllusIcon name="clock" :size="32" color="#2563EB" /></div>
      <div>
        <h2>自动触发器</h2>
        <p class="el-subtitle">让 Loop 成为真正的循环，而不只是你做了一次的操作</p>
      </div>
    </div>
    <div class="el-two-col">
      <div class="el-explain">
        <div class="el-point">
          <span class="dot dot-blue">●</span>
          <div>按<strong>计划自动触发</strong>，自行发现工作并分类，不需要人工介入</div>
        </div>
        <div class="el-point">
          <span class="dot dot-blue">●</span>
          <div><code>/loop</code> 按节奏循环运行，<code>/goal</code> 持续运行直到条件满足</div>
        </div>
        <div class="el-point">
          <span class="dot dot-blue">●</span>
          <div>每轮结束后，<strong>独立的小模型</strong>检查是否完成——不让写代码的模型给自己打分</div>
        </div>
        <div class="el-point">
          <span class="dot dot-blue">●</span>
          <div>发现内容进 <strong>Triage 收件箱</strong>，无发现自动归档</div>
        </div>
      </div>
      <div class="illus-code">
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
</template>

<style scoped>
.dot-blue { color: #2563EB; flex-shrink: 0; }
</style>
