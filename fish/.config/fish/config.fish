#abbr -a vim nvim

#fish_default_key_bindings
fish_vi_key_bindings

alias sp='vim $HOME/notes/scratchpad-(date +"%m-%d-%Y").md'

function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

if status --is-interactive
  tmux ^ /dev/null; and exec true
end

if command -v exa > /dev/null
  abbr -a l 'exa'
  abbr -a ls 'exa'
  abbr -a ll 'exa -l'
  abbr -a lll 'exa -la'
else
  abbr -a l 'ls'
  abbr -a ll 'ls -l'
  abbr -a lll 'ls -la'
end

# golang
set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# npm
set -x PATH $PATH $HOME/.npm-global/bin

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PATH $PYENV_ROOT/bin
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
