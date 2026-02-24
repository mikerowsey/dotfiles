# ---------- SSH agent socket ----------
# Linux systemd user session typically provides XDG_RUNTIME_DIR.
# Only set if the socket exists and nothing else has already set SSH_AUTH_SOCK.
if [[ -n "${XDG_RUNTIME_DIR:-}" ]] && [[ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]] && [[ -z "${SSH_AUTH_SOCK:-}" ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
