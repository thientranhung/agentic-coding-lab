# 🧪 Agentic Coding Lab

> **Phòng nghiên cứu thế hệ mới của công nghệ phần mềm: AI-Agent Orchestration.**

Chào mừng bạn đến với **Agentic Coding Lab**. Repository này đóng vai trò là kho tàng kiến thức để khám phá, phân tích và làm chủ các quy trình "Agentic Coding" — nơi các lập trình viên không chỉ viết code, mà còn điều phối hệ thống các AI Agent để xây dựng phần mềm.

[🇬🇧 **English (Phiên bản Tiếng Anh)**](../README.md)

---

## 🧭 Sứ mệnh

Mục tiêu của phòng thí nghiệm này là tài liệu hóa và chuẩn hóa các phương pháp làm việc với AI Agent. Chúng tôi hướng tới việc vượt qua các phương pháp "code qua chat" đơn giản (Vibe Coding) để tiến tới **Điều phối Agent Hệ thống (Systematic Agent Orchestration)**.

## 🔬 Các mảng nghiên cứu cốt lõi

### 1. Scrum & Quản Trị Dự Án
*Cấu trúc Đội ngũ Agentic*

Áp dụng phương pháp Scrum cho quy trình phát triển có sự hỗ trợ của AI, định nghĩa vai trò và trách nhiệm trong môi trường làm việc kết hợp người-agent.

- **[Tổng Quan Scrum](understand-scrum/index.md)**: Cấu trúc đội ngũ, các vai trò và thuật ngữ.

### 2. Phương pháp BMAD
*Business Methodology and Architecture Development*

Một framework quy củ, phân theo giai đoạn để chuyển đổi ngôn ngữ tự nhiên thành phần mềm cấp doanh nghiệp. Nó là cầu nối giữa một ý tưởng mơ hồ và mã nguồn chạy được thông qua hệ thống "giàn giáo" kiến trúc nghiêm ngặt.

- **[Phân tích Kiến trúc](understand-bmad/BMAD-Architecture-Analysis.md)**: Cấu trúc của BMAD.
- **[Quy trình Chuyên sâu](understand-bmad/BMAD-Workflow-Deep-Dive.md)**: 5 giai đoạn phát triển.
- **[Logic Thực thi Lệnh](understand-bmad/BMAD-Command-Execution-Logic.md)**: Cách các slash command điều khiển động cơ agent.

### 3. Beads: Quản lý Tác vụ Agent
*Hệ thống "Jira" dành cho AI Agent*

Một hệ thống theo dõi vấn đề chuyên biệt được thiết kế cho agent, giải quyết vấn đề "Mất trí nhớ của Agent" (Agent Amnesia) bằng cách lưu trữ ngữ cảnh và trạng thái bên ngoài cửa sổ context.

- **[Tìm hiểu về Beads](understand-beads.md)**: Tại sao task list bằng Markdown lại thất bại và cách Beads thành công.

### 4. Làm chủ Claude Code
*Hướng dẫn V2 Nâng cao*

Các kỹ thuật để kiểm soát coding agent mạnh mẽ nhất hiện nay, tập trung vào hành vi xác định (deterministic) thông qua hooks và các lớp thực thi (enforcement layers).

- **[Claude Code từ Newbie đến Pro](lam-quen-voi-claude-code.md)**: Scaffolding toàn cục, hooks, và các cổng bảo mật.

### 5. Gemini CLI
*AI Agent mã nguồn mở cho Terminal*

Nghiên cứu chi tiết về nền tảng agentic coding mã nguồn mở của Google, hỗ trợ MCP, sandboxing và multimodal với 1M token context.

| Tài liệu | Nội dung | Liên kết |
| :--- | :--- | :--- |
| **Tổng quan** | Gemini CLI là gì, so sánh, triết lý thiết kế | [📖](gemini-cli/0.%20Overview.md) |
| **Kiến trúc & Logic** | Data flow, tool system, cơ chế nội bộ | [🏗️](gemini-cli/1.%20Architecture%20and%20Logic.md) |
| **Playbook** | Cài đặt, Day 1, cheat sheet, troubleshooting | [🛠️](gemini-cli/2.%20Playbook.md) |
| **So sánh với Claude Code** | Bảng so sánh lệnh tương đương chi tiết | [⚖️](gemini-cli/3.%20Gemini%20CLI%20vs%20Claude%20Code.md) |

---

## 📚 Khóa học: Làm chủ BMAD

Một giáo trình hoàn chỉnh được thiết kế để biến bạn thành một Technical Agent Lead.

| Module | Mô tả | Liên kết |
| :--- | :--- | :--- |
| **Module 1** | **Tư duy & Khái niệm**<br>Triết lý "Workflow-First". | [🇬🇧 English](../en/understand-bmad/course/module-1-concept.md) • [🇻🇳 Tiếng Việt](understand-bmad/course/module-1-concept.md) |
| **Module 2** | **Câu lệnh**<br>Bộ công cụ cho từng giai đoạn dự án. | [🇬🇧 English](../en/understand-bmad/course/module-2-commands.md) • [🇻🇳 Tiếng Việt](understand-bmad/course/module-2-commands.md) |
| **Case Study 1** | **Greenfield**<br>Xây dựng tính năng mới từ đầu. | [🇬🇧 English](../en/understand-bmad/course/case-study-1-greenfield.md) • [🇻🇳 Tiếng Việt](understand-bmad/course/case-study-1-greenfield.md) |
| **Case Study 2** | **Brownfield**<br>Làm chủ mã nguồn cũ (Legacy). | [🇬🇧 English](../en/understand-bmad/course/case-study-2-brownfield.md) • [🇻🇳 Tiếng Việt](understand-bmad/course/case-study-2-brownfield.md) |
| **Case Study 3** | **Sáng tạo**<br>Giải quyết vấn đề kinh doanh & Đổi mới. | [🇬🇧 English](../en/understand-bmad/course/case-study-3-creative.md) • [🇻🇳 Tiếng Việt](understand-bmad/course/case-study-3-creative.md) |

---

## 🛠 Cấu trúc Repository

```
agentic-coding-lab/
├── en/                     # 🇬🇧 Tài liệu Tiếng Anh
│   ├── claude-code/        # Deep dive Claude Code
│   ├── gemini-cli/         # Deep dive Gemini CLI
│   ├── get-shit-done/      # GSD framework
│   ├── bmad-method/        # BMad framework
│   ├── superpowers/        # Superpowers framework
│   ├── understand-scrum/
│   ├── understand-beads.md
│   └── ...
└── vn/                     # 🇻🇳 Tài liệu Tiếng Việt (Bạn đang ở đây)
    ├── claude-code/
    ├── gemini-cli/
    ├── get-shit-done/
    ├── bmad-method/
    ├── superpowers/
    └── ...
```

## 🤝 Đóng góp

Đây là một repo nghiên cứu sống. Nếu bạn tìm thấy các pattern agentic mới hoặc muốn cải thiện bản dịch, hãy thoải mái tạo PR.

---
*Duy trì bởi Astragentic Team.*
