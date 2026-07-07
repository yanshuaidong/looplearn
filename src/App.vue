<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted, type Component } from 'vue'
import Page01 from './slides/Page01.vue'
import Page02 from './slides/Page02.vue'
import Page03 from './slides/Page03.vue'
import Page04 from './slides/Page04.vue'
import Page05 from './slides/Page05.vue'
import Page06 from './slides/Page06.vue'
import Page07 from './slides/Page07.vue'
import Page08 from './slides/Page08.vue'
import Page09 from './slides/Page09.vue'
import Page10 from './slides/Page10.vue'
import Page11 from './slides/Page11.vue'
import Page12 from './slides/Page12.vue'
import Page13 from './slides/Page13.vue'
import Page14 from './slides/Page14.vue'
import Page15 from './slides/Page15.vue'
import Page16 from './slides/Page16.vue'
import Page17 from './slides/Page17.vue'
import './assets/deck-illus.css'

const slideComponents: Component[] = [
  Page01, Page02, Page03, Page04, Page05, Page06, Page07,
  Page08, Page09, Page10, Page11, Page12, Page13, Page14,
  Page15, Page16, Page17,
]

const currentSlide = ref(0)
const total = slideComponents.length
const progress = computed(() => ((currentSlide.value + 1) / total) * 100)

function goTo(idx: number) {
  if (idx >= 0 && idx < total) currentSlide.value = idx
}
function next() { goTo(currentSlide.value + 1) }
function prev() { goTo(currentSlide.value - 1) }

function onKey(e: KeyboardEvent) {
  if (e.key === 'ArrowRight' || e.key === ' ' || e.key === 'ArrowDown') { e.preventDefault(); next() }
  if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') { e.preventDefault(); prev() }
}

onMounted(() => window.addEventListener('keydown', onKey))
onUnmounted(() => window.removeEventListener('keydown', onKey))
</script>

<template>
  <div class="deck">
    <div class="progress-bar">
      <div class="progress-fill" :style="{ width: progress + '%' }"></div>
    </div>

    <div class="slide-counter">{{ currentSlide + 1 }} / {{ total }}</div>

    <button class="nav-btn nav-prev" @click="prev" :disabled="currentSlide === 0">‹</button>
    <button class="nav-btn nav-next" @click="next" :disabled="currentSlide === total - 1">›</button>

    <div class="dot-nav">
      <button
        v-for="(_, i) in slideComponents"
        :key="i"
        class="dot"
        :class="{ active: i === currentSlide }"
        @click="goTo(i)"
      ></button>
    </div>

    <div class="slides-wrapper">
      <component
        v-for="(Comp, i) in slideComponents"
        :is="Comp"
        :key="i"
        :active="currentSlide === i"
        @navigate="goTo"
      />
    </div>
  </div>
</template>

<style>
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
  background: #F4E8C8;
  overflow: hidden;
  font-family: -apple-system, 'PingFang SC', 'Microsoft YaHei', 'Segoe UI', sans-serif;
}

.deck {
  position: fixed; inset: 0;
  background: #F4E8C8;
  color: #171512;
}

.slides-wrapper {
  width: 100%; height: 100%;
  position: relative;
}

.slide {
  position: absolute; inset: 0;
  display: flex; flex-direction: column;
  justify-content: center; align-items: center;
  padding: 60px 80px;
  opacity: 0; pointer-events: none;
  transform: translateX(40px);
  transition: opacity 0.4s ease, transform 0.4s ease;
  background:
    radial-gradient(circle at 18% 20%, rgba(226, 187, 112, 0.18), transparent 30%),
    radial-gradient(circle at 88% 74%, rgba(78, 103, 80, 0.13), transparent 34%),
    #F4E8C8;
  color: #171512;
  overflow: hidden;
}

.slide::before {
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
  z-index: 0;
}

.slide.active {
  opacity: 1; pointer-events: all;
  transform: translateX(0);
}

.progress-bar {
  position: fixed; top: 0; left: 0; right: 0; height: 3px;
  background: rgba(93, 67, 33, 0.16); z-index: 100;
}
.progress-fill {
  height: 100%; background: linear-gradient(90deg, #4E6750, #C28E2D);
  transition: width 0.4s ease;
}
.slide-counter {
  position: fixed; top: 16px; right: 24px;
  font-size: 13px; color: rgba(58, 52, 43, 0.55); z-index: 100;
  font-weight: 500;
}
.nav-btn {
  position: fixed; top: 50%; transform: translateY(-50%);
  background: rgba(255, 252, 242, 0.72); border: 1.5px solid rgba(93, 67, 33, 0.16);
  color: #4E6750; font-size: 28px; width: 44px; height: 44px;
  border-radius: 50%; cursor: pointer; z-index: 100;
  transition: all 0.2s; display: flex; align-items: center; justify-content: center;
  box-shadow: 0 2px 8px rgba(15, 23, 42, 0.06);
}
.nav-btn:hover:not(:disabled) {
  background: rgba(255, 252, 242, 0.9); border-color: rgba(194, 142, 45, 0.45); color: #C28E2D;
  box-shadow: 0 4px 16px rgba(68, 54, 28, 0.1);
}
.nav-btn:disabled { opacity: 0.3; cursor: default; }
.nav-prev { left: 20px; }
.nav-next { right: 20px; }
.dot-nav {
  position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%);
  display: flex; gap: 6px; z-index: 100;
}
.dot {
  width: 6px; height: 6px; border-radius: 50%;
  background: rgba(93, 67, 33, 0.22); border: none; cursor: pointer;
  transition: all 0.2s;
}
.dot.active { background: #4E6750; width: 20px; border-radius: 3px; }

.slide-tag {
  display: inline-block; font-size: 12px; font-weight: 700; letter-spacing: 3px;
  text-transform: uppercase; color: #4E6750;
  margin-bottom: 14px;
}
.slide-title {
  font-family: Georgia, 'Times New Roman', 'Songti SC', serif;
  font-size: clamp(36px, 4vw, 54px); font-weight: 500; color: #171512;
  line-height: 1.2; margin-bottom: 10px; text-align: center;
  letter-spacing: 0;
}
.slide-subtitle {
  font-size: 18px; color: #4E6750; margin-bottom: 32px; text-align: center;
  line-height: 1.7; font-weight: 600;
}
</style>
