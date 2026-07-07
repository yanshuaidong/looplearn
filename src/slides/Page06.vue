<script setup lang="ts">
import comparisonImage from '../assets/loop-engineering-mode-comparison-ai-style-transparent.png'

defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide comparison-slide" :class="{ active }">
    <header class="comparison-header">
      <h2 class="slide-title">Prompt Engineering vs Loop Engineering</h2>
      <p class="slide-subtitle">提示词工程 vs 循环工程</p>
    </header>

    <img
      class="comparison-image"
      :src="comparisonImage"
      alt="Prompt Engineering 与 Loop Engineering 的对比图"
    />

    <p class="comparison-note">
      Prompt Engineering 并没有消亡。一个 Loop 是由多个 Prompt 组成的，写得差的 Prompt 放进 Loop 里只会让糟糕的工作以更快的速度产出。Loop Engineering 是在 Prompt Engineering 之上的层次，而不是替代它。
    </p>
  </div>
</template>

<style scoped>
.comparison-slide {
  justify-content: flex-start;
  padding: 28px 48px 24px;
  gap: 12px;
}

.comparison-header {
  width: min(1120px, 100%);
  text-align: center;
}

.comparison-header .slide-title {
  margin-bottom: 6px;
  font-size: clamp(26px, 2.6vw, 38px);
}

.comparison-header .slide-subtitle {
  margin-bottom: 0;
  font-size: 15px;
  color: var(--illus-green);
  font-weight: 700;
}

.comparison-image {
  display: block;
  flex: 1;
  width: min(96vw, 1180px);
  min-height: 0;
  max-height: calc(100vh - 200px);
  object-fit: contain;
  z-index: 1;
}

.comparison-note {
  width: min(1020px, 100%);
  margin: 0;
  padding: 12px 18px;
  background: rgba(255, 252, 242, 0.78);
  border: 1.5px solid rgba(93, 67, 33, 0.16);
  border-left: 4px solid var(--illus-gold);
  border-radius: 8px;
  box-shadow: 0 8px 18px rgba(68, 54, 28, 0.06);
  color: var(--illus-text-secondary);
  font-size: 14px;
  line-height: 1.68;
  text-align: left;
}

@media (max-width: 980px) {
  .comparison-slide {
    padding: 32px 20px 24px;
    gap: 10px;
    overflow-y: auto;
  }

  .comparison-header .slide-title {
    font-size: clamp(22px, 5.2vw, 30px);
  }

  .comparison-header .slide-subtitle {
    font-size: 14px;
  }

  .comparison-image {
    flex: none;
    width: 98vw;
    max-height: none;
  }

  .comparison-note {
    font-size: 13px;
    line-height: 1.65;
    padding: 10px 14px;
  }
}
</style>
