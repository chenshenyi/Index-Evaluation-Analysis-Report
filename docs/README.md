# 專案說明

## 環境建置

為了方便開發，建議以 [Visual Studio Code](https://code.visualstudio.com/) 為開發環境，並根據 `.vscode` 資料夾中的設定檔 `.vscode/extensions.json` 安裝相關 Extension （或者可以直接在 VS Code 中搜尋 `@recommended`）。

程式碼中有中文，請統一使用 Big5-HKSCS 編碼，否則匯入 Excel 時會出現亂碼。

如果程式碼有編譯錯誤，請檢查 `Tools` > `References` 中的參考是否正確（亦作 `工具` > `設定引用項目`）。引用項目包括（請維護此列表）：

- `Visual Basic For Applications`
- `Microsoft Excel 16.0 Object Library`
- `OLE Automation`
- `Microsoft Office 16.0 Object Library`
- `Microsoft Scripting Runtime`
- `Microsoft Forms 2.0 Object Library`
- `Microsoft Visual Basic for Applications Extensibility 5.3`

## 程式執行

所有內容都需先匯入 `test/A. 主程式.xlsm` 中進行測試，詳細說明請參考 `test/README.md`。

## 資料夾結構

Index-Evaluation-Analysis-Report

- docs
- src
  - *專案程式碼寫在此處*
- test
  - 0 原始資料
  - 1 各院彙整資料
  - 2 各院報告書模板
  - 3 各院報告書
  - input
  - output
  - A主程式.xlsm
  - B參數.xlsx
- 指標報告書自動化範例檔案（示範給不會寫程式的人看）
- 新專案（供不會寫程式的人開啟新專案使用，請保持其子資料夾淨空，但保留一個隱藏檔案供 `git` 保留資料夾）

## 發布前 Checklist

- `git` commit 並 push
- 確認 `test/` 中的測試資料是否正確
- 更新說明文件
  - `docs/`
  - `test/README.md`
  - `src/README.md`
  - `README.md`
  - `指標報告書自動化範例檔案/操作指引.docx`
  - `新專案/操作指引.docx`
- 更新版本號
- 將 `A 主程式` 更新到 `指標報告書自動化範例檔案` 與 `新專案`

## 函數說明

詳見 `docs/` 資料夾。

## 常見問題

1. 新增資料夾沒有顯示在 `git` 中

   請確認該資料夾下是否有檔案，若無，請新增一個 `.gitkeep`。

## 測試檔資料夾結構

測試檔案分成兩大類，一部分是會出現在正式專案中的資料，包括：

- 0.原始資料
- 1.各院彙整資料
- 2.各院報告書模板
- 3.各院報告書(輸入)
- 4.各院報告書(輸出)
- input
- output

另一部份是測試專用的資料，根據測試的函數命名，包括：

- input: 預設輸入資料，受 `git` 管理，所有測試操作都不能更改此資料夾內容
- output: 輸出資料，不受 `git` 管理，修改檔案的函數測試，皆應從 `input` 資料夾讀取或複製，並將結果寫入 `output` 資料夾

## 匯入模組(module)

所有程式碼都寫在 `A. 主程式.xlsm` 中，因為 `VBA` 是一種古老的語言，所以匯入模組的方式也很古老，有一個方便的小程序可以幫助我們匯入模組，請參考 [import_modules.bas](../src/import_modules.bas)。

## 發布正式版

將資料夾中 `A. 主程式.xlsm` 分別複製到 `指標報告書自動化範例檔案` 與 `新專案` 中即可。
