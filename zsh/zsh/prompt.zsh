# prompt
setopt prompt_subst

# prompt
LAMBDA="%{$fg[blue]%}λ%{$reset_color%}"
ARROW="%{$fg[blue]%}➜%{$reset_color%}"
LEFT_ARROW="%{$fg_bold[red]%}VI %{$reset_color%}"
SLASH="%{$fg_bold[blue]%}/%{$reset_color%}"

function color_path() {
  echo "${${PWD/#$HOME/~}//\//$SLASH}"
}

function vimode() {
  echo "${${KEYMAP/vicmd/$LEFT_ARROW}/(main|viins)/}"
}

if [[ -n $SSH_CONNECTION ]]; then
  SSH="%{$fg[green]%}[%{$reset_color%}%m%{$fg[green]%}]%{$reset_color%} "
fi

PROMPT='$SSH$LAMBDA $(color_path) ${vcs_info_msg_0_}$(vimode)$ARROW '
