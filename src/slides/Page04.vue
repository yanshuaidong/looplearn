<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
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
        <div class="def-card-icon"><IllusIcon name="loop" :size="40" color="#0D9488" /></div>
        <div class="def-card-title">Loop 是什么</div>
        <div class="def-card-body">一个<strong>递归目标系统</strong>：你定义目的，Agent 不断迭代，直到任务真正完成</div>
      </div>
      <div class="def-card">
        <div class="def-card-icon"><IllusIcon name="gear" :size="40" color="#2563EB" /></div>
        <div class="def-card-title">Loop 做什么</div>
        <div class="def-card-body">自动<strong>发现工作 → 分派任务 → 检查结果 → 记录状态 → 决定下一步</strong></div>
      </div>
      <div class="def-card">
        <div class="def-card-icon"><IllusIcon name="user" :size="40" color="#7C3AED" /></div>
        <div class="def-card-title">你做什么</div>
        <div class="def-card-body">你<strong>设计这套系统</strong>，而不是坐在旁边一轮一轮地手动触发 Agent</div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.def-hero {
  background: linear-gradient(135deg, #CCFBF1, #DBEAFE);
  border: 1.5px solid rgba(13,148,136,0.2);
  border-radius: 16px; padding: 32px 48px; margin-bottom: 32px;
  text-align: center; max-width: 800px;
  box-shadow: 0 4px 24px rgba(13,148,136,0.08);
}
.def-quote { font-size: 22px; line-height: 1.7; color: #334155; }
.hl-red { color: #E11D48; font-weight: 700; }
.hl-teal { color: #0D9488; font-weight: 700; }
.def-cards {
  display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px;
  width: 100%; max-width: 900px;
}
.def-card {
  background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 16px;
  padding: 24px; text-align: center;
  box-shadow: 0 2px 8px rgba(15,23,42,0.04);
}
.def-card-icon { margin-bottom: 10px; display: flex; justify-content: center; }
.def-card-title { font-weight: 600; font-size: 15px; color: #1E293B; margin-bottom: 8px; }
.def-card-body { font-size: 14px; color: #64748B; line-height: 1.6; }
.def-card-body strong { color: #334155; }
</style>
