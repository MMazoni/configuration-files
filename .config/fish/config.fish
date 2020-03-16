# --------------PATHS-----------------------

# set -x PATH /home/mmazoniandrade/.local/bin/ $PATH
# set -x PATH /home/mmazoniandrade/miniconda3/bin/ $PATH

set pipenv_fish_fancy yes

if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# eval (python3 -m virtualfish compat_aliases auto_activation global_requirements)

# default shell : sudo chsh -s /usr/bin/fish mmazoniandrade

fundle plugin 'tuvistavie/fish-theme-afowler'

fundle init

# source /home/mmazoniandrade/miniconda3/etc/fish/conf.d/conda.fish

# --------------ALIAS--------------------

alias downie='cd ~/Downloads/'
alias python=python3
alias pip=pip3
alias open=xdg-open
