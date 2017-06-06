set incsearch                               "highlight while typing search"
set hlsearch                                "highlight all search results"

nnoremap <Space>w :w<CR> 
nnoremap <Space>q :q<CR>
nnoremap <Space>wq :wq<CR>
nnoremap <Space>nh :noh<CR>


set showmode
nnoremap FF :action GotoFile<CR>
nnoremap ff :action FindInPath<CR>

nnoremap zf :action CollapseSelection<CR>

nnoremap <Space>t :action GotoDeclaration<CR>
nnoremap <Space>bq :action CloseActiveTab<CR>
nnoremap <Space>G :action CloseActiveTab<CR>
nnoremap <Space>G :action Annotate<CR>
nnoremap <Space>T :action ActivateStructureToolWindow<CR>
nnoremap <Space>s :action AceAction<CR>
nnoremap <Space>u :action ShowUsages<CR>
nnoremap <Space>o :action CloseActiveTab<CR>

