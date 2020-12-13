main() {
  say "Checking git"
  need_cmd git
  say "Checking ansible"
  need_cmd ansible
  say "All requirements met"
  clone_dotphiles_repo
}

clone_dotphiles_repo() {
  say "Cloning dotphiles repository..."
  git clone -q https://github.com/thassiov/dotphiles.git /tmp/dotphiles
}

say() {
    printf 'dotphile: %s\n' "$1"
}

err() {
    say "$1" >&2
    exit 1
}

need_cmd() {
    if ! check_cmd "$1"; then
        err "need '$1' (command not found)"
    fi
}

check_cmd() {
    command -v "$1" > /dev/null 2>&1
}

main "$@" || exit 1
