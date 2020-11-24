#!/bin/zsh
() {
  emulate -L zsh -o extendedglob -o rcquotes -o noshortloops -o warncreateglobal

  local dir=${${(%):-%x}:A:h}
  local fdir=$dir/functions
  typeset -gU FPATH fpath=( $fdir $dir $fpath )

  autoload -Uz $fdir/hist $fdir/.hist.*~*.zwc

  zle -N push-line .hist.push-line.widget
  zle -N push-input .hist.push-line.widget
  zle -N push-line-or-edit .hist.push-line.widget

  zle -N get-line .hist.get-line.widget

  zle -N undo .hist.undo.widget
}
