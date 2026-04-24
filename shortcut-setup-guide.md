# 語音備忘錄 → Notion 完整設定教學

## Notion Database 資訊

| 項目 | 值 |
|-----|-----|
| Database 名稱 | Catch Rverything |
| Database ID | `340a0e5b9b3580ca8a58e6a51b606e4e` |
| Notion API Endpoint | `https://api.notion.com/v1/pages` |

### 欄位對應

| 欄位名稱 | 類型 | Shortcut 填入內容 |
|---------|------|-----------------|
| `Name` | Title | Timestamp 變數（格式化時間） |
| `Captured At` | Date | ISODate 變數（ISO 8601 格式） |
| `Raw` | Text | Transcript 變數（語音轉錄文字） |
| `Source` | Select | `iPhone` 或 `Apple Watch` |
| `Status` | Select | `Inbox`（固定值） |

---

## 建立 iPhone Shortcut（逐步操作）

打開 **Shortcuts app** → 右上角「**+**」→ 新增捷徑

---

### Action 1：取得目前時間

搜尋加入：**「Date」**
- 預設即可（取得現在時間）

---

### Action 2：格式化時間（用於 Name 標題）

搜尋加入：**「Format Date」**
- Date：`Date`（上一個 Action 的輸出）
- Format：`Custom`
- Custom Format：`yyyy-MM-dd HH:mm`
- 長按輸出結果 → 改名為 **`Timestamp`**

---

### Action 3：格式化 ISO 時間（Notion API 專用）

搜尋加入：**「Format Date」**（第二個）
- Date：`Date`（Action 1 的輸出）
- Format：`ISO 8601`
- 長按輸出結果 → 改名為 **`ISODate`**

---

### Action 4：語音輸入

搜尋加入：**「Dictate Text」**
- Language：`繁體中文 - 台灣`（或 Auto）
- 長按輸出結果 → 改名為 **`Transcript`**

> 執行時自動開麥克風，說完點「Done」即停止

---

### Action 5：呼叫 Notion API

搜尋加入：**「Get Contents of URL」**

#### 基本設定
- **URL：** `https://api.notion.com/v1/pages`
- **Method：** `POST`

#### Headers（點「Add new field」逐一加入）

| Key | Value |
|-----|-------|
| `Authorization` | `Bearer secret_你的IntegrationToken` |
| `Content-Type` | `application/json` |
| `Notion-Version` | `2022-06-28` |

#### Request Body
- 選擇：**Text**
- 貼入以下 JSON，並將三個地方換成對應變數（用 Shortcut 的「插入變數」功能）：

```
{"parent":{"database_id":"340a0e5b9b3580ca8a58e6a51b606e4e"},"properties":{"Name":{"title":[{"text":{"content":"[Timestamp]"}}]},"Captured At":{"date":{"start":"[ISODate]"}},"Raw":{"rich_text":[{"text":{"content":"[Transcript]"}}]},"Source":{"select":{"name":"iPhone"}},"Status":{"select":{"name":"Inbox"}}}}
```

**插入變數的位置：**
- `[Timestamp]` → 換成 `Timestamp` 變數
- `[ISODate]` → 換成 `ISODate` 變數
- `[Transcript]` → 換成 `Transcript` 變數

> 注意：`iPhone` 和 `Inbox` 是固定文字，不換變數

---

### Action 6：完成通知

搜尋加入：**「Show Notification」**
- Title：`已存入 Notion`
- Body：選 `Transcript` 變數

---

### 儲存設定
- 捷徑名稱：**語音備忘錄**
- 圖示：建議選麥克風符號
- 點右上角「Done」

---

## Apple Watch 版本（Source 改為 "Apple Watch"）

Apple Watch 版本和 iPhone 版本幾乎相同，只需把 JSON 中的：
```
"Source":{"select":{"name":"iPhone"}}
```
改為：
```
"Source":{"select":{"name":"Apple Watch"}}
```

建立兩個捷徑：「語音備忘錄 iPhone」和「語音備忘錄 Watch」

### 加到 Apple Watch

1. iPhone Shortcuts app → 找到捷徑 → 長按 → 「Edit」
2. 右上角點「**ⓘ**」→ 開啟「**Show on Apple Watch**」
3. Apple Watch 上開啟 Shortcuts app → 找到捷徑執行

### 加到錶盤（選用）
1. Apple Watch 長按錶盤 → Edit → 選 Complications 位置
2. 選「Shortcuts」→ 選「語音備忘錄 Watch」

---

## 錯誤排除

| 錯誤 | 原因 | 解決 |
|------|------|------|
| `401` | Integration Token 錯誤 | 確認 `secret_` 開頭，無多餘空格 |
| `400` | JSON 格式或欄位名錯誤 | 欄位名稱必須完全符合（含大小寫和空格） |
| `404` | Database 未連結 Integration | Notion Database → `...` → Add connections → 加入 Integration |
| 錄音無反應 | 麥克風權限 | 設定 → 隱私權 → 麥克風 → 開啟 Shortcuts |

---

## 已驗證測試紀錄

2026-04-12：由 Claude MCP 寫入一筆測試資料「2026-04-12 測試語音備忘錄」，確認 API 連線、欄位對應、Source/Status 寫入均正常。
