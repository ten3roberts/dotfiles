export QT_QPA_PLATFORMTHEME='qt5ct'

# Update rust
rustup update &

# Default programs
export BROWSER="firefox"
export TERMINAL="kitty"
export EDITOR="ec"
export VISUAL="ec"

export PATH=$HOME/.scripts:$HOME/.cargo/bin:$HOME/.local/bin:$PATH

# Cleanup home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOMR="$HOME/.config"
export ZDOTDIR="$HOME/.config/zsh"
export INPUTRC="$HOME/.config/inputrc"
export LESSHISTFILE="-"
