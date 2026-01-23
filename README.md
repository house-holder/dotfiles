# Config collection using **GNU Stow**
If there's a utility, shell script, or user-scoped custom config file you don't want to rebuild for every new work environment, then `stow` is the tool you're after. This is how I manage a 1:1 config setup across multiple machines.

Why? If you end up programming on different devices, changing one configuration in one spot means you'll have to go to every other device and make identical changes to them, too. This makes that process simpler because you can just pull your stow repo and the changes will be synced.

Feel *free*[^1] to try out [GNU stow](https://www.gnu.org/software/stow/) for yourself.

### Installation:
Update your package manager if needed, then:
- `sudo apt install stow`
- `pacman -S stow`[^2]

There are other install options I don't use. [Read the docs](https://www.gnu.org/software/stow/manual/stow.html#Introduction) to learn more.

### Setup:
1) Create a dedicated config dir in your home (mine is `~/dotfiles/`)
2) `mv` relevant config files/dirs into `dotfiles/`
    - Note: I've placed the files inside their own respective "package" dirs, i.e.
        - `~/dotfiles/nvim/`
        - `~/dotfiles/bash/`
        - etc.
3) `cd ~/dotfiles/` *(or whatever you named it)*
4) `stow .` to set up the symlinks



That's it, pretty hassle free. When you make any config changes, commit and push them to your own remote - then enjoy pulling it down from anywhere you need a familiar and comfortable workspace.

> [!WARNING]
> If you want to copy these configs, you'll need access to:
> > `bash`
> > `eza`
> > `nvim`
> > `pydf`
> > `tmux`
> 
> Some things may be hardcoded to my own unique absolute paths. Be warned!
>
> But feel free to use anything interesting you find here.

# Config Details
I am mostly after tools that improve my (hobbyist, to be clear) workflow in a way that I feel is sensible. This includes a very [kickstart](https://github.com/nvim-lua/kickstart.nvim)-inspired modular Neovim config with some tweaks, plus other minor items.

The good news: It doesn't have to be limited to these items, and can be expanded to whatever configurations you desire.


## Summary

Get excited about your dev environment, dive into configuring things for yourself, and know you can keep it all organized quite neatly and make it highly repeatable using `stow`.

ok  
thanks for reading this far  
**bye**

[^1]: FOSS forever  
[^2]: Arch btw
