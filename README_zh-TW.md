<br>
<div align="center">

# spec-fab: Conflict-Driven Specifications
[![GitHub stars](https://img.shields.io/github/stars/stephen9412/spec-fab?style=social)](https://github.com/stephen9412/spec-fab/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![English](https://img.shields.io/badge/DOCS-English-red)](./README.md)

</div>
<br>

> 🛑 **Stop chatting. Start merging.**
>
> 將 LLM 強制整合進你的 Unix 管線，把**架構決策**當作 **Git 合併衝突**，交由身為人類的你來定奪。
>
> ---
> ⭐️ **Github 衝浪新手，你的小小 Star 可以讓我放棄晚餐，再多寫兩個小時代碼。**

![Demo](.github/assets/output.gif)

## ⚡️ TL;DR

**就像 spec-kit，但活在你的 Terminal 裡。**

```bash
# 1. 安裝 (Install)
curl -sLf https://raw.githubusercontent.com/stephen9412/spec-fab/refs/heads/main/install.sh | sh

# 2. 初始化 (Init)
mkdir my-project && cd my-project
spec_init

# 3. 定立原則 (Constitution)
spec_constitution "Principles: Rust, Clean Code, Zero-Cost Abstractions"

# 4. 注入想法 (Drafting) - 展現 Unix Pipe 的力量！
echo "Build a Tinder-like app for adopting cats" | spec_new
# 💥 規格衝突！AI 發現你的需求有模糊地帶，請打開 spec.md 解決這些衝突。

# 5. 生成計畫 (Architecting)
spec_plan
# 💥 架構衝突！AI 針對實作細節提供了不同方案 (Options)，請打開 plan.md 選擇你的戰術。
```
---

## 為什麼選擇 spec-fab

> **遵循 Unix 哲學的 Spec-Kit 替代方案。**

我們把那些臃腫的「巨嬰」依賴全丟了。
❌ 不需要 Ruby
❌ 不需要 Node.js
❌ 不需要複雜的狀態機

我們只留下最強悍的：
✅ **Fish Shell** (流程控制)
✅ **Fabric AI** (大腦)
✅ **Vim / 你的編輯器** (決策)

* **⚡️ 極速快感**: 這只是 Shell Function，比你打 `npm install` 的時間還短。
* **🧠 AI 原生**: 底層使用 [Fabric](https://github.com/danielmiessler/Fabric) 來替你進行架構腦力激盪與審查。
* **📄 純粹 Markdown**: 你的架構文件就是純文字。沒有隱藏的資料庫，沒有黑魔法。
* **🤝 相容 Spec-Kit**: 我們採用 GitHub 官方 [spec-kit](https://github.com/github/spec-kit) 的最佳實踐邏輯，但用人類該有的方式實作。

---

## 🎭 一個真實的諷刺故事

> **"這就是為什麼這個專案存在。"**

諷刺的是，當初我在開發 spec-fab 的時候，我試圖用很熱的組合：**OpenCode + Claude Sonnet 4.5**，去跑 **Spec-kit** 的官方指令，僅僅是為了生成一個基礎模板來做交叉驗證。

結果呢？那個「高科技」組合不停地報錯，讓我在螢幕前滿頭問號，懷疑人生。

那一刻我頓悟了：**我們需要的不是跟 TUI (文字介面) 搏鬥，也不是在靈光乍現的時候去 debug 那些複雜的依賴環境。** 我們需要的是更簡潔、更暴力、更不會背叛你的工具。

於是，`spec-fab` 誕生了。

---

## 🚀 安裝

一條指令，30 秒內將你的 Terminal 升級為架構師軍火庫。

```bash
curl -sLf https://raw.githubusercontent.com/stephen9412/spec-fab/refs/heads/main/install.sh | sh
```

### 🧹 解除安裝 (The "Clean Break" Promise)

我們尊重你的系統潔癖（我有）。spec-fab 的設計非常克制，所有核心檔案都乖乖待在 `~/.specfab` 目錄下。

如果你決定不再使用，我們提供了一個 **`spec_uninstall`** 指令，它會移除 spec-fab 的本體以及我們在 Shell 中掛載的 Hook。

**但請注意，我們堅持「不越俎代庖」的原則：**

* 我們 **不會** 刪除 `fish` shell：因為這可能已經成為你的預設 shell。
* 我們 **不會** 刪除 `~/.config/fabric`：因為我們不知道你是否在安裝 spec-fab 之前就已經在使用 Fabric。我們不想誤刪你珍貴的 API Keys 或 Patterns。

**我們的承諾：**
1. `spec_uninstall` (自動清除 spec-fab 專屬檔案)
2. 或者手動 `rm -rf ~/.specfab` (簡單暴力)
3. 你的 Fish 設定與 AI 金鑰會毫髮無傷地保留下來。

---

## 🛠 使用

### 1. 初始化環境 (`spec_init`)

別讓你的專案裸奔。

```bash
spec_init
# ✅ Created Constitution: .specify/memory/constitution.md
# ✅ Created Spec Template: .specify/templates/spec-template.md
# ...
# 🚀 spec-fab environment ready.
```

### 2. 注入憲法 (`spec_constitution`)

告訴 AI 你的原則是什麼。你可以餵給它文件，或是直接下指令。

```bash
# Pipe 模式：把草稿餵進去
cat draft.md | spec_constitution

# Argument 模式：直接下達最高指導原則
spec_constitution "Create principles focused on code quality, testing standards, and Rust idioms."
```

### 3. 開立新規格 (`spec_new`)

這是魔法發生的地方。給它一個想法，它還你一個完整的 Git 分支與規格草稿。

```bash
cat prd.md | spec_new
# 📥 Reading feature description from STDIN...
# 🏷  Slug generated: build-faceswap-pipeline
# 🌿 Git branch created: 1-build-faceswap-pipeline
# 🏗  Drafting Specification...
# 🔍 Refining Spec quality...
# ✅ Spec Refined & Created at: specs/1-build-faceswap-pipeline/spec.md
```

### 4. 生成實作計畫 (`spec_plan`)

AI 架構師會分析你的規格書，並產出技術計畫。**如果有不確定的地方，它會故意製造衝突讓你解決。**

```bash
spec_plan
# 🚀 Generating Technical Plan for feature: 1-build-faceswap-pipeline
# 🧠 Architecting the solution...
# ⚠  CONFLICTS DETECTED! The Architect presented options.
#    Please open the file and resolve the merge conflicts.
#    (這就是我們要的：你自己決定架構，而不是讓 AI 瞎掰)
```

### 9. Language & Translation Workflow

spec-fab supports multi-language documentation natively using Fabric's `LANGUAGE_OUTPUT` setting.

#### Toggle Language
Switch the AI's output language globally (e.g., between English and your Native Locale).

```bash
# Toggle between en-US and your native language (set in config)
spec_toggle_lang
# Output: 🌐 Fabric output switched to Native: zh-TW

# Toggle back
spec_toggle_lang
# Output: 🇺🇸 Fabric output reset to Default: en-US

```

#### Translate Documents

Translate any existing specification or plan into the currently selected language.
*Uses the `translate_tech` pattern to ensure technical terms (e.g., Kubernetes, React) remain in English.*

```bash
# Standard usage (uses current global language setting)
spec_translate spec.md
# 咻! spec.md is now in Traditional Chinese.

# One-off override (without changing global config)
LANGUAGE_OUTPUT=ja-JP spec_translate plan.md
# 咻! plan.md is now in Japanese.


## 🚧 近期上線 (Roadmap)

spec-fab 的旅程才剛開始。我們正致力於補完從「架構決策」到「落地執行」的最後拼圖：

| 指令 |
| :--- |
| **`spec_roadmap`** |
| **`spec_dispatch`** |
| **`spec_evolve`** |
| **`spec_glue`** |
| **`spec_project_brief`** |

## 貢獻

我非常歡迎社群的貢獻！

### 你可以協助的地方

1. **優化 Patterns (`patterns/`)**: AI 的大腦在於 Prompt。如果你發現了能讓 AI 寫出更嚴謹規格、或更棒的架構建議的 Prompt 寫法，請務必提交 PR。
2. **改進 Fish 函式**: 我們追求 Fish Shell 的極致效能與可讀性。如果你有更優雅的寫法，或發現了 Bug，歡迎修正。
3. **文檔與範例**: 幫助我們完善 README 或提供更多的使用案例。

### 開發原則

* **保持依賴極簡**: 請不要引入 Python、Node.js 或 Ruby 等重型依賴。我們希望它只需依賴 `fish`, `curl`, `git` 和 `fabric` 就能運作。（我不排斥所有 cli 工具，但越多依賴，`install.sh` 就會越麻煩，最後又會很重。）
* **Unix 哲學**: 盡量遵循 Unix 哲學，透過 Pipe (`|`) 串接。但我後面還是會想加入 Gum 去讓人快速選擇檔案之類的（給一些 cat 障礙者使用或我）。畢竟誰沒有過還是小白的時候，要求不要那麼嚴格。

### 提交步驟

1. Fork 本專案。
2. 建立你的功能分支 (`git checkout -b feature/AmazingFeature`)。
3. 提交你的修改 (我們推薦使用 Conventional Commits，例如 `feat: add new pattern`)。
4. 推送到分支 (`git push origin feature/AmazingFeature`)。
5. 開啟 Pull Request。


## 致謝

* **[Fabric](https://github.com/danielmiessler/Fabric)**：感謝 [Daniel Miessler](https://github.com/danielmiessler) 創造了 Fabric，讓「在 Terminal 呼叫 AI」這件事變得如此優雅，為 SpecFab 提供了強大的 AI 運算引擎。
* **[spec-kit](https://github.com/github/spec-kit)**：感謝 GitHub 團隊開源了 spec-kit。SpecFab 的核心方法論、Prompt 邏輯以及對工程規範的堅持，皆深受其啟發。我們站在巨人的肩膀上，試圖用更輕量的方式實踐這套優秀的理念。

