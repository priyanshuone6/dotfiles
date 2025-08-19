# uvbash: minimal env manager (create | use | del)
# usage:
#   uvbash create <name> [uv venv options...]
#   uvbash use <name>
#   uvbash del <name>

uvbash() {
  emulate -L zsh
  local cmd="${1:-}"; shift || true
  local root="${UV_VENVS:-$HOME/.venvs}"
  mkdir -p "$root"

  _path() { print -r -- "$root/$1"; }

  case "$cmd" in
    create)
      local name="${1:-}"; shift || true
      [[ -z "$name" ]] && { print -u2 "usage: uvbash create <name> [uv venv options...]"; return 2; }
      command -v uv >/dev/null 2>&1 || { print -u2 "uvbash: 'uv' not found"; return 127; }
      [[ -e "$(_path "$name")" ]] && { print -u2 "uvbash: env '$name' already exists"; return 1; }
      uv venv "$@" "$(_path "$name")" || return
      print "created: $name -> $(_path "$name")"
      ;;
    use)
      local name="${1:-}"
      [[ -z "$name" ]] && { print -u2 "usage: uvbash use <name>"; return 2; }
      local act="$(_path "$name")/bin/activate"
      [[ -f "$act" ]] || { print -u2 "uvbash: env '$name' not found at $(_path "$name")"; return 1; }
      source "$act"
      ;;
    del)
      local name="${1:-}"
      [[ -z "$name" ]] && { print -u2 "usage: uvbash del <name>"; return 2; }
      local p="$(_path "$name")"
      [[ -e "$p" ]] || { print -u2 "uvbash: env '$name' not found"; return 1; }
      rm -rf -- "$p" && print "deleted: $name"
      ;;
    *)
      print -u2 "usage: uvbash {create|use|del} ..."
      return 2
      ;;
  esac
}
