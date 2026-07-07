<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
const emit = defineEmits<{ navigate: [index: number] }>()
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="split-layout">
      <div class="summary-panel split-left">
        <div class="slide-tag">构成</div>
        <h2 class="slide-title">Loop 的六大构成要素</h2>
        <p class="slide-subtitle">
          每个要素都在回答同一个问题：怎样让 Agent 不靠人工推动，也能持续交付结果？
        </p>
        <div class="core-statement">
          Automations 提供心跳，Memory 提供连续性，中间四项把工作隔离、知识、工具和验证串起来。
        </div>
      </div>

      <div class="elements-grid split-right">
        <div class="el-card" @click="emit('navigate', 7)">
          <div class="el-num">01</div>
          <div class="el-icon"><IllusIcon name="clock" :size="28" color="#4E6750" /></div>
          <div><div class="el-name">Automations</div><div class="el-desc">自动触发器 · Loop 的心跳</div></div>
        </div>
        <div class="el-card" @click="emit('navigate', 8)">
          <div class="el-num">02</div>
          <div class="el-icon"><IllusIcon name="tree" :size="28" color="#4E6750" /></div>
          <div><div class="el-name">Worktrees</div><div class="el-desc">并行隔离 · 防止文件冲突</div></div>
        </div>
        <div class="el-card" @click="emit('navigate', 9)">
          <div class="el-num">03</div>
          <div class="el-icon"><IllusIcon name="document" :size="28" color="#C28E2D" /></div>
          <div><div class="el-name">Skills</div><div class="el-desc">技能文件 · 固化项目知识</div></div>
        </div>
        <div class="el-card" @click="emit('navigate', 10)">
          <div class="el-num">04</div>
          <div class="el-icon"><IllusIcon name="plug" :size="28" color="#8A5A2D" /></div>
          <div><div class="el-name">Connectors</div><div class="el-desc">MCP 连接器 · 接入真实工具</div></div>
        </div>
        <div class="el-card" @click="emit('navigate', 11)">
          <div class="el-num">05</div>
          <div class="el-icon"><IllusIcon name="robot" :size="28" color="#A8463E" /></div>
          <div><div class="el-name">Sub-Agents</div><div class="el-desc">子 Agent · 制作者 / 检查者</div></div>
        </div>
        <div class="el-card" @click="emit('navigate', 12)">
          <div class="el-num">+</div>
          <div class="el-icon"><IllusIcon name="memory" :size="28" color="#4E6750" /></div>
          <div><div class="el-name">Memory</div><div class="el-desc">持久记忆 · Loop 的脊柱</div></div>
        </div>
        <div class="elements-hint">点击右侧条目或继续翻页查看每个要素详解</div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.elements-grid {
  display: grid; grid-template-columns: 1fr 1fr; gap: 12px;
}
.el-card {
  display: grid;
  grid-template-columns: 34px 34px 1fr;
  align-items: center;
  gap: 12px;
  background: rgba(255, 252, 242, 0.68);
  border: 1.5px solid rgba(93, 67, 33, 0.16);
  border-radius: 8px;
  padding: 14px;
  cursor: pointer;
  transition: all 0.2s;
  box-shadow: 0 8px 18px rgba(68, 54, 28, 0.06);
}
.el-card:hover { transform: translateY(-2px); border-color: rgba(194, 142, 45, 0.45); background: rgba(255, 252, 242, 0.9); }
.el-num { font-size: 12px; color: rgba(58, 52, 43, 0.46); font-weight: 800; }
.el-icon { display: flex; justify-content: center; }
.el-name { font-size: 14px; font-weight: 700; color: #171512; margin-bottom: 3px; }
.el-desc { font-size: 12px; color: rgba(58, 52, 43, 0.64); line-height: 1.5; }
.elements-hint { grid-column: 1 / -1; font-size: 13px; color: rgba(58, 52, 43, 0.5); padding-top: 4px; }
</style>
