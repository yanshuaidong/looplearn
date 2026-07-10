<script setup lang="ts">
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-summary" :class="{ active }">
    <div class="split-layout">
      <div class="summary-panel split-left">
        <div class="slide-tag">总结</div>
        <h2 class="summary-title">Build the Loop.<br/>Stay the Engineer.</h2>
        <p class="summary-sub">构建循环。保持工程师的身份。</p>
        <div class="core-statement">
          <span class="term-tip term-tip--phrase" tabindex="0">
            Loop design is harder than prompt engineering, not easier. The leverage point moved.
            <span class="term-tip-body" role="tooltip">
              <span class="tip-lead">设计 Loop 比写 Prompt 更难；真正见效的关键，也从「写好一句指令」变成了「设计整条循环」。</span>
              <span class="tip-row tip-before"><strong>以前</strong>：拼一句好 Prompt，往往就能解决问题。</span>
              <span class="tip-row tip-now"><strong>现在</strong>：要规划任务边界、验证方式、人类何时介入——这些才决定 Loop 好不好用。</span>
            </span>
          </span>
          <span class="sq-author">— Addy Osmani · Google Chrome</span>
        </div>
      </div>

      <div class="summary-content split-right">
        <div class="practices-header">
          <h3 class="practices-title">最佳实践总结</h3>
          <p class="practices-desc">让 Loop 更稳、更好用的几条经验，照着做能少踩很多坑。</p>
        </div>
        <table class="practices-table">
          <thead>
            <tr>
              <th>要点</th>
              <th>怎么做</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>从小任务做起</td>
              <td>一次只做一件清楚的小事。目标太大太模糊，Agent 就不知道该动哪里、怎么判断做完了</td>
            </tr>
            <tr>
              <td>说清楚怎么验收</td>
              <td>指令里写清楚怎么检查，比如跑哪条测试（<code>pnpm test test/auth</code>）、要过哪些场景。这样才知道算不算做完</td>
            </tr>
            <tr>
              <td>少改、先验证</td>
              <td>让 Agent 每次只改一小块，检查通过再继续。一次改太多，错了也难查是哪里出问题</td>
            </tr>
            <tr>
              <td>照着项目已有写法来</td>
              <td>让 Agent 先看附近代码，复用现有组件和命名，别轻易发明新套路</td>
            </tr>
            <tr>
              <td>重要决定还是你来</td>
              <td>Agent 负责查资料和动手改；产品方向、架构取舍、最后把关留给你</td>
            </tr>
            <tr>
              <td>跑顺了就存下来</td>
              <td>某次流程特别好用，就写成 Skill 或固定命令，下次直接复用，省得重复搭</td>
            </tr>
          </tbody>
        </table>
        <div class="summary-resources">
          <div class="res-label">参考资源</div>
          <div class="res-links">
            <a href="https://addyosmani.com/blog/loop-engineering/" target="_blank">addyosmani.com</a>
            <a href="https://cobusgreyling.github.io/loop-engineering/" target="_blank">loop-engineering showcase</a>
            <a href="https://github.com/cobusgreyling/loop-engineering" target="_blank">GitHub Repo</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.slide-summary { overflow: visible; }

.summary-content { position: relative; text-align: left; }
.core-statement { overflow: visible; }

.term-tip {
  position: relative;
  cursor: help;
  color: inherit;
  border-bottom: 1.5px dashed rgba(194, 142, 45, 0.45);
  outline: none;
}

.term-tip:hover,
.term-tip:focus-visible {
  border-bottom-color: rgba(194, 142, 45, 0.85);
}

.term-tip-body {
  position: absolute;
  left: 0;
  bottom: calc(100% + 10px);
  z-index: 20;
  width: min(340px, 82vw);
  padding: 12px 14px;
  border-radius: 8px;
  border: 1.5px solid rgba(93, 67, 33, 0.18);
  background: #FFF7DF;
  box-shadow: 0 10px 28px rgba(68, 54, 28, 0.14);
  font-size: 13px;
  font-weight: 500;
  line-height: 1.55;
  color: #3A342B;
  text-align: left;
  pointer-events: none;
  opacity: 0;
  transform: translateY(4px);
  transition: opacity 0.15s ease, transform 0.15s ease;
}

.term-tip:hover .term-tip-body,
.term-tip:focus-visible .term-tip-body {
  opacity: 1;
  transform: translateY(0);
}

.tip-lead {
  display: block;
  margin-bottom: 8px;
  color: #2D291F;
  font-weight: 600;
}

.tip-row {
  display: block;
  margin-top: 6px;
  font-size: 12px;
  line-height: 1.5;
}

.tip-row strong { font-weight: 700; }
.tip-before { color: #A8463E; }
.tip-now { color: #4E6750; }

.summary-title {
  font-family: Georgia, 'Times New Roman', 'Songti SC', serif;
  font-size: clamp(44px, 5vw, 70px);
  font-weight: 500;
  line-height: 1.08;
  color: #171512;
  margin: 0 0 18px;
}
.summary-sub { font-size: 21px; color: #4E6750; margin-bottom: 0; letter-spacing: 2px; }
.sq-author { display: block; margin-top: 10px; font-size: 13px; color: #4E6750; font-weight: 700; }

.practices-header { margin-bottom: 12px; }
.practices-title {
  font-size: 16px;
  font-weight: 800;
  color: #171512;
  margin: 0 0 6px;
}
.practices-desc {
  font-size: 13px;
  color: rgba(58, 52, 43, 0.72);
  margin: 0;
  line-height: 1.5;
}

.practices-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 16px;
  font-size: 12px;
  background: rgba(255, 252, 242, 0.68);
  border: 1.5px solid rgba(93, 67, 33, 0.16);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 8px 18px rgba(68, 54, 28, 0.06);
}

.practices-table th,
.practices-table td {
  border: 1px solid rgba(93, 67, 33, 0.12);
  padding: 8px 10px;
  text-align: left;
  vertical-align: top;
  line-height: 1.55;
}

.practices-table th {
  background: rgba(78, 103, 80, 0.12);
  color: #4E6750;
  font-weight: 800;
  white-space: nowrap;
}

.practices-table td:first-child {
  font-weight: 700;
  color: #171512;
  white-space: nowrap;
  width: 1%;
}

.practices-table td:last-child {
  color: #3A342B;
}

.practices-table code {
  font-family: 'JetBrains Mono', 'Fira Code', monospace;
  font-size: 0.92em;
  background: rgba(78, 103, 80, 0.12);
  color: #4E6750;
  padding: 1px 5px;
  border-radius: 4px;
}

.summary-resources { text-align: left; }
.res-label { font-size: 12px; color: rgba(58,52,43,0.52); margin-bottom: 10px; }
.res-links { display: flex; gap: 12px; flex-wrap: wrap; }
.res-links a { font-size: 13px; color: #4E6750; text-decoration: none; font-weight: 700; }
.res-links a:hover { color: #C28E2D; text-decoration: underline; }
</style>
