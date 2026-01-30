# Nghiên cứu: BMAD Builder (The Meta-Layer)

> **Phân hệ:** BMAD Module Builder (BMB)
> **Trạng thái:** Active (v6.0.0)
> **Triết lý:** "Dogfooding" - Dùng chính kiến trúc BMAD để xây dựng BMAD.

---

## 1. Tổng quan: Sự trỗi dậy của Meta-Programming

Trong hầu hết các hệ thống AI Agent, người dùng là người viết Prompt/Config thủ công. BMAD đi ngược lại: Nó cung cấp một tầng **Meta-Layer** để AI tự viết ra cấu hình cho chính nó.

**BMB (BMad Module Builder)** nằm tại `_bmad/bmb/` và là tập hợp các workflow quyền năng nhất hệ thống, cho phép bạn:
*   Tạo ra nhân viên mới (Agent).
*   Thiết lập quy trình làm việc mới (Workflow).
*   Đóng gói thành sản phẩm để chia sẻ (Module).

---

## 2. Kiến trúc cốt lõi: Step-File Architecture

Tất cả các Builder của BMB đều chạy trên một kiến trúc phần mềm đặc biệt gọi là **"Step-File Architecture"** (SFA).

### Nguyên lý hoạt động:
Thay vì một file Prompt dài 5000 dòng dễ gây ảo giác (hallucination), SFA chia nhỏ quy trình thành hàng chục file siêu nhỏ:

*   `steps-c/step-01-discovery.md`: Phỏng vấn nhu cầu.
*   `steps-c/step-02-draft.md`: Nháp cấu trúc.
*   `steps-c/step-03-validate.md`: Kiểm tra cú pháp.

**Ưu điểm:**
*   **Just-In-Time Loading:** AI chỉ nhìn thấy step hiện tại -> Tập trung 100% não bộ cho 1 việc nhỏ.
*   **Strict Sequencing:** Không thể nhảy cóc. Bạn không thể tạo file nếu chưa qua bước Validate.
*   **State Tracking:** Trạng thái được lưu vào frontmatter của file output.

---

## 3. Ba trụ cột của BMB

### A. Agent Builder (`/bmb:agent`)
*   **Đầu vào:** Ý tưởng mơ hồ (VD: "Tôi muốn một agent chuyên viết thơ tình").
*   **Quy trình:**
    1.  **Brainstorming:** AI phỏng vấn bạn để xác định Persona (Tính cách), Tone (Giọng điệu).
    2.  **Construction:** Tự động điền vào template `simple-agent.template.md` hoặc cấu trúc Expert phức tạp.
    3.  **Validation:** Check cú pháp XML/YAML để đảm bảo chạy được.
*   **Đầu ra:** File `.agent.yaml` hoặc `.md` sẵn sàng sử dụng.

#### 🧪 Case Study: Xây dựng "Agent Đòi nợ" (DebtCollector)
1.  **User:** "Tôi cần agent gửi mail nhắc thanh toán, giọng điệu đanh thép."
2.  **Builder:** "Ok, tôi đề xuất icon là 💸. Kỹ năng cần có: Tra soát ngày quá hạn, Email template. Tone: Formal but Firm."
3.  **Kết quả:**
    ```yaml
    name: DebtCollector
    icon: 💸
    persona:
      role: Financial Enforcement
      style: "Nghiêm túc, không dùng emoji vui vẻ, tập trung vào số liệu."
    ```

### B. Workflow Builder (`/bmb:workflow`)
*   **Đầu vào:** Một quy trình làm việc thủ công (VD: Các bước test code).
*   **Sức mạnh:** Biến quy trình lỏng lẻo thành **Thuật toán**.
    *   Hỗ trợ tạo các chế độ: Create, Edit, Validate.
    *   Tự động sinh cấu trúc thư mục `steps/`, `data/`, `templates/`.
*   **Đầu ra:** Một thư mục Workflow chuẩn BMAD, có thể cài đặt bằng `bmad install`.

#### 🧪 Case Study: Workflow "Viết Blog chuẩn SEO"
1.  **User:** "Tôi muốn quy trình viết blog: Tìm từ khóa -> Lập dàn ý -> Viết bài -> Chèn ảnh."
2.  **Builder:** 
    *   Tạo file `step-01-keyword.md` (Dùng tool search).
    *   Tạo file `step-02-outline.md` (Template dàn ý).
    *   Tạo file `step-03-write.md` (Quy tắc SEO).
3.  **Kết quả:** User chỉ cần gõ `/custom:blog-seo` là AI tự chạy lần lượt 3 bước trên.

### C. Module Builder (`/bmb:module`)
*   **Cấp độ cao nhất:** Quad-modal (Brief -> Create -> Edit -> Validate).
*   **Chức năng:** Đóng gói Agent + Workflow + Resources thành một gói phần mềm (Module).
*   **Đầu ra:** File `module.yaml` và bộ cài đặt `_module-installer/`.

#### 🧪 Case Study: Module "Tuyển dụng nhân sự"
1.  **Brief:** Cần 1 hệ thống lọc CV và phỏng vấn tự động.
2.  **Builder:**
    *   Tạo Agent: `Recruiter` (Lọc CV), `Interviewer` (Phỏng vấn).
    *   Tạo Workflow: `scan-cv` (Đọc PDF), `interview-bot` (Chat).
    *   Đóng gói: `hr-module`.
3.  **Phát hành:** Gửi thư mục `hr-module` cho team khác, họ chỉ cần copy vào và chạy.

---

## 4. Tại sao bạn cần BMB?

1.  **Chuẩn hóa:** Không còn cảnh mỗi người viết Prompt một kiểu. Tất cả đều theo chuẩn XML/YAML của BMAD.
2.  **Tốc độ:** Thay vì mất 2 giờ để setup cấu trúc thư mục và file config, BMB làm trong 2 phút.
3.  **Tránh lỗi:** Các file sinh ra đảm bảo 100% đúng cú pháp, không bị lỗi "File not found" hay "Invalid YAML".

Đây chính là công cụ biến bạn từ "Người dùng AI" thành "Nhà phát triển AI" (AI Engineer).
