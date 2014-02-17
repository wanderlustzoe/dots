if [[ "$OSTYPE" == linux* ]]; then
  # nvidia fix
  export __GL_SYNC_TO_VBLANK=1
  export __GL_SYNC_DISPLAY_DEVICE=DFP-0
  export __VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=DFP-0

  # command not found; install pkgfile
  [[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] &&\
    source /usr/share/doc/pkgfile/command-not-found.zsh
fi

