# 語音轉錄進 Notion

## 專案定位
本專案不只限於「語音轉錄進 Notion」，同時是一個**製作 Apple Shortcut（捷徑）的專案執行框架**。未來新的捷徑需求也沿用同一套工作流程。

---

## 專案背景
- **目標**：Apple Watch 錄音 → iCloud Drive `NotionMemo` 資料夾 → iPhone 自動抓取 → 轉錄 → 寫入 Notion
- **Notion Database ID**：`340a0e5b9b3580ca8a58e6a51b606e4e`

### 已踩過的坑
- Gemini API + base64 方案過度複雜，最終改用 iOS 內建「轉錄音訊」
- manifest.txt 索引多餘，改用「取得檔案夾的內容」直接枚舉
- 型別不符（File vs Audio）用「編碼媒體（僅音訊：開）」解決

---

## 當下狀態
- **Shortcut A（Notion Memo）**：錄音 + 儲存到 NotionMemo（2 格）
- **Shortcut B（Notion Processor）**：取得內容 → 重複 → 編碼媒體 → 轉錄音訊 → ChatGPT 整理 → 取代清理 → POST Notion → 刪除檔案
- **自動化**：藍牙 / 充電器 / 時間 三重觸發

---

## 問題積欠清單（Pending Issues）
非主線問題暫存區。主線跑通後再按優先度處理。

| # | 問題 | 來源 | 狀態 |
|---|---|---|---|
| 1 | Gemini API 與其他 API 輸出差異 | 分支 | 暫停 |
| 2 | 模型版本 / 音檔格式比對 | 分支 | 暫停 |
| 3 | AI 分類 / tag 流程 | 主線後段 | 待 Raw+Cleaned 寫入完成再處理 |
| 4 | 捷徑自動化生成（shortcuts-js / .shortcut 檔） | 研究 | 違反 MVP 原則，先用複製 template + iCloud 連結替代 |

### #4 詳細說明：shortcuts-js 為何不採用

**違反 MVP 原則：**
- 流程：寫 JS → npm 編譯 → 產出 .shortcut → Mac 簽名 → 匯入 → 測試
- 手建流程：捷徑 App 拖拉 → 測試
- 單一捷徑：寫 JS 前置成本 > 手建成本
- 只有要批次產 10+ 個類似捷徑才划算

**API 不完整：**
- Apple 沒開放官方 API，格式為反向工程
- 新動作（如「編碼媒體」「轉錄音訊」）支援滯後 iOS
- `.shortcut` 檔需 macOS `shortcuts` CLI 簽名才能打開
- 社群維護，活躍度不穩

**結論：** 適合「寫程式的人想程式化捷徑」的情境，不適合「想快速做捷徑」的場景。本專案現階段需求為單一 pipeline，直接手建最快。

---

## 相關檔案
- [CLAUDE.md](CLAUDE.md) — AI 協作行為規範（專案憲法）
