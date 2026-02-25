param(
  [switch]$DryRun
)

$ErrorActionPreference = 'Stop'

Write-Host '== Daily Maintenance Helper =='
Write-Host '1) Plan (3-5 items)'
Write-Host '2) Implement + local verification'
Write-Host '3) Pre-commit secret scan'
Write-Host '4) Summary + next actions'

if ($DryRun) {
  Write-Host '[DRYRUN] no command execution'
  exit 0
}

powershell -NoProfile -ExecutionPolicy Bypass -File scripts/secret-scan.ps1
Write-Host '[OK] secret scan done'
