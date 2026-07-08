<script setup lang="ts">
import { ref } from 'vue'
defineProps<{ active: boolean }>()
const activeTab = ref<'claude' | 'codex'>('claude')
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
            <div><strong>/loop</strong> 按固定间隔循环运行；<strong>/goal</strong> 持续直到条件满足</div>
          </div>
          <div class="cp-row">
            <span class="cp-num">③</span>
            <div>完成后由<strong>独立小模型</strong>评判——写代码的 Agent 不给自己打分</div>
          </div>
        </div>
      </div>

      <!-- 右侧：Tab 面板 -->
      <div class="tab-panel">
        <div class="tab-nav">
          <button
            :class="['tab-btn', { active: activeTab === 'claude' }]"
            @click="activeTab = 'claude'"
          >◆ Claude Code</button>
          <button
            :class="['tab-btn', { active: activeTab === 'codex' }]"
            @click="activeTab = 'codex'"
          >◇ Codex App</button>
        </div>

        <!-- Claude Code Tab -->
        <div v-if="activeTab === 'claude'" class="tab-content">
          <div class="illus-code">
            <div class="code-label">/loop — 按时间间隔循环运行（单位 s / m / h / d）</div>
            <pre><code><span class="c"># 语法：/loop [间隔] [提示词]</span>
/loop 2m 检查 CI 状态是否通过

<span class="c"># 省略间隔 → Claude 动态决定频率</span>
/loop 监控 PR 合并状态

<span class="c"># 省略一切 → 运行内置维护提示（巡检模式）</span>
/loop</code></pre>
          </div>
          <div class="illus-code">
            <div class="code-label">/goal — 持续运行直到条件达成（独立小模型逐轮验证）</div>
            <pre><code><span class="c"># 语法：/goal "可验证的完成条件"</span>
/goal "auth 模块所有测试通过，且 lint 干净"</code></pre>
          </div>
          <div class="illus-code demo-block">
            <div class="code-label demo-label">🌤 演示：每 2 分钟查一次北京天气，共 3 次后停止</div>
            <pre><code>/loop 2m 用 beijing-weather skill 查询北京实时天气

<span class="c"># 触发点：2 min ▸ 4 min ▸ 6 min，第 3 次后按 Esc 停止</span></code></pre>
          </div>
        </div>

        <!-- Codex App Tab -->
        <div v-if="activeTab === 'codex'" class="tab-content">
          <div class="illus-code">
            <div class="code-label">Automation — 对话内描述 或 TOML 配置文件两种方式</div>
            <pre><code><span class="c"># 方式 1：直接在对话框告诉 Codex（Thread Automation）</span>
"每 2 分钟用 $beijing-weather 查一次北京天气，共 3 次后停止"

<span class="c"># 方式 2：TOML 配置 .codex/automations/weather.toml</span>
prompt   = "用 $beijing-weather skill 查北京实时天气"
schedule = "*/2 * * * *"  <span class="c"># 每 2 分钟（cron 语法）</span>
max_runs = 3              <span class="c"># 执行 3 次后自动停止</span></code></pre>
          </div>
          <div class="illus-code">
            <div class="code-label">/goal — 持续运行直到目标达成（跨 session 保持状态）</div>
            <pre><code><span class="c"># 先在 ~/.codex/config.toml 开启 feature flag</span>
[features]
goals = true

<span class="c"># 然后在对话中输入目标：</span>
/goal "6 分钟内每隔 2 分钟查询北京天气，共 3 次"
/goal status  <span class="c"># 查看进度</span>
/goal pause   <span class="c"># 暂停</span>
/goal clear   <span class="c"># 清除目标</span></code></pre>
          </div>
          <div class="illus-code demo-block">
            <div class="code-label demo-label">🌤 演示：Codex App 版天气查询（同样效果）</div>
            <pre><code><span class="c"># 在对话中告诉 Codex 即可，无需额外配置</span>
"帮我每 2 分钟用 $beijing-weather 查一次北京天气，
 2 min、4 min、6 min 各触发一次，共 3 次后停止"</code></pre>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<style scoped>
/* Tab 面板容器 */
.tab-panel {
  display: flex;
  flex-direction: column;
  gap: 0;
  min-width: 0;
}

/* Tab 导航栏 */
.tab-nav {
  display: flex;
  gap: 4px;
  margin-bottom: 0;
}

.tab-btn {
  padding: 8px 22px;
  border-radius: 8px 8px 0 0;
  border: 1.5px solid var(--illus-border);
  border-bottom: none;
  background: rgba(255, 252, 242, 0.38);
  color: rgba(58, 52, 43, 0.55);
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  letter-spacing: 0.4px;
  transition: all 0.18s;
}

.tab-btn.active {
  background: rgba(42, 37, 30, 0.92);
  color: #FFF7DF;
  border-color: rgba(255, 252, 242, 0.18);
}

.tab-btn:hover:not(.active) {
  background: rgba(255, 252, 242, 0.72);
  color: var(--illus-text);
}

/* Tab 内容区 */
.tab-content {
  display: flex;
  flex-direction: column;
  gap: 8px;
  border-radius: 0 8px 8px 8px;
  overflow: visible;
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
