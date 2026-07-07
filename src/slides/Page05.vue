<script setup lang="ts">
import architectureImage from '../assets/loop-engineering-architecture-transparent.png'

defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide architecture-slide" :class="{ active }">
    <h2 class="slide-title architecture-title">Loop Engineering 架构图</h2>
    <img
      class="architecture-image"
      :src="architectureImage"
      alt="Loop Engineering 架构图"
    />
  </div>
</template>

<style scoped>
.architecture-slide {
  justify-content: flex-start;
  padding: 54px 72px 46px;
}

.architecture-title {
  width: 100%;
  margin-bottom: 22px;
}

.architecture-image {
  display: block;
  width: min(88vw, 1120px);
  max-height: calc(100vh - 170px);
  object-fit: contain;
  z-index: 1;
}

@media (max-width: 980px) {
  .architecture-slide {
    padding: 48px 28px 40px;
  }

  .architecture-image {
    width: 94vw;
    max-height: calc(100vh - 150px);
  }
}
</style>
