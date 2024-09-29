# Dotfiles

This repository contains my personal system dotfiles, making it easy to manage and sync configurations across machines.

## Table of Contents

- [Dotfiles](#dotfiles)
  1.  [Table of Contents](#table-of-contents)
  2.  [Requirements](#requirements)
  3.  [Installation](#installation)
  4.  [Notes](#notes)
  5.  [Submodule Update](#submodule-update)

## Requirements

Make sure the following tools are installed on your system:

- `git` (for cloning the repository)
- `stow` (for creating symlinks)
- `wget` and `curl` (for downloading plugins)

You can install these using your package manager. For example, on a Debian-based system:

```bash
sudo apt install git stow
```

## Installation

1. Clone the repository into your `$HOME` directory:

```bash
git clone git@github.com:A-raj468/dotfiles.git
cd dotfiles
```

2. Update the submodule for Neovim configuration (if applicable):

This repo includes a submodule for Neovim in the `.config/nvim` directory. To initialize and update the submodule:

```bash
git submodule init
git submodule update
```

3. Create symlinks using `GNU Stow`:

Use `stow` to symlink the dotfiles to the correct locations in your system. Each subdirectory in this repo represents a group of dotfiles.

For example, to symlink the Neovim configuration:

```bash
stow nvim
```

Repeat this process for other configurations:

```bash
stow <directory-name>
```

> [!Warning]
> These dotfiles are tailored for my personal use case and may contain configurations or customizations that don’t apply to your system.
> Always review the content and modify it to suit your own environment and needs.
> Do not blindly copy without understanding the impact on your system.

For instance, you could have directories like `zsh`, `tmux`, etc., and you would run `stow zsh`, `stow tmux`, etc., to symlink them.

## Notes

- Ensure that the destination directories for symlinks (like `~/.config` for Neovim) already exist, or `stow` will create them for you.

- You can uninstall symlinks created by `stow` by using:

```bash
stow -D <directory-name>
```

## Submodule Update

If the Neovim configuration submodule needs updating, you can pull the latest changes like so:

```bash
git submodule update --remote --merge
```
