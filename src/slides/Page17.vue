<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
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
        <div class="summary-points">
          <div class="sp"><IllusIcon name="loop" :size="20" color="#4E6750" /> Loop Engineering = 设计驱动 Agent 的系统，而非直接提示 Agent</div>
          <div class="sp"><IllusIcon name="gear" :size="20" color="#4E6750" /> 六要素：Automations · Worktrees · Skills · Connectors · Sub-Agents · Memory</div>
          <div class="sp"><IllusIcon name="rocket" :size="20" color="#C28E2D" /> 杠杆点移动了：从写提示词，到设计让 Agent 自主运行的控制系统</div>
          <div class="sp"><IllusIcon name="user" :size="20" color="#8A5A2D" /> Loop 设计比 Prompt 工程更难，因为你在设计整套系统</div>
          <div class="sp"><IllusIcon name="warning" :size="20" color="#A8463E" /> 设计 Loop 时带着判断力，而不是用它来逃避思考</div>
        </div>
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
.summary-points {
  display: flex; flex-direction: column; gap: 10px;
  margin-bottom: 18px;
}
.sp {
  font-size: 14px; color: #3A342B; line-height: 1.6;
  background: rgba(255, 252, 242, 0.68); border: 1.5px solid rgba(93,67,33,0.16);
  padding: 12px 16px; border-radius: 8px;
  display: flex; align-items: center; gap: 10px;
  box-shadow: 0 8px 18px rgba(68,54,28,0.06);
}
.sq-author { display: block; margin-top: 10px; font-size: 13px; color: #4E6750; font-weight: 700; }
.summary-resources { text-align: left; }
.res-label { font-size: 12px; color: rgba(58,52,43,0.52); margin-bottom: 10px; }
.res-links { display: flex; gap: 12px; flex-wrap: wrap; }
.res-links a { font-size: 13px; color: #4E6750; text-decoration: none; font-weight: 700; }
.res-links a:hover { color: #C28E2D; text-decoration: underline; }
</style>
