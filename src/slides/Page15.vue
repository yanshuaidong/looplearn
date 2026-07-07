<script setup lang="ts">
import IllusIcon from '../components/illustrations/IllusIcon.vue'
defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="slide-tag">风险</div>
    <h2 class="slide-title">Loop Engineering 的三大风险</h2>
    <p class="slide-subtitle">Loop 越好，这些问题就越尖锐——不是更容易</p>
    <div class="risks-grid">
      <div class="risk-card risk-1">
        <div class="risk-icon"><IllusIcon name="warning" :size="36" color="#EA580C" /></div>
        <div class="risk-num">01</div>
        <div class="risk-title">验证仍然是你的责任</div>
        <div class="risk-body">无人值守运行的 Loop，也是<strong>无人值守地犯错</strong>的 Loop。「通过了验证」是声明，不是证明。</div>
        <div class="risk-action">→ 代码审查不能消失</div>
      </div>
      <div class="risk-card risk-2">
        <div class="risk-icon"><IllusIcon name="book" :size="36" color="#E11D48" /></div>
        <div class="risk-num">02</div>
        <div class="risk-title">理解债（Comprehension Debt）</div>
        <div class="risk-body">Loop 交付代码越快，你实际理解的代码比例就越低。顺畅的 Loop <strong>加速了知识债的积累</strong>。</div>
        <div class="risk-action">→ 读 Loop 产出的代码</div>
      </div>
      <div class="risk-card risk-3">
        <div class="risk-icon"><IllusIcon name="user" :size="36" color="#7C3AED" /></div>
        <div class="risk-num">03</div>
        <div class="risk-title">认知投降（Cognitive Surrender）</div>
        <div class="risk-body">当 Loop 自动运转时，接受它返回的任何结果是最舒适的选择。这是<strong>最隐性的危险</strong>。</div>
        <div class="risk-action">→ 带着判断力去设计，而非逃避思考</div>
      </div>
    </div>
    <div class="risks-footer">
      两个人可以构建完全相同的 Loop，却得到<strong>截然相反的结果</strong>。Loop 不知道区别，<strong>你知道。</strong>
    </div>
  </div>
</template>

<style scoped>
.risks-grid {
  display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px;
  width: 100%; max-width: 1050px; margin-bottom: 20px;
}
.risk-card {
  border-radius: 16px; padding: 24px; border: 1.5px solid;
  background: #FFFFFF; box-shadow: 0 4px 24px rgba(15,23,42,0.06);
}
.risk-1 { border-color: rgba(234,88,12,0.2); }
.risk-2 { border-color: rgba(225,29,72,0.2); }
.risk-3 { border-color: rgba(124,58,237,0.2); }
.risk-icon { margin-bottom: 8px; }
.risk-num { font-size: 28px; font-weight: 800; margin-bottom: 4px; }
.risk-1 .risk-num { color: rgba(234,88,12,0.25); }
.risk-2 .risk-num { color: rgba(225,29,72,0.25); }
.risk-3 .risk-num { color: rgba(124,58,237,0.25); }
.risk-title { font-size: 15px; font-weight: 700; color: #1E293B; margin-bottom: 12px; }
.risk-body { font-size: 13px; color: #64748B; line-height: 1.7; margin-bottom: 12px; }
.risk-body strong { color: #334155; }
.risk-action { font-size: 13px; font-weight: 600; color: #0D9488; }
.risks-footer {
  font-size: 16px; color: #64748B; text-align: center; max-width: 700px;
}
.risks-footer strong { color: #0D9488; }
</style>
