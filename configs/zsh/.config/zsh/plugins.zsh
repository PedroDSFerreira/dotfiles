# Check if the plugins argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 [github_username/plugin_name]"
  exit 1
fi

# Assign the input argument to github_plugins array
github_plugins=("$@")

for plugin in "${plugins[@]}"; do
    plugin_name=${plugin#*/}

    # Clone the plugin from GitHub if it doesn't exist
    if [[ ! -d "${ZDOTDIR:-$HOME}/plugins/$plugin_name" ]]; then
        mkdir -p "${ZDOTDIR:-$HOME}/plugins/${plugin_name}"
        echo "Cloning $plugin"
        git clone --depth 1 --recursive "https://github.com/$plugin.git" "${ZDOTDIR:-$HOME}/plugins/$plugin_name" 2>/dev/null
    fi

    # Custom config for zsh-vi-mode
    if [[ "$plugin_name" == "zsh-vi-mode" ]]; then
        eval "function zvm_config() { ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT; ZVM_VI_INSERT_ESCAPE_BINDKEY=jk; }"
    elif [[ "$plugin_name" == "zsh-completions" ]]; then
        fpath=("${ZDOTDIR:-$HOME}/plugins/$plugin_name/src" $fpath)
        autoload -Uz compinit
        compinit -u
    fi

    # Load the plugin
    for initscript in "${plugin_name}.zsh" "${plugin_name}.plugin.zsh" "${plugin_name}.sh"; do
        if [ -f "${ZDOTDIR:-$HOME}/plugins/$plugin_name/$initscript" ]; then
            source "${ZDOTDIR:-$HOME}/plugins/$plugin_name/$initscript"
            break
        fi
    done

done

unset plugin
unset plugin_name
unset github_plugins
unset initscript

