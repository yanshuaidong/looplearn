<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-summary" :class="{ active }">
    <div class="summary-blob summary-blob-1"></div>
    <div class="summary-blob summary-blob-2"></div>
    <div class="summary-content">
      <div class="slide-tag">总结</div>
      <h2 class="summary-title">Build the Loop.<br/>Stay the Engineer.</h2>
      <p class="summary-sub">构建循环。保持工程师的身份。</p>
      <div class="summary-points">
        <div class="sp"><IllusIcon name="loop" :size="20" color="#0D9488" /> Loop Engineering = 设计驱动 Agent 的系统，而非直接提示 Agent</div>
        <div class="sp"><IllusIcon name="gear" :size="20" color="#2563EB" /> 六要素：Automations · Worktrees · Skills · Connectors · Sub-Agents · Memory</div>
        <div class="sp"><IllusIcon name="rocket" :size="20" color="#EA580C" /> 杠杆点移动了：从写提示词，到设计让 Agent 自主运行的控制系统</div>
        <div class="sp"><IllusIcon name="user" :size="20" color="#7C3AED" /> Loop 设计比 Prompt 工程更难，不是更容易——因为你在设计整套系统</div>
        <div class="sp"><IllusIcon name="warning" :size="20" color="#E11D48" /> 设计 Loop 时带着判断力，而不是用它来逃避思考</div>
      </div>
      <div class="summary-quote">
        "Loop design is harder than prompt engineering, not easier.<br/>
        The leverage point moved."
        <span class="sq-author">— Addy Osmani · Google Chrome</span>
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
</template>

<style scoped>
.slide-summary { overflow: hidden; }

.summary-blob {
  position: absolute; border-radius: 50%; pointer-events: none;
}
.summary-blob-1 {
  top: -60px; right: -40px; width: 350px; height: 350px;
  background: radial-gradient(circle, rgba(226,187,112,0.14) 0%, transparent 70%);
}
.summary-blob-2 {
  bottom: -80px; left: -60px; width: 400px; height: 400px;
  background: radial-gradient(circle, rgba(78,103,80,0.1) 0%, transparent 70%);
}

.summary-content { position: relative; text-align: center; max-width: 800px; }
.summary-title {
  font-size: 48px; font-weight: 800; line-height: 1.2;
  background: linear-gradient(135deg, #0D9488, #2563EB);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
  margin-bottom: 10px;
}
.summary-sub { font-size: 20px; color: #64748B; margin-bottom: 28px; letter-spacing: 2px; }
.summary-points {
  text-align: left; display: flex; flex-direction: column; gap: 10px;
  margin-bottom: 24px;
}
.sp {
  font-size: 14px; color: #64748B; line-height: 1.6;
  background: #FFFFFF; border: 1.5px solid #E2E8F0;
  padding: 10px 16px; border-radius: 10px;
  display: flex; align-items: center; gap: 10px;
  box-shadow: 0 2px 8px rgba(15,23,42,0.04);
}
.summary-quote {
  background: #CCFBF1; border-left: 3px solid #0D9488;
  padding: 16px 20px; border-radius: 0 12px 12px 0;
  font-size: 14px; color: #64748B; font-style: italic;
  margin-bottom: 20px; text-align: left;
}
.sq-author { display: block; margin-top: 8px; font-style: normal; font-size: 13px; color: #0D9488; font-weight: 600; }
.summary-resources { text-align: center; }
.res-label { font-size: 12px; color: #CBD5E1; margin-bottom: 10px; }
.res-links { display: flex; gap: 16px; justify-content: center; flex-wrap: wrap; }
.res-links a { font-size: 13px; color: #2563EB; text-decoration: none; font-weight: 500; }
.res-links a:hover { color: #0D9488; text-decoration: underline; }
</style>
