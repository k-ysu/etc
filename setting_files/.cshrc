#ource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h         history 25
alias j         jobs -l
alias la        ls -a
alias lf        ls -FA
alias ll        ls -lA
alias grepphp 'find . -name "*.php"|xargs grep'
alias greptpl 'find . -name "*.tpl"|xargs grep'
alias gitb git branch -a
alias gitc git checkout
alias gitp git pull origin
alias gitrevert git checkout --
alias gitmreset git reset --hard ORIG_HEAD
alias gitremove git remote prune origin

# A righteous umask
umask 22

#set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin $HOME/local/emacs/bin $HOME/local/bin /etc/node/bin )
set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin $HOME/local/emacs/bin $HOME/local/bin )

setenv  EDITOR  vi
setenv  PAGER   more
setenv  BLOCKSIZE       K
setenv  PKG_DBDIR       ~/db/pkg
#setenv  LANG ja_JP.EUC
setenv  LANG ja_JP.eucJP
#setenv NODE_PATH "/etc/node/bin"

if ($?prompt) then
        # An interactive shell -- set some stuff up
        set prompt="[%m]%c>"
        set filec
        set history = 100
        set savehist = 100
        set mail = (/var/mail/$USER)
        if ( $?tcsh ) then
                bindkey "^W" backward-delete-word
                bindkey -k up history-search-backward
                bindkey -k down history-search-forward
        endif
endif

