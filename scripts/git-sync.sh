#!/usr/bin/env bash
# Commit mọi thay đổi và đồng bộ với GitHub (nếu đã cấu hình remote "origin").
# Dùng: ./scripts/git-sync.sh        (thủ công)  hoặc lên lịch mỗi 15–60 phút.
set -euo pipefail
cd "$(dirname "$0")/.."

git add -A
if ! git diff --cached --quiet; then
  git commit -q -m "vault sync $(date '+%Y-%m-%d %H:%M')"
fi

if git remote get-url origin >/dev/null 2>&1; then
  git pull --rebase --autostash -q origin "$(git branch --show-current)" || { echo "pull failed — xử lý conflict thủ công"; exit 1; }
  git push -q origin "$(git branch --show-current)"
  echo "synced with origin"
else
  echo "committed locally (chưa có remote origin)"
fi
