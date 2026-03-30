# 家族 Claude Code セットアップガイド

## デバイス一覧

| 誰 | デバイス | Claude Code 状況 | 契約 |
|---|---|---|---|
| Katsu | MacBook（現行）| ✅ 稼働中 | Katsu名義 Max Plan |
| Katsu | MacBook Air M5（予定）| セットアップ待ち | 同上 |
| Shohei | MacBook Air M3 | セットアップ待ち | 共有（→将来個別） |
| Yoko | MacBook Air M1 | セットアップ待ち | 共有（→将来個別） |
| Katsu | Windows（会社）| ✅ 稼働中（独立） | 同上 |

## ローカルフォルダ構造（各マック）

各デバイスで `git clone https://github.com/katsu9999/claude-config ~/.claude` した後：

```
~/.claude/
├── CLAUDE.md              ← 各自専用（デバイス・ユーザーごとに異なる）
├── settings.json          ← 共通設定
├── rules/                 ← 共通ルール
├── docs/                  ← このガイド等
└── projects/
    ├── -Users-<自分>/memory/        ← 自分のメモリ
    └── -Users-<自分>--claude/memory/ ← 自分のプロジェクトメモリ
```

## セットアップ手順（各デバイス）

### 共通手順
1. `brew install claude-code`（または公式インストーラー）
2. `claude` を起動し Katsu の Claude Pro でログイン
3. `cd ~ && git clone https://github.com/katsu9999/claude-config ~/.claude`
4. 各自の `CLAUDE.md` を配置（後述）
5. 動作確認

### Shohei（M3 MacBook Air）
- CLAUDE.md：`~/katsu-config/shohei/CLAUDE.md` の内容を `~/.claude/CLAUDE.md` にコピー
- または：`scripts/setup-shohei.sh` を実行

### Yoko（M1 MacBook Air）
- CLAUDE.md：`scripts/setup-yoko.sh` を実行
- 初回は Katsu がサポート

### Katsu M5（購入後）
- CLAUDE.md：現行マックの CLAUDE.md をそのままコピー
- `scripts/setup-new-mac.sh` を実行

## 個別契約への移行手順

1. **新 Claude Pro を契約する**（Anthropic サイト）
2. **新アカウントでログイン**：`claude auth logout && claude auth login`
3. **メモリ確認**：既存の `~/.claude/projects/` はそのまま残る
4. **git pull** で最新メモリを取得
5. 完了 — メモリ・ルール・スキルはそのまま引き継がれる
