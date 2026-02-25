# openclaw-xj-template

基于 OpenClaw 的**安全优先仓库维护模板**（A 方案）。

## 目标

- 为个人/团队仓库提供可复用的维护规范与安全门禁。
- 默认执行“本地优先、最小改动、先检查后提交”。

## 最高优先级规则

1. 所有操作必须遵守 `SECURITY_POLICY.md`。
2. 任何与 `SECURITY_POLICY.md` 冲突的操作，必须暂停并等待仓库所有者确认。

## 包含内容

- `SECURITY_POLICY.md`：最高优先级安全与边界规则。
- `REPO_MAINTENANCE_POLICY.md`：每日维护流程与提交规范。
- `CONTRIBUTING.md`：协作与提交流程约定。
- `scripts/secret-scan.ps1`：提交前敏感信息扫描脚本。
- `.githooks/pre-commit`：本地 pre-commit 钩子（调用 secret scan）。
- `.github/workflows/secret-scan.yml`：CI 侧的基础密钥扫描示例。
- `scripts/init-template.ps1`：模板初始化脚本（检查文件+设置 hooksPath）。
- `OPLOG.md`：关键操作审计记录。

## 使用方式

1. 启用 hooks：
   - `git config core.hooksPath .githooks`
2. 提交前本地扫描：
   - `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/secret-scan.ps1`
3. 按 `REPO_MAINTENANCE_POLICY.md` 执行日常维护。

## 许可与来源

- OpenClaw 本体为开源项目：<https://github.com/openclaw/openclaw>
- 本仓库为维护模板，不包含 OpenClaw 全量源码快照。
