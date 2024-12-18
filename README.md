# Dotfiles

## Prerequisites

- GNU Stow (`stow`): A symlink farm manager that helps organize and install dotfiles.

## Installation

1. Clone this repository to the home directory:
   ```bash
   git clone git@github.com:turbuIence/dotfiles.git ~/.dotfiles
   ```

2. Navigate to the dotfiles directory:
   ```bash
   cd ~/.dotfiles
   ```

3. Install the dotfiles using Stow:
   ```bash
   stow .
   ```

4. Add user block to .gitconfig:
   ```
   [user]
       email = bugcat@capoo.com
       name = Bugcat Capoo
   ```

This will create symbolic links in your home directory pointing to the configuration files in this repository.

## Using Stow

GNU Stow creates symbolic links from the files in this repository to your home directory, maintaining the same directory structure. For example:

```
~/.dotfiles/
├── .bashrc          → ~/.bashrc
├── .vim/
│   ├── autoload/    → ~/.vim/autoload/
│   └── colors/      → ~/.vim/colors
└── .gitconfig       → ~/.gitconfig
```

## Uninstalling

To remove the symlinks created by Stow:

```bash
cd ~/.dotfiles
stow -D .
```
