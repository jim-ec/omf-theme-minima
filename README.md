<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### Minima

> A theme for [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish).

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.3.1-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## Install

```
omf install git@github.com:jim-ec/omf-theme-minima.git
omf theme minima
```

## Features

- **Prompt:** Red when last exit code was non-zero, green otherwise
- **Path:** Relative to home or relative to repository root
- Current Git branch
- High responsiveness due to very few processes spawning per prompt

![Figure](figure00.png)

## Tips

To disable the greeting displayed when launching the fish shell, amend the following instruction to `~/.config/fish/config.fish`:

```fish
set -U fish_greeting
```
To add to your path variable, use the `-a` option to append or `-p` to prepend:

```fish
set -a PATH ~/bin
```

