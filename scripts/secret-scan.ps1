param()

$ErrorActionPreference = 'Stop'

# 1) forbidden filenames/extensions
$forbiddenNamePatterns = @(
  '^\.env(\..+)?$',
  '^\.npmrc$', '^\.pypirc$',
  '(^|[/\\])id_rsa$', '(^|[/\\])id_dsa$', '(^|[/\\])id_ecdsa$', '(^|[/\\])id_ed25519$',
  '\.pem$', '\.p12$', '\.pfx$', '\.key$',
  '(^|[/\\])\.aws[/\\]credentials$',
  '(^|[/\\])\.ssh[/\\].+',
  '(^|[/\\])(secrets?|credentials?)\.(json|ya?ml|toml|ini|txt)$'
)

# 2) suspicious content patterns (staged diff)
$contentPatterns = @(
  'AKIA[0-9A-Z]{16}',
  'AIza[0-9A-Za-z\-_]{35}',
  'ghp_[A-Za-z0-9]{36,}',
  'github_pat_[A-Za-z0-9_]{20,}',
  'xox[baprs]-[A-Za-z0-9\-]{10,}',
  '-----BEGIN (RSA|EC|DSA|OPENSSH|PRIVATE) KEY-----',
  '(?i)(api[_-]?key|secret|token|password|passwd|cookie|session)\s*[:=]\s*["''][A-Za-z0-9_\-\./+=]{20,}["'']',
  '(?i)authorization\s*:\s*(bearer|basic)\s+[A-Za-z0-9\-\._~\+/=]{20,}'
)

$stagedFiles = git diff --cached --name-only
if (-not $stagedFiles) {
  Write-Host '[secret-scan] no staged files'
  exit 0
}

$violations = @()

foreach ($file in $stagedFiles) {
  $leaf = Split-Path $file -Leaf
  foreach ($pat in $forbiddenNamePatterns) {
    if ($leaf -match $pat -or $file -match $pat) {
      $violations += "forbidden filename pattern matched: $file (pattern: $pat)"
    }
  }
}

$diff = git diff --cached --unified=0 -- . ':(exclude)package-lock.json'
$addedLines = ($diff -split "`n") | Where-Object { $_.StartsWith('+') -and -not $_.StartsWith('+++') }
$placeholderAllow = '(?i)(YOUR_|your-|REPLACE|EXAMPLE|FAKE|DUMMY|TEST|CHANGEME|_TOKEN|API_KEY|LINE_CHANNEL_ACCESS_TOKEN|long-random-token|8-plus-chars|<.*>|\{\{.*\}\})'
$scanLines = $addedLines | Where-Object { $_ -notmatch $placeholderAllow }
$addedText = ($scanLines -join "`n")
foreach ($pat in $contentPatterns) {
  if ($addedText -match $pat) {
    $violations += "suspicious staged content pattern matched: $pat"
  }
}

if ($violations.Count -gt 0) {
  Write-Host ''
  Write-Host '[BLOCKED] potential sensitive data detected in staged changes:' -ForegroundColor Red
  $violations | Sort-Object -Unique | ForEach-Object { Write-Host " - $_" -ForegroundColor Yellow }
  Write-Host ''
  Write-Host 'Action required: unstage/redact before commit.' -ForegroundColor Red
  exit 1
}

Write-Host '[secret-scan] pass'
exit 0
