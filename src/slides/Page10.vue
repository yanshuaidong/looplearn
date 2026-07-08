<script setup lang="ts">
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-two-col">
      <div class="summary-panel">
        <div class="el-badge el-b-3">03 / Skills</div>
        <div class="el-title-row">
          <div>
            <h2>技能文件</h2>
            <p class="el-subtitle">让 Agent 不再每次会话都要重新推断你的项目上下文。</p>
          </div>
        </div>
        <div class="core-statement">
          Skill 把团队约定、构建步骤和历史教训固化下来，让每一次 Loop 都从更好的起点开始。
        </div>
      </div>
      <div class="el-explain">
        <div class="el-point">
          <span class="dot dot-orange">●</span>
          <div>一个包含 <code>SKILL.md</code> 的文件夹，写明项目约定、构建步骤、历史教训</div>
        </div>
        <div class="el-point">
          <span class="dot dot-orange">●</span>
          <div>Agent 每次运行都会加载，而不是每次都<strong>靠猜测重新推导</strong></div>
        </div>
        <div class="el-point">
          <span class="dot dot-orange">●</span>
          <div>把「只有你知道」的上下文变成「Agent 也知道」的<strong>结构化输入</strong></div>
        </div>
        <div class="el-prose">
          <p>Skills（技能文件）解决的是一个每次都在浪费的成本：每次新对话，Agent 都要从零推断你的项目规范。</p>
          <p>Skill 是一个包含 <code>SKILL.md</code> 文件的文件夹，写明了项目约定、构建步骤、"我们不这样做是因为那次事故"等知识。Agent 在每次会话开始时加载 Skill，而不是每次都重新猜测。</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dot-orange { color: #C28E2D; flex-shrink: 0; }

.el-prose {
  background: var(--illus-surface);
  border: 1.5px solid var(--illus-border);
  border-radius: 8px;
  padding: 16px 18px;
  box-shadow: var(--illus-shadow-sm);
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.el-prose p {
  margin: 0;
  font-size: 15px;
  color: var(--illus-text-secondary);
  line-height: 1.74;
}

.el-prose code {
  background: rgba(194, 142, 45, 0.12);
  padding: 1px 6px;
  border-radius: 4px;
  font-size: 13px;
  color: #8A5A2D;
  font-weight: 500;
}
</style>
