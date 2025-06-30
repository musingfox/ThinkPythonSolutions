#!/bin/bash

echo "🐍 Think Python 繁體中文版環境設置腳本"
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

# 檢查 Python3
echo ""
echo "🐍 檢查 Python 3..."
if ! command -v python3 &> /dev/null; then
    echo "📦 安裝 Python 3..."
    brew install python
else
    echo "✅ Python 3 已安裝: $(python3 --version)"
fi

# 檢查 pip3
echo ""
echo "📦 檢查 pip3..."
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 未找到，請重新安裝 Python"
    exit 1
else
    echo "✅ pip3 已安裝"
fi

# 安裝 Jupyter
echo ""
echo "📓 安裝 Jupyter Notebook..."
pip3 install --user jupyter notebook ipython

# 檢查安裝是否成功
if command -v jupyter &> /dev/null; then
    echo "✅ Jupyter Notebook 安裝成功"
else
    echo "⚠️  Jupyter 可能安裝在用戶目錄，請將以下路徑加入 PATH："
    echo "   export PATH=\"\$HOME/Library/Python/3.*/bin:\$PATH\""
    echo "   或重新啟動終端機"
fi

# 安裝常用的 Python 套件
echo ""
echo "📚 安裝常用的 Python 套件..."
pip3 install --user matplotlib pandas numpy requests beautifulsoup4

echo ""
echo "🎉 安裝完成！"
echo ""
echo "📋 下一步操作："
echo "1. 在終端機中輸入 'jupyter notebook' 啟動 Jupyter"
echo "2. 瀏覽器會自動開啟 Jupyter 介面"
echo "3. 點選 'soln' 資料夾開始學習"
echo ""
echo "📖 如果遇到問題，請參考 '學習指南.md' 檔案"
echo ""
echo "🚀 現在就開始你的 Python 學習之旅吧！"