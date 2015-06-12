alias ll="ls -lh"
export POSTGRES="/Library/PostgreSQL/9.4"
export PGDATA="$POSTGRES/data"
export JAVA_HOME=$(/usr/libexec/java_home)
export LIQUIBASE_HOME="/Applications/liquibase"

# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'

}

get_date() {
    # since this is mostly for long-running commands,
    # seconds isn't necessary and we can save some
    # space
    #date +'%H:%M:%S'
    date +'%H:%M'
}

branch_color() {

    # default green
    color="32"
   
    if [[ "$(parse_git_branch)" == "" ]]; then
        echo "${color}m"
        return
    fi

    # colors: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
    # no change: green 32

    # querying remote is slow, so won't include that.
    # but want to identify committed versus un-pushed changes
    
    status="$(git status)"

    if [[ "$status" =~ "Changes not staged for commit" \
            || "$status" =~ "Changes to be committed" || "$status" =~ "Untracked files" ]]; then
        # yellow
        color="33"

    elif [[ "$status" =~ "Your branch is ahead" ]]; then
        # underline yellow
        color="4;33"
    fi

    if [[ "$status" =~ "diverged" || "$status" =~ "Your branch is behind" ]]; then
        # red
        color="31"
    fi

    if [[ "$status" =~ "cannot be fast forwarded" || "$status" =~ "both modified" ]]; then
        # underlined red
        color="4;31"
    fi

    echo "${color}m"
}

export PS1="\[$(tput setaf 6)\]\W \[\033[35m\]\$(get_date) \[\033[\$(branch_color)\]\$(parse_git_branch)\[\033[00m\]$ \[$(tput sgr0)\]"
export PATH="${PATH}:~/bin:${POSTGRES}/bin:${LIQUIBASE_HOME}"
export PYTHONPATH="/Library/Python/2.7/site-packages"
export PGPASSWORD="postgres"
test -f ~/.git-completion.bash && . $_

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
alias witch=which
export PATH
