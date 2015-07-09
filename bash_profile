alias ll="ls -lh"

alias gcc=ccache
alias g++=ccache
alias cc=ccache
alias c++=ccache

export POSTGRES="/Library/PostgreSQL/9.4"
export PGDATA="$POSTGRES/data"
export JAVA_HOME=$(/usr/libexec/java_home)
export LIQUIBASE_HOME="/Applications/liquibase"
export PATH="${PATH}:~/bin:${POSTGRES}/bin:${LIQUIBASE_HOME}:/opt/apache-maven-3.3.3/bin"
export PYTHONPATH="/Library/Python/2.7/site-packages"
export PGPASSWORD="postgres"
test -f ~/.git-completion.bash && . $_

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
alias witch=which
export PATH



###########################################
# everything bellow goes in               #
# /etc/profile or etc/prodile.d/xxx.sh on #
# envs that are all mine                  #
###########################################
#
##https://wiki.archlinux.org/index.php/Color_Bash_Prompt
#
## Reset
#Color_Off=$(echo -e '\033[0m')       # Text Reset
#
## Regular Colors
#Black=$(echo -e '\033[0;30m')        # Black
#Red=$(echo -e '\033[0;31m')          # Red
#Green=$(echo -e '\033[0;32m')        # Green
#Yellow=$(echo -e '\033[0;33m')       # Yellow
#Blue=$(echo -e '\033[0;34m')         # Blue
#Purple=$(echo -e '\033[0;35m')       # Purple
#Cyan=$(echo -e '\033[0;36m')         # Cyan
#White=$(echo -e '\033[0;37m')        # White
#
## Bold
#BBlack=$(echo -e '\033[1;30m')       # Black
#BRed=$(echo -e '\033[1;31m')         # Red
#BGreen=$(echo -e '\033[1;32m')       # Green
#BYellow=$(echo -e '\033[1;33m')      # Yellow
#BBlue=$(echo -e '\033[1;34m')        # Blue
#BPurple=$(echo -e '\033[1;35m')      # Purple
#BCyan=$(echo -e '\033[1;36m')        # Cyan
#BWhite=$(echo -e '\033[1;37m')       # White
#
## Underline
#UBlack=$(echo -e '\033[4;30m')       # Black
#URed=$(echo -e '\033[4;31m')         # Red
#UGreen=$(echo -e '\033[4;32m')       # Green
#UYellow=$(echo -e '\033[4;33m')      # Yellow
#UBlue=$(echo -e '\033[4;34m')        # Blue
#UPurple=$(echo -e '\033[4;35m')      # Purple
#UCyan=$(echo -e '\033[4;36m')        # Cyan
#UWhite=$(echo -e '\033[4;37m')       # White
#
## Background
#On_Black=$(echo -e '\033[40m')       # Black
#On_Red=$(echo -e '\033[41m')         # Red
#On_Green=$(echo -e '\033[42m')       # Green
#On_Yellow=$(echo -e '\033[43m')      # Yellow
#On_Blue=$(echo -e '\033[44m')        # Blue
#On_Purple=$(echo -e '\033[45m')      # Purple
#On_Cyan=$(echo -e '\033[46m')        # Cyan
#On_White=$(echo -e '\033[47m')       # White
#
## High Intensity
#IBlack=$(echo -e '\033[0;90m')       # Black
#IRed=$(echo -e '\033[0;91m')         # Red
#IGreen=$(echo -e '\033[0;92m')       # Green
#IYellow=$(echo -e '\033[0;93m')      # Yellow
#IBlue=$(echo -e '\033[0;94m')        # Blue
#IPurple=$(echo -e '\033[0;95m')      # Purple
#ICyan=$(echo -e '\033[0;96m')        # Cyan
#IWhite=$(echo -e '\033[0;97m')       # White
#
## Bold High Intensity
#BIBlack=$(echo -e '\033[1;90m')      # Black
#BIRed=$(echo -e '\033[1;91m')        # Red
#BIGreen=$(echo -e '\033[1;92m')      # Green
#BIYellow=$(echo -e '\033[1;93m')     # Yellow
#BIBlue=$(echo -e '\033[1;94m')       # Blue
#BIPurple=$(echo -e '\033[1;95m')     # Purple
#BICyan=$(echo -e '\033[1;96m')       # Cyan
#BIWhite=$(echo -e '\033[1;97m')      # White
#
## High Intensity backgrounds
#On_IBlack=$(echo -e '\033[0;100m')   # Black
#On_IRed=$(echo -e '\033[0;101m')     # Red
#On_IGreen=$(echo -e '\033[0;102m')   # Green
#On_IYellow=$(echo -e '\033[0;103m')  # Yellow
#On_IBlue=$(echo -e '\033[0;104m')    # Blue
#On_IPurple=$(echo -e '\033[0;105m')  # Purple
#On_ICyan=$(echo -e '\033[0;106m')    # Cyan
#On_IWhite=$(echo -e '\033[0;107m')   # White
#export LESS="-iMSx4 -FXR"
#
#
## regexs bellow are from
## http://merlinmoncure.blogspot.ca/2012/09/psql-now-with-splash-of-color.html
## I'm going to go about this slightly differently
##PAGER="sed \"s/\(\([[:space:]]\+[0-9.\:\-]\+\)\+\)$/${LIGHT_CYAN}\1$NOCOLOR/;" 
##PAGER+="1s/\(.*\)/${LIGHT_GREEN}\1${NOCOLOR}/g;"
##PAGER+="s/\([[:space:]]\+[0-9.\-\:]\+[[:space:]]\)/${LIGHT_CYAN}\1$NOCOLOR/g;" 
##PAGER+="2,\\\$s/|/$YELLOW|$NOCOLOR/g;2,\\\$s/^\([-+]\+\)/$YELLOW\1$NOCOLOR/\" 2>/dev/null  | less"
#
## define colors for types of output here
## so it's easier to change the colors later
#HEADER="${Purple}"
#DIVIDER="${Yellow}"
#NUMERIC="${Cyan}"
#DATE="${Green}"
#NORMAL="${Color_Off}"
#BOOL="${Red}"
#
## osx brew install gsed and symlink in place of sed
#PAGER="sed \""
## first row of output; headers
#PAGER+="1s/^\(.*\)/${HEADER}\1${NORMAL}/;"
#PAGER+="1s/ | / ${DIVIDER}|${HEADER} /g;"
#
## RECORD separators in extended output
#PAGER+="s/-\(\[ RECORD [0-9]\+ ]\)\([-+]\+\)/${DIVIDER}-${HEADER}\1${DIVIDER}\2${NORMAL}/;"
#
## horizontal separators
#PAGER+="s/^\([-+]\+\)/${DIVIDER}\1${NORMAL}/;"
#
## careful with numerics!!! don't break the
## previous colors settings!
#
## datetime
## this will color matching date time strings
## within text fields
#PAGER+="s/\(^\| \)\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\( [0-9.:-]\+\)\?\)\( \|\\\$\)/\1${DATE}\2${NORMAL}\4/g;"
#
## numeric and bool, which we don't want
## to color if they occur within text
## fields have tricky detection for
## surrounding pips or lind ends
#
## numeric fields; this has a bug where sequential numeric fields
## are only alternately colored. This is because we match the 
## separators on both sides of the field; this bug is preferable
## to matching numerics at the start of text fields
#PAGER+="s/\(^\||\)\( *\)\([0-9.\-]\+\)\(\( *\)|\|\\\$\)/\1\2${NUMERIC}\3${NORMAL}\4/g;"
#
## bools
#PAGER+="s/\(^\| \)\( *\)\([tf]\)\(\( *\)|\|\\\$\)/\1\2${BOOL}\3${NORMAL}\4/g;"
#
## column separators (and the occaisional unfortunate pipe in text)
## doing this last so pipes are intact for use in numeric fields,
## because it's slick to not catch numerics in text fields
#PAGER+="2,\\\$s/ | / ${DIVIDER}|${NORMAL} /g;"
#
#PAGER+="\" 2>/dev/null | less"
#
#
#export PAGER
#
#
#
## Git branch in prompt.
#
#parse_git_branch() {
#
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
#
#}
#
#get_date() {
#    # since this is mostly for long-running commands,
#    # seconds isn't necessary and we can save some
#    # space
#    #date +'%H:%M:%S'
#    date +'%H:%M'
#}
#
#branch_color() {
#
#    # default green
#    color="32"
#   
#    if [[ "$(parse_git_branch)" == "" ]]; then
#        echo "${color}m"
#        return
#    fi
#
#    # colors: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
#    # no change: green 32
#
#    # querying remote is slow, so won't include that.
#    # but want to identify committed versus un-pushed changes
#    
#    status="$(git status)"
#
#    if [[ "$status" =~ "Changes not staged for commit" \
#            || "$status" =~ "Changes to be committed" || "$status" =~ "Untracked files" ]]; then
#        # yellow
#        color="33"
#
#    elif [[ "$status" =~ "Your branch is ahead" ]]; then
#        # underline yellow
#        color="4;33"
#    fi
#
#    if [[ "$status" =~ "diverged" || "$status" =~ "Your branch is behind" ]]; then
#        # red
#        color="31"
#    fi
#
#    if [[ "$status" =~ "cannot be fast forwarded" || "$status" =~ "both modified" ]]; then
#        # underlined red
#        color="4;31"
#    fi
#
#    echo "${color}m"
#}
#
#function get_name() {
#    echo "$USER@$(hostname | cut -d. -f1)"
#    # or
#    # echo "$USER@local"
#}
#
#export PS1="\[\033[33m\]\$(get_name)\[\033[00m\] \[$(tput setaf 6)\]\W \[\033[35m\]\$(get_date) \[\033[\$(branch_color)\]\$(parse_git_branch)\[\033[00m\]$ \[$(tput sgr0)\]"
