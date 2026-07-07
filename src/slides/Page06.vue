<script setup lang="ts">
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="slide-tag">对比</div>
    <h2 class="slide-title">Prompt Engineering vs Loop Engineering</h2>
    <div class="compare-table">
      <div class="ct-header">
        <div></div>
        <div class="ct-pe">Prompt Engineering</div>
        <div class="ct-le">Loop Engineering ✨</div>
      </div>
      <div class="ct-row">
        <div class="ct-dim">优化对象</div>
        <div>你手写的一条指令</div>
        <div class="ct-le-val">自动决定「提示什么/何时提示/是否可接受」的整套系统</div>
      </div>
      <div class="ct-row">
        <div class="ct-dim">工作单位</div>
        <div>一次手动对话</div>
        <div class="ct-le-val">跨多轮次、自动运行的完整工作流</div>
      </div>
      <div class="ct-row">
        <div class="ct-dim">成功衡量</div>
        <div>第一个回复的质量</div>
        <div class="ct-le-val">最终输出的结果质量</div>
      </div>
      <div class="ct-row">
        <div class="ct-dim">对 Agent 的视角</div>
        <div>你手持的工具</div>
        <div class="ct-le-val">你调度的长期运行进程</div>
      </div>
      <div class="ct-row">
        <div class="ct-dim">人的角色</div>
        <div>提问者</div>
        <div class="ct-le-val">规则制定者 / 系统设计者</div>
      </div>
    </div>
    <div class="compare-note">
      ⚠️ Prompt Engineering 没有消亡，一个 Loop 由多个 Prompt 组成。<strong>LE 是 PE 之上的层次</strong>，不是替代它。
    </div>
  </div>
</template>

<style scoped>
.compare-table {
  width: 100%; max-width: 960px; border-radius: 16px;
  overflow: hidden; border: 1.5px solid #E2E8F0; margin-bottom: 16px;
  box-shadow: 0 4px 24px rgba(15,23,42,0.06);
}
.ct-header, .ct-row {
  display: grid; grid-template-columns: 180px 1fr 1fr;
}
.ct-header {
  background: #F1F5F9; padding: 12px 20px;
  font-size: 13px; font-weight: 600; border-bottom: 1.5px solid #E2E8F0;
}
.ct-pe { color: #64748B; }
.ct-le { color: #0D9488; }
.ct-row {
  padding: 14px 20px; font-size: 14px;
  border-bottom: 1px solid #F1F5F9;
  background: #FFFFFF;
  transition: background 0.15s;
}
.ct-row:hover { background: #F8FAFC; }
.ct-row:last-child { border-bottom: none; }
.ct-dim { color: #94A3B8; font-size: 13px; font-weight: 500; }
.ct-le-val { color: #1E293B; font-weight: 500; }
.compare-note {
  font-size: 14px; color: #64748B; max-width: 960px; width: 100%;
  background: #FFEDD5; border: 1.5px solid rgba(234,88,12,0.2);
  border-radius: 12px; padding: 14px 18px;
}
.compare-note strong { color: #EA580C; }
</style>
