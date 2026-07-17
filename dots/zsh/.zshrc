# Main environment variables
export ZSH="${HOME}/.omz"
export NVM="${HOME}/.nvm"

# OMZ Configuration
ZSH_THEME=""
ZSH_CUSTOM="${HOME}/.omc"
ZSH_COMPDUMP="${ZSH_CACHE_DIR}/.zcompdump"

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# Plugins
# Standard plugins: $ZSH/plugins/
# Custom plugins:   $ZSH_CUSTOM/plugins/
plugins=(common-aliases cp git aws docker brew composer nvm)

if command -v zstyle &> /dev/null; then
  # Updates
  zstyle ':omz:update' mode auto
  zstyle ':omz:update' frequency 7
  zstyle ':omz:update' verbosity default
  # History config
  zstyle ':omz:history' max-entries 10000
  zstyle ':omz:history' save-interval 200
  zstyle ':omz:history' share-history yes
  # Plugins config
  zstyle ':omz:plugins:nvm' lazy yes
  zstyle ':omz:plugins:nvm' autoload yes
fi

# Load Oh My Zsh
if [ -f ${ZSH}/oh-my-zsh.sh ]; then
	source ${ZSH}/oh-my-zsh.sh
fi

# Starship prompt
if command -v starship &> /dev/null; then
	eval "$(starship init zsh)"
fi

# Load NVM
if [ -d "${NVM}" ]; then
  export NVM_DIR="${NVM}"
  [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"
  [ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"
fi
