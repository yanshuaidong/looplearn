<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="split-layout">
      <div class="summary-panel split-left">
        <div class="slide-tag">风险</div>
        <h2 class="slide-title">Loop Engineering 的三大风险</h2>
        <p class="slide-subtitle">Loop 越好，这些问题就越尖锐，不是更容易。</p>
        <div class="core-statement">
          两个人可以构建完全相同的 Loop，却得到截然相反的结果。Loop 不知道区别，<strong>你知道。</strong>
        </div>
      </div>

      <div class="risks-grid split-right">
        <div class="risk-card">
          <div class="risk-icon"><IllusIcon name="warning" :size="30" color="#C28E2D" /></div>
          <div>
            <div class="risk-num">01</div>
            <div class="risk-title">验证仍然是你的责任</div>
            <div class="risk-body">无人值守运行的 Loop，也是<strong>无人值守地犯错</strong>的 Loop。「通过了验证」是声明，不是证明。</div>
            <div class="risk-action">→ 代码审查不能消失</div>
          </div>
        </div>
        <div class="risk-card">
          <div class="risk-icon"><IllusIcon name="book" :size="30" color="#A8463E" /></div>
          <div>
            <div class="risk-num">02</div>
            <div class="risk-title">理解债（Comprehension Debt）</div>
            <div class="risk-body">Loop 交付代码越快，你实际理解的代码比例就越低。顺畅的 Loop <strong>加速了知识债的积累</strong>。</div>
            <div class="risk-action">→ 读 Loop 产出的代码</div>
          </div>
        </div>
        <div class="risk-card">
          <div class="risk-icon"><IllusIcon name="user" :size="30" color="#8A5A2D" /></div>
          <div>
            <div class="risk-num">03</div>
            <div class="risk-title">认知投降（Cognitive Surrender）</div>
            <div class="risk-body">当 Loop 自动运转时，接受它返回的任何结果是最舒适的选择。这是<strong>最隐性的危险</strong>。</div>
            <div class="risk-action">→ 带着判断力去设计，而非逃避思考</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.risks-grid {
  display: grid;
  gap: 14px;
}
.risk-card {
  display: grid;
  grid-template-columns: 42px 1fr;
  gap: 14px;
  border-radius: 8px;
  padding: 16px 18px;
  border: 1.5px solid rgba(93,67,33,0.16);
  background: rgba(255, 252, 242, 0.68);
  box-shadow: 0 8px 18px rgba(68,54,28,0.06);
}
.risk-icon { padding-top: 2px; }
.risk-num { font-size: 13px; font-weight: 800; margin-bottom: 4px; color: rgba(58,52,43,0.5); }
.risk-title { font-size: 16px; font-weight: 700; color: #171512; margin-bottom: 8px; }
.risk-body { font-size: 14px; color: #3A342B; line-height: 1.72; margin-bottom: 8px; }
.risk-body strong { color: #171512; }
.risk-action { font-size: 13px; font-weight: 700; color: #4E6750; }
</style>
