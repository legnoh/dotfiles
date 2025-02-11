# install_vscode

Install Zshell plugin and common configurations.

- [zsh-users/zsh-autosuggestions: Fish-like autosuggestions for zsh](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-users/zsh-syntax-highlighting: Fish shell like syntax highlighting for Zsh.](https://github.com/zsh-users/zsh-syntax-highlighting)

## Requirements

None

## Role Variables

None

## Dependencies

None

## Manual TODO

None

## Appendix

### Concept: Modular Zsh Configuration for Enhanced Flexibility

This Role is responsible for placing the .zshrc file, which contains only the following two lines:

```
for f in $HOME/.config/zsh/*; source $f;
autoload -Uz compinit && compinit
```

This means that any files placed under the `$HOME/.config/zsh/` directory by other Ansible Roles will be automatically loaded, including shell completion functionality.
With this mechanism, other Ansible Roles can freely add their required Zsh configurations later as needed.

### Why is HISTSIZE so large?

- [5000兆円欲しい! (ごせんちょうえんほしい)とは【ピクシブ百科事典】](https://dic.pixiv.net/a/5000%E5%85%86%E5%86%86%E6%AC%B2%E3%81%97%E3%81%84%21)
