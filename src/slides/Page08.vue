<script setup lang="ts">
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-element" :class="{ active }">
    <div class="el-two-col">

      <!-- 左侧：概念 -->
      <div class="summary-panel">
        <div class="el-badge el-b-1">01 / Automations</div>
        <div class="el-title-row">
          <div>
            <h2>自动触发器</h2>
            <p class="el-subtitle">让 Loop 成为真正的循环，而不只是你做了一次的操作。</p>
          </div>
        </div>
        <div class="core-statement">
          Automation 是 Loop 的心跳：它负责按节奏唤醒系统，让 Agent 自己发现下一轮工作。
        </div>
        <div class="concept-list">
          <div class="cp-row">
            <span class="cp-num">①</span>
            <div><strong>做什么</strong>：定义任务 + 设定节奏，Agent 自动按时执行，不需要人每次触发</div>
          </div>
          <div class="cp-row">
            <span class="cp-num">②</span>
            <div><strong>/loop</strong> 按固定间隔循环运行</div>
          </div>
          <div class="cp-row">
            <span class="cp-num">③</span>
            <div>完成后由<strong>独立小模型</strong>评判——写代码的 Agent 不给自己打分</div>
          </div>
        </div>
      </div>

      <!-- 右侧：示例 -->
      <div class="example-panel">
        <div class="illus-code">
          <div class="code-label">/loop — 按时间间隔循环运行（单位 s / m / h / d）</div>
          <pre><code><span class="c"># 语法：/loop [间隔] [提示词]</span>
/loop 60m 每60分钟提醒我喝水</code></pre>
        </div>
        <div class="illus-code demo-block">
          <div class="code-label demo-label">🌤 演示：每 2 分钟查一次北京天气，共 3 次后停止</div>
          <pre><code>/loop 2m

每 2 分钟执行一次，共执行 3 次后自动停止。

每次只做：
1. 读取并执行 @weather skill
2. 运行 bash weather/scripts/query-beijing.sh
3. 原样输出脚本返回的那一行文字

要求：
- 总共只执行 3 次（含第一次立即执行）
- 第 3 次输出后停止 loop，不要再继续
- 不要创建或修改任何文件
- 不要解释、不要标题、不要表格、不要多余说明
- 每次回复只包含那一行天气文字</code></pre>
        </div>
      </div>

    </div>
  </div>
</template>

<style scoped>
/* 右侧示例面板 */
.example-panel {
  display: flex;
  flex-direction: column;
  gap: 8px;
  min-width: 0;
}

/* 演示代码块特殊样式 */
.demo-block {
  border-color: rgba(194, 142, 45, 0.55) !important;
  box-shadow: 0 0 0 1px rgba(194, 142, 45, 0.15), var(--illus-shadow) !important;
}

.demo-label {
  color: rgba(226, 187, 112, 0.88) !important;
}

/* 左侧概念列表 */
.concept-list {
  margin-top: 18px;
  display: flex;
  flex-direction: column;
  gap: 9px;
}

.cp-row {
  display: flex;
  gap: 10px;
  align-items: flex-start;
  font-size: 14px;
  color: var(--illus-text-secondary);
  line-height: 1.7;
  background: var(--illus-surface);
  border: 1.5px solid var(--illus-border);
  border-radius: 8px;
  padding: 11px 13px;
  box-shadow: var(--illus-shadow-sm);
}

.cp-row strong { color: var(--illus-text); }

.cp-num {
  font-weight: 700;
  color: var(--illus-gold);
  flex-shrink: 0;
  font-size: 15px;
  line-height: 1.7;
}
</style>
