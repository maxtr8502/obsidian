---
type: dashboard
tags: [dashboard]
---
# ✅ Dashboard Task

Task là checkbox `- [ ]` nằm trong note của project / meeting / daily (nguồn là chính note đó, không có danh sách trung tâm).
Gợi ý ghi hạn: `📅 2026-10-31`.

## Task mở trong Dự án
```query
"- [ ]" path:"02_Projects"
```

## Action item từ họp
```query
"- [ ]" tag:#meeting
```

## Task trong Daily gần đây
```query
"- [ ]" path:"01_Journal/Daily"
```

## Task ở các Area
```query
"- [ ]" path:"03_Areas"
```
