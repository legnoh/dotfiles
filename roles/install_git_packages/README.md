# install_git_packages

Install Git family and settings.

- [Git](https://git-scm.com/)
  - [GitHub CLI | Take GitHub to the command line](https://cli.github.com/)
  - [x-motemen/ghq: Remote repository management made easy](https://github.com/x-motemen/ghq)
  - [simonwhitaker/gibo: 🤫 Easy access to gitignore boilerplates](https://github.com/simonwhitaker/gibo)
  - [Git Large File Storage](https://git-lfs.com/)

## Requirements

- Role:
  - `install_zsh_config`

## Role Variables

| Variable                               | Required | Default  | Choices | Comments             |
|----------------------------------------|----------|----------|---------|----------------------|
| `install_git_packages_github_username` | no       | `legnoh` | -       | Your github username |

## Dependencies

- `SSH Sign Key` must be set to your GitHub account.
  - [Adding a new SSH key to your GitHub account - GitHub Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

## Manual TODO

- [ ] Setup GitHub CLI
  ```sh
  gh auth login --git-protocol=https --hostname=github.com --web
  ```

## Appendix

### Concept: Dynamic Inclusion of Git Configuration via Ansible Roles

This Role is responsible for managing the placement of `~/.gitconfig`, functioning as a router. Using the `blockinfile` module, it only contains an include block and the corresponding file path.

```
# BEGIN ANSIBLE MANAGED BLOCK - Global
[include]
  path = ~/.config/git/common.gitconfig
...
# END ANSIBLE MANAGED BLOCK - Global
```

This design allows other Ansible Roles to place files under the `~/.config/git/` and append include blocks to `.gitconfig` via `blockinfile`. As a result, users can flexibly customize their Git configurations even after the initial setup. With this approach, each Ansible Role can independently append the necessary Git settings as needed, ensuring modular and maintainable configuration management.

### Concept: Communication and Signing Methodology for Git Operations

This role requires the use of an `SSH Sign Key` for Git commit signing but does not require the use of an `SSH Authentication Key`. This decision is made based on the fact that communicating with the SCM over HTTPS is generally more versatile. While alternative signing methods such as `GPG keys` or `S/MIME certificates` are available, they are not as simple due to the need for additional software or paid certificates. Therefore, the most straightforward and versatile approach at present is to use HTTPS for SCM communication and SSH for signing.

- FYI: [github - git clone with HTTPS or SSH remote? - Stack Overflow](https://stackoverflow.com/questions/11041729/git-clone-with-https-or-ssh-remote)

Additionally, the access token required for HTTPS communication is automatically stored in the Keychain after authentication with the GitHub CLI (`gh`), meaning users should not manually create it.

- [GitHub CLI | Take GitHub to the command line](https://cli.github.com/manual/gh_auth_setup-git)
