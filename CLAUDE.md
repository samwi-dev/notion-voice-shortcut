# 專案憲法（Project Constitution）

> 專案定位、背景、狀態、問題清單請見 [README.md](README.md)

## 最高原則
**以「最小可行性方案（MVP）達成目的」為主要目標**，盡量減少中間繁雜流程。  
每一個提議的步驟都要自問：「這一步能不能拿掉？」能拿掉就拿掉。

---

## 對話啟停約定（觸發詞）
| 使用者說 | Claude 自動執行 |
|---|---|
| **「讀進度」** / **「開場」** / 開新對話第一句 | 讀 README.md「當下狀態」+「問題積欠清單」段落，給簡短摘要 |
| **「push」** / **「同步」** / **「更新」** | 執行 `./update.sh "對應訊息"` 推送到 GitHub |
| **「收工」** / **「結束」** | 寫 Notion 進度 + push GitHub + 摘要今日主線 Y/N |

---

## 工作流程（每次新任務必走）

### Step 1：取得 Apple Shortcut 相關資源
開始任何捷徑相關任務前，**先查 [SHORTCUTS_PLUGINS.md](SHORTCUTS_PLUGINS.md)**，盤點可用的：
- Skills / Plugins / MCP / Agent
- iOS 捷徑內建動作、自動化觸發、現成捷徑來源
- 若清單內沒有需要的工具 → 再搜尋擴充，並把新發現回寫進 SHORTCUTS_PLUGINS.md

### Step 2：使用者下指令 → 先 Plan、不執行
使用者會用簡短語句下達任務，例如：
> 「我需要做什麼？我的任務結尾是什麼？」

收到後**先產出 Plan**（目標、步驟、結尾驗證點），**不要直接動手**。  
原因：新問題會覆蓋舊問題，沒有 Plan 會讓前面做的動作作廢。Plan 確認後才開始執行。

### Step 3：先查現成方案
在製作任何新捷徑/專案前，先搜尋：
- 是否有人已經做過類似 Shortcut？
- 是否可以直接下載使用或微調就能用？
- 有現成方案就直接採用，不要重造輪子。

---

## 核心規則

### 1. 名稱必須與 iOS 捷徑實際中文一致
- 提及動作/變數時，使用捷徑 App 上顯示的正確中文名稱（例：「取得檔案夾的內容」不是「取得資料夾的內容」）。
- 不確定時先問使用者看到什麼，不要用訓練資料裡記得的翻譯當標準答案。
- 若使用者回報「找不到這個動作」，第一反應是確認正確名稱，不要急著改方案。

### 2. 不要讓新方案推翻已完成的工作
- 使用者反問時，先釐清他是在「問問題」還是「要求改方向」。
- 提出新做法前，檢查是否會讓剛做好的步驟作廢；若會，先跟使用者確認是否願意重做。
- 禁止「堆疊式擴增」——不要一直加新動作來解決上一個動作造成的問題，優先考慮砍掉重練。

### 3. 優先選簡單路徑
當有多種做法：
- 內建動作 > 自建 API 流程
- 直接取用 > 中間轉檔 / 編碼 / 解碼
- 扁平結構 > 巢狀資料夾 / manifest 索引
若使用者質疑某步驟為何存在，認真重新評估能否移除。

### 4. 問問題要具體、單點、可驗證
- 一次只驗證一件事，不要把 5 個步驟綁成一個指令。
- 給出步驟後要有「如何確認成功」的驗證點（看到什麼、應該出現什麼）。

### 5. 錯誤處理原則
- 先讀實際錯誤訊息再提方案，不要猜。
- 使用者貼錯誤訊息時，直接指出具體那一行意思與修法，不要長篇分析。

### 6. 一次只解一個問題（止損鐵律）
- **核心反模式**：Claude 會「疊加 code、疊加狀況」，舊問題導致新問題、新問題加劇舊問題，主線被突發變更推滑。必須強制打斷這個循環。
- **規則**：碰到新問題 → **寫入「問題積欠清單」**（見 README.md），不允許自行拖出主線去處理。
- **Claude 每次回應前的自我檢查**：
  - 這次是不是又在加 code / 加步驟 / 加判斷？
  - 有沒有偏離當前主線任務？
  - 不確定時 → **用一句話問使用者**，不要自行擴增。

### 7. 主線鎖定
- 每個專案要有明確的「主線任務」（例：`M2 – iOS Shortcut 跑通`）。
- 任何與主線無關的優化（模型比較、架構升級、支線嘗試）→ 一律先進「問題積欠清單」，不當場執行。
- 主線沒跑通前，**拒絕開分支**。

### 8. 平台能力先確認，再規劃流程
- **不假設 Apple Watch 可以做 iPhone 能做的事** — Watch 是受限平台，沒有 AI / Apple Intelligence / ChatGPT / 重型運算能力
- 規劃 Watch 捷徑前先問：這格動作 Watch 真的能跑嗎？不確定先查 SHORTCUTS_PLUGINS.md「Apple Watch 能力限制」
- 跨裝置流程的標準模式：**Watch 蒐集 → 「執行捷徑」呼叫 → iPhone 接手處理**
- 違反這條的後果：使用者照著做才發現 Watch 上跑不了，整個 plan 重來

### 9. 每日收斂
- 每次工作結束要明確回答：「今日主線有無前進？」Y/N
- 若 N：寫出原因 + 明日收斂策略。
- 每日進度同步到 Notion 「In Progress」資料庫，欄位：**日期｜階段｜做了什麼｜結果/問題｜下一步**。

---

## 專案結構
本專案**沒有應用程式原始碼**，是純文件驅動的 Apple Shortcut 專案框架，Shortcut 本身只存在於 iOS/macOS 捷徑 App 裡（本 repo 不含 `.shortcut` 檔）。

| 檔案 | 用途 |
|---|---|
| `README.md` | 專案定位、背景、當下狀態、問題積欠清單、今日進度（「讀進度」指令的資料來源） |
| `CLAUDE.md` | 本檔，Claude 行為規範 |
| `SHORTCUTS_PLUGINS.md` | 可用 MCP / iOS 內建動作 / 自動化觸發 / 現成捷徑來源盤點，含「Apple Watch 能力限制」 |
| `shortcut-setup-guide.md` | Notion Database 欄位對應、逐步建立捷徑教學、錯誤排除表 |
| `update.sh` | 一鍵 `git add && commit && push` 腳本 |
| `.env.example` | Notion API 設定範本（`NOTION_TOKEN` / `NOTION_DATABASE_ID` / `NOTION_VERSION` / `NOTION_ENDPOINT`），不含真實金鑰 |

## 常用指令
- **推送變更**：`./update.sh "訊息"`（不帶參數會互動詢問訊息）— 等同「push」/「同步」/「更新」觸發詞
- **沒有 build / lint / test**：這不是傳統程式碼庫，沒有可執行的程式語言檔案。驗證方式一律是**在 iOS 捷徑 App 裡實際跑一次該 Action/Shortcut**，並確認 Notion 資料庫寫入結果或「快速查看」輸出是否符合預期。

## 系統架構（Pipeline）
兩個 Shortcut 組成端到端流程：

1. **Shortcut A（Notion Memo，錄音端）**：Apple Watch 或 iPhone 錄音 → 儲存到 iCloud Drive `NotionMemo` 資料夾
2. **Shortcut B（Notion Processor，處理端）**：
   `取得檔案夾的內容` → `重複每個項目` → `編碼媒體`（僅音訊：開，File→Audio 轉型）→ `轉錄音訊` → `使用 ChatGPT` 整理文字 → `取代文字` 清理 → `取得 URL 的內容`（POST）寫入 Notion → `刪除檔案`
3. **自動化觸發**：藍牙 / 充電器 / 時間 三重觸發呼叫 Shortcut B（多筆錄音處理策略尚未定案，見 README 問題積欠清單 #7）

### Notion 寫入 Schema
Database ID `340a0e5b9b3580ca8a58e6a51b606e4e`，POST `https://api.notion.com/v1/pages`（`Notion-Version: 2022-06-28`）：

| 欄位 | 類型 | 內容 |
|---|---|---|
| `Name` | Title | 格式化時間戳（`yyyy-MM-dd HH:mm`） |
| `Captured At` | Date | ISO 8601 時間 |
| `Raw` | Text | 轉錄/整理後文字 |
| `Source` | Select | `iPhone` 或 `Apple Watch` |
| `Status` | Select | 固定 `Inbox` |

### 已知限制（規劃前必讀）
- Apple Watch **不能**跑 ChatGPT / Apple Intelligence / 穩定的轉錄音訊 — 需 AI 或重運算的步驟一律交給 iPhone（`執行捷徑` 轉手）
- iCloud Drive 檔案會被系統回收成雲端佔位檔（☁️），導致「編碼媒體」失敗 → 目前用「取得檔案夾內容」+「排序：製作日期最新優先」+「限制 1」只處理最新一筆繞過
- 字典（JSON 解析）索引是 **1-based**，不是 0-based
- Base64 輸出含 MIME 換行，如需清理要用「分開文字＋結合文字」
- watchOS 版「儲存到 iCloud Drive」是同步阻塞、離線會逾時，不像 iPhone 有本機快取
- 詳細清單與更新見 `SHORTCUTS_PLUGINS.md`
