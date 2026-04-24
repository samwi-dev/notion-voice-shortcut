# Apple Shortcut 製作 — Plugin / Skill / MCP 盤點

> 每次開始新捷徑任務前，先查這份清單（對應 CLAUDE.md 工作流程 Step 1）。

---

## 🧩 可用 MCP / API

### Notion MCP
- **功能**：讀寫 Notion 頁面、資料庫、評論、使用者
- **用途**：捷徑最終輸出目的地（寫入資料庫、更新進度）
- **常用動作**：
  - `notion-fetch` — 讀取頁面/資料庫
  - `notion-create-pages` — 建立新頁面
  - `notion-update-page` — 更新既有頁面
  - `notion-search` — 搜尋內容
- **狀態**：✅ 已連接

### Gmail MCP
- **功能**：搜尋、建立草稿、管理標籤
- **用途**：捷徑可串接 email 自動化（收到特定信 → 觸發流程）
- **狀態**：✅ 已連接

### Google Drive MCP
- **功能**：讀寫 Google Drive 檔案、搜尋、權限
- **用途**：替代 iCloud Drive 當 queue 資料夾（跨平台場景）
- **狀態**：✅ 已連接

### Claude in Chrome
- **功能**：瀏覽器自動化（導航、點擊、填表、截圖）
- **用途**：捷徑觸發後續網頁操作（登入、查資料）
- **狀態**：✅ 已連接

### Computer Use
- **功能**：桌面控制（點擊、輸入、截圖）
- **用途**：Mac 端捷徑整合 macOS App
- **狀態**：✅ 已連接

---

## 🍎 iOS 捷徑內建關鍵動作

### 錄音/音訊
| 動作 | 用途 | 備註 |
|---|---|---|
| 錄音 | 錄製音訊 | 輸出 File 類型 |
| 編碼媒體 | File → Audio 類型轉換 | 「僅音訊：開」 |
| 轉錄音訊 | 音訊 → 文字 | 需網路，iOS 內建 |
| 播放音訊 | 播放 | 測試用 |

### 檔案系統
| 動作 | 用途 | 備註 |
|---|---|---|
| 儲存檔案 | 寫入 iCloud Drive | 指定資料夾 |
| 取得檔案夾的內容 | 列出資料夾內所有檔案 | 取代 manifest.txt |
| 刪除檔案 | 移除處理完的檔案 | 立即刪除：開 |
| 從路徑取得檔案 | 讀單一檔案 | 需已知路徑 |

### 網路 / API
| 動作 | 用途 | 備註 |
|---|---|---|
| 取得 URL 的內容 | HTTP 請求（GET/POST） | JSON body 用「檔案」輸入 |
| 文字 | 組 JSON payload | 內嵌變數膠囊 |

### AI / 文字處理
| 動作 | 用途 | 備註 |
|---|---|---|
| 使用 ChatGPT | AI 整理/分析 | 需 OpenAI 帳號 |
| 取代文字 | 字串替換/清理 | 支援正規表達式 |
| 分開文字 / 結合文字 | 文字切割與重組 | 處理換行/分隔符 |
| 從字典取得值 | 解析 JSON 回應 | iOS 1-based 索引 |

### 流程控制
| 動作 | 用途 | 備註 |
|---|---|---|
| 重複每個項目 | 迴圈 | 對清單每筆執行 |
| 如果 | 條件判斷 | |
| 設定變數 | 命名變數 | 方便後續引用 |
| 快速查看 | 預覽輸出 | 除錯神器 |

---

## 🤖 自動化觸發（Automation）

iOS：設定 → 捷徑 → 自動化 → 建立個人自動化

| 觸發類型 | 適用情境 | 備註 |
|---|---|---|
| Wi-Fi | 回家 / 到辦公室 | 指定 SSID |
| 藍牙 | 戴 AirPods、接特定裝置 | Watch 無法選 |
| 充電器 | 插電時 | 最可靠 |
| 時間 | 固定時間 | 保底方案 |
| 到達 / 離開 | 位置觸發 | 需位置權限 |
| App 開啟 | 打開特定 App | |

---

## 📦 現成捷徑來源（找現成方案用）

- **RoutineHub** — https://routinehub.co — 社群分享捷徑
- **MacStories Shortcuts Archive** — https://www.macstories.net/shortcuts
- **r/shortcuts (Reddit)** — https://reddit.com/r/shortcuts
- **ShareShortcuts** — https://shareshortcuts.com

> 憲法規則：做新捷徑前**先搜尋這些站**，找到類似的直接下載調整。

---

## 🔍 搜尋 MCP 註冊中心
若需其他工具：用 `mcp-registry` 的 `search_mcp_registry` 或 `suggest_connectors`。

---

## 🚀 加速建立捷徑（避免每次從零填）

### 1. 複製現有捷徑當 template（最務實）
- 長按捷徑 → 複製 → 改幾格變數就是新捷徑
- 把跑通的捷徑當 template 重用

### 2. iCloud 分享連結
- 捷徑右上角分享 → 產生 iCloud 連結
- 建 Notion 頁存所有 template 連結，下次點連結即匯入

### 3. macOS Shortcuts App（比 iOS 快 10 倍）
- 鍵盤 + 複製貼上 + 多選編輯
- iCloud 同步回 iPhone/Watch

### 4. shortcuts-js（程式化生成，重度方案）
- npm 套件 `@joshfarrant/shortcuts-js`
- JavaScript → `.shortcut` 檔
- 缺點：學習曲線、需 Mac 簽名、API 不完整
- **違反 MVP 原則，暫不投入**

### 5. AI 直接產 .shortcut 檔
- 技術可行但 Apple 簽名機制擋住
- 目前無穩定工具鏈，**不建議**

---

## ⚠️ 已知限制
- Apple Watch 捷徑**無法**轉錄音訊（需在 iPhone 端處理）
- 語音備忘錄 App 的錄音**不在 iCloud Drive**，無法用「取得檔案夾的內容」枚舉
- iOS 捷徑無法枚舉「Watch 藍牙裝置」當觸發
- 字典索引是 **1-based**（不是 0-based）
- Base64 輸出含 MIME 換行，需 `分開文字+結合文字` 清理
