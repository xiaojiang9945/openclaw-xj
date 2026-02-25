# SECURITY_POLICY.md

Last updated: 2026-02-25 12:06 (GMT+8)
Priority: HIGHEST (user-defined)

## Core Mandatory Rules

1. **No deletion of existing content without explicit user instruction**
   - Do not delete existing files/directories/content.
   - Do not run destructive commands (`rm`, `rmdir`, recursive delete, empty/truncate existing files, destructive git operations).
   - If deletion is requested, ask for explicit confirmation with target path before action.

2. **Operational work directory constraint**
   - All work must be performed under: `D:\wplace\openclaw\work`
   - Creating/editing files and directories is allowed only within this path unless user explicitly overrides.

3. **External-contact privacy protection**
   - During any network/login/external interaction, never disclose:
     - computer/device security details
     - account security details
     - passwords/passphrases
     - API keys/tokens/cookies/session data
     - private SSH keys, recovery codes, MFA backups

## Additional Safety Baseline Rules

4. **No secret exfiltration**
   - Never paste local secrets into websites, prompts, tickets, chats, or commands.

5. **Minimum-necessary data sharing**
   - Share only the minimum data required to complete a task.
   - Redact sensitive identifiers by default.

6. **Explicit confirmation for high-risk actions**
   - Require explicit user confirmation before:
     - deleting/moving/overwriting important existing data
     - installing system-wide software
     - changing auth/security settings
     - running remote scripts
     - opening ports/firewall changes

7. **Safe command execution**
   - Prefer read-only inspection first.
   - Avoid unknown scripts, obfuscated commands, and untrusted binaries.

8. **No credential handling in plaintext**
   - Do not store or echo credentials in files, logs, terminal history, or chat.

9. **Path and scope checks before writes**
   - Verify target path is under `D:\wplace\openclaw\work` before file changes.

10. **Network destination caution**
    - Prefer official domains.
    - Warn and request confirmation for suspicious/unknown endpoints.

11. **Git safety**
    - No force push, no history rewrite, no branch delete without explicit confirmation.

12. **Auditability**
    - Keep a short changelog for important operations in `D:\wplace\openclaw\work\OPLOG.md`.

## Fixed Repository Maintenance Rules (Daily)

These rules are persistent and must be followed for ongoing repository maintenance.

### Goals

13. **Continuous maintenance and improvement**
    - Perform daily maintenance, optimization, fixes, and documentation updates for the repository.
    - Prioritize reliability, maintainability, performance, and readability.

### Hard Security Red Lines

14. **Never commit or expose sensitive data**
    - Never commit, push, print, or disclose passwords, tokens, API keys, cookies, private keys, session data, personal identity data, phone numbers, addresses, or other private/security-sensitive information.

15. **Never commit secret-bearing files**
    - Never commit `.env`, key files, auth caches, local credential stores, or personal data files.

16. **Stop-on-risk behavior**
    - If suspicious secrets or privacy data are detected, stop the commit/push flow immediately.
    - Report findings and provide a redaction/cleanup plan before any network action.

17. **No push/PR by default**
    - Do not run `push`, create PRs, or perform remote release actions unless the user explicitly says: `allow push`.

### Scope and Change Controls

18. **Working scope restriction**
    - All repository operations must stay within `D:\wplace\openclaw\work` unless the user explicitly overrides.

19. **Confirmation for risky structural changes**
    - Before delete/move/overwrite of important files, remote URL changes, or broad refactors, explain impact and require explicit user confirmation.

### Daily Execution Flow

20. **Plan first**
    - Start with a short daily plan (3-5 items).

21. **Local verification required**
    - After changes, run local verification (build/tests/lint where applicable) before commit.

22. **Pre-commit secret scan**
    - Before commit, inspect staged files and diffs for sensitive content.
    - Block commit if sensitive content is found.

23. **Daily delivery summary**
    - Provide: change summary, risk-check result, and suggested next actions.

### Commit Rules

24. **Minimal commit scope**
    - Include only required files in each commit; keep change scope minimal.

25. **Message quality**
    - Commit messages should explain why the change is made, not only what changed.

26. **User confirmation before commit**
    - Show the staged file list and wait for explicit user confirmation before creating a commit.
