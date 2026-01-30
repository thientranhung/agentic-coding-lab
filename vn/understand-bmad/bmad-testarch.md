# Nghiên cứu: BMAD Test Architecture (TestArch) - Toàn diện

> **Phân hệ:** Business Methodology Module (BMM) - Quality Assurance
> **Trạng thái:** Active (v6.0.0)
> **Triết lý:** "Shift Left" - Kiểm thử ngay từ khi thiết kế, không phải đợi code xong.

---

## 1. Hệ sinh thái TestArch

Bạn mới chỉ biết đến **ATDD**, nhưng đó chỉ là 1 trong 7 viên ngọc vô cực của hệ thống QA trong BMAD. Dưới đây là bức tranh toàn cảnh:

| Workflow | Tên đầy đủ | Vai trò (Persona) | Mục tiêu chính |
| :--- | :--- | :--- | :--- |
| **`atdd`** | Acceptance Test-Driven | Developer | Viết test Fail trước khi Code (TDD). |
| **`test-design`** | Test Design Strategy | QA Lead / Architect | Lên chiến lược test, đánh giá rủi ro (Risk) và phân loại độ ưu tiên (P0, P1...). |
| **`nfr-assess`** | Non-Functional Req | Performance Eng | Kiểm tra phi chức năng: Tốc độ, Bảo mật, Độ tin cậy. |
| **`automate`** | Test Automation | SDET | Tự động sinh test code hàng loạt cho các feature (E2E, API, Unit). |
| **`trace`** | Traceability Matrix | Product Owner | Truy vết: Yêu cầu này đã có test chưa? Coverage bao nhiêu %? |
| **`ci`** | CI/CD Pipeline | DevOps | Tạo file config cho GitHub Actions/GitLab CI để chạy test tự động. |
| **`test-review`** | Test Quality Review | Sr. QA | Review chất lượng code test (tránh test flaky, test vô nghĩa). |

---

## 2. Chi tiết & Case Study từng Workflow

### A. Chiến lược & Thiết kế (`test-design`)

Trước khi viết bất kỳ dòng test nào, ta cần biết test cái gì và tại sao.

*   **Đầu vào:** Epic/Story, PRD.
*   **Hành động:** Phân tích rủi ro (Risk Scoring) và chọn tầng test (Unit vs E2E).

#### 🧪 Case Study: Tính năng "Thanh toán qua Ví điện tử"
1.  **Chạy lệnh:** `/bmm:testarch-test-design`
2.  **Risk Assessment:**
    *   AI phát hiện rủi ro: "Mất kết nối mạng khi đang trừ tiền".
    *   Đánh giá: Impact (cao) x Probability (trung bình) = **High Risk**.
    *   Kết luận: Cần test kỹ case này ở tầng Integration (API).
3.  **Output:** File `test-design-epic-X.md` quy định:
    *   **P0 (Critical):** Test luồng thanh toán thành công (E2E).
    *   **P1 (High):** Test xử lý timeout/mất mạng (API Mock).
    *   **P2 (Medium):** Test giao diện dark mode (Component).

---

### B. Tự động hóa diện rộng (`automate`)

Nếu ATDD là "viết test từng cái một", thì Automate là "sản xuất test công nghiệp".

*   **Đầu vào:** Source code đã code, Story.
*   **Hành động:** AI quét code, tìm tất cả các nhánh (branch/edge cases) chưa được test và tự sinh code test.

#### 🧪 Case Study: Form đăng ký phức tạp
1.  **Bối cảnh:** Dev đã code xong form đăng ký với 20 trường validation phức tạp.
2.  **Chạy lệnh:** `/bmm:testarch-automate`
3.  **Magic:**
    *   AI phân tích code React/Vue.
    *   Tự tạo `tests/e2e/registration.spec.ts`.
    *   Tự sinh 50 test case bao phủ mọi kịch bản: Email sai, Password yếu, Username trùng, Bỏ trống trường bắt buộc...
    *   Tự tạo **Data Factory** (dùng thư viện Faker) để sinh dữ liệu ngẫu nhiên cho test.

---

### C. Đánh giá chất lượng hệ thống (`nfr-assess`)

Test chức năng (chạy đúng) là chưa đủ. Hệ thống phải chạy nhanh và an toàn.

*   **Tiêu chí:**
    *   **Performance:** API phản hồi < 200ms?
    *   **Security:** Có dính lỗi bảo mật cơ bản (OWASP) không?
    *   **Reliability:** Chịu tải được 1000 users không?

#### 🧪 Case Study: Săn lùng API chậm
1.  **Chạy lệnh:** `/bmm:testarch-nfr`
2.  **AI Audit:**
    *   AI đọc log hoặc kết quả chạy load test (k6/JMeter).
    *   Phát hiện: API `/api/get-orders` mất 2.5s để phản hồi.
3.  **Báo cáo:**
    *   Status: **FAIL** ❌ (Threshold quy định là 500ms).
    *   Khuyến nghị: "Thiếu index ở bảng Orders, cột user_id".
    *   Hành động: Chặn release cho đến khi fix xong.

---

### D. Truy vết & Quản lý Coverage (`trace`)

Câu hỏi kinh điển của PM: "Tính năng này đã test đủ chưa?". `trace` sẽ trả lời bằng số liệu, không phải cảm tính.

*   **Logic:** Tạo ma trận ánh xạ: `Yêu cầu (Requirement)` <-> `Test Case`.

#### 🧪 Case Study: Báo cáo trước ngày Release
1.  **Chạy lệnh:** `/bmm:testarch-trace`
2.  **Kết quả:**
    *   Yêu cầu AC-01 (Login): ✅ 3 Unit Test, 1 E2E Test (Đủ).
    *   Yêu cầu AC-02 (Quên mật khẩu): ⚠️ Chỉ có Unit test, thiếu E2E.
    *   Yêu cầu AC-03 (Khóa tài khoản): ❌ Chưa có test nào.
3.  **Quyết định:** Gate status = **FAIL**. Không được deploy lên Production.

---

### E. Tự động hóa CI/CD (`ci`)

*   **Mục tiêu:** Đưa tất cả quy trình trên vào pipeline tự động (GitHub Actions).
*   **Tính năng đặc biệt:** **"Burn-in"**.
    *   Chạy test lặp lại 10 lần liên tục để phát hiện "Flaky test" (lúc xanh lúc đỏ).
    *   Chỉ test nào vượt qua lò luyện (Burn-in) mới được merge.

---

## 3. Tổng kết: Quy trình phối hợp (The Flow)

Một vòng đời QA chuẩn trong BMAD sẽ chạy như sau:

1.  **Plan:** Chạy `test-design` để định hình chiến lược test P0/P1.
2.  **Develop:** Dev chạy `atdd` để viết test đỏ, sau đó code cho xanh.
3.  **Expand:** Code xong feature, chạy `automate` để AI viết thêm 20 test cases phụ nhằm cover 100% logic.
4.  **Verify:** Chạy `nfr-assess` để đảm bảo code không làm chậm hệ thống.
5.  **Audit:** Chạy `trace` để PM kiểm tra xem đã đủ test chưa.
6.  **Merge:** Pipeline `ci` chạy lần cuối, burn-in để đảm bảo ổn định tuyệt đối.
