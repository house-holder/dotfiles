# Config collection using **GNU Stow**
The `stow` tool is handy for syncing your configs across machines. I am now working with a "packaged" version of this config repo, which means the top level is made up of `common`, `desktop`, and `server` config files used in ways that fit those descriptions.

### Installation:
Update your package manager if needed, then:
- `sudo apt install stow`
or
- `pacman -S stow`

### Setup (with package scopes):
1) Create a dedicated config dir in your home (mine is `~/.dotfiles/`)
2) Move configs into `~/.dotfiles/[package]/[...]`, where `[...]` represents any path beyond your `$HOME`.
    - **Examples**
        - Single file: `mv ~/.gitconfig ~/.dotfiles/common/.gitconfig`
        - Config dir: `mv ~/.config/hypr/ ~/.dotfiles/desktop/.config/hypr/`
3) `cd ~/.dotfiles/` *(or whatever you named it)*
4) `stow [package]` to set up the symlinks - for a new desktop, I'd `stow common` and `stow desktop` - and that's it. Enjoy soft link farming.

[Read the docs](https://www.gnu.org/software/stow/manual/stow.html#Introduction) to learn more.
