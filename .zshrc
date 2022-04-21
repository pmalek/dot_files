#zmodload zsh/zprof

. "/Users/pmalek/.local/share/lscolors.sh"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"
HIST_FORMAT="'%Y-%m-%d %T:'$(echo -e '\t')"
alias history="fc -t "$HIST_FORMAT" -il 1"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
  git
  git-extras
  docker
  golang
  history
  #kubectl # slow :(
  ssh-agent
  #vagrant
  #https://github.com/popstas/zsh-command-time
  command-time
  gnu-utils
  #fzf-tab
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'

#######################################################################
#                            command time                             #
#######################################################################

# If command execution time above min. time, plugins will not output time.
ZSH_COMMAND_TIME_MIN_SECONDS=10
# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"

#######################################################################
#                               aliases                               #
#######################################################################
# alias tmux='tmux -2'
#
# Doesn't work on mac, just use pbcopy
#alias pbcopy='xsel --clipboard --input'
#alias pbpaste='xsel --clipboard --output'
#
alias wireshark='export LIBOVERLAY_SCROLLBAR=0; wireshark'
alias lgrep='ls -l | grep'
#alias ls='ls --color=auto '
alias cp='cp -r'
# allow user's aliases to be used when in sudo
# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '
#alias g++="g++ -fdiagnostics-color=auto"
alias p="python3"
alias cdgo="cd $GOPATH/src/github.com/pmalek/"
alias ggg="git fzf"
alias ffmpeg="ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"
alias ta="tmux a"
#alias open="xdg-open"
alias k="kubectl"
alias ka="kubectl apply"
alias kaf="kubectl apply -f"
alias kdel="kubectl delete"
alias kdelf="kubectl delete -f"
alias kd="kubectl describe"
alias n="nvim"
#alias i="istioctl"
# https://unix.stackexchange.com/a/25329/15387
alias watch="watch --color "
alias r="rg"
alias python='python3'
alias c="code"
#alias docker="podman"

#######################################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--min-height 24 -e --inline-info --reverse --border --color=16 --ansi'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_TAB_OPTS="--min-height 24"

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word


# https://stackoverflow.com/questions/38141865/can-i-use-both-emacs-and-vim-keybindings-in-zsh
bindkey -e

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Don't fill PATH twice with tmux
# https://stackoverflow.com/questions/13058578/how-to-prevent-tmux-from-filling-up-the-global-path-variable-with-duplicated-pat
if [[ -z $TMUX ]]; then
  #export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  # below comes from: $(brew --prefix openvpn)
  #export PATH="/usr/local/opt/openvpn/sbin:$PATH"
  export PATH="$HOME/Library/Python/3.9/bin:$PATH"
  export PATH="$HOME/bin:/usr/local/bin:$PATH"
  export PATH="$HOME/.git-fuzzy/bin:$PATH"

  source $HOME/.cargo/env
  export PATH="$HOME/.cargo/bin:$PATH"


  # Sumo
  source /dev/stdin <<< "$(/Users/pmalek/.devcli/dev --init)"
fi
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/config_vagrant"

################################################################################
# https://github.com/bigH/git-fuzzy
# when diffing with branches or commits for preview
export GF_DIFF_COMMIT_PREVIEW_DEFAULTS="--patch-with-stat"

export BAT_THEME="gruvbox-dark"

# added by travis gem
# [ ! -s /Users/pmalek/.travis/travis.sh ] || source /Users/pmalek/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/private/tmp/g/google-cloud-sdk/path.zsh.inc' ]; then . '/private/tmp/g/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
# if [ -f '/private/tmp/g/google-cloud-sdk/completion.zsh.inc' ]; then . '/private/tmp/g/google-cloud-sdk/completion.zsh.inc'; fi

# fzf-tab
# https://github.com/Aloxaf/fzf-tab/wiki/Configuration
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# zstyle ':fzf-tab:*:*:*' fzf-flags '--height 80%'
# remember to use single quote here!!!
# zstyle ':fzf-tab:complete:(bat|cat|less|nvim|head):*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:cd:*' popup-pad 120 240

# it is an example. you can change it
# zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
# 	'git diff $word | delta'|
# zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
# 	'git log --color=always $word'
# zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
# 	'git help $word | bat -plman --color=always'
# zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
# 	'case "$group" in
# 	"commit tag") git show --color=always $word ;;
# 	*) git show --color=always $word | delta ;;
# 	esac'
# zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
# 	'case "$group" in
# 	"modified file") git diff $word | delta ;;
# 	"recent commit object name") git show --color=always $word | delta ;;
# 	*) git log --color=always $word ;;
# 	esac'

#zprof

