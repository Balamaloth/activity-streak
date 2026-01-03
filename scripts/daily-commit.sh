#!/usr/bin/env bash
set -euo pipefail

# LOCAL SCRIPT (for running from your machine via cron)
# Edit the variables below before use:
REPO_DIR="/path/to/local/repo"        # <-- REPLACE: absolute path to your local repo clone
BRANCH="main"                         # <-- REPLACE if your default branch is different

AUTHOR_NAME="Your Name"               # <-- REPLACE: name that will appear on the commit
AUTHOR_EMAIL="you@example.com"        # <-- REPLACE: must be an email registered to your GitHub account

cd "$REPO_DIR"
git checkout "$BRANCH"
git pull --rebase origin "$BRANCH"

mkdir -p contributions
echo "$(date -I) - automated contribution from local script" >> contributions/contributions.log
git add contributions/contributions.log

# Use explicit author so commit counts for your account
GIT_AUTHOR_NAME="$AUTHOR_NAME" \
GIT_AUTHOR_EMAIL="$AUTHOR_EMAIL" \
git commit -m "Daily contribution: $(date -I)" || echo "Nothing to commit"

git push origin "$BRANCH"
