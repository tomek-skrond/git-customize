### git-customize

This script is used for easy switching between git accounts.

It modifies git config parameters through custom environment files using `git config --global` command.

### Prerequisites

0. MacOS or a Linux-based system
1. GPG keyring (`gpg` command) with [signing commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key) set up.
2. Github or other git platform account
3. Backup of your current git config (just in case)

### Installation
Clone this github repo to chosen folder:
```
git clone git@github.com:tomek-skrond/git-customize.git "${XDG_CONFIG_HOME:-$HOME/.config}"/gitswitch
```

To set it up properly, it's recommended to use it as an alias:
```bash
alias gitswitch="~/.config/gitswitch/switch.sh"
```

Create profiles in the folder you cloned the repo (refer to [example configuration](./.example)).

After setting up alias, you can switch between your profiles defined in `~/.config/git/` (or other path you chose for this repo).
```
gitswitch example
```

Example command output:
```
/Users/user/.config/gitswitch
Switching account to .example
Switching SSH Agent context
All identities removed.
Identity added: /Users/tskr/.ssh/id_ed25519 (example.account@example.mail)
Done
```
