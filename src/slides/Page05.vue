<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="slide-tag">架构</div>
    <h2 class="slide-title">内循环 vs 外循环</h2>
    <p class="slide-subtitle">Loop Engineering 工作在 Agent 内循环的上一层</p>
    <div class="loop-diagram">
      <div class="loop-outer">
        <div class="loop-outer-label">外循环 — 你来设计</div>
        <div class="loop-outer-steps">
          <div class="ls ls-schedule"><IllusIcon name="clock" :size="18" color="#2563EB" /> 按计划触发</div>
          <div class="ls-arrow">→</div>
          <div class="ls ls-dispatch"><IllusIcon name="search" :size="18" color="#EA580C" /> 发现 &amp; 分派</div>
          <div class="ls-arrow">→</div>
          <div class="ls ls-verify"><IllusIcon name="check" :size="18" color="#0D9488" /> 验证结果</div>
          <div class="ls-arrow">→</div>
          <div class="ls ls-state"><IllusIcon name="save" :size="18" color="#7C3AED" /> 记录状态</div>
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
</template>

<style scoped>
.loop-diagram { width: 100%; max-width: 860px; margin: 0 0 24px; }
.loop-outer {
  border: 2px solid rgba(13,148,136,0.3); border-radius: 16px;
  padding: 24px 24px 20px; position: relative;
  background: #FFFFFF; box-shadow: 0 4px 24px rgba(13,148,136,0.08);
}
.loop-outer-label {
  position: absolute; top: -12px; left: 24px;
  background: #F5F7FA; padding: 0 10px;
  font-size: 13px; color: #0D9488; font-weight: 600;
}
.loop-outer-steps {
  display: flex; align-items: center; gap: 8px; margin-bottom: 16px;
  flex-wrap: wrap; justify-content: center;
}
.ls {
  padding: 10px 16px; border-radius: 10px; font-size: 13px; font-weight: 500;
  display: flex; align-items: center; gap: 6px;
}
.ls-schedule { background: #DBEAFE; color: #2563EB; border: 1.5px solid rgba(37,99,235,0.2); }
.ls-dispatch { background: #FFEDD5; color: #EA580C; border: 1.5px solid rgba(234,88,12,0.2); }
.ls-verify { background: #CCFBF1; color: #0D9488; border: 1.5px solid rgba(13,148,136,0.2); }
.ls-state { background: #EDE9FE; color: #7C3AED; border: 1.5px solid rgba(124,58,237,0.2); }
.ls-arrow { color: #CBD5E1; font-size: 20px; }
.loop-inner {
  border: 1.5px dashed rgba(37,99,235,0.3); border-radius: 12px;
  padding: 14px 20px; position: relative; background: #F8FAFC;
}
.loop-inner-label {
  position: absolute; top: -10px; left: 16px;
  background: #F5F7FA; padding: 0 8px;
  font-size: 12px; color: #2563EB; font-weight: 600;
}
.loop-inner-steps {
  display: flex; align-items: center; gap: 8px;
  font-size: 13px; color: #94A3B8; justify-content: center;
}
.loop-inner-steps span:nth-child(odd) { color: #64748B; font-weight: 500; }
.loop-insight {
  background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 12px;
  padding: 16px 24px; font-size: 15px; color: #64748B; max-width: 860px;
  width: 100%; box-shadow: 0 2px 8px rgba(15,23,42,0.04);
}
.loop-insight strong { color: #0D9488; }
</style>
