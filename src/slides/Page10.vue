<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-badge el-b-3">03 / Skills</div>
    <div class="el-title-row">
      <div class="el-icon-wrap" style="background:#FFEDD5"><IllusIcon name="document" :size="32" color="#EA580C" /></div>
      <div>
        <h2>技能文件</h2>
        <p class="el-subtitle">让 Agent 不再每次会话都要重新推断你的项目上下文</p>
      </div>
    </div>
    <div class="el-two-col">
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
        <div class="el-point">
          <span class="dot dot-orange">●</span>
          <div>Skill 是<strong>编写格式</strong>，Plugin 是<strong>分发方式</strong>，打包后队友一次安装即可</div>
        </div>
      </div>
      <div class="illus-code">
        <div class="code-label">SKILL.md 示例</div>
        <pre><code>---
name: project-conventions
description: 代码规范和构建步骤
---

## 技术栈
- Node.js 20 + TypeScript + Fastify
- 测试框架：Vitest

## 构建命令
- pnpm test
- pnpm typecheck

## 禁止事项
- 不得在业务层直接写 SQL
- 不得提交真实密钥</code></pre>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dot-orange { color: #EA580C; flex-shrink: 0; }
</style>
