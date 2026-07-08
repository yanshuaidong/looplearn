<script setup lang="ts">
const emit = defineEmits<{ navigate: [index: number] }>()
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="split-layout split-layout--balanced">
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

      <div class="elements-grid split-right elements-grid--balanced">
        <div class="detail-card el-card" @click="emit('navigate', 7)">
          <div class="detail-card-title">01 · Automations</div>
          <div>自动触发器 · Loop 的心跳</div>
        </div>
        <div class="detail-card el-card" @click="emit('navigate', 8)">
          <div class="detail-card-title">02 · Worktrees</div>
          <div>并行隔离 · 防止文件冲突</div>
        </div>
        <div class="detail-card el-card" @click="emit('navigate', 9)">
          <div class="detail-card-title">03 · Skills</div>
          <div>技能文件 · 固化项目知识</div>
        </div>
        <div class="detail-card el-card" @click="emit('navigate', 10)">
          <div class="detail-card-title">04 · Connectors</div>
          <div>MCP 连接器 · 接入真实工具</div>
        </div>
        <div class="detail-card el-card" @click="emit('navigate', 11)">
          <div class="detail-card-title">05 · Sub-Agents</div>
          <div>子 Agent · 制作者 / 检查者</div>
        </div>
        <div class="detail-card el-card" @click="emit('navigate', 12)">
          <div class="detail-card-title">+ · Memory</div>
          <div>持久记忆 · Loop 的脊柱</div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.split-layout--balanced {
  align-items: stretch;
}

.elements-grid--balanced {
  height: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: repeat(3, 1fr);
  gap: 12px;
}

.el-card {
  cursor: pointer;
  transition: all 0.2s;
  min-height: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.el-card:hover {
  transform: translateY(-2px);
  border-color: rgba(194, 142, 45, 0.45);
  background: rgba(255, 252, 242, 0.9);
}

@media (max-width: 980px) {
  .elements-grid--balanced {
    height: auto;
    grid-template-rows: auto;
  }
}
</style>
