import MarkdownIt from 'markdown-it'
import multimdTable from 'markdown-it-multimd-table'

const md = new MarkdownIt({
  html: false,
  linkify: true,
  typographer: false,
  breaks: false,
}).use(multimdTable, {
  multiline: true,
  rowspan: false,
  headerless: false,
})

export function renderMarkdown(source: string): string {
  return md.render(source)
}
