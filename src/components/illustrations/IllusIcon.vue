<script setup lang="ts">
defineProps<{
  name: string
  size?: number
  color?: string
}>()
</script>

<template>
  <svg
    :width="size ?? 32"
    :height="size ?? 32"
    viewBox="0 0 48 48"
    fill="none"
    aria-hidden="true"
    class="illus-icon"
  >
    <!-- Loop / Refresh -->
    <g v-if="name === 'loop'">
      <circle cx="24" cy="24" r="18" :stroke="color ?? '#0D9488'" stroke-width="2.5" fill="none"/>
      <path d="M24 6v8M24 34v8M6 24h8M34 24h8" :stroke="color ?? '#0D9488'" stroke-width="2" stroke-linecap="round"/>
      <path d="M32 14l4-4M14 34l-4 4" :stroke="color ?? '#2563EB'" stroke-width="2.5" stroke-linecap="round"/>
      <path d="M32 14l-6 2 2 6M14 34l6-2-2-6" :stroke="color ?? '#2563EB'" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
    </g>

    <!-- Clock / Automation -->
    <g v-else-if="name === 'clock'">
      <circle cx="24" cy="24" r="18" :stroke="color ?? '#2563EB'" stroke-width="2.5" fill="#DBEAFE"/>
      <circle cx="24" cy="24" r="2" :fill="color ?? '#2563EB'"/>
      <path d="M24 14v10l7 4" :stroke="color ?? '#2563EB'" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
    </g>

    <!-- Write / Prompt -->
    <g v-else-if="name === 'write'">
      <rect x="8" y="6" width="28" height="36" rx="4" :stroke="color ?? '#2563EB'" stroke-width="2.5" fill="#DBEAFE"/>
      <path d="M14 16h20M14 24h14M14 32h18" :stroke="color ?? '#2563EB'" stroke-width="2" stroke-linecap="round" opacity="0.6"/>
      <path d="M30 28l8 8" :stroke="color ?? '#0D9488'" stroke-width="2.5" stroke-linecap="round"/>
    </g>

    <!-- Book / Context -->
    <g v-else-if="name === 'book'">
      <path d="M8 10h14a4 4 0 014 4v28H12a4 4 0 00-4 4V10z" :stroke="color ?? '#7C3AED'" stroke-width="2.5" fill="#EDE9FE"/>
      <path d="M26 10h14a4 4 0 014 4v28H30a4 4 0 00-4 4V10z" :stroke="color ?? '#7C3AED'" stroke-width="2.5" fill="#EDE9FE"/>
      <path d="M14 18h8M14 26h8M34 18h4M34 26h4" :stroke="color ?? '#7C3AED'" stroke-width="2" stroke-linecap="round" opacity="0.5"/>
    </g>

    <!-- Gear / Harness -->
    <g v-else-if="name === 'gear'">
      <circle cx="24" cy="24" r="8" :stroke="color ?? '#EA580C'" stroke-width="2.5" fill="#FFEDD5"/>
      <path d="M24 4v6M24 38v6M4 24h6M38 24h6M9.5 9.5l4.2 4.2M34.3 34.3l4.2 4.2M9.5 38.5l4.2-4.2M34.3 13.7l4.2-4.2" :stroke="color ?? '#EA580C'" stroke-width="2.5" stroke-linecap="round"/>
    </g>

    <!-- Tree / Worktree -->
    <g v-else-if="name === 'tree'">
      <circle cx="24" cy="16" r="10" :stroke="color ?? '#0D9488'" stroke-width="2.5" fill="#CCFBF1"/>
      <rect x="20" y="26" width="8" height="16" rx="2" :stroke="color ?? '#0D9488'" stroke-width="2.5" fill="#CCFBF1"/>
      <path d="M14 38h20" :stroke="color ?? '#0D9488'" stroke-width="2.5" stroke-linecap="round"/>
    </g>

    <!-- Document / Skill -->
    <g v-else-if="name === 'document'">
      <path d="M12 6h18l8 8v28a2 2 0 01-2 2H12a2 2 0 01-2-2V8a2 2 0 012-2z" :stroke="color ?? '#EA580C'" stroke-width="2.5" fill="#FFEDD5"/>
      <path d="M30 6v8h8" :stroke="color ?? '#EA580C'" stroke-width="2.5" stroke-linejoin="round"/>
      <path d="M16 22h16M16 30h12M16 38h14" :stroke="color ?? '#EA580C'" stroke-width="2" stroke-linecap="round" opacity="0.6"/>
    </g>

    <!-- Plug / Connector -->
    <g v-else-if="name === 'plug'">
      <rect x="16" y="4" width="16" height="12" rx="3" :stroke="color ?? '#7C3AED'" stroke-width="2.5" fill="#EDE9FE"/>
      <path d="M20 16v8M28 16v8" :stroke="color ?? '#7C3AED'" stroke-width="2.5" stroke-linecap="round"/>
      <path d="M14 24h20v8a4 4 0 01-4 4H18a4 4 0 01-4-4v-8z" :stroke="color ?? '#7C3AED'" stroke-width="2.5" fill="#EDE9FE"/>
      <path d="M8 32h32" :stroke="color ?? '#7C3AED'" stroke-width="2.5" stroke-linecap="round"/>
    </g>

    <!-- Robot / Agent -->
    <g v-else-if="name === 'robot'">
      <rect x="10" y="16" width="28" height="24" rx="6" :stroke="color ?? '#E11D48'" stroke-width="2.5" fill="#FFE4E6"/>
      <circle cx="18" cy="28" r="3" :fill="color ?? '#E11D48'"/>
      <circle cx="30" cy="28" r="3" :fill="color ?? '#E11D48'"/>
      <path d="M20 36h8" :stroke="color ?? '#E11D48'" stroke-width="2" stroke-linecap="round"/>
      <path d="M24 8v8" :stroke="color ?? '#E11D48'" stroke-width="2.5" stroke-linecap="round"/>
      <circle cx="24" cy="6" r="3" :fill="color ?? '#E11D48'"/>
    </g>

    <!-- Memory / Storage -->
    <g v-else-if="name === 'memory'">
      <ellipse cx="24" cy="12" rx="14" ry="5" :stroke="color ?? '#0891B2'" stroke-width="2.5" fill="#CFFAFE"/>
      <path d="M10 12v20c0 2.8 6.3 5 14 5s14-2.2 14-5V12" :stroke="color ?? '#0891B2'" stroke-width="2.5" fill="#CFFAFE"/>
      <path d="M10 22c0 2.8 6.3 5 14 5s14-2.2 14-5" :stroke="color ?? '#0891B2'" stroke-width="2" opacity="0.5"/>
    </g>

    <!-- Search / Discover -->
    <g v-else-if="name === 'search'">
      <circle cx="20" cy="20" r="12" :stroke="color ?? '#EA580C'" stroke-width="2.5" fill="#FFEDD5"/>
      <path d="M29 29l10 10" :stroke="color ?? '#EA580C'" stroke-width="2.5" stroke-linecap="round"/>
    </g>

    <!-- Build / Maker -->
    <g v-else-if="name === 'build'">
      <path d="M8 32l8-8 6 6-8 8H8v-6z" :stroke="color ?? '#2563EB'" stroke-width="2.5" fill="#DBEAFE" stroke-linejoin="round"/>
      <path d="M28 8l12 12-16 16H12l16-16 4-4 8 8" :stroke="color ?? '#2563EB'" stroke-width="2.5" fill="none" stroke-linejoin="round"/>
    </g>

    <!-- Check / Verify -->
    <g v-else-if="name === 'check'">
      <circle cx="24" cy="24" r="18" :stroke="color ?? '#0D9488'" stroke-width="2.5" fill="#CCFBF1"/>
      <path d="M14 24l7 7 13-14" :stroke="color ?? '#0D9488'" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
    </g>

    <!-- Warning -->
    <g v-else-if="name === 'warning'">
      <path d="M24 4L44 40H4L24 4z" :stroke="color ?? '#EA580C'" stroke-width="2.5" fill="#FFEDD5" stroke-linejoin="round"/>
      <path d="M24 18v10" :stroke="color ?? '#EA580C'" stroke-width="2.5" stroke-linecap="round"/>
      <circle cx="24" cy="34" r="2" :fill="color ?? '#EA580C'"/>
    </g>

    <!-- Rocket -->
    <g v-else-if="name === 'rocket'">
      <path d="M24 4c-8 8-12 20-12 28h24C36 24 32 12 24 4z" :stroke="color ?? '#2563EB'" stroke-width="2.5" fill="#DBEAFE" stroke-linejoin="round"/>
      <circle cx="24" cy="20" r="4" :stroke="color ?? '#2563EB'" stroke-width="2" fill="#FFFFFF"/>
      <path d="M12 36l-4 8 8-4M36 36l4 8-8-4" :stroke="color ?? '#0D9488'" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
    </g>

    <!-- State / Save -->
    <g v-else-if="name === 'save'">
      <rect x="8" y="6" width="32" height="36" rx="4" :stroke="color ?? '#0891B2'" stroke-width="2.5" fill="#CFFAFE"/>
      <rect x="16" y="6" width="16" height="12" rx="2" :stroke="color ?? '#0891B2'" stroke-width="2" fill="#FFFFFF"/>
      <rect x="14" y="26" width="20" height="12" rx="2" :stroke="color ?? '#0891B2'" stroke-width="2" fill="#FFFFFF"/>
    </g>

    <!-- Quote bubble -->
    <g v-else-if="name === 'quote'">
      <path d="M8 8h20a4 4 0 014 4v12a4 4 0 01-4 4H16l-8 8V8z" :stroke="color ?? '#2563EB'" stroke-width="2.5" fill="#DBEAFE"/>
      <path d="M28 16h12a4 4 0 014 4v12a4 4 0 01-4 4H36l-8 8V16z" :stroke="color ?? '#0D9488'" stroke-width="2.5" fill="#CCFBF1"/>
    </g>

    <!-- User / Engineer -->
    <g v-else-if="name === 'user'">
      <circle cx="24" cy="16" r="8" :stroke="color ?? '#2563EB'" stroke-width="2.5" fill="#DBEAFE"/>
      <path d="M8 42c0-8.8 7.2-16 16-16s16 7.2 16 16" :stroke="color ?? '#2563EB'" stroke-width="2.5" fill="#DBEAFE"/>
    </g>

    <!-- Default: circle -->
    <g v-else>
      <circle cx="24" cy="24" r="18" :stroke="color ?? '#0D9488'" stroke-width="2.5" fill="#CCFBF1"/>
    </g>
  </svg>
</template>

<style scoped>
.illus-icon { display: block; flex-shrink: 0; }
</style>
