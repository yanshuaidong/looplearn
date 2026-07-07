<script setup lang="ts">
import aiEvolutionChain from '../assets/ai-evolution-chain.png'

defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-evolution" :class="{ active }">
    <div class="evolution-layout">
      <div class="evolution-visual">
        <img
          :src="aiEvolutionChain"
          alt="Prompt、Context、Harness、Loop 四阶段 AI 开发演进水彩插画"
        />
      </div>

      <div class="evolution-copy">
        <p class="evolution-kicker">AI 工程的四次演进</p>
        <h2 class="evolution-title">从提示词，到持续交付结果的循环系统</h2>
        <p class="evolution-lead">
          过去两年，AI 开发的重点正在不断变化。
        </p>
        <p>
          从研究如何写好提示词（Prompt），逐步发展到组织上下文（Context）、
          编排工具与流程（Harness），再到构建能够自主运行、持续交付结果的循环系统（Loop）。
        </p>
        <p class="evolution-emphasis">
          这不是简单的工具升级，而是 AI 开发者工作重心的迁移：从一次性表达意图，
          走向设计可观察、可修正、可反复创造结果的工作循环。
        </p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.slide-evolution {
  background:
    radial-gradient(circle at 16% 22%, rgba(226, 187, 112, 0.2), transparent 31%),
    radial-gradient(circle at 86% 72%, rgba(78, 103, 80, 0.13), transparent 35%),
    #F4E8C8;
  color: #171512;
  overflow: hidden;
}

.evolution-layout {
  position: relative;
  display: grid;
  grid-template-columns: minmax(520px, 1.04fr) minmax(420px, 0.96fr);
  align-items: center;
  gap: 42px;
  width: min(1160px, 100%);
  z-index: 1;
}

.evolution-visual {
  display: flex;
  align-items: center;
  justify-content: center;
  min-width: 0;
}

.evolution-visual img {
  display: block;
  width: min(48vw, 570px);
  max-height: 78vh;
  object-fit: contain;
  filter: drop-shadow(0 18px 22px rgba(68, 54, 28, 0.09)) saturate(0.96);
}

.evolution-copy {
  text-align: left;
  color: #3A342B;
}

.evolution-kicker {
  margin: 0 0 12px;
  color: #4E6750;
  font-size: 15px;
  font-weight: 700;
  letter-spacing: 3px;
}

.evolution-title {
  margin: 0 0 24px;
  font-family: Georgia, 'Times New Roman', 'Songti SC', serif;
  font-size: clamp(36px, 4vw, 52px);
  font-weight: 500;
  line-height: 1.12;
  letter-spacing: 0;
  color: #171512;
}

.evolution-lead {
  color: #4E6750;
  font-size: 21px;
  font-weight: 650;
  line-height: 1.72;
}

.evolution-copy p {
  margin: 0 0 18px;
  font-size: 17px;
  line-height: 1.9;
}

.evolution-emphasis {
  padding: 16px 18px;
  border-left: 4px solid #C28E2D;
  background: rgba(255, 252, 242, 0.62);
  color: #2D291F;
  font-weight: 600;
}

@media (max-width: 980px) {
  .evolution-layout {
    grid-template-columns: 1fr;
    gap: 22px;
  }

  .evolution-visual {
    order: 2;
  }

  .evolution-visual img {
    width: min(72vw, 360px);
    max-height: 48vh;
  }

  .evolution-copy {
    order: 1;
  }
}
</style>
