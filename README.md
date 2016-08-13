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
## Default Keymaps & Commands
Once installed, you can use the following commands

* `Ctrl + x`    - Plays the selected song in the Playlist window

* `Ctrl + a`    - R**a**ndom On or Off in the Playlist Window

* `Ctrl + e`    - R**e**peat On or Off in the Playlist Window

## Customizing
You can map your own key bindings for various tasks using the *<plug>* mappings that are available as follows:

* :MpcPlaylistBrowser
* :MpcTogglePlayback
* :MpcIncreaseVolume
* :MpcDecreaseVolume
* :MpcPlayNext
* :MpcPlayPrev

They are named appropriately and so they will do what their name suggests they will.

## Attribution
This plugin is possible because of the book [VimL Primer](https://pragprog.com/book/bkviml/the-viml-primer) from **The Pragmatic Bookshelf**. Its a must read for anyone looking to learn Vim scripting. 
