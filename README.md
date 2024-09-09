# My dotfiles

This repo contains the dotfiles for my system.

## Requirements

Make sure you have `git` and `stow` installed on your system.

## Installation

Clone the repo in your `$HOME` directory using `git` and checkout to the repo

```bash
git clone git@github.com:A-raj468/dotfiles.git
cd dotfiles
```

> [!Important]
> This repo contains a submodule `nvim` in the `.config/nvim` directory. Update the submodule using your preferred method.

Use the `GNU Stow` to create symlinks

```bash
stow .
```
