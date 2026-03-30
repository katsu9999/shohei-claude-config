# Skills Manifest — インストール必須スキル一覧

新しいデバイス・環境でセットアップするときに参照するリスト。
`skills/` フォルダはgit管理外のため、各デバイスで手動インストールが必要。

---

## ⚠️ Mac側でインストール待ちのスキル

> **Macでgit pullしたら、このセクションを確認して未インストールのものを入れること。**
> インストール完了したら該当行を削除してcommit・push。

| スキル | インストール元 | 追加日 | 追加デバイス |
|---|---|---|---|
| （なし） | — | — | — |

✅ 2026-03-28 Superpowers全スキルをMacにインストール済み

---

## インストール方法

### ECC スキル（大部分）
`/configure-ecc` コマンドを実行してマーケットプレイスからダウンロード。

### Community スキル（一部）
ECC マーケットプレイスの Community セクションから個別にダウンロード。

### Superpowers（obra/superpowers）
```bash
git clone --depth 1 https://github.com/obra/superpowers /tmp/superpowers
cp -r /tmp/superpowers/skills/* ~/.claude/skills/
```

---

## Katsu の必須スキル一覧

### ★ 最優先（毎日使う）
```
brainstorming
using-superpowers
verification-before-completion
systematic-debugging
test-driven-development
writing-plans
executing-plans
subagent-driven-development
dispatching-parallel-agents
```

### 開発・コード品質
```
coding-standards
backend-patterns
frontend-patterns
deployment-patterns
database-migrations
docker-patterns
e2e-testing
tdd-workflow
requesting-code-review
receiving-code-review
finishing-a-development-branch
using-git-worktrees
security-review
```

### 言語・フレームワーク別
```
python-patterns / python-testing
golang-patterns / golang-testing
kotlin-patterns / kotlin-testing / kotlin-coroutines-flows
springboot-patterns / springboot-security / springboot-tdd
swift-concurrency-6-2 / swiftui-patterns
```

### AI・エージェント開発
```
claude-api
agent-harness-construction
agentic-engineering
autonomous-loops
continuous-learning-v2
cost-aware-llm-pipeline
eval-harness
enterprise-agent-ops
```

### コンサル・ビジネス
```
article-writing
market-research
investor-materials
api-design
```

### Community スキル（個別インストール必要）
```
plankton-code-quality   ← コード品質自動チェック（hooks連携）
blueprint               ← 複雑プロジェクトの設計計画
prompt-optimizer        ← プロンプト最適化
```

---

## 自動同期されるスキル（git管理）

`skills/learned/` フォルダのみgitで同期される：

| ファイル | 内容 |
|---|---|
| `claude-code-mcp-setup.md` | MCP サーバー追加の正しい方法 |
| `clubspark-booking-automation.md` | ClubSpark テニスコート予約自動化 |
| `multi-profile-env-config.md` | 複数プロファイル .env 設定パターン |
| `obsidian-markdown-table-format.md` | Obsidian テーブル書式ルール |
| `parallel-playwright-multi-user.md` | Playwright 並列マルチユーザー |

---

## セットアップ手順（新デバイス）

1. `git pull` で最新設定を取得
2. **⚠️ 「Mac側でインストール待ち」セクションを確認** → 未インストールのものを入れる
3. `/configure-ecc` を実行してECCスキルをインストール
4. Superpowers をcloneしてインストール（上記コマンド参照）
5. 上記「Community スキル」を手動で追加インストール
6. `skills/learned/` は git pull で自動取得済み ✅
7. 動作確認：`/using-superpowers` で全スキルが読み込まれているか確認

---

## 新スキルをインストールしたときのルール

**Windows・Macどちらかで新しいスキルをインストールしたら必ず：**

1. 「Mac側でインストール待ち」テーブルに追記（スキル名・インストール元URL・日付・デバイス）
2. `git add docs/skills-manifest.md && git commit && git push`
3. 他のデバイスで `git pull` して確認・インストール → テーブルから削除してpush

---

*Last updated: 2026-03-28*
