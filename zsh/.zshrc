#Changing default editor to nvim
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export PATH="/usr/lib/ccache/bin/:$PATH"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

ttyctl -f

#Use BASE16_SHELL
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  nvim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

# for VI bindings
bindkey -e
#export KEYTIMEOUT=1

#Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#aliases
alias "gpu-off"="sudo modprobe -r nvidia_uvm && sudo modprobe -r nvidia && sudo tee /proc/acpi/bbswitch <<< OFF"
alias "gpu-on"="sudo tee /proc/acpi/bbswitch <<< ON"
alias gpu="sudo cat /proc/acpi/bbswitch"
alias xd='xrandr --output HDMI-1 --right-of eDP-1 --auto && sleep 3 && sh /home/dced/.config/polybar/launch.sh &'
alias pf="/etc/openvpn/portforward.sh"
alias nus="cd /home/dced/NUS/AY1819Sem1"
alias hdd="sudo mount /dev/sdb1 /mnt/HDD"
alias update="trizen -Syu"
alias ts="trizen --noconfirm -S"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VIRTUAL_ENV_DISABLE_PROMPT=1
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
