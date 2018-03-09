colorscheme solarized

" use ^ not 0 
unmap 0

" vim-slime
let g:slime_target = "tmux"

" \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \	'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan'],
let g:rainbow_conf = {
        \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
        \   'ctermfgs': ['darkblue', 'darkgreen', 'darkyellow', 'red',  'darkmagenta', 'magenta'],
        \	'operators': '_,_',
        \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
        \	'separately': {
        \		'*': {},
        \		'tex': {
        \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
        \		},
        \		'lisp': {
        \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
        \		},
        \		'vim': {
        \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
        \		},
        \		'html': {
        \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
        \		},
        \		'css': 0,
        \	}
        \}

" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
