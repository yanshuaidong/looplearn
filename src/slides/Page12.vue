<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-two-col">
      <div class="summary-panel">
        <div class="el-badge el-b-5">05 / Sub-Agents</div>
        <div class="el-title-row">
          <div class="el-icon-wrap"><IllusIcon name="robot" :size="32" color="#A8463E" /></div>
          <div>
            <h2>子 Agent：制作者 / 检查者</h2>
            <p class="el-subtitle">写代码的模型给自己打分时太宽容了。</p>
          </div>
        </div>
        <div class="core-statement">
          把“做事”和“验收”拆开，Loop 才有资格无人值守地往前走。
        </div>
      </div>

      <div class="el-explain">
        <div class="maker-checker">
          <div class="mc-card mc-maker">
            <div class="mc-icon"><IllusIcon name="build" :size="28" color="#C28E2D" /></div>
            <div class="mc-title">制作者 (Maker)</div>
            <div class="mc-desc">探索 → 实现方案<br/>写代码、改文件</div>
            <div class="mc-model">快速模型 · 低成本</div>
          </div>
          <div class="mc-arrow">→</div>
          <div class="mc-card mc-checker">
            <div class="mc-icon"><IllusIcon name="check" :size="28" color="#4E6750" /></div>
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
          <span class="dot dot-yellow">⚠</span>
          <div>子 Agent 消耗更多 Token，只在<strong>第二意见值得付费</strong>的地方使用</div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dot-pink { color: #A8463E; flex-shrink: 0; }
.dot-yellow { color: #C28E2D; flex-shrink: 0; }
.maker-checker {
  display: flex; align-items: center; gap: 20px;
  width: 100%;
}
.mc-card {
  flex: 1; border-radius: 8px; padding: 20px; border: 1.5px solid rgba(93,67,33,0.16);
  background: rgba(255, 252, 242, 0.68); box-shadow: 0 8px 18px rgba(68,54,28,0.06);
}
.mc-icon { margin-bottom: 10px; }
.mc-title { font-size: 16px; font-weight: 700; color: #171512; margin-bottom: 10px; }
.mc-desc { font-size: 14px; color: #3A342B; line-height: 1.6; margin-bottom: 12px; }
.mc-model {
  font-size: 12px; padding: 4px 10px; border-radius: 999px; display: inline-block; font-weight: 700;
}
.mc-maker .mc-model { background: rgba(226,187,112,0.24); color: #8A5A2D; }
.mc-checker .mc-model { background: rgba(78,103,80,0.13); color: #4E6750; }
.mc-arrow { font-size: 30px; color: #4E6750; }
</style>
