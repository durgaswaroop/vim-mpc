# Vim-mpc
Vim Plugin for MPC Player

[MPC](https://www.musicpd.org/clients/mpc/) is an Open source media player that works with [MPD Daemon](https://www.musicpd.org/). This plugin allows you to easily interact with that daemon.
Vim and music is a great combination. Listening to your favorite MJ song while coding makes you a *Bad* ass programmer. But to change a song, Pause/Play it, you have to leave Vim and open the media player. Being able to control your media player from Vim makes you a *Badder* ass. 

Let Vim-mpc take care of that while you code listening to Thriller.

This is how the Playlist window looks like. 

![vim-mpc playlist image](https://github.com/durgaswaroop/vim-mpc/blob/master/PlaylistWindow.PNG)

Let's see a Demo. Shall We ?

![vim-mpc demo image](https://github.com/durgaswaroop/vim-mpc/blob/master/Animation.gif)

Now that's smooth. Smooth like a Criminal!

## Installing
Install it using any Plugin manager of your choice. If you don't have a preference, I recommend [Pathogen](https://github.com/tpope/vim-pathogen) by Tim Pope. 

To install using Pathogen, 

```bash
cd ~/.vim/bundle # For linux

# vimfiles/bundle in Windows

git clone https://github.com/durgaswaroop/vim-mpc.git
```

## Built-in commands for various actions.
Once installed, you can use the following commands

* `:MpcBrowser`     - Opens the playlist in a split window with Colors for Artist and Title

* `:TogglePlayback` - Play/Stop the track

* `:ToggleRandom`   - Random On or Off

* `:ToggleRepeat`   - Repeat On or Off

* `:IncreaseVolume`  - Increase Volume by 5%

* `:DecreaseVolume`  - Decrease Volume by 5%

* `:PlayNext` - Plays the next song in the Playlist

* `:PlayPrev` - Plays the previous song in the Playlist

## Default Keymaps
* `<Leader>p` - Mapped to `:MpcBrowse`. You can change it if you wish. Look at Customizing below

* `Ctrl + x` - Plays the selected song in the Playlist window

* `Ctrl + a` - Random On or Off in the Playlist Window

* `Ctrl + e` - Repeat On or Off in the Playlist Window

## Customizing
You can map your own key to get the playlist window as follows

To map it to `Ctrl + p`, add this to your vimrc file

```
nnoremap <C-p> <plug>MpcBrowse
```

## Attribution
This plugin is possible because of the book [VimL Primer](https://pragprog.com/book/bkviml/the-viml-primer) from **The Pragmatic Bookshelf**. Its a must read for anyone looking to learn Vim scripting. 
