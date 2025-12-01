# Environment variables for MacOS
if [[ "$(uname)" == "Darwin" ]]; then
  # Adds Homebrew to environment variables on Apple Silicon Macs
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
