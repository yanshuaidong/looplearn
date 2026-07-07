<script setup lang="ts">
import salonOrigin from '../assets/loop-engineering-salon-text.png'

defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-origin" :class="{ active }">
    <div class="origin-layout">
      <div class="origin-visual">
        <img
          :src="salonOrigin"
          alt="Boris Cherny 与 Peter Steinberger 在沙发沙龙中用中英双语气泡分享 Loop Engineering 观点"
        />
      </div>

      <div class="origin-copy">
        <h2 class="origin-title">Loop Engineering 从哪里来？</h2>
        <p class="origin-lead">
          Loop Engineering（循环工程）是 2026 年 6 月在 AI 编程社区迅速传播的一个新概念。
        </p>

        <div class="origin-story">
          <p>
            Google 工程师 <strong>Addy Osmani</strong> 对这一趋势做了系统整理；与此同时，
            Anthropic Claude Code 负责人 <strong>Boris Cherny</strong> 和开发者
            <strong>Peter Steinberger</strong> 在公开场合分别提出了相同观点：
          </p>
          <p class="origin-quote">
            工程师的核心工作，正在从“写好一次提示词”转向“设计能持续提示、执行、观察和修正的循环”。
          </p>
          <p>
            本文将带你从零理解什么是 Loop Engineering、它与 Prompt Engineering 的本质区别、
            构成一个完整 Agent Loop 的六大要素，以及如何设计自己的第一个可运行 Loop。
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.slide-origin {
  background:
    radial-gradient(circle at 18% 20%, rgba(226, 187, 112, 0.18), transparent 30%),
    radial-gradient(circle at 88% 74%, rgba(78, 103, 80, 0.13), transparent 34%),
    #F4E8C8;
  color: #171512;
  overflow: hidden;
}

.slide-origin::before {
  content: "";
  position: absolute;
  inset: 0;
  background-image:
    linear-gradient(rgba(93, 67, 33, 0.035) 1px, transparent 1px),
    linear-gradient(90deg, rgba(93, 67, 33, 0.025) 1px, transparent 1px);
  background-size: 32px 32px, 44px 44px;
  mix-blend-mode: multiply;
  opacity: 0.5;
  pointer-events: none;
}

.origin-layout {
  position: relative;
  display: grid;
  grid-template-columns: minmax(520px, 1.08fr) minmax(420px, 0.92fr);
  align-items: center;
  gap: 52px;
  width: min(1160px, 100%);
  z-index: 1;
}

.origin-visual {
  display: flex;
  align-items: center;
  justify-content: center;
  min-width: 0;
}

.origin-visual img {
  display: block;
  width: min(58vw, 660px);
  max-height: 74vh;
  object-fit: contain;
  filter: drop-shadow(0 18px 24px rgba(68, 54, 28, 0.1));
}

.origin-copy {
  text-align: left;
}

.origin-title {
  margin: 0 0 18px;
  font-family: Georgia, 'Times New Roman', 'Songti SC', serif;
  font-size: clamp(38px, 4.4vw, 58px);
  font-weight: 500;
  line-height: 1.12;
  letter-spacing: 0;
  color: #171512;
}

.origin-lead {
  margin: 0 0 24px;
  color: #4E6750;
  font-size: 20px;
  line-height: 1.7;
  font-weight: 600;
}

.origin-story {
  display: grid;
  gap: 16px;
  color: #3A342B;
  font-size: 16px;
  line-height: 1.86;
}

.origin-story strong {
  color: #171512;
  font-weight: 700;
}

.origin-quote {
  padding: 16px 18px;
  border-left: 4px solid #C28E2D;
  background: rgba(255, 252, 242, 0.62);
  color: #2D291F;
  font-weight: 600;
}

@media (max-width: 980px) {
  .origin-layout {
    grid-template-columns: 1fr;
    gap: 22px;
  }

  .origin-visual {
    order: 2;
  }

  .origin-visual img {
    width: min(88vw, 620px);
    max-height: 44vh;
  }

  .origin-copy {
    order: 1;
  }
}
</style>
