# PowerShell script to simulate Git feature branching, PR workflow, peer review, and clean merge
#
# Scenario:
# 1. Verify working repository and ensure main branch
# 2. Create feature branch 'feat/pr-guidelines'
# 3. Stage and commit repository initialization artifacts
# 4. Simulate peer review approval and merge cleanly into main

$ErrorActionPreference = "Stop"
$ScriptDir = $PSScriptRoot
$RepoRoot = Resolve-Path (Join-Path $ScriptDir "..\..")

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Week 1: Initialize Git Repository & PR Workflow Simulator" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

Set-Location $RepoRoot
Write-Host "[i] Working repository directory: $RepoRoot" -ForegroundColor Yellow

# Step 1: Ensure repository is on 'main' branch
Write-Host "`n[Step 1] Verifying current branch is 'main'..." -ForegroundColor Cyan
$currentBranch = (git branch --show-current).Trim()
if ($currentBranch -ne "main") {
    git checkout main 2>$null
}
Write-Host "[✓] Currently on branch: main" -ForegroundColor Green

# Step 2: Create feature branch for PR guidelines
Write-Host "`n[Step 2] Creating and switching to feature branch 'feat/pr-guidelines'..." -ForegroundColor Cyan
git checkout -B feat/pr-guidelines
Write-Host "[✓] Switched to branch 'feat/pr-guidelines'" -ForegroundColor Green

# Step 3: Stage artifacts
Write-Host "`n[Step 3] Staging initial repository artifacts..." -ForegroundColor Cyan
git add README.md .gitignore .github/ practice/
Write-Host "[✓] Artifacts staged" -ForegroundColor Green

# Step 4: Create commit on feature branch
Write-Host "`n[Step 4] Committing changes using Conventional Commits standard..." -ForegroundColor Cyan
git commit -m "feat(repo): initialize repository with PR guidelines, language choice, and review standards

- Add comprehensive root README.md with PR guidelines and Python 3.10+ specification
- Add .github/pull_request_template.md for structured peer reviews
- Add .gitignore for Python, virtual environments, and IDE artifacts
- Add practice documentation and PR workflow simulation scripts"

Write-Host "[✓] Changes committed to 'feat/pr-guidelines'" -ForegroundColor Green

# Step 5: Simulate Peer Review & Approval
Write-Host "`n[Step 5] Simulating peer code review..." -ForegroundColor Cyan
Write-Host "  Reviewer @code-owner: 'LGTM! Clear guidelines, solid Python rationale, and well-structured PR template.' [APPROVED]" -ForegroundColor Green

# Step 6: Checkout main and merge cleanly
Write-Host "`n[Step 6] Merging feature branch 'feat/pr-guidelines' into 'main'..." -ForegroundColor Cyan
git checkout main

$mergeMessage = @"
Merge pull request #1 from feat/pr-guidelines into main

feat(repo): initialize repository with PR guidelines and language choice
"@

git merge feat/pr-guidelines --no-ff -m "$mergeMessage"
Write-Host "[✓] Clean merge into 'main' completed!" -ForegroundColor Green

# Step 7: View Git Log
Write-Host "`n[Step 7] Visualizing repository Git log graph..." -ForegroundColor Cyan
git log --graph --oneline -n 5

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host " PR Workflow Simulation Completed Successfully!           " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
