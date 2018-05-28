function ssh () {
  /usr/bin/ssh -t $@ "tmux attach || tmux new";
}

alias tmx="tmux -2 attach-session -t local || tmux -2 new-session -s local"

export PAGER=less
alias l="ls -lahG"
alias ..="cd .."
alias vi=vim

alias ssh="ssh -A" # forward ssh agent
alias grp="grep -rniH --color"
alias rg="rg -ip"
alias tree="tree -C"
export LESS="-X -F -S -raw"
alias cat="less"

#alias dory='python3 -m dory'

alias less='less -FXRS'
alias o="less"
#alias gcc="gcc -std=c99 -pedantic -Wall -Werror -D_XOPEN_SOURCE=600 -m32"
#export PS1='\u\[\e[m\] \w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

export EDITOR=vim


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# --column: Show column number
# --line-number: Show line number
# --no-heading: Do not show file headings in results
# --fixed-strings: Search term as a literal string
# --ignore-case: Case insensitive search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
# --color: Search color options
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# \ rg --column --line-number --no-heading --fixed-strings --no-ignore --hidden --follow --color "always"
# \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
# \ -g "\!{.git,node_modules,vendor}/*" '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="bfs -type d -nohidden"  
export FZF_DEFAULT_OPTS='--bind J:down,K:up --reverse --ansi --color=light'


__sf() {
    rg_command='rg " " --column --line-number --no-heading --fixed-strings --no-ignore --hidden --follow --color "always" -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}" -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" 2> /dev/null'
    local files=`eval $rg_command $1 | fzf | awk -F ':' '{print $1}'`
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

sf() {
    rg_command='rg --column --line-number --no-heading --fixed-strings --no-ignore --hidden --follow --color "always" -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}" -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" 2> /dev/null'
    local files=`eval $rg_command $1 | fzf | awk -F ':' '{print $1}'`
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

bind '"\C-f": "__sf\n"'

#bind -x '"\C-e": vim `echo $(fzf) | grep -o -e ^[^:]\*`;'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


