#!/bin/bash
BRANCH="latest"
REPO_URL="https://github.com/nikborzunov/flowtime-timer.git"
START_DATE="2000-12-31"
END_DATE="2025-03-01"
FILE="commit.md"
rm -rf .git
git init
git checkout -B "$BRANCH"
git remote add origin "$REPO_URL"
touch "$FILE"

START=$(date -j -f "%Y-%m-%d" "$START_DATE" "+%s")
END=$(date -j -f "%Y-%m-%d" "$END_DATE" "+%s")

DAMN=(
"X    X  XXX   X   X  X   X"
"XX  XX X   X  XX XX  XX  X"
"X XX X X   X  X X X  X X X"
"X    X XXXXX  X   X  X  XX"
"X    X X   X  X   X  X   X"
"X    X X   X  X   X  X   X"
"X    X X   X  X   X  X   X")

commit_needed() {
  local letter=$(( $1 / 6 ))
  local col=$(( $1 % 6 ))
  local row=$2
  [[ ${DAMN[row]:letter*6+col:1} == "X" ]]
}

current="$START"
while [ "$current" -le "$END" ]; do
  days=$(( (current - START) / 86400 ))
  week=$(( (days / 7 ) % 26 ))
  row=$(( days % 7 ))
  if commit_needed "$week" "$row"; then
    DATE=$(date -r "$current" "+%Y-%m-%dT12:00:00")
    echo "$DATE" >> "$FILE"
    git add "$FILE"
    GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" git commit -m "commit $DATE"
  fi
  current=$((current + 86400))
done

git push origin "$BRANCH" -f