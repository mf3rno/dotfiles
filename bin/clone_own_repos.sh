#!/bin/bash

# TODO: Prettify output from git, one line per clone instead of verbose output
# TODO: Notify on existing repo & skip
# TODO: Add option to list repos/select (fzf?)

gen_repo_clone_commands() {
  echo "$1" | sed -r "$SED_CLONE_REGEX"
}

gen_bash_script() {
  local -r SCRIPT_FN=$1
  local -r CONTENTS=$2
  local -r DEST_PATH=$3

  echo '#!/bin/bash' > $SCRIPT_FN
  echo '' >> $SCRIPT_FN
  echo "cd $DEST_PATH" >> $SCRIPT_FN
  echo "$CONTENTS" >> $SCRIPT_FN

  chmod +x $SCRIPT_FN
}

TMP_SCRIPT_FN=${TMP_SCRIPT_FN:=$(mktemp)}
GIT_SRC_PATH=${GIT_SRC_PATH:=$HOME/.src}
GIT_OWNER=${GIT_OWNER:=$USER}
GIT_OWNER_REPO_PATH=${GIT_OWNER_REPO_PATH:=$GIT_SRC_PATH/github/$GIT_OWNER}

PERSONAL_REPOS=$(gh list-repos xf3rno)
SED_CLONE_REGEX="s/^(.*)$/git clone --recursive=. -j 4 --progress git@github.com:\/\1.git/"
SCRIPT_CONTENTS=$(gen_repo_clone_commands "$PERSONAL_REPOS")
REPO_COUNT=$(echo "$PERSONAL_REPOS" | wc -l)

echo "Found $REPO_COUNT repos"
read -n 1 -p 'Begin clone? (y/n): ' CONFIRM_CLONE_RAW

CONFIRM=${CONFIRM_CLONE_RAW,,}

echo "$CONFIRM"

if [[ "$CONFIRM" != "y" ]]; then
  echo "Aborting"
  exit 1
fi

gen_bash_script "$TMP_SCRIPT_FN" "$SCRIPT_CONTENTS" "$GIT_OWNER_REPO_PATH"

bash -c $TMP_SCRIPT_FN

rm $TMP_SCRIPT_FN
