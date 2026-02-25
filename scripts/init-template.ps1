param(
  [switch]$DryRun
)

$ErrorActionPreference = 'Stop'

$targets = @(
  'SECURITY_POLICY.md',
  'REPO_MAINTENANCE_POLICY.md',
  'CONTRIBUTING.md',
  '.githooks/pre-commit',
  'scripts/secret-scan.ps1'
)

$missing = @()
foreach ($t in $targets) {
  if (-not (Test-Path $t)) { $missing += $t }
}

if ($missing.Count -gt 0) {
  Write-Host '[WARN] missing required template files:' -ForegroundColor Yellow
  $missing | ForEach-Object { Write-Host " - $_" }
} else {
  Write-Host '[OK] core template files exist'
}

if ($DryRun) {
  Write-Host '[DRYRUN] skip git config write'
  exit 0
}

git config core.hooksPath .githooks
Write-Host '[OK] git hooksPath set to .githooks'
