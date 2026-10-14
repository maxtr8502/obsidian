---
type: system
tags: [system]
---
# 📖 Vault Guide

Dựng ngày 2026-10-14 từ kết quả khảo sát (xem [[Discovery_Answers_2026-10-14]]). Vault này là **một vault duy nhất**, phân vùng bằng thư mục + property `confidentiality`.

## 1. Cấu trúc
| Thư mục | Dùng cho |
|---|---|
| `00_Inbox` | Mọi note mới (mặc định). Xử lý trong Weekly Review |
| `01_Journal` | Daily / Weekly |
| `02_Projects` | Mỗi dự án 1 thư mục: `<Tên>/<Tên>.md` + `Requirements/` `Meetings/` `Deliverables/` |
| `03_Areas` | `Work` (Objectives, Processes), `Technical-AI`, `Finance`, `Career-Content`, `Goals` |
| `04_Knowledge` | `Literature`, `Permanent`, `Technical`, `Prompts` |
| `05_People` | `Persons`, `Orgs` (vendor/đối tác) |
| `06_Decisions` | Nhật ký quyết định |
| `07_Archive` | Dự án/ghi chú đã xong |
| `08_MOC` | Hub + dashboard (`Bases/`) |
| `09_System` | Tài liệu hệ thống |
| `90_Templates` | Template (core Templates plugin) |
| `98_LocalOnly` | **Không đẩy lên GitHub** (xem §4) |
| `99_Attachments` | Ảnh/PDF nhỏ. File lớn để ngoài vault, chỉ link |

## 2. Quy ước note
- **Mọi note có frontmatter `type`** (project, requirement, meeting, decision, person, org, literature, permanent, prompt, runbook, tech-note, goal, daily, weekly…). Dashboard lọc theo `type`.
- Tên file: tự nhiên, có thể có dấu tiếng Việt.
  - Họp: `2026-10-14 TênDựán - Chủ đề`
  - Requirement: `REQ-012 Tên ngắn` (đặt `req_id: REQ-012`)
  - Quyết định: `DEC-20261014 Tên quyết định`
- Liên kết = quan hệ có ý nghĩa (project ↔ objective ↔ process ↔ requirement ↔ deliverable). Tag chỉ để lọc thô (`#meeting`, `#ai`…).
- `status`, `priority`, `due` dùng đúng giá trị liệt kê trong template để dashboard hoạt động.
- Một ý = một permanent note; không bắt buộc Zettelkasten đầy đủ.

## 3. Nguồn sự thật (source of truth)
- Tài liệu chính thức (BRD, SOP, hợp đồng): **bản cuối ở SharePoint/Drive**; Obsidian giữ bản nháp + ghi chú + link.
- Task: sống trong chính note (checkbox); xem tổng hợp ở [[Dashboard_Tasks]].
- Code: ở Git/GitHub; note chỉ ghi link repo + snippet ngắn.
- Dữ liệu ERP/DWH/Excel có cấu trúc: giữ bản gốc ngoài, Obsidian lưu mô tả + link.
- Tài chính: **không** lưu số dư/giao dịch; chỉ thesis, quy tắc, quyết định.

## 4. Bảo mật & đồng bộ (theo Q20)
Chính sách công ty: cho phép nếu được phê duyệt; AI cho dữ liệu công ty: chỉ AI được công ty duyệt.
- `confidentiality: internal` = ghi chú cá nhân về công việc, **không** chứa nội dung mật/khách hàng. `confidential` = tuyệt đối không để trong vault đẩy lên GitHub.
- Nội dung cần giữ cục bộ → để trong `98_LocalOnly/` (đã `.gitignore`).
- Repo GitHub phải là **private**. Trước khi đẩy dữ liệu công việc, **xác nhận chính sách công ty** (đây là điều kiện bạn đã chọn ở Q20a/b).
- Không dán nội dung mật vào AI cá nhân. Prompt template có trường `data_scope` để nhắc điều này.
- Sao lưu = Git history. Mục tiêu mất tối đa 1 giờ → sync ít nhất mỗi giờ (xem `scripts/git-sync.sh`).

## 5. Quy trình
1. **Capture** → `00_Inbox` (note mới tự rơi vào đây).
2. **Daily**: Top 3, ghi nhanh, task.
3. **Weekly Review** (T_Weekly): xử lý Inbox → chuyển note về đúng thư mục, gắn `type` + link; rà task, họp, quyết định.
4. Dự án xong → đổi `status: done`, điền Outcome & Lessons learned, chuyển vào `07_Archive`.
