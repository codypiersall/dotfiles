# https://github.com/blinks zsh theme

function _prompt_char() {
  if [ ! -z "$GIT_PROMPTINFO_ENABLED" ]; then
      if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1 && git rev-parse HEAD >/dev/null 2>&1); then
        echo "%{%F{green}%}$(git rev-parse --abbrev-ref HEAD)%{%f%k%b%}"
      else
        echo ' '
      fi
  else
    echo ' '
  fi
}

git_prompt_info () {
  if [ ! -z "$GIT_PROMPTINFO_ENABLED" ]; then
    local ref
    if [[ "$(command git rev-parse --is-inside-work-tree > /dev/null 2>&1)" ]]; then
        if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]] then
            # ref=$(command git symbolic-ref HEAD 2> /dev/null)  || ref=$(command git rev-parse --short HEAD 2> /dev/null)  || return 0
            ref="$(git rev-parse --abbrev-ref HEAD)"
            echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref}$ZSH_THEME_GIT_PROMPT_SUFFIX"
        fi
    fi
  fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}

PROMPT='%{%f%k%b%}
[%F{red}%D{%I:%M%p}%F{reset}:zsh] $(virtualenv_info)%{%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
%{%}$(_prompt_char)%{%} %#%{%f%k%b%} '
