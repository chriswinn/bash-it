#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" ${green}|"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

THEME_CLOCK_CHAR_COLOR=${THEME_CLOCK_CHAR_COLOR:-"$red"}
THEME_SHOW_CLOCK=${THEME_SHOW_CLOCK:-"true"}
THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$bold_cyan"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%Y-%m-%d %H:%M"}

THEME_SHOW_VENV=${THEME_SHOW_VENV:-"true"}
THEME_SHOW_VENV_RUBY=${THEME_SHOW_VENV_RUBY:-"true"} # Defaults to Python, unless this == "true"

__c17n_clock() {
  if [[ "${THEME_SHOW_CLOCK}" == "true" ]]; then
		printf "$(clock_prompt)" && __c17n_space 
  fi
}

__c17n_venv() {
  if [[ "${THEME_SHOW_VENV}" == "true" ]] && [[ "${THEME_SHOW_VENV_RUBY}" == "true" ]]; then
    printf "($(ruby_version_prompt))" && __c17n_space 
	elif [[ "${THEME_SHOW_VENV}" == "true" ]]; then  
    printf "($(python_version_prompt))" && __c17n_space
  fi
}

function prompt_command() {
		#PS1="\n$(__c17n_clock)${yellow}$(__c17n_venv)${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_prompt_char_info) ${green}→${reset_color} "
    PS1="\n$(battery_char) $(__c17n_clock)${yellow}$(__c17n_venv)${purple}\h ${reset_color}in ${green}\w\n${bold_cyan}$(scm_prompt_char_info) ${green}→${reset_color} "
}

safe_append_prompt_command prompt_command
