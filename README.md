# Vim-mpc
Vim Plugin for MPC Player

[MPC](https://www.musicpd.org/clients/mpc/) is an Open source media player that works with [MPD Daemon](https://www.musicpd.org/). This plugin allows you to easily interact with that daemon.

This is how it looks when you open the Playlist Window

![vim-mpc playlist image](PlaylistWindow.png)

## Built-in commands for various actions.
* `:MpcBrowser`     - Opens the playlist in a split window with Colors for Artist and Title

* `:TogglePlayback` - Play/Stop the track

* `:ToggleRandom`   - Random On or Off

* `:ToggleRepeat`   - Repeat On or Off

## Default Keymaps

* `<Leader>p` - Mapped to `:MpcBrowse`. So, you can use that. 

* `Ctrl + x` - Plays the selected song in the Playlist window

* `Ctrl + a` - Random On or Off in the Playlist Window

* `Ctrl + e` - Repeat On or Off in the Playlist Window

## Customizing

You can map your own key to get the playlist window as follows

To map it to `Ctrl + p`, add this to your vimrc file

`nnoremap <C-p> <plug>MpcBrowse`

## Attribution

This plugin is possible because of the book [VimL Primer](https://pragprog.com/book/bkviml/the-viml-primer) from **The Pragmatic Bookshelf**. Its a must read for anyone looking to learn Vim scripting. 

