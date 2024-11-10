# --------------PATHS-----------------------

# set -x PATH /home/mmazoniandrade/.local/bin/ $PATH
set -x PATH "$PATH":"$HOME/.local/scripts/"

set pipenv_fish_fancy yes

# if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# eval (python3 -m virtualfish compat_aliases auto_activation global_requirements)

# default shell : sudo chsh -s /usr/bin/fish mmazoniandrade

if not type -q omf; eval (curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
    fish install --path=~/.local/share/omf --config=~/.config/omf); end

if not omf theme sashimi; omf install sashimi; omf theme sashimi; end

if type -q kubectl; eval (kubectl completion fish > ~/.config/fish/completions/kubectl.fish); end

bind \cf "tmux-sessionizer"

# source /home/mmazoniandrade/miniconda3/etc/fish/conf.d/conda.fish

# --------------ALIAS--------------------

alias downie='cd ~/Downloads/'
alias python=python3
alias pip=pip3
alias open=xdg-open
alias k='kubectl'
alias ls='ls --color=auto'
