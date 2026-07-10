<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="split-layout">
      <div class="summary-panel split-left">
        <div class="slide-tag">实践</div>
        <h2 class="slide-title">如何开始你的第一个 Loop？</h2>
        <p class="slide-subtitle">从最小可用的 Loop 开始，理解后再逐步扩展。</p>
        <div class="core-statement">
          第一条规则：先让 Loop 只读、只记录。等你理解它的行为，再逐步交给它写代码和开 PR。
        </div>
      </div>

      <div class="practice-stack split-right">
        <div class="steps-phases">
          <div class="phase">
            <div class="phase-badge">阶段 1 · 只读</div>
            <div class="phase-desc">阅读需求文档 → 写 TODO.md</div>
            <div class="phase-human">人工：读 TODO 决定今天做什么</div>
          </div>
          <div class="phase">
            <div class="phase-badge">阶段 2 · 草稿</div>
            <div class="phase-desc">起草修复 → 运行测试</div>
            <div class="phase-human">人工：审查 diff 再 push</div>
          </div>
          <div class="phase">
            <div class="phase-badge">阶段 3 · 半自动</div>
            <div class="phase-desc">开 Draft PR → 通知企业微信</div>
            <div class="phase-human">人工：点击 Merge</div>
          </div>
          <div class="phase">
            <div class="phase-badge">阶段 4 · 全自动</div>
            <div class="phase-desc">双 Agent + CI 绿自动合并</div>
            <div class="phase-human">人工：异常时介入</div>
          </div>
        </div>
        <div class="start-tip">
          <div class="tip-title">
            <IllusIcon name="rocket" :size="22" color="#4E6750" />
            推荐第一个 Loop（零风险版）
          </div>
          <div class="tip-code">
            <code>/loop "读取产品最新的需求文档，整理成按优先级排序的待办摘要，写入 TODO.md。不要编辑源代码文件，不要开 PR。" --schedule "0 8 * * 1-5"</code>
          </div>
          <div class="tip-note">这个 Loop 每天早上根据最新需求帮你整理好待办清单，风险几乎为零，是理解 Loop 行为的最好起点。</div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.practice-stack { display: grid; gap: 16px; }
.steps-phases {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
}
.phase {
  padding: 15px 16px; border-radius: 8px; border: 1.5px solid rgba(93,67,33,0.16);
  background: rgba(255, 252, 242, 0.68); text-align: left;
  box-shadow: 0 8px 18px rgba(68,54,28,0.06);
}
.phase-badge { font-size: 12px; font-weight: 800; margin-bottom: 8px; color: #4E6750; }
.phase-desc { font-size: 14px; color: #171512; margin-bottom: 8px; line-height: 1.5; font-weight: 700; }
.phase-human { font-size: 12px; color: rgba(58,52,43,0.62); }
.start-tip {
  background: rgba(226,187,112,0.16); border: 1.5px solid rgba(194,142,45,0.28);
  border-radius: 8px; padding: 18px 20px;
}
.tip-title {
  font-size: 14px; font-weight: 800; color: #4E6750; margin-bottom: 12px;
  display: flex; align-items: center; gap: 8px;
}
.tip-code {
  background: rgba(42,37,30,0.92); border-radius: 8px; padding: 12px 16px; margin-bottom: 10px;
  overflow: auto; border: 1.5px solid rgba(93,67,33,0.16);
}
.tip-code code { font-family: monospace; font-size: 13px; color: #FFF7DF; line-height: 1.6; white-space: pre-wrap; }
.tip-note { font-size: 13px; color: #3A342B; line-height: 1.6; }
</style>
