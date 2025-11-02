if status --is-login
  eval "$(/opt/homebrew/bin/brew shellenv)"
  
  # 1Password SSH Setting
  set -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
  
  # set default tui editor as neovim
  set -x EDITOR nvim
  set -x TIG_EDITOR "nvim"
end

