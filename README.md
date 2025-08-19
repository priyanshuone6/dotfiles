# dotfiles
The repository contains all my dotfiles

## Run these
```bash
mkdir -p "$HOME/.venvs"

ln -s ~/dotfiles/git/gitconfig ~/.gitconfig

grep -Fq 'dotfiles/zsh/zshrc' "$HOME/.zshrc" 2>/dev/null || printf '\n# load dotfiles zshrc\n[[ -r "$HOME/dotfiles/zsh/zshrc" ]] && . "$HOME/dotfiles/zsh/zshrc"\n' >> "$HOME/.zshrc"

source ~/.zshrc
```

# uvbash helper for venv
uvbash create <name> [uv venv options...]
uvbash use    <name>
uvbash del    <name>
