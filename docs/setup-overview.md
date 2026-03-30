# Katsu Claude Code セットアップ全体マップ

**最終更新:** 2026-03-21
**参考:** ECC (Everything Claude Code) × Superpowers 統合
**ベースライン:** Anthropicハッカソン優勝者 @affaanmustafa のセットアップを参考に構築

---

## 開発フロー（必須）

```
タスク受領
    ↓
🔍 STEP 0: 市場調査（WebSearch / gh search）
    ↓
💡 STEP 1: ブレインストーム（brainstorming スキル）← HARD-GATE
    ↓
📋 STEP 2: 計画書（writing-plans + /plan）
    ↓
🌿 STEP 3: Git Worktree 隔離
    ↓
🧪 STEP 4: TDD実装（test-driven-development）
    ↓
⚡ STEP 5: サブエージェント実行
    ↓
✅ STEP 6: 完了前検証（verification-before-completion）
    ↓
👀 STEP 7: コードレビュー
    ↓
🏁 STEP 8: ブランチ完了
    ↓
🧠 STEP 9: /learn-eval → /save-session
```

---

## スキル一覧（~/.claude/skills/）

### Superpowers スキル（14個）

| スキル | 用途 | 呼び出しタイミング |
|---|---|---|
| `using-superpowers` | スキル体系の確立 | セッション開始時 |
| `brainstorming` | 要件整理・設計探索 | コード前 HARD-GATE |
| `writing-plans` | 実装計画書作成 | ブレインストーム後 |
| `executing-plans` | 計画書の実行 | 計画確認後 |
| `test-driven-development` | RED→GREEN→REFACTOR | 実装前 |
| `subagent-driven-development` | サブエージェント駆動実装 | 並列タスク時 |
| `systematic-debugging` | バグの根本原因調査 | エラー発生時 |
| `verification-before-completion` | 完了前の証拠確認 | 完了宣言前 |
| `requesting-code-review` | コードレビュー依頼 | 実装完了後 |
| `receiving-code-review` | レビュー受け取り | フィードバック後 |
| `dispatching-parallel-agents` | 並列エージェント起動 | 独立タスク2つ以上 |
| `using-git-worktrees` | 隔離ブランチ作業 | 機能開発開始時 |
| `finishing-a-development-branch` | ブランチ完了処理 | 実装完了後 |
| `writing-skills` | 新スキル作成 | スキル追加時 |

---

## コマンド一覧（~/.claude/commands/）

| コマンド | 内容 |
|---|---|
| `/dev` | ECC×Superpowers 完全統合開発フロー（10ステップ） |
| `/mobile` | Takada家 携帯電話6台管理ダッシュボード |
| `/neta` | 今日のAI・テックトレンド収集・保存 |
| `/daily` | Kats Daily 起動（毎朝ルーティン） |
| `/payslip` | UK給与明細・税金分析 + 年金貢献額推奨 |
| `/finance` | Katsu 資産ダッシュボード |
| `/house` | 97 Morphou Road 家プロジェクトダッシュボード |
| `/save-session` | セッション状態を保存 |
| `/learn-eval` | パターン抽出・スキル保存判定 |
| `/s` | スクリーンショット読み込み・説明 |
| `/vox` | Kats Vox（音声入力アプリ）起動 |

---

## フック（~/.claude/settings.json）

| タイミング | 動作 | 効果 |
|---|---|---|
| **Notification** | Mac通知（Ping音） | Claudeが確認待ちのとき通知 |
| **PostCompact** | Git状態・コミット履歴を自動表示 | コンテキスト圧縮後の記憶リセット防止 |
| **PostToolUse（Edit/Write）** | `console.log`残留を警告 | デバッグ文の置き忘れ防止 |
| **PreToolUse（Bash）** | `git push`前に確認メッセージ | レビュー忘れ防止 |
| **PreToolUse（Edit/Write）** | `.env`等の保護ファイルをブロック | 重要ファイルの誤編集防止 |
| **Stop** | `/learn-eval` と `/save-session` リマインダー | セッション終了の後始末 |

---

## プラグイン

| プラグイン | 用途 |
|---|---|
| `claude-md-management` | CLAUDE.md の管理・改善 |
| `hookify` | 会話でフックを作成（JSON不要） |
| `typescript-lsp` | TypeScript リアルタイム型チェック |
| `pyright-lsp` | Python リアルタイム型チェック |
| `mgrep` | ripgrepより賢いコード検索 |

---

## MCP サーバー

| サーバー | 用途 | 状態 |
|---|---|---|
| `github` | PR・Issue・リポジトリ操作 | ✅ Connected |
| `playwright` | ブラウザ自動操作・UIテスト | ✅ Connected |
| `Gmail` | メール操作（claude.ai統合） | ✅ Connected |
| `Google Calendar` | カレンダー操作（claude.ai統合） | ✅ Connected |

---

## サブエージェント（~/.claude/agents/）

| エージェント | 役割 |
|---|---|
| `planner` | 機能実装計画の立案 |
| `architect` | システム設計・アーキテクチャ判断 |
| `tdd-guide` | テスト駆動開発の指導 |
| `code-reviewer` | コード品質・セキュリティレビュー |
| `security-reviewer` | 脆弱性分析 |
| `build-error-resolver` | ビルドエラーの修正 |
| `e2e-runner` | E2Eテスト（Playwright） |
| `refactor-cleaner` | デッドコード削除・リファクタリング |
| `doc-updater` | ドキュメント更新 |
| `go-reviewer` | Go言語コードレビュー |
| `kotlin-reviewer` | Kotlin/Androidコードレビュー |
| `python-reviewer` | Pythonコードレビュー |

---

## ルール（~/.claude/rules/）

| ファイル | 内容 |
|---|---|
| `common/coding-style.md` | コーディングスタイル原則 |
| `common/git-workflow.md` | Gitワークフロー |
| `common/testing.md` | テスト方針（80%カバレッジ） |
| `common/performance.md` | モデル選択・コンテキスト管理 |
| `common/agents.md` | サブエージェント委任ルール |
| `common/security.md` | セキュリティチェック |
| `clients.md` | クライアントコード一覧（3レター） |
| `development-workflow.md` | 機能実装ワークフロー |
| `git-workflow.md` | コミット・PR作成ルール |
| `performance.md` | モデル選択戦略 |

---

## ステータスライン

画面下部に表示される情報：
```
 main*  TODO:3  14:32
```
- **ブランチ名**（`*`=未コミット変更あり）
- **TODOカウント**（メモリ内の未完了タスク数）
- **現在時刻**

---

## エージェントチーム（並列開発）

複雑なタスクは複数のClaudeインスタンスを並列で動かす：

```bash
# 方法1: /fork コマンド（同一タスクの並列分岐）
/fork

# 方法2: Git Worktree × 複数ターミナル
git worktree add -b feature/api ../worktrees/api main
git worktree add -b feature/ui ../worktrees/ui main
# 各worktreeで別のClause Codeセッションを起動
```

**最適な並列数:** 3〜5インスタンス
**使いどころ:** 独立したモジュール・フロントエンド×バックエンド同時開発

---

## メモリ（自動記憶）

| ファイル | 内容 |
|---|---|
| `memory/user_profile.md` | Katsuのプロフィール・役割 |
| `memory/finance_assets.md` | 全資産マップ |
| `memory/house_project.md` | 家プロジェクト詳細 |
| `memory/mobile_phones.md` | 携帯電話6台管理 |
| `memory/project_nft_wonder_secret_club.md` | NFT保有情報 |
| `memory/reminder_google_ai_pro.md` | Google AI Pro解約リマインダー |
| `memory/feedback_dev_flow.md` | 開発フロー必須適用ルール |

---

## 参考リソース

- [Everything Claude Code（ハッカソン優勝）](https://github.com/affaan-m/everything-claude-code)
- [Superpowers for Claude Code](https://github.com/obra/superpowers)
- [Claude Code 公式ドキュメント](https://code.claude.com/docs)
- [PulseMCP サーバーディレクトリ](https://www.pulsemcp.com/servers)
