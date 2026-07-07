Loop Engineering 循环工程又是什么鬼？
鹤啸九天
鹤啸九天​
中国农业大学 计算机科学与技术硕士
​关注他
收录于 · 鹤啸九天
19 人赞同了该文章
（1）Loop Engineering 背景
这几天，硅谷谈论最多的话题：Loop Engineering，循环工程，简称 LE


6月7日，谷歌云主管（Addy Osmani）发表博文，掀起热烈讨论：


地址见附录

OpenClaw作者 Peter Steinberger（江湖人称“虾爹”）说：

你不应该再去 prompting coding agent , 而是设计 loops，去 prompt agents。





Anthropic Claude Code 负责人 Boris Cherny（Claude 之父） 也说过：


我现在已经不直接 prompt Claude 了, 有一套 loops 在运行，会去 prompt Claude，并判断接下来要做什么。我的工作是写 loops。


（2）Loop Engineering 介绍
单纯靠堆Prompt指挥AI的时代已经落幕了。

过去两年，让 coding agent 做事的基本方式

写好 prompt，提供足够上下文。
输入一段内容，阅读返回的结果，再输入下一段。
agent 是工具，一轮接一轮地操作（轰炸）。
Harness 是为单个 agent 构建运行环境，而Loop Engineering 则位于 harness 之上，像 Harness，但会按时间运行，获取反馈，并喂养自己。

这种人机乒乓球模式中，人类充当AI的实时调度器，一旦任务复杂，人的耐心的打字速度就成了系统交付瓶颈



范式转变：

PE是人类喂AI答案
LE是人类构建AI自动进化引擎
于是，不用再琢磨怎么说话更精准，而是设计这套loop法则：定义目标、质检标准，剩下的让系统在自我博弈中迭代完成，未来竞争力不再是回写prompt的人，而是那些设计出最聪明、最闭环系统的规则制定者。


claude code 的loop命令就是典型。


Loop Engineering 正在取代“亲自给 agent 写 prompt”。

核心：不再直接 prompt agent，而是设计系统去 prompt agent。

loop 是递归目标：定义目标，让 AI 不断迭代，直到任务完成。

（3）Loop Engineering 架构
一张框架图概括LE，顺时针从12点方向开始看


LE 由五个构建块组成

Automations 自动化：按计划自动触发、发现和分诊。
Worktrees 工作树：让两个并行工作的 agents 不会互相干扰。
Skills 技能：把项目知识写下来，避免 agent 靠猜。
Plugins 插件 和 connectors 连接器：把 agent 接入已经在用的工具。
Sub-agents 子Agent：一个提想法，另一个检查。

另外，还有memory：markdown 文件，Linear board，或任何存在于单次 conversation 之外、能够保存“已完成事项”和“下一步事项”的地方。

这五个核心模块在Claude Code 和 Codex 都已经具备：

定时自动化（Automations）：循环的心跳。按时间表自动触发，完成发现和分类工作，不需人工介入。这两个产品里的定时任务实现名称不同，但本质相同——让系统自己找事儿做。
并行工作树（Worktrees）：让多个 Agent 并行工作而不干扰的隔离机制。没有 Worktrees，两个 Agent 会在同一代码分支上互相覆盖对方的改动，循环就此失控。
技能知识沉淀（Skills）：把项目知识写下来，避免 Agent 每次都只能靠猜测。这是把「只有你知道」的上下文转化为「Agent 也知道」的结构化输入。
插件与连接器（Plugins and Connectors）：把 Agent 接入已有工具链——GitHub、Linear、Slack、数据库。循环要读取实际环境信息，也要把结果写回环境，连接器是这个双向通道。
制作者与验证者分离的子 Agent（Sub-agents）：一个Agent提出方案，另一个检验——制造者与审查者天然分离。这是循环里内置的质量门禁，防止单个 Agent 的错误在无人知晓的情况下蔓延。


表格整理

基础能力	循环中的工作	Codex 应用	Claude Code
自动化（Automations）	按计划发现与分流任务	自动化标签页：选择项目、提示词、执行频率、环境；结果进入分流收件箱；用 /goal 执行直到完成	定时任务与 cron、/loop、/goal、钩子、GitHub Actions
工作树（Worktrees）	隔离并行开发任务	每个线程内置独立工作树	git worktree、--worktree 参数；在子代理上隔离工作树
技能（Skills）	将项目知识固化为可复用能力	代理技能（SKILL.md），通过 $name 调用或隐式触发	代理技能（SKILL.md）
插件/连接器（Plugins / connectors）	连接外部工具	连接器（MCP）+ 用于分发的插件	MCP 服务器 + 插件
子代理（Sub-agents）	创意构思与验证	子代理以 TOML 格式定义在 .codex/agents/ 目录下	任务子代理定义在 .claude/agents/ 目录下，支持代理团队协作
状态（State）	跟踪任务进度与完成情况	Markdown 文件或通过连接器集成 Linear	Markdown（AGENTS.md、进度文件）或通过 MCP 集成 Linear
各模块细节略，详细介绍见文末技术博客

（4）LE认知
等等，看起来，LE不就是定时循环任务吗？

所以，Loop Engineering = cron job?

Loop Engineering 要反馈循环，就像开发团队要了解新功能、用户问题、工作流优化等。

LLM 可直接访问或生成数据，且要明确目标和验证输出结果的反馈循环。

YC CEO Garry Tan 提醒:

不要把 Agent 变成“富士康工厂”式重复劳动机器，开发者应让 Agent 承担更多工作。
有人指出

让 Agent 做更多事，但要明确边界，要提供清晰上下文、可信工具、可审计操作记录和安全停止条件
（5）LE问题
LE虽好，但也别贪杯。

比如，LE模式存在字符膨胀问题，Token消耗太快等

① 调试难度大

调试跑 47 轮的状态机，比修好 prompt 难 10 倍，且大多数人连可靠的一次性 prompt 都写不好。

一开始设置容易，但之后有很多痛点，修复费劲。
有人后悔引入 Loop，迁移到其他方案耗费时间和资源，只能继续撑着。
还有人建议尽早迁移，时间越久情况越糟。
② Token消耗大
LE模式下，Token 消耗量高

Boris Cherny 和 Peter Steinberger 背后公司提供近乎无限 token 支持
但社区很多人 token 预算有限。
怎么办？

Peter 无解，有人指出 20 美元套餐不可能，“难道你的时间真不值钱吗？”
Token 充裕公司可用 while 循环
Token 紧张初创公司可用 for 循环实现目标。
工业界做法

Claude Code 对 token 消耗问题做了各种限制，如 Loops 支持最小 1 分钟间隔，最长运行 3 天，到期自动停止；
Loops 绑定当前 Claude Code 会话，关闭终端或结束会话后停止；还提供禁用 Loop 的开关。
③ 长任务稳定性
LE重点是让 Agent 长时间运行不跑偏，并能判断对错

Claude Code 是典型代表。

Anthropic 应用 AI 团队工程师 Ash 表示：公司探索方向更偏“尽量完全自主”，目标是把人类判断写入 Harness，而不是插入人工兜底。

去年，Claude Code 从只能连续运行约 20 分钟、易出错，进化到几乎由自己编写、可连续运行数天。

Anthropic 工程师 Andrew 指出：让 Agent 连续运行数小时甚至数天，核心难点有上下文、规划和自我判断。

为解此，Anthropic 采用两条路径：

提升模型本身，把长时任务能力写入模型权重；
改造模型外部的 Harness。
早期长时运行 Agent 把需求拆解成持久化文件，在新上下文窗口中反复执行任务，缓解上下文丢失和任务漂移。

随着新模型能力增强，Anthropic 开始简化 Harness。

Opus 4.6 擅长规划和工具选择，Sonnet 4.6 以低成本提供接近 Opus 的执行能力，常见组合是用 Opus 做规划、Sonnet 执行代码。
服务器端压缩和百万级上下文窗口使模型在单一长会话中保持更久连贯性。
Anthropic 内部实验的前沿 Harness 模式是生成器—评估器—规划器结构，借鉴生成对抗网络思想。

附录
参考：

原文地址：https://addyosmani.com/blog/loop-engineering/
截图来自AI产品狙击手
技术报告专题：https://wqw547243068.github.io/