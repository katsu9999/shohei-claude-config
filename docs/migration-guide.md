# 移行ガイド

## 1. 個別 Claude Pro 契約への移行（Shohei・Yoko）

### いつやるか
- Shohei：ENG4U Unit 2 完了・学習ルーティン確立後（目安：2026年7月）
- Yoko：Claude Code を1ヶ月以上安定運用後

### 手順（5分で完了）

#### Shohei の場合
1. anthropic.com で Shohei 専用の Claude Pro を契約
2. Shohei の MacBook で以下を実行：
   ```bash
   claude auth logout
   claude auth login
   # Shohei専用メールでログイン
   ```
3. `git pull` で最新メモリを取得
4. `claude` を起動して動作確認
5. Katsu に共有ログインの停止を連絡 → Katsu のアカウントから除外

#### Yoko の場合
- Shohei と同様の手順

### 注意点
- メモリ・ルール・CLAUDE.md はそのまま引き継がれる（ゼロ移行コスト）
- 移行後も GitHub 同期は継続可能
- 個別契約後は各自がアカウント管理

---

## 2. Katsu の M5 MacBook Air 追加

### いつやるか
- M5 MacBook Air 購入後

### 手順（10分で完了）

1. M5 Mac で Claude Code をインストール
   ```bash
   brew install claude-code
   ```
2. 既存 Katsu の Mac から CLAUDE.md をコピー（または GitHub から取得）
3. GitHub からリポジトリをクローン
   ```bash
   git clone https://github.com/katsu9999/claude-config ~/.claude
   ```
4. セットアップスクリプトを実行
   ```bash
   bash ~/.claude/scripts/setup-new-mac.sh
   ```
5. ログイン
   ```bash
   claude auth login
   ```
6. 動作確認

### Katsu 2台マック間の同期
- 共通：GitHub 経由で同期（git push / pull）
- 仕事の Mac（現行）からプッシュ → M5 でプル
- M5 から更新したら → 現行 Mac でプル
