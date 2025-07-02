# 🚀 IDE 使用指南

除了 Jupyter Notebook 網頁介面，你也可以使用現代化的 IDE 來學習和開發 Python。本指南涵蓋最受歡迎的 IDE 配置方法。

## 📊 IDE 選擇建議

| IDE | 適合對象 | 優勢 | 缺點 |
|-----|---------|------|------|
| **VSCode** | 初學者到專家 | 免費、輕量、擴充性強 | 需要設定 |
| **Cursor** | 喜歡 AI 輔助 | 內建 AI、基於 VSCode | 付費功能 |
| **PyCharm** | 專業開發者 | 功能完整、除錯強大 | 較重、複雜 |
| **Jupyter** | 學習、實驗 | 互動性強、視覺化好 | 不適合大型專案 |

## 🔵 Visual Studio Code (VSCode)

### 安裝 VSCode

1. **下載並安裝**
   - 前往 [code.visualstudio.com](https://code.visualstudio.com)
   - 下載 macOS 版本
   - 拖拽到 Applications 資料夾

2. **安裝必要擴充套件**
   - 開啟 VSCode
   - 按 `Cmd+Shift+X` 開啟擴充套件面板
   - 搜尋並安裝以下套件：

```
必裝擴充套件：
• Python (Microsoft) - Python 語言支援
• Jupyter (Microsoft) - Notebook 支援
• Python Debugger (Microsoft) - 除錯工具

推薦擴充套件：
• Python Docstring Generator - 自動產生文件
• autoDocstring - 智慧文件字串
• Python Indent - 自動縮排
• Better Comments - 更好的註解顯示
• Error Lens - 即時錯誤顯示
```

### 設定 VSCode 使用 uv 環境

1. **開啟專案**
   ```bash
   # 在終端機中
   cd /path/to/ThinkPythonSolutions
   code .
   ```

2. **選擇 Python 解釋器**
   - 按 `Cmd+Shift+P` 開啟命令面板
   - 輸入 "Python: Select Interpreter"
   - 選擇專案目錄下的 `.venv/bin/python`
   - 或選擇 uv 管理的 Python 環境

3. **驗證設定**
   - 開啟任何 `.py` 檔案
   - 檢查左下角是否顯示正確的 Python 版本
   - 開啟 `.ipynb` 檔案確認可以執行

### VSCode 使用技巧

**執行 Python 程式碼：**
```bash
# 在 VSCode 終端機中（Ctrl+`）
uv run python script.py
```

**執行 Jupyter Cell：**
- 在 `.ipynb` 檔案中點擊 Cell 左側的執行按鈕
- 或按 `Shift+Enter` 執行當前 Cell

**除錯 Python 程式：**
1. 在程式碼行號左側點擊設定中斷點
2. 按 `F5` 開始除錯
3. 使用除錯面板檢查變數值

## 🤖 Cursor

Cursor 是基於 VSCode 的 AI 增強 IDE，特別適合學習程式設計。

### 安裝 Cursor

1. **下載並安裝**
   - 前往 [cursor.sh](https://cursor.sh)
   - 下載 macOS 版本
   - 安裝並註冊帳號

2. **匯入 VSCode 設定（可選）**
   - 第一次啟動時，Cursor 會詢問是否匯入 VSCode 設定
   - 選擇 "Yes" 保持一致性

### Cursor 特殊功能

**AI 聊天助手：**
- 按 `Cmd+L` 開啟 AI 聊天
- 可以詢問程式碼問題、除錯建議、概念解釋

**AI 程式碼生成：**
- 按 `Cmd+K` 在程式碼中插入 AI 生成的程式碼
- 輸入自然語言描述你想要的功能

**AI 程式碼解釋：**
- 選取程式碼片段
- 按 `Cmd+L` 詢問 "解釋這段程式碼"

### Cursor 學習工作流程

```bash
1. 開啟練習檔案（如 chap01.ipynb）
2. 閱讀說明文字
3. 嘗試自己寫程式碼
4. 如果卡住，使用 Cmd+L 詢問 AI
5. 執行並測試程式碼
6. 理解 AI 的解釋並繼續學習
```

## 🐍 PyCharm

適合有一定基礎的學習者。

### 安裝 PyCharm

1. **下載 Community 版本（免費）**
   - 前往 [jetbrains.com/pycharm](https://www.jetbrains.com/pycharm/)
   - 選擇 Community 版本

2. **設定專案**
   - 開啟 PyCharm
   - 選擇 "Open" 並選擇 ThinkPythonSolutions 資料夾
   - 在設定中選擇專案的 Python 解釋器

## 📝 工作流程比較

### Jupyter Notebook（網頁）
```bash
cd ThinkPythonSolutions
uv run jupyter notebook
# 在瀏覽器中學習
```
**適合：** 互動式學習、資料分析、快速實驗

### VSCode
```bash
cd ThinkPythonSolutions
code .
# 在 VSCode 中開啟 .ipynb 檔案
```
**適合：** 習慣使用編輯器、喜歡整合環境

### Cursor（推薦初學者）
```bash
cd ThinkPythonSolutions
cursor .
# 享受 AI 輔助學習
```
**適合：** 完全初學者、需要 AI 協助理解概念

## 🛠 實用設定

### VSCode 工作區設定

建立 `.vscode/settings.json`：

```json
{
    "python.defaultInterpreterPath": "./.venv/bin/python",
    "python.terminal.activateEnvironment": true,
    "jupyter.askForKernelRestart": false,
    "jupyter.alwaysTrustNotebooks": true,
    "files.associations": {
        "*.ipynb": "jupyter-notebook"
    },
    "python.formatting.provider": "black",
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": false,
    "python.linting.flake8Enabled": true
}
```

### 快捷鍵對照

| 功能 | VSCode/Cursor | Jupyter |
|------|---------------|---------|
| 執行 Cell | `Shift+Enter` | `Shift+Enter` |
| 新增 Cell | `B` (在 notebook) | `B` |
| 刪除 Cell | `DD` (在 notebook) | `DD` |
| 變更為 Code | `Y` | `Y` |
| 變更為 Markdown | `M` | `M` |
| 命令面板 | `Cmd+Shift+P` | - |

## 🎯 學習建議

### 初學者路徑
1. **第 1-2 週**：使用 Jupyter Notebook 網頁版學習基礎
2. **第 3-4 週**：嘗試 Cursor 享受 AI 輔助
3. **第 5+ 週**：根據喜好選擇 VSCode 或繼續使用 Cursor

### 進階使用者路徑
1. 直接使用 VSCode 或 PyCharm
2. 配置除錯環境
3. 學習使用 Git 整合
4. 探索更多擴充套件

## 🔧 常見問題

### Python 解釋器找不到
```bash
# 在 IDE 終端機中確認 uv 環境
uv run python --version

# 手動指定解釋器路徑
which python  # 在 uv shell 中執行
```

### Jupyter Kernel 無法連接
```bash
# 重新安裝 kernel
uv run python -m ipykernel install --user --name=think-python
```

### 套件導入失敗
```bash
# 確認在正確的 uv 環境中
uv run python -c "import matplotlib; print('OK')"
```

## 💡 小技巧

1. **同時使用多種工具**：Jupyter 用於實驗，VSCode 用於開發
2. **善用 AI 助手**：在 Cursor 中多問問題，加速學習
3. **版本控制**：學會使用 Git 追蹤學習進度
4. **個人化設定**：調整字體、主題、快捷鍵符合個人喜好

選擇最適合你的工具開始學習吧！🚀