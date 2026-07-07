<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="slide-tag">实例</div>
    <h2 class="slide-title">一个 Loop 长什么样？</h2>
    <p class="slide-subtitle">一个真实的「每日 CI 分类 Loop」把所有要素串联起来</p>
    <div class="anatomy-flow">
      <div class="af-step af-s1">
        <div class="af-icon"><IllusIcon name="clock" :size="28" color="#2563EB" /></div>
        <div class="af-label">Automation</div>
        <div class="af-desc">每天早上触发<br/>调用分类 Skill</div>
      </div>
      <div class="af-arrow">→</div>
      <div class="af-step af-s2">
        <div class="af-icon"><IllusIcon name="search" :size="28" color="#EA580C" /></div>
        <div class="af-label">发现工作</div>
        <div class="af-desc">读 CI 失败<br/>未解决 Issue<br/>最近提交</div>
      </div>
      <div class="af-arrow">→</div>
      <div class="af-step af-s3">
        <div class="af-icon"><IllusIcon name="tree" :size="28" color="#0D9488" /></div>
        <div class="af-label">Worktree</div>
        <div class="af-desc">为每个发现<br/>开独立分支</div>
      </div>
      <div class="af-arrow">→</div>
      <div class="af-step af-s4">
        <div class="af-icon"><IllusIcon name="robot" :size="28" color="#E11D48" /></div>
        <div class="af-label">双 Agent</div>
        <div class="af-desc">制作者起草修复<br/>检查者验证方案</div>
      </div>
      <div class="af-arrow">→</div>
      <div class="af-step af-s5">
        <div class="af-icon"><IllusIcon name="plug" :size="28" color="#7C3AED" /></div>
        <div class="af-label">Connectors</div>
        <div class="af-desc">自动开 PR<br/>关联 Ticket<br/>通知 Slack</div>
      </div>
      <div class="af-arrow">→</div>
      <div class="af-step af-s6">
        <div class="af-icon"><IllusIcon name="memory" :size="28" color="#0891B2" /></div>
        <div class="af-label">State 更新</div>
        <div class="af-desc">记录状态<br/>明天继续</div>
      </div>
    </div>
    <div class="anatomy-key">
      <strong>关键：</strong>你设计了<strong>一次</strong>，没有提示任何一个步骤。这就是 Steinberger 的整个观点。
    </div>
  </div>
</template>

<style scoped>
.anatomy-flow {
  display: flex; align-items: flex-start; gap: 0; width: 100%; max-width: 1100px;
  margin: 0 0 24px;
}
.af-step {
  flex: 1; text-align: center; padding: 20px 10px;
  background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 12px;
  box-shadow: 0 2px 8px rgba(15,23,42,0.04);
}
.af-icon { margin-bottom: 6px; display: flex; justify-content: center; }
.af-label { font-size: 12px; font-weight: 700; color: #1E293B; margin-bottom: 4px; }
.af-desc { font-size: 11px; color: #94A3B8; line-height: 1.5; }
.af-s1 { border-color: rgba(37,99,235,0.25); background: #F8FAFF; }
.af-s2 { border-color: rgba(234,88,12,0.25); background: #FFFBF5; }
.af-s3 { border-color: rgba(13,148,136,0.25); background: #F0FDFA; }
.af-s4 { border-color: rgba(225,29,72,0.25); background: #FFF5F7; }
.af-s5 { border-color: rgba(124,58,237,0.25); background: #FAF5FF; }
.af-s6 { border-color: rgba(8,145,178,0.25); background: #F0FDFE; }
.af-arrow { color: #CBD5E1; font-size: 20px; display: flex; align-items: center; padding: 0 4px; flex-shrink: 0; }
.anatomy-key {
  background: #CCFBF1; border: 1.5px solid rgba(13,148,136,0.2);
  border-radius: 12px; padding: 16px 24px; font-size: 15px; color: #64748B;
  max-width: 1100px; width: 100%;
}
.anatomy-key strong { color: #0D9488; }
</style>
