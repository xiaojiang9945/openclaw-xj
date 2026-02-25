# SECURITY_POLICY.md

Last updated: 2026-02-25 11:18 (GMT+8)
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
