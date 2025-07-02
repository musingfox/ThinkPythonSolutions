#!/bin/bash

echo "💻 Think Python IDE 環境設置腳本"
echo "===================================="
echo ""

# 檢查是否為 macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ 此腳本僅適用於 macOS 系統"
    exit 1
fi

echo "🎯 選擇你想要設置的 IDE："
echo "1) VSCode - 免費、功能強大、最受歡迎"
echo "2) Cursor - 基於 VSCode，內建 AI 輔助"
echo "3) PyCharm Community - 專業 Python IDE"
echo "4) 全部安裝"
echo ""

read -p "請輸入選項 (1-4): " choice

case $choice in
    1|4)
        echo ""
        echo "📥 安裝 Visual Studio Code..."
        if ! command -v code &> /dev/null; then
            brew install --cask visual-studio-code
            echo "✅ VSCode 安裝完成"
        else
            echo "✅ VSCode 已安裝"
        fi
        
        echo "📦 設置 VSCode Python 擴充套件..."
        code --install-extension ms-python.python
        code --install-extension ms-python.debugpy
        code --install-extension ms-toolsai.jupyter
        code --install-extension ms-python.black-formatter
        code --install-extension njpwerner.autodocstring
        code --install-extension aaron-bond.better-comments
        code --install-extension usernamehw.errorlens
        echo "✅ VSCode 擴充套件安裝完成"
        
        if [[ $choice == 1 ]]; then
            break
        fi
        ;;
esac

case $choice in
    2|4)
        echo ""
        echo "🤖 安裝 Cursor..."
        if ! command -v cursor &> /dev/null; then
            brew install --cask cursor
            echo "✅ Cursor 安裝完成"
        else
            echo "✅ Cursor 已安裝"
        fi
        
        if [[ $choice == 2 ]]; then
            break
        fi
        ;;
esac

case $choice in
    3|4)
        echo ""
        echo "🐍 安裝 PyCharm Community..."
        if ! ls /Applications | grep -q "PyCharm"; then
            brew install --cask pycharm-ce
            echo "✅ PyCharm Community 安裝完成"
        else
            echo "✅ PyCharm 已安裝"
        fi
        
        if [[ $choice == 3 ]]; then
            break
        fi
        ;;
esac

echo ""
echo "🎉 IDE 安裝完成！"
echo ""
echo "📋 下一步操作："
echo ""

if [[ $choice == 1 ]] || [[ $choice == 4 ]]; then
    echo "📝 VSCode 使用方式："
    echo "1. 在終端機中執行：code ."
    echo "2. 或開啟 VSCode 然後 File > Open Folder"
    echo "3. 選擇 ThinkPythonSolutions 資料夾"
    echo "4. VSCode 會自動偵測 Python 環境和 Jupyter notebooks"
    echo ""
fi

if [[ $choice == 2 ]] || [[ $choice == 4 ]]; then
    echo "🤖 Cursor 使用方式："
    echo "1. 在終端機中執行：cursor ."
    echo "2. 或開啟 Cursor 然後選擇專案資料夾"
    echo "3. 按 Cmd+L 開啟 AI 聊天助手"
    echo "4. 按 Cmd+K 使用 AI 生成程式碼"
    echo ""
fi

if [[ $choice == 3 ]] || [[ $choice == 4 ]]; then
    echo "🐍 PyCharm 使用方式："
    echo "1. 開啟 PyCharm"
    echo "2. 選擇 'Open' 並選擇 ThinkPythonSolutions 資料夾"
    echo "3. 在設定中配置 Python 解釋器為專案的 .venv/bin/python"
    echo ""
fi

echo "💡 通用設定："
echo "- Python 解釋器路徑：$(pwd)/.venv/bin/python"
echo "- 或使用：uv run python"
echo "- Jupyter notebooks 位於 soln/ 資料夾"
echo ""
echo "📖 詳細使用指南請參考：IDE使用指南.md"
echo ""
echo "🚀 開始你的 Python 學習之旅吧！"