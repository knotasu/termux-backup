# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change the frequency the auto-updater is run (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to set how old an update must be before it's applied, manually or via the auto-updater (in days).
# zstyle ':omz:update' cooldown 10

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh-plugins/zsh-defer/zsh-defer.plugin.zsh
source ~/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
fpath+=~/.zsh-plugins/zsh-completions
source ~/.zsh-plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':completion:*' menu-select yes
zstyle ':fzf-tab:*' switch-word yes
source ~/.zsh-plugins/zsh-you-should-use/you-should-use.plugin.zsh
# source ~/.zsh-plugins/zsh-autopair/autopair.zsh
source ~/.zsh-plugins/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh
alias ls="lsd"
alias cat="bat --theme=Dracula --style=plain --paging=never"
eval "$(zoxide init zsh)"
unalias gga 2>/dev/null
export GOPATH="$HOME/.local/go"
export GOCACHE="$HOME/.cache/go"
export GOMODCACHE="$GOPATH/pkg/mod"
export PATH=$PATH:$HOME/go/bin
export OPENCLAW_DISABLE_BONJOUR=1

# ===== Persistent Directory =====
LAST_DIR_FILE="$HOME/.cache/core-termux/last_dir"
SESSION_TIMESTAMP="$HOME/.cache/core-termux/.session_time"
SESSION_TIMEOUT=5

save_dir() {
  mkdir -p ~/.cache/core-termux 2>/dev/null
  pwd > "$LAST_DIR_FILE"
  date +%s > "$SESSION_TIMESTAMP"
}

restore_dir() {
  if [[ -f "$SESSION_TIMESTAMP" ]] && [[ -f "$LAST_DIR_FILE" ]]; then
    local current_time
    local last_time
    current_time=$(date +%s)
    last_time=$(cat "$SESSION_TIMESTAMP" 2>/dev/null || echo 0)
    local diff=$((current_time - last_time))

    if [[ $diff -lt $SESSION_TIMEOUT ]]; then
      local dir
      dir=$(cat "$LAST_DIR_FILE" 2>/dev/null)
      if [[ -d "$dir" ]] && [[ "$dir" != "$HOME" ]]; then
        cd "$dir" 2>/dev/null
      fi
    fi
  fi
  date +%s > "$SESSION_TIMESTAMP"
}

if typeset -f add-zsh-hook &>/dev/null; then
  add-zsh-hook precmd save_dir
  restore_dir
else
  restore_dir
  trap 'save_dir' EXIT
fi
echo

# ===== Core-Termux Banner =====
source "/data/data/com.termux/files/home/.local/share/core-termux/core/utils/banner.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# === App Launcher para Termux ===
abrir() {
    local app=$1
    if [[ -z "$app" ]]; then
        echo "Uso: abrir <nombre_app>"
        return 1
    fi
    
    # Buscar el nombre del paquete de la app
    local pkg=$(pm list packages | cut -d':' -f2 | grep -i "$app" | head -n 1)
    
    if [[ -n "$pkg" ]]; then
        echo "🚀 Iniciando: $pkg..."
        # Usamos monkey para lanzar la app sin ser root
        monkey -p "$pkg" -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1
    else
        echo "❌ No se encontró la app: '$app'"
    fi
}

# === App Launcher para Termux (Versión Inteligente) ===
abrir() {
    # Convertimos lo que escribas a minúsculas
    local app=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    local pkg=""

    # Diccionario de apps comunes
    case "$app" in
        what*|wpp) pkg="com.whatsapp" ;;
        you*) pkg="com.google.android.youtube" ;;
        insta*|ig) pkg="com.instagram.android" ;;
        tele*) pkg="org.telegram.messenger" ;;
        chrome) pkg="com.android.chrome" ;;
        face*) pkg="com.facebook.katana" ;;
        twi*|x) pkg="com.twitter.android" ;;
        tik*) pkg="com.zhiliaoapp.musically" ;;
        spot*) pkg="com.spotify.music" ;;
        calc*) pkg="com.sec.android.app.popupcalculator" ;; # Calculadora (Samsung/Genérico)
        *) pkg="$1" ;; # Si no está en la lista, intenta usar lo que escribiste
    esac

    echo "🚀 Iniciando: $pkg..."
    # Lanzamos la app directo
    monkey -p "$pkg" -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1
}

# === App Launcher para Termux (Versión Nativa) ===
abrir() {
    # Convertimos lo que escribas a minúsculas
    local app=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    local pkg=""

    # Diccionario de apps
    case "$app" in
        what*|wpp) pkg="com.whatsapp" ;;
        you*) pkg="com.google.android.youtube" ;;
        insta*|ig) pkg="com.instagram.android" ;;
        tele*) pkg="org.telegram.messenger" ;;
        chrome) pkg="com.android.chrome" ;;
        face*) pkg="com.facebook.katana" ;;
        twi*|x) pkg="com.twitter.android" ;;
        tik*) pkg="com.zhiliaoapp.musically" ;;
        spot*) pkg="com.spotify.music" ;;
        calc*) pkg="com.sec.android.app.popupcalculator" ;;
        *) pkg="$1" ;; # Intenta usar lo que escribas directamente
    esac

    echo "🚀 Iniciando: $pkg..."
    
    # Usamos 'am start', el método maestro de Android
    am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -p "$pkg" > /dev/null 2>&1
    
    # Verificación por si falla silenciosamente
    if [ $? -ne 0 ]; then
        echo "❌ Permiso denegado por Android o la app no está instalada."
    fi
}

# === App Launcher para Termux (Versión Deep Link Hacker) ===
abrir() {
    local app=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    
    echo "🚀 Engañando a Android para abrir: $app..."
    
    case "$app" in
        # Para apps bloqueadas usamos Deep Links (Acción VIEW)
        what*|wpp) am start -a android.intent.action.VIEW -d "whatsapp://wa.me/" > /dev/null 2>&1 ;;
        you*) am start -a android.intent.action.VIEW -d "vnd.youtube://" > /dev/null 2>&1 ;;
        insta*|ig) am start -a android.intent.action.VIEW -d "instagram://" > /dev/null 2>&1 ;;
        tele*) am start -a android.intent.action.VIEW -d "tg://" > /dev/null 2>&1 ;;
        face*) am start -a android.intent.action.VIEW -d "fb://" > /dev/null 2>&1 ;;
        twi*|x) am start -a android.intent.action.VIEW -d "twitter://" > /dev/null 2>&1 ;;
        spot*) am start -a android.intent.action.VIEW -d "spotify://" > /dev/null 2>&1 ;;
        
        # Para apps del sistema usamos el método normal
        chrome) am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -p "com.android.chrome" > /dev/null 2>&1 ;;
        calc*) am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -p "com.sec.android.app.popupcalculator" > /dev/null 2>&1 ;;
        
        # Método genérico si pones el paquete manual
        *) am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -p "$1" > /dev/null 2>&1 ;;
    esac
}

# === App Launcher Definitivo (El Caballo de Troya) ===
abrir() {
    local app=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    
    echo "🚀 Invocando: $app..."
    
    case "$app" in
        # Usamos enlaces web oficiales, Android se verá obligado a abrir las apps
        what*|wpp) termux-open "https://wa.me/" ;;
        you*) termux-open "https://www.youtube.com/" ;;
        insta*|ig) termux-open "https://www.instagram.com/" ;;
        tele*) termux-open "https://t.me/" ;;
        face*) termux-open "https://www.facebook.com/" ;;
        twi*|x) termux-open "https://twitter.com/" ;;
        spot*) termux-open "https://open.spotify.com/" ;;
        chrome) termux-open "https://google.com/" ;;
        *) 
            echo "❌ No lo tengo en la lista rápida."
            echo "💡 Tip: Si sabes su enlace, usa: termux-open https://urldelaapp.com"
            ;;
    esac
}
