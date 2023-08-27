set clipboard=unnamed



unmap <Space>
" You can find the available commands by:
" Opening the developer console: alt+cmd+i
" Then execute the command obcommand
exmap openTextSearch :obcommand global-search:open
nmap <Space>rr :openTextSearch

exmap openFileSearch :obcommand switcher:open
nmap <Space>ff :openFileSearch

exmap openSidebar :obcommand app:toggle-left-sidebar
nmap <Space>ft :openSidebar

exmap jumpToLink obcommand mrj-jump-to-link:activate-jump-to-anywhere
nmap <Space>jj :jumpToLink



" Tabs
exmap newTab obcommand workspace:new-tab
nmap <Space>w/ :newTab

exmap closeTab obcommand workspace:close-tab-group
nmap <Space>q :closeTab

exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nmap <Space>wn :nextTab
nmap <Space>wm :prevTab



" Splitting
exmap splitVertical obcommand workspace:split-vertical
exmap splitHorizontal obcommand workspace:split-horizontal
exmap only obcommand workspace:close-others
nmap <Space>w\ :splitVertical
nmap <Space>w| :splitVertical
nmap <Space>w- :splitHorizontal

