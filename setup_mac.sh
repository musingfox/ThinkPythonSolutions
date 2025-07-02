#!/bin/bash

echo "🐍 Think Python 繁體中文版環境設置腳本"
echo "使用 uv - 現代化 Python 包管理工具"
echo "======================================"
echo ""

# 檢查是否為 macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ 此腳本僅適用於 macOS 系統"
    exit 1
fi

echo "📋 開始檢查和安裝必要軟體..."
echo ""

# 檢查 Homebrew
echo "🍺 檢查 Homebrew..."
if ! command -v brew &> /dev/null; then
    echo "📦 安裝 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # 加入 PATH (針對 Apple Silicon Mac)
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew 已安裝"
fi

# 安裝 uv
echo ""
echo "⚡ 安裝 uv - 現代化 Python 包管理工具..."
if ! command -v uv &> /dev/null; then
    brew install uv
    echo "✅ uv 安裝成功"
else
    echo "✅ uv 已安裝: $(uv --version)"
fi

# 建立專案並安裝依賴
echo ""
echo "📚 使用 uv 建立 Python 專案環境..."

# 初始化專案（如果 pyproject.toml 不存在）
if [ ! -f "pyproject.toml" ]; then
    uv init --no-readme --python 3.11
    echo "✅ 專案初始化完成"
fi

# 安裝 Jupyter 和常用套件
echo ""
echo "📦 安裝 Jupyter 和學習所需套件..."
uv add jupyter matplotlib pandas numpy requests beautifulsoup4 ipykernel

# 安裝專案依賴
echo ""
echo "🔄 同步專案環境..."
uv sync

echo ""
echo "✅ 環境建立完成！"

echo ""
echo "🎉 環境安裝完成！"
echo ""
echo "🎯 選擇學習方式："
echo "1) 使用瀏覽器 Jupyter Notebook（推薦初學者）"
echo "2) 安裝 IDE（VSCode、Cursor 等）"
echo "3) 兩者都設置"
echo ""

read -p "請輸入選項 (1-3): " learning_choice

case $learning_choice in
    1|3)
        echo ""
        echo "📋 Jupyter Notebook 使用方式："
        echo "1. 啟動 Jupyter：uv run jupyter notebook"
        echo "2. 瀏覽器會自動開啟 Jupyter 介面"
        echo "3. 點選 'soln' 資料夾開始學習"
        echo "4. 開始第一個練習：chap01.ipynb"
        echo ""
        ;;
esac

case $learning_choice in
    2|3)
        echo ""
        echo "💻 是否要安裝 IDE？ (y/n)"
        read -p "" install_ide
        if [[ $install_ide == "y" ]] || [[ $install_ide == "Y" ]]; then
            ./setup_ide.sh
        else
            echo "💡 你可以稍後執行 './setup_ide.sh' 來安裝 IDE"
        fi
        ;;
esac

echo ""
echo "💡 uv 使用小技巧："
echo "- 啟動 Jupyter：uv run jupyter notebook"
echo "- 執行 Python 腳本：uv run python script.py"
echo "- 安裝新套件：uv add 套件名稱"
echo "- 查看已安裝套件：uv tree"
echo "- 進入虛擬環境 shell：uv shell"
echo ""
echo "🌟 uv 的優勢："
echo "- ⚡ 極快的安裝速度"
echo "- 🔒 自動管理依賴衝突"
echo "- 🐍 自動安裝 Python 版本"
echo "- 📦 統一的專案管理"
echo ""
echo "📚 更多資源："
echo "- 📖 學習指南：學習指南.md"
echo "- 💻 IDE 設定：IDE使用指南.md"
echo "- 🔧 問題解決：修復環境.md"
echo "- 🚀 快速開始：快速開始.md"
echo ""
echo "🚀 現在就開始你的 Python 學習之旅吧！"