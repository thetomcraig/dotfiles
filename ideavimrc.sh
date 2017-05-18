source ${HOME}/Dotfiles/vim_and_ideavim_common.sh

set showmode
nnoremap FF :action GotoFile<CR>
nnoremap ff :action FindInPath<CR>

nnoremap <Space>t :action GotoDeclaration<CR>
nnoremap <Space>bq :action CloseActiveTab<CR>
nnoremap <Space>G :action CloseActiveTab<CR>
nnoremap <Space>G :action Annotate<CR>
nnoremap <Space>T :action ActivateStructureToolWindow<CR>
nnoremap <Space>s :action AceAction<CR>
nnoremap <Space>u :action ShowUsages<CR>
