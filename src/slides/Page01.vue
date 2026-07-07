<script setup lang="ts">
import ouroborosInfinity from '../assets/loop-ouroboros-infinity.png'

defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide slide-cover" :class="{ active }">
    <div class="paper-grain"></div>
    <div class="cover-layout">
      <div class="cover-content">
        <h1 class="cover-title">
          <span>Loop</span>
          <span>Engineering</span>
        </h1>
        <p class="cover-sub">循环工程</p>
      </div>
      <div class="cover-hero">
        <img :src="ouroborosInfinity" alt="蛇咬住尾巴形成横向 8 的循环工程插画" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.slide-cover {
  background:
    radial-gradient(circle at 22% 26%, rgba(226, 187, 112, 0.2), transparent 30%),
    radial-gradient(circle at 82% 68%, rgba(78, 103, 80, 0.12), transparent 34%),
    #F4E8C8;
  overflow: hidden;
  color: #171512;
}
.slide-cover::before { display: none; }

.paper-grain {
  position: absolute;
  inset: 0;
  background-image:
    linear-gradient(rgba(93, 67, 33, 0.035) 1px, transparent 1px),
    linear-gradient(90deg, rgba(93, 67, 33, 0.025) 1px, transparent 1px);
  background-size: 32px 32px, 44px 44px;
  mix-blend-mode: multiply;
  opacity: 0.55;
  pointer-events: none;
}

.cover-layout {
  position: relative;
  display: grid;
  grid-template-columns: minmax(360px, 0.86fr) minmax(420px, 1.14fr);
  align-items: center;
  gap: 54px;
  max-width: 1130px;
  width: 100%;
}
.cover-content { text-align: left; }
.cover-hero {
  justify-self: end;
  width: min(55vw, 620px);
}
.cover-hero img {
  display: block;
  width: 100%;
  height: auto;
  filter: drop-shadow(0 18px 24px rgba(68, 54, 28, 0.08)) saturate(0.96);
}

.cover-title {
  font-family: Georgia, 'Times New Roman', 'Songti SC', serif;
  font-size: clamp(54px, 6.2vw, 84px);
  font-weight: 500;
  line-height: 1.06;
  letter-spacing: 0;
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
}
.cover-sub {
  font-size: 24px;
  color: #4E6750;
  font-weight: 400;
  letter-spacing: 6px;
  margin-bottom: 22px;
}

@media (max-width: 860px) {
  .cover-layout {
    grid-template-columns: 1fr;
    gap: 22px;
  }

  .cover-hero {
    justify-self: center;
    width: min(78vw, 520px);
  }

  .cover-title {
    font-size: 52px;
  }
}
</style>
