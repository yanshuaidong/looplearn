<script setup lang="ts">
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="split-layout split-layout--balanced">
      <div class="summary-panel split-left">
        <div class="slide-tag">定义</div>
        <h2 class="slide-title">什么是 Loop Engineering？</h2>
        <p class="slide-subtitle">
          它不是把提示词写得更漂亮，而是把 Agent 放进一个能持续推进结果的系统。
        </p>
        <div class="core-statement">
          把你从「<span class="rose-text">提示 Agent 的人</span>」<br />
          变成「<span class="rose-text">设计驱动 Agent 的系统</span>」的工程师。
        </div>
      </div>

      <div class="detail-stack split-right detail-stack--balanced">
        <div class="detail-card">
          <div class="detail-card-title">Loop 是什么</div>
          <div>一个<strong>递归目标系统</strong>：你定义目的，Agent 不断迭代，直到任务真正完成。</div>
        </div>
        <div class="detail-card">
          <div class="detail-card-title">Loop 做什么</div>
          <div>自动<strong>发现工作 → 分派任务 → 检查结果 → 记录状态 → 决定下一步</strong>。</div>
        </div>
        <div class="detail-card">
          <div class="detail-card-title">你做什么</div>
          <div>你<strong>设计这套系统</strong>，而不是坐在旁边一轮一轮地手动触发 Agent。</div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.split-layout--balanced {
  align-items: stretch;
}

.detail-stack--balanced {
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

@media (max-width: 980px) {
  .detail-stack--balanced {
    height: auto;
    justify-content: flex-start;
    gap: 14px;
  }
}
</style>
