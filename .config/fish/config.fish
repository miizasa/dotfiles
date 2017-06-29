set -g fish_user_paths "/usr/local/bin" $fish_user_paths

#alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
#alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacs='emacsclient -nw -a ""'
alias emacs-kill='emacsclient -e "(kill-emacs)"'


#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end
