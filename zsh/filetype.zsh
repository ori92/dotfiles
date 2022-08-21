#!/bin/zsh

# open browser on urls
_browser_fts=(htm html de org net com at cx nl se dk)
for ft in $_browser_fts; do alias -s $ft="$BROWSER"; done

# open text files in editor
_editor_fts=(js md MD cpp cxx cc c hh h inl asc txt TXT tex)
for ft in $_editor_fts; do alias -s $ft="$EDITOR"; done

# open images in viewer
_image_fts=(jpg jpeg png gif mng tiff tif xpm)
for ft in $_image_fts; do alias -s $ft="$XIVIEWER"; done

# open video on smplayer
_media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm flac)
for ft in $_media_fts; do alias -s $ft=smplayer; done

# read documents
alias -s pdf='okular'
alias -s ps='gv'
alias -s dvi='xdvi'
alias -s chm='xchm'
alias -s djvu='djview'

# list whats inside packed file
alias -s zip='unzip -l'
alias -s rar='unrar l'
alias -s tar='tar tf'
alias -s gz='gunzip -l'

# torrent files
alias -s torrent='xdg-open'
