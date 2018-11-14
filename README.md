# Basic setups for new computers


- vim
- emacs
- tmux
- ssh

## vim

https://github.com/amix/vimrc


## git submodule shallow copy

Sometime we don't need all the history commit. As a user a shallow clone 
of a repo is enough. Here is how to make submodules shallow.

Add a submodule
``` shell
git submodule add  --depth=1 <repository> [<path>]
```

Then edit `.gitmodule`, add `shallow = true` like this:
```
[submodule "submodules/tmux"]
	path = submodules/tmux
	url = https://github.com/reveriel/.tmux.git
	shallow = true
```




