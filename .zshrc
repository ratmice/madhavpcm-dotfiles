# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/antigen.zsh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/$HOME/.local/bin:$HOME/mybin:/home/madhavpcm/.config/local/share/gem/ruby/3.0.0/bin:$PATH"


eval "$(zoxide init zsh)"

source ~/p.zsh
PATH="/home/madhavpcm/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/madhavpcm/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/madhavpcm/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/madhavpcm/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/madhavpcm/perl5"; export PERL_MM_OPT;

alias config='/usr/bin/git --git-dir=/home/madhavpcm/.cfg/ --work-tree=/home/madhavpcm/'
alias lockctl='/usr/bin/betterlockscreen -l'
bindkey -v
MANGOHUD_CONFIGFILE="~/.config/mangohud/mangohud.conf"
export IFNAME="wlp6s0"
export CON_NAME="kawahotspot"
export QT_QPA_PLATFORMTHEME=qt5ct

export EDITOR="nvim"
export VISUAL="nvim"

#vi edit
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen theme romkatv/powerlevel10k
antigen apply
#myexpos
#alias xfsi="cd $HOME/myexpos/xfs-interface/ && ./xfs-interface; cd -"
export STAGE="$HOME/myexpos/assignments/stage"
export SPL="$HOME/myexpos/spl/spl_progs"
export EXPL="$HOME/myexpos/expl/expl_progs"
