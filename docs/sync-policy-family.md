# 家族 Claude Code 同期ポリシー

## 同期パターン一覧

### 全員同期（家族全体で情報共有したいとき）
対象：Katsu + Shohei + Yoko
```bash
cd ~/.claude && git add -p && git commit -m "sync: family update" && git push && git pull
```

### Katsu のみ同期（Macと Windows の連携）
対象：Katsuのマック1 + Katsuのマック2 + Windows
- Katsuのメモリのみコミット・プッシュ
- Windows側は git pull で受け取る

### Shohei のみ同期（Shohei の学習進捗をKatsuが確認したいとき）
対象：ShoheiのM3 ↔ Katsuのマック
- Shohei が `git push` → Katsu が `git pull` で確認可能

### Yoko のみ同期（Yoko のプロジェクトをKatsuと共有したいとき）
対象：YokoのM1 ↔ Katsuのマック
- Yoko が `git push` → Katsu が `git pull` で確認可能

## 同期する（全デバイス共通）

✅ `CLAUDE.md`（各自で異なるが共有リポジトリに含む）
✅ `settings.json`
✅ `rules/`
✅ `docs/`
✅ `projects/-Users-<name>/memory/`（各自のメモリ）

## 同期しない

❌ `plugins/`（各デバイスで個別インストール）
❌ `skills/`（同上）
❌ `sessions/`
❌ `history.jsonl`
❌ Windows 固有コマンド

## 注意事項

- push前に必ずサイズ確認：`git ls-files | xargs du -ck | tail -1`
- 1MB（1024KB）を超えたら絶対に push しない → Katsu に確認
- Shohei・Yoko の Windows は今後も使用予定なし（Mac のみ）
