#!/bin/zsh

set -euo pipefail

SCRIPTPATH=$(echo $(dirname $0))

echo "Using configuration from $SCRIPTPATH"

ACCOUNT="$1"

if [ ! -f "${SCRIPTPATH}/.${ACCOUNT}" ]; then
	echo "Profile $ACCOUNT does not exist in ${SCRIPTPATH}"
	exit 1
fi

source "${SCRIPTPATH}/.${ACCOUNT}"

echo "Switching account to .${ACCOUNT}"

git credential-cache exit

git config --global credential.username "${GIT_CREDENTIAL_USERNAME}"
git config --global user.email "${GIT_USER_EMAIL}"
git config --global user.name "${GIT_USER_NAME}"
git config --global user.signingkey "${GIT_USER_SIGNINGKEY}"

echo "Switching SSH Agent context"
ssh-add -D
ssh-add "$SSH_KEY_PATH"

echo "Done"
