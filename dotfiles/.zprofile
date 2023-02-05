#local binary path
PATH=$PATH:$HOME/.local/bin:$(ruby -e 'puts Gem.user_dir')/bin:$HOME/.node/bin:$HOME/.config/composer/vendor/bin:$(go env GOPATH)/bin

export EDITOR='nvim'
export VISUAL='nvim'

