<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
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
      <div class="tip-title">
        <IllusIcon name="rocket" :size="22" color="#2563EB" />
        推荐第一个 Loop（零风险版）
      </div>
      <div class="tip-code">
        <code>/loop "Read yesterday's CI failures. Write a prioritized summary to TODO.md. Do NOT edit source files. Do NOT open PRs." --schedule "0 8 * * 1-5"</code>
      </div>
      <div class="tip-note">这个 Loop 每天早上帮你整理好问题清单，风险几乎为零，是理解 Loop 行为的最好起点。</div>
    </div>
  </div>
</template>

<style scoped>
.steps-phases {
  display: flex; align-items: center; gap: 0;
  width: 100%; max-width: 1000px; margin-bottom: 24px;
}
.phase {
  flex: 1; padding: 18px 14px; border-radius: 12px; border: 1.5px solid #E2E8F0;
  background: #FFFFFF; text-align: center;
  box-shadow: 0 2px 8px rgba(15,23,42,0.04);
}
.phase-badge { font-size: 11px; font-weight: 700; margin-bottom: 8px; }
.phase-1 .phase-badge { color: #2563EB; }
.phase-2 .phase-badge { color: #16A34A; }
.phase-3 .phase-badge { color: #EA580C; }
.phase-4 .phase-badge {
  color: #0D9488; border: 1.5px solid rgba(13,148,136,0.3);
  padding: 2px 8px; border-radius: 6px; display: inline-block;
}
.phase-desc { font-size: 13px; color: #334155; margin-bottom: 8px; line-height: 1.5; font-weight: 500; }
.phase-human { font-size: 11px; color: #94A3B8; }
.phase-arrow { color: #CBD5E1; font-size: 20px; padding: 0 6px; flex-shrink: 0; }
.start-tip {
  width: 100%; max-width: 1000px;
  background: #DBEAFE; border: 1.5px solid rgba(37,99,235,0.25);
  border-radius: 16px; padding: 20px 24px;
}
.tip-title {
  font-size: 14px; font-weight: 700; color: #2563EB; margin-bottom: 12px;
  display: flex; align-items: center; gap: 8px;
}
.tip-code {
  background: #FFFFFF; border-radius: 10px; padding: 12px 16px; margin-bottom: 10px;
  overflow: auto; border: 1.5px solid rgba(37,99,235,0.15);
}
.tip-code code { font-family: monospace; font-size: 13px; color: #0D9488; line-height: 1.6; white-space: pre-wrap; }
.tip-note { font-size: 13px; color: #64748B; line-height: 1.6; }
</style>
