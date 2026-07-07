<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-badge el-b-5">05 / Sub-Agents</div>
    <div class="el-title-row">
      <div class="el-icon-wrap" style="background:#FFE4E6"><IllusIcon name="robot" :size="32" color="#E11D48" /></div>
      <div>
        <h2>子 Agent：制作者 / 检查者</h2>
        <p class="el-subtitle">写代码的模型给自己打分时太宽容了</p>
      </div>
    </div>
    <div class="maker-checker">
      <div class="mc-card mc-maker">
        <div class="mc-icon"><IllusIcon name="build" :size="28" color="#2563EB" /></div>
        <div class="mc-title">制作者 (Maker)</div>
        <div class="mc-desc">探索 → 实现方案<br/>写代码、改文件</div>
        <div class="mc-model">快速模型 · 低成本</div>
      </div>
      <div class="mc-arrow">⟶</div>
      <div class="mc-card mc-checker">
        <div class="mc-icon"><IllusIcon name="check" :size="28" color="#0D9488" /></div>
        <div class="mc-title">检查者 (Checker)</div>
        <div class="mc-desc">运行测试、类型检查<br/>对照规范验证</div>
        <div class="mc-model">强模型 · 高置信</div>
      </div>
    </div>
    <div class="el-points-row">
      <div class="el-point">
        <span class="dot dot-pink">●</span>
        <div>这种分离也应用于<strong>停止条件</strong>：<code>/goal</code> 用独立模型判断是否完成</div>
      </div>
      <div class="el-point">
        <span class="dot dot-pink">●</span>
        <div>一个你真正信任的验证者，是你<strong>敢走开</strong>的唯一理由</div>
      </div>
      <div class="el-point">
        <span class="dot dot-yellow">⚠</span>
        <div>子 Agent 消耗更多 Token，只在<strong>第二意见值得付费</strong>的地方使用</div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dot-pink { color: #E11D48; flex-shrink: 0; }
.dot-yellow { color: #CA8A04; flex-shrink: 0; }
.maker-checker {
  display: flex; align-items: center; gap: 20px;
  margin: 0 0 20px; width: 100%;
}
.mc-card {
  flex: 1; border-radius: 16px; padding: 24px; border: 1.5px solid;
  background: #FFFFFF; box-shadow: 0 4px 24px rgba(15,23,42,0.06);
}
.mc-maker { border-color: rgba(37,99,235,0.25); }
.mc-checker { border-color: rgba(13,148,136,0.25); }
.mc-icon { margin-bottom: 10px; }
.mc-title { font-size: 16px; font-weight: 700; color: #1E293B; margin-bottom: 10px; }
.mc-desc { font-size: 14px; color: #64748B; line-height: 1.6; margin-bottom: 12px; }
.mc-model {
  font-size: 12px; padding: 4px 10px; border-radius: 20px; display: inline-block; font-weight: 500;
}
.mc-maker .mc-model { background: #DBEAFE; color: #2563EB; }
.mc-checker .mc-model { background: #CCFBF1; color: #0D9488; }
.mc-arrow { font-size: 36px; color: #0D9488; }
.el-points-row { display: flex; flex-direction: column; gap: 12px; width: 100%; }
</style>
