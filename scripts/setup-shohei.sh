#!/bin/bash
# Shohei の MacBook Air M3 セットアップスクリプト
# 実行場所：Shohei の Mac で git clone 後に実行

set -e

echo "=== Shohei Claude Code セットアップ開始 ==="

# 1. メモリフォルダ作成
mkdir -p ~/.claude/projects/-Users-shohei/memory
mkdir -p ~/.claude/projects/-Users-shohei--claude/memory

# 2. CLAUDE.md を Shohei 専用に設定（shohei/CLAUDE.md をコピー）
if [ -f ~/.claude/katsu-config/shohei/CLAUDE.md ]; then
    cp ~/.claude/katsu-config/shohei/CLAUDE.md ~/.claude/CLAUDE.md
    echo "✅ CLAUDE.md を Shohei 専用設定にしました"
else
    echo "⚠️  katsu-config/shohei/CLAUDE.md が見つかりません。手動で配置してください"
fi

# 3. MEMORY.md が存在しなければ作成
MEMORY_PATH="$HOME/.claude/projects/-Users-shohei--claude/memory/MEMORY.md"
if [ ! -f "$MEMORY_PATH" ]; then
    cat > "$MEMORY_PATH" << 'EOF'
# Shohei Memory Index

## Profile
- 18歳、UK在住（7歳からUKで育つ）
- 日本の大学進学目標（2027年4月）
- ADHD診断済み、MacBook Air M3使用

## Learning
- （学習進捗をここに記録）

## Goals
- ENG4U・MHF4U 完了
- 2027年4月 日本の大学入学
EOF
    echo "✅ MEMORY.md を初期化しました"
fi

echo ""
echo "=== セットアップ完了 ==="
echo "次のステップ："
echo "1. claude を起動してログインする"
echo "2. Katsu に git push してもらい、git pull で最新メモリを取得"
echo "3. Katsu と一緒に初回セッションを実施"
