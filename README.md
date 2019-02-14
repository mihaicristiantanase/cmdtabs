# cmdtabs

### What is does:
1. displays a very simplified tabline in the command line when pressing F3
   key;
2. keeps the actual tabline hidden;

The fake tabline shows the number of the tab with additional "+" character in
case one of the buffers in the tab has unsaved changes.

### What it requires:
1. vim-mctab plugin needs to be removed because of the mapping collision
2. VIM 7+

### How does it look:
Assuming there are 4 tabs, second and forth tabs with unsaved buffers and the
second tab currently selected, the fake tabline will look like this
```c
  1  [ 2+]  3    4+
```
This tabline is displayed in the middle of the command line.

### What is the motivation:
An additional line is needed to show vim's tabline. This plugin shows a fake
tabline in an area which is always visible, the command line.

This is an incremental improvement over the
[vim-mctab](https://github.com/mihaicristiantanase/vim-mctab).
vim-mctab plugin displays a simplified tabline for a breaf moment, disrupting
the active windows while trazitioning.

Another reason is that it's very useful to have a quick glimpse of the tab
line when changing tabs.

### How to install:

Vundle<br/>
`Plugin 'mihaicristiantanase/cmdtabs'`

vim-plug<br/>
`Plug 'mihaicristiantanase/cmdtabs'`

Pathogen<br/>
`git clone https://github.com/mihaicristiantanase/cmdtabs ~/.vim/bundle/cmd-tabs`
