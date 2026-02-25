# SECURITY_CHECKLIST

用于每次维护提交前的快速核查。

## 必查项

- [ ] 操作目录仅在 `D:\wplace\openclaw\work`
- [ ] 未执行 pull/push/PR/远程发布（除非明确授权）
- [ ] staged 文件范围最小化
- [ ] `scripts/secret-scan.ps1` 执行通过
- [ ] 不包含 `.env`、密钥文件、个人数据
- [ ] commit message 清晰说明“为什么改”

## 高风险动作前确认

- 删除/移动/覆盖重要文件
- 修改远程地址或认证配置
- 批量重构
