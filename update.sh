#!/bin/bash
# 一鍵 push 到 GitHub
# 使用：./update.sh "更新說明"
# 或：直接 ./update.sh （會詢問訊息）

cd "$(dirname "$0")" || exit 1

# 顯示當前改動
echo "📋 目前改動："
git status -s
echo ""

# 取得 commit 訊息
if [ -z "$1" ]; then
  read -r -p "✏️  請輸入更新說明： " MSG
else
  MSG="$1"
fi

if [ -z "$MSG" ]; then
  echo "❌ 訊息不能空白"
  exit 1
fi

# 執行
git add . && \
git commit -m "$MSG" && \
git push && \
echo "✅ 推送完成 → https://github.com/samwi-dev/notion-voice-shortcut"
