# Nghiên cứu chuyên sâu về các Mode vận hành của BMAD Method

> **Phiên bản tài liệu:** 2.0 (Cập nhật sau khi phân tích mã nguồn thực tế tại `_bmad/`)
> **Trạng thái:** Verified against codebase v6.0.0

Tài liệu này phân tích các "Mode" (Chế độ) hoạt động của BMAD Method, từ cấp độ chiến lược (Tracks) đến cấp độ thực thi (Execution Engines).

---

## 1. Operating Tracks (Các luồng vận hành chính)

BMAD không chỉ có một quy trình duy nhất. Dựa vào cấu trúc thư mục thực tế tại `_bmad/bmm/workflows/`, hệ thống hỗ trợ 2 luồng công việc chính:

### A. Enterprise Standard Flow (Full BMM Layer)
Đây là chế độ mặc định, tuân thủ nghiêm ngặt quy trình 4 giai đoạn chuẩn của Business Methodology Module (BMM).

*   **Đặc điểm:** Đi từ Phân tích -> Lập kế hoạch -> Giải pháp -> Thực thi.
*   **Các Workflow chính:**
    *   `/bmm:create-prd` (Phase 2)
    *   `/bmm:create-architecture` & `/bmm:create-epics-and-stories` (Phase 3)
    *   `/bmm:sprint-planning` & `/bmm:dev-story` (Phase 4)
*   **Khi nào dùng:** Dự án lớn, phức tạp, cần tài liệu hóa kỹ càng và độ chính xác cao.

### B. Quick Flow (Luồng Tinh gọn)
Nằm tại `_bmad/bmm/workflows/bmad-quick-flow/`. Đây là chế độ "đường tắt" dành cho các task nhỏ hoặc khi cần prototype nhanh.

*   **Các Workflow chính:**
    *   **Quick Spec** (`/bmm:quick-spec`): Bỏ qua PRD/Architecture đầy đủ, chỉ tạo một Technical Spec ngắn gọn thông qua hội thoại.
    *   **Quick Dev** (`/bmm:quick-dev`): Code trực tiếp dựa trên Tech Spec hoặc yêu cầu ngắn, bỏ qua cấu trúc Epic/Story phức tạp.
*   **Khi nào dùng:** Hotfix, tính năng nhỏ, POC (Proof of Concept), hoặc khi user muốn "code luôn đi đừng nói nhiều".

---

## 2. Interaction Modes (Chế độ Tương tác)

Cách người dùng và các Agent tương tác với nhau.

### A. Orchestrator Mode (Chế độ Nhạc trưởng)
Được điều khiển bởi **BMad Master Agent** (`_bmad/core/agents/bmad-master.md`).
*   **Cơ chế:** Menu-driven. Agent hiển thị menu lựa chọn [1], [2], [LW]... và người dùng chọn lệnh.
*   **Vai trò:** Điều hướng, tra cứu (List Workflows, List Tasks), và quản lý trạng thái chung.

### B. Party Mode (Chế độ Hội nghị Đa Agent)
Nằm tại `_bmad/core/workflows/party-mode/` (Lưu ý: Không phải `cis` như tài liệu cũ).
*   **Cơ chế:** Một phiên thảo luận nhóm (Group Chat) nơi nhiều Agent (PM, Architect, Dev, Tester) cùng online.
*   **Quy trình:**
    1.  User đưa ra chủ đề.
    2.  Các Agent lần lượt đưa ra quan điểm dựa trên Persona của mình.
    3.  Master Agent tổng hợp và chốt phương án.
*   **Ứng dụng:** Brainstorming, giải quyết xung đột kiến trúc, hoặc rà soát toàn diện (360-degree review).

---

## 3. Execution Modes (Cơ chế Thực thi Logic)

BMAD sử dụng 2 động cơ (Engine) khác nhau để chạy các workflow, tùy thuộc vào tính chất công việc.

### A. Step-File Execution (Chế độ Tệp-Bước)
*   **Cấu trúc:** Thư mục chứa `steps/step-01-xxx.md`, `steps/step-02-xxx.md`.
*   **Động cơ:** `workflow.md` (Markdown-based orchestrator).
*   **Đặc điểm:** Tuần tự, ngắt quãng. Mỗi bước là một file hướng dẫn riêng biệt được nạp vào context.
*   **Áp dụng:** Các workflow thiên về **Tư duy & Sáng tạo** (Analysis, Planning, Solutioning) như `create-prd`, `create-architecture`.

### B. Task Engine Execution (Chế độ Tác vụ XML)
*   **Cấu trúc:** Sử dụng `workflow.yaml` + `instructions.xml`.
*   **Động cơ:** `_bmad/core/tasks/workflow.xml` (The Core OS).
*   **Đặc điểm:**
    *   Sử dụng vòng lặp logic (Loop), điều kiện rẽ nhánh (If/Else) ngay trong XML.
    *   Có khả năng tự động hóa cao hơn, validation chặt chẽ hơn.
    *   Hỗ trợ tương tác CLI (Git, Filesystem) mạnh mẽ.
*   **Áp dụng:** Các workflow thiên về **Kỹ thuật & Code** (Implementation) như `dev-story`, `code-review`, `testarch-*`.

---

## 4. Project Context Modes (Chế độ Ngữ cảnh Dự án)

BMAD tự động điều chỉnh hành vi dựa trên trạng thái của codebase.

### A. Greenfield (Dự án Mới)
*   **Kích hoạt:** Khi thư mục dự án rỗng hoặc người dùng khai báo mới.
*   **Hành vi:**
    *   Tự do đề xuất Tech Stack.
    *   Tập trung xây dựng nền móng (Scaffolding).
    *   Yêu cầu chạy đầy đủ các bước Analysis/Planning.

### B. Brownfield (Dự án Hiện hữu)
*   **Kích hoạt:** Khi phát hiện `.git` hoặc source code.
*   **Hành vi:**
    *   **Bắt buộc:** Phải chạy `/bmm:document-project` hoặc `/bmm:generate-project-context` để tạo `project-context.md`.
    *   **Nguyên tắc "Fit-in":** Code mới phải tuân thủ Style, Pattern và thư viện của code cũ.
    *   **Validation:** Các bước Review sẽ kiểm tra kỹ tính tương thích ngược (Regression).

---

## 5. Course Correction Mode (Chế độ Điều hướng)

Một chế độ đặc biệt nằm ở `/bmm:correct-course`.
*   **Mục đích:** Xử lý các thay đổi (Change Request) phát sinh giữa chừng Sprint.
*   **Cơ chế:** Không đi thẳng tiếp, mà dừng lại -> Đánh giá tác động (Impact Analysis) -> Cập nhật PRD/Spec -> Quay lại Dev.
*   **Khi nào dùng:** Khi phát hiện bug thiết kế nghiêm trọng, hoặc yêu cầu kinh doanh thay đổi đột ngột.

---

## TỔNG KẾT: Bảng lựa chọn Mode

| Nhu cầu của bạn | Mode/Track khuyên dùng | Lệnh gợi ý |
| :--- | :--- | :--- |
| **Xây app từ đầu, bài bản** | Enterprise Flow (Greenfield) | `/bmm:create-product-brief` |
| **Sửa lỗi nhanh, thêm tính năng nhỏ** | Quick Flow (Brownfield) | `/bmm:quick-dev` |
| **Bí ý tưởng, cần team tư vấn** | Party Mode | `/core:party-mode` |
| **Code tính năng lớn đã có Spec** | Task Engine Execution | `/bmm:dev-story` |
| **Review code khắt khe** | Task Engine (Adversarial) | `/bmm:code-review` |
| **Thay đổi yêu cầu giữa chừng** | Course Correction | `/bmm:correct-course` |
