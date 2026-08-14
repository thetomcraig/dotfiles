set clipboard=unnamed



unmap <Space>
" You can find the available commands by:
" Opening the developer console: alt+cmd+i
" Then execute the command: app.commands.commands
exmap openTextSearch :obcommand global-search:open
nmap <Space>rr :openTextSearch<CR>

exmap openFileSearch :obcommand switcher:open
nmap <Space>ff :openFileSearch<CR>

exmap openSidebar :obcommand app:toggle-left-sidebar
nmap <Space>ft :openSidebar<CR>

exmap jumpToLink obcommand mrj-jump-to-link:activate-jump-to-anywhere
nmap <Space>jj :jumpToLink

exmap openSettings :obcommand app:open-settings
nmap <Space>ve :openSettings<CR>

exmap openDailyNote :obcommand daily-notes
nmap <Space>ve :openDailyNote<CR>

" Tabs
exmap newTab obcommand workspace:new-tab
nmap <Space>w/ :newTab

exmap closeTab obcommand workspace:close-tab-group
nmap <Space>q :closeTab

exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nmap <Space>wn :nextTab
nmap <Space>wm :prevTab

exmap toggleTask obcommand editor:toggle-checklist-status
nmap <Space>wc :toggleTask<CR>

" Make o/O use context-aware newlines (continue lists, blockquotes, code
" indents)
exmap BlankBelow obcommand obsidian-editor-shortcuts:insertLineBelow
exmap BlankAbove  obcommand obsidian-editor-shortcuts:insertLineAbove
nmap o :BlankBelow<CR>i
nmap O :BlankAbove<CR>i

" Splitting
exmap splitVertical obcommand workspace:split-vertical
exmap splitHorizontal obcommand workspace:split-horizontal
exmap only obcommand workspace:close-others
nmap <Space>w\ :splitVertical
nmap <Space>w| :splitVertical
nmap <Space>w- :splitHorizontal

