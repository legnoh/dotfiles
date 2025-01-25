# install_git_packages

Install Git family and settings.

- [Git](https://git-scm.com/)
  - [GitHub CLI | Take GitHub to the command line](https://cli.github.com/)
  - [x-motemen/ghq: Remote repository management made easy](https://github.com/x-motemen/ghq)
  - [simonwhitaker/gibo: 🤫 Easy access to gitignore boilerplates](https://github.com/simonwhitaker/gibo)
  - [Git Large File Storage](https://git-lfs.com/)

## Requirements

None

## Role Variables

| Variable                | Required | Default | Choices                   | Comments                                 |
|-------------------------|----------|---------|---------------------------|------------------------------------------|
| `install_git_packages_github_username`                     | no       | `legnoh`   | -               | Your github username                         |

## Dependencies

- SSH Sign Key must be set to your GitHub account.

## Manual TODO

- [ ] Setup GitHub CLI
  ```sh
  gh auth login --git-protocol=https --hostname=github.com --web
  ```
