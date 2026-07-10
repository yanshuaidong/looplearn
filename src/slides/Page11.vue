<script setup lang="ts">
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-two-col">
      <div class="summary-panel">
        <div class="el-badge el-b-4">04 / Connectors</div>
        <div class="el-title-row">
          <div>
            <h2>MCP 连接器</h2>
            <p class="el-subtitle">把 Loop 从文件系统扩展到你的真实工具链。</p>
          </div>
        </div>
        <div class="core-statement">
          Connector 让 Loop 能读取任务系统、调用 API、发通知，把结果送回真实工作流。
        </div>
      </div>
      <div class="el-explain">
        <div class="el-point">
          <span class="dot dot-purple">●</span>
          <div>只能看文件系统的 Loop 是个<strong>微小的 Loop</strong></div>
        </div>
        <div class="el-point">
          <span class="dot dot-purple">●</span>
          <div>基于 MCP 协议，读取 Issue 追踪、查询数据库、调用 API、发企业微信消息</div>
        </div>
        <div class="el-point">
          <span class="dot dot-purple">●</span>
          <div>Claude Code 和 Codex 均原生支持 MCP，<strong>连接器通常可以跨工具复用</strong></div>
        </div>
        <div class="el-highlight">
          <div class="hl-before">之前：Agent 说「这里是修复方案」</div>
          <div class="hl-after">之后：Loop 自动开 PR → 关联 Ticket → CI 通过后通知频道</div>
        </div>
        <div class="connector-tools">
          <div class="ct-item">GitHub</div>
          <div class="ct-item">Linear</div>
          <div class="ct-item">企业微信</div>
          <div class="ct-item">数据库</div>
          <div class="ct-item">Staging API</div>
          <div class="ct-item">CI / CD</div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dot-purple { color: #8A5A2D; flex-shrink: 0; }
.connector-tools {
  display: grid; grid-template-columns: repeat(2, 1fr); gap: 12px;
  align-content: start;
}
.ct-item {
  background: rgba(255, 252, 242, 0.68); border: 1.5px solid rgba(93,67,33,0.16);
  border-radius: 8px; padding: 12px 14px; display: flex; align-items: center;
  gap: 10px; font-size: 14px; color: #3A342B; font-weight: 600;
  box-shadow: 0 8px 18px rgba(68,54,28,0.06);
}
.el-highlight {
  background: rgba(255, 252, 242, 0.68); border: 1.5px solid rgba(93,67,33,0.16); border-radius: 8px;
  padding: 16px; margin-top: 4px;
  box-shadow: 0 8px 18px rgba(68,54,28,0.06);
}
.hl-before { color: #A8463E; font-size: 13px; margin-bottom: 8px; }
.hl-after { color: #4E6750; font-size: 13px; font-weight: 700; }
</style>
