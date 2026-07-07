<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
const emit = defineEmits<{ navigate: [index: number] }>()
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="slide-tag">构成</div>
    <h2 class="slide-title">Loop 的六大构成要素</h2>
    <p class="slide-subtitle">缺一不可，Claude Code 和 Codex 均已原生支持全部五个核心组件</p>
    <div class="elements-grid">
      <div class="el-card el-1" @click="emit('navigate', 7)">
        <div class="el-num">01</div>
        <div class="el-icon"><IllusIcon name="clock" :size="36" color="#2563EB" /></div>
        <div class="el-name">Automations</div>
        <div class="el-desc">自动触发器<br/>Loop 的心跳</div>
      </div>
      <div class="el-card el-2" @click="emit('navigate', 8)">
        <div class="el-num">02</div>
        <div class="el-icon"><IllusIcon name="tree" :size="36" color="#0D9488" /></div>
        <div class="el-name">Worktrees</div>
        <div class="el-desc">并行隔离<br/>防止文件冲突</div>
      </div>
      <div class="el-card el-3" @click="emit('navigate', 9)">
        <div class="el-num">03</div>
        <div class="el-icon"><IllusIcon name="document" :size="36" color="#EA580C" /></div>
        <div class="el-name">Skills</div>
        <div class="el-desc">技能文件<br/>固化项目知识</div>
      </div>
      <div class="el-card el-4" @click="emit('navigate', 10)">
        <div class="el-num">04</div>
        <div class="el-icon"><IllusIcon name="plug" :size="36" color="#7C3AED" /></div>
        <div class="el-name">Connectors</div>
        <div class="el-desc">MCP 连接器<br/>接入真实工具</div>
      </div>
      <div class="el-card el-5" @click="emit('navigate', 11)">
        <div class="el-num">05</div>
        <div class="el-icon"><IllusIcon name="robot" :size="36" color="#E11D48" /></div>
        <div class="el-name">Sub-Agents</div>
        <div class="el-desc">子 Agent<br/>制作者 / 检查者</div>
      </div>
      <div class="el-card el-6" @click="emit('navigate', 12)">
        <div class="el-num">+</div>
        <div class="el-icon"><IllusIcon name="memory" :size="36" color="#0891B2" /></div>
        <div class="el-name">Memory</div>
        <div class="el-desc">持久记忆<br/>Loop 的脊柱</div>
      </div>
    </div>
    <div class="elements-hint">点击卡片或继续翻页查看每个要素详解</div>
  </div>
</template>

<style scoped>
.elements-grid {
  display: grid; grid-template-columns: repeat(6, 1fr); gap: 12px;
  width: 100%; max-width: 1100px; margin-bottom: 12px;
}
.el-card {
  background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 16px;
  padding: 20px 12px; text-align: center; cursor: pointer;
  transition: all 0.2s; box-shadow: 0 2px 8px rgba(15,23,42,0.04);
}
.el-card:hover { transform: translateY(-4px); box-shadow: 0 8px 32px rgba(15,23,42,0.1); }
.el-num { font-size: 11px; color: #CBD5E1; margin-bottom: 8px; font-weight: 700; }
.el-icon { margin-bottom: 10px; display: flex; justify-content: center; }
.el-name { font-size: 13px; font-weight: 700; color: #1E293B; margin-bottom: 6px; }
.el-desc { font-size: 11px; color: #94A3B8; line-height: 1.5; }
.el-1:hover { border-color: rgba(37,99,235,0.4); background: #DBEAFE; }
.el-2:hover { border-color: rgba(13,148,136,0.4); background: #CCFBF1; }
.el-3:hover { border-color: rgba(234,88,12,0.4); background: #FFEDD5; }
.el-4:hover { border-color: rgba(124,58,237,0.4); background: #EDE9FE; }
.el-5:hover { border-color: rgba(225,29,72,0.4); background: #FFE4E6; }
.el-6:hover { border-color: rgba(8,145,178,0.4); background: #CFFAFE; }
.elements-hint { font-size: 13px; color: #CBD5E1; }
</style>
