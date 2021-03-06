PATH="/usr/local/bin:${PATH}"

# Add homebrew to the path, if it's installed
if which brew > /dev/null; then
  _brew_prefix=$(brew --prefix)
  PATH="${_brew_prefix}/bin:${_brew_prefix}/sbin:${PATH}"
fi

if [ -d "${HOME}/bin" ]; then
    PATH="${HOME}/bin:${PATH}"
fi

typeset -U path
