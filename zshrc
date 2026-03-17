# dotfiles
if [[ ! -f /tmp/.fastfetch-done ]]; then
    fastfetch
    touch /tmp/.fastfetch-done
fi

precmd()  { print -Pn '\e]2;%~\a' }
preexec() { printf '\e]2;%s\a' "${1%% *}" }

export PATH="$HOME/.local/bin:$PATH"

zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*' menu select
export LS_COLORS="di=1;36:ln=36:so=35:pi=33:ex=32:bd=33;1:cd=33;1:su=31:sg=31:tw=1;36:ow=1;36"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
source <(carapace _carapace zsh)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
