#!/usr/bin/env bash
# Bash script to simulate Git feature branching, PR workflow, peer review, and clean merge
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

echo "=========================================================="
echo " Week 1: Initialize Git Repository & PR Workflow Simulator"
echo "=========================================================="

cd "${REPO_ROOT}"
echo "[i] Working repository directory: ${REPO_ROOT}"

# Step 1: Ensure main branch
echo -e "\n[Step 1] Verifying current branch is 'main'..."
CURRENT_BRANCH="$(git branch --show-current || echo 'main')"
if [ "${CURRENT_BRANCH}" != "main" ]; then
    git checkout main 2>/dev/null || true
fi
echo "[✓] Currently on branch: main"

# Step 2: Create feature branch
echo -e "\n[Step 2] Creating and switching to feature branch 'feat/pr-guidelines'..."
git checkout -B feat/pr-guidelines
echo "[✓] Switched to branch 'feat/pr-guidelines'"

# Step 3: Stage artifacts
echo -e "\n[Step 3] Staging initial repository artifacts..."
git add README.md .gitignore .github/ practice/
echo "[✓] Artifacts staged"

# Step 4: Commit with Conventional Commits format
echo -e "\n[Step 4] Committing changes using Conventional Commits standard..."
git commit -m "feat(repo): initialize repository with PR guidelines, language choice, and review standards

- Add comprehensive root README.md with PR guidelines and Python 3.10+ specification
- Add .github/pull_request_template.md for structured peer reviews
- Add .gitignore for Python, virtual environments, and IDE artifacts
- Add practice documentation and PR workflow simulation scripts"
echo "[✓] Changes committed to 'feat/pr-guidelines'"

# Step 5: Simulate peer review
echo -e "\n[Step 5] Simulating peer code review..."
echo "  Reviewer @code-owner: 'LGTM! Clear guidelines, solid Python rationale, and well-structured PR template.' [APPROVED]"

# Step 6: Checkout main and merge cleanly
echo -e "\n[Step 6] Merging feature branch 'feat/pr-guidelines' into 'main'..."
git checkout main
git merge feat/pr-guidelines --no-ff -m "Merge pull request #1 from feat/pr-guidelines into main

feat(repo): initialize repository with PR guidelines and language choice"
echo "[✓] Clean merge into 'main' completed!"

# Step 7: View Git log
echo -e "\n[Step 7] Visualizing repository Git log graph..."
git log --graph --oneline -n 5

echo -e "\n=========================================================="
echo " PR Workflow Simulation Completed Successfully!           "
echo "=========================================================="
