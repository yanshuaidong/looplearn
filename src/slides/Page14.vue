<script setup lang="ts">
import loopIconSprite from '../assets/page14-loop-icons-sprite.png'

const loopIconSpriteUrl = `url("${loopIconSprite}")`

defineProps<{ active: boolean }>()
</script>

<template>
  <div class="slide" :class="{ active }">
    <div class="split-layout">
      <div class="summary-panel split-left">
        <div class="slide-tag">实例</div>
        <h2 class="slide-title">一个 Loop 长什么样？</h2>
        <p class="slide-subtitle">一个真实的「每日 CI 分类 Loop」把所有要素串联起来。</p>
        <div class="core-statement">
          你设计了一次，然后系统每天自己触发、发现、隔离、验证、通知和记录。
        </div>
      </div>

      <div class="anatomy-flow split-right">
        <div class="af-step">
          <div class="af-icon"><span class="af-logo af-logo-automation" /></div>
          <div><div class="af-label">Automation</div><div class="af-desc">每天早上触发 · 调用分类 Skill</div></div>
        </div>
        <div class="af-step">
          <div class="af-icon"><span class="af-logo af-logo-discover" /></div>
          <div><div class="af-label">发现工作</div><div class="af-desc">读 CI 失败 · 未解决 Issue · 最近提交</div></div>
        </div>
        <div class="af-step">
          <div class="af-icon"><span class="af-logo af-logo-worktree" /></div>
          <div><div class="af-label">Worktree</div><div class="af-desc">为每个发现开独立分支</div></div>
        </div>
        <div class="af-step">
          <div class="af-icon"><span class="af-logo af-logo-agent" /></div>
          <div><div class="af-label">双 Agent</div><div class="af-desc">制作者起草修复 · 检查者验证方案</div></div>
        </div>
        <div class="af-step">
          <div class="af-icon"><span class="af-logo af-logo-connectors" /></div>
          <div><div class="af-label">Connectors</div><div class="af-desc">自动开 PR · 关联 Ticket · 通知 Slack</div></div>
        </div>
        <div class="af-step">
          <div class="af-icon"><span class="af-logo af-logo-state" /></div>
          <div><div class="af-label">State 更新</div><div class="af-desc">记录状态 · 明天继续</div></div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.anatomy-flow {
  display: grid;
  gap: 10px;
}
.af-step {
  display: grid;
  grid-template-columns: 58px 1fr;
  gap: 16px;
  align-items: center;
  min-height: 72px;
  padding: 9px 16px;
  background: rgba(255, 252, 242, 0.68);
  border: 1.5px solid rgba(93, 67, 33, 0.16);
  border-radius: 8px;
  box-shadow: 0 8px 18px rgba(68,54,28,0.06);
}
.af-icon {
  display: flex;
  justify-content: center;
  align-items: center;
}
.af-logo {
  --sprite-x: 0%;
  --sprite-y: 0%;
  display: block;
  width: 52px;
  height: 52px;
  background-image: v-bind(loopIconSpriteUrl);
  background-repeat: no-repeat;
  background-size: 300% 200%;
  background-position: var(--sprite-x) var(--sprite-y);
}
.af-logo-automation { --sprite-x: 0%; --sprite-y: 0%; }
.af-logo-discover { --sprite-x: 50%; --sprite-y: 0%; }
.af-logo-worktree { --sprite-x: 100%; --sprite-y: 0%; }
.af-logo-agent { --sprite-x: 0%; --sprite-y: 100%; }
.af-logo-connectors { --sprite-x: 50%; --sprite-y: 100%; }
.af-logo-state { --sprite-x: 100%; --sprite-y: 100%; }
.af-label { font-size: 14px; font-weight: 700; color: #171512; margin-bottom: 3px; }
.af-desc { font-size: 13px; color: rgba(58, 52, 43, 0.66); line-height: 1.5; }
</style>
