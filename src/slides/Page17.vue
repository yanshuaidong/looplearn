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
          Loop design is harder than prompt engineering, not easier. The leverage point moved.
          <span class="sq-author">— Addy Osmani · Google Chrome</span>
        </div>
      </div>

      <div class="summary-content split-right">
        <div class="practices-header">
          <h3 class="practices-title">最佳实践总结</h3>
          <p class="practices-desc">以下是构建可靠 Loop 的核心原则，每条都对应一类常见的失败。</p>
        </div>
        <table class="practices-table">
          <thead>
            <tr>
              <th>原则</th>
              <th>具体做法</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>从窄任务开始</td>
              <td>每次只定义一个有明确边界的目标，宽泛的目标让 Agent 无法判断哪些文件、哪些验证信号是相关的</td>
            </tr>
            <tr>
              <td>告诉 Agent 如何验证</td>
              <td>在指令中直接写明验证命令（<code>pnpm test test/auth</code>）、验收场景或 API 端点，让"完成"可测量</td>
            </tr>
            <tr>
              <td>偏好小的可逆变更</td>
              <td>要求 Agent 做最小的连贯修改，运行验证后再扩展；大范围推测性重写难以判断是哪个假设出了问题</td>
            </tr>
            <tr>
              <td>尊重现有代码模式</td>
              <td>让 Agent 先检查相邻的实现，复用现有组件，遵循现有命名，避免引入不必要的新抽象</td>
            </tr>
            <tr>
              <td>人类保持判断席位</td>
              <td>Agent 处理证据收集和机械性修复；产品判断、架构决策、最终 Review 保留给人类</td>
            </tr>
            <tr>
              <td>沉淀可复用 Loop</td>
              <td>当某个 Loop 跑得好的时候，把它固化为 Skill 文件或标准化的触发器，降低未来的重复成本</td>
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
.slide-summary { overflow: hidden; }

.summary-content { position: relative; text-align: left; }
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
