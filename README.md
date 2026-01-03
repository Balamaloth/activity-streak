

This repository includes an automation to make a daily commit so the GitHub contribution graph shows activity.

Included files and purpose
- `.github/workflows/daily-commit.yml` — GitHub Actions workflow that runs daily and appends a line to `contributions/contributions.log`. It pushes using a Personal Access Token (PAT) so commits can be attributed to your account.
- `scripts/daily-commit.sh` — Local script you can run from your machine (example for cron). Edit placeholders before use.
- `contributions/contributions.log` — the file the workflow/script updates.

Secrets required for the workflow (add in repo → Settings → Secrets & variables → Actions)
- PERSONAL_TOKEN — a PAT with `repo` scope (used to push)
- COMMIT_NAME — your commit author name (e.g., "Alice Example")
- COMMIT_EMAIL — a verified email address on your GitHub account 

Notes
- Commits count for your contribution graph only if the commit author email is registered/verified on your account and commits land on the repo default branch.
- If your repo default branch is not `main`, update `HEAD:main` in the workflow to `
- To use empty commits instead of touching a file, replace the commit step with `git commit --allow-empty -m "Daily contribution: $(date -I)"`.
