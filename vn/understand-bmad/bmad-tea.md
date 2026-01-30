# TestArch: Kiến trúc kiểm thử toàn diện của BMAD

> **Phân hệ:** Test Engineering Architecture (TEA)
> **Mục tiêu:** Đảm bảo chất lượng (Quality Assurance) không chỉ là tìm bug, mà là ngăn chặn bug ngay từ đầu.
> **Triết lý:** "Shift Left" (Test sớm nhất có thể) và "Test as Code".

---

## 1. TestArch là gì?

Trong các phương pháp coding truyền thống, Testing thường là bước cuối cùng (và hay bị cắt bớt). Nhưng với BMAD, Testing được nâng lên thành một **Kiến trúc (Architecture)** ngang hàng với Development.

**TestArch** (nằm trong module `_bmad/tea`) cung cấp bộ công cụ và quy trình để xây dựng hệ thống test tự động, bền vững và tích hợp sâu vào CI/CD.

Điểm đặc biệt: TestArch không chỉ test code, nó test cả **Yêu cầu (Requirements)** và **Thiết kế (Design)**.

---

## 2. Quy trình kiểm thử (TEA Pipeline)

TestArch chia quá trình kiểm thử thành các giai đoạn logic:

### Giai đoạn 1: Chuẩn bị & Học hỏi (Foundation)
*   **/tea:teach-me-testing**: Nếu bạn chưa rành về testing, Agent sẽ dạy bạn qua 7 bài học của "TEA Academy".
*   **/tea:test-design**: Lập kế hoạch test dựa trên rủi ro (Risk-based testing). Xác định cái gì *cần* test kỹ, cái gì *có thể* bỏ qua.

### Giai đoạn 2: Xây dụng hạ tầng (Infrastructure)
*   **/tea:test-framework**: Tự động dựng khung Testing (dùng Playwright, Cypress hoặc Jest) chuẩn chỉnh ngay từ đầu với Page Object Model.
*   **/tea:ci-setup**: Cấu hình pipeline CI/CD (GitHub Actions) để chạy test tự động mỗi khi push code.

### Giai đoạn 3: Thực thi (Implementation) - Vòng lặp ATDD
Đây là trái tim của TestArch:
1.  **ATDD (Acceptance Test Driven Development):** Dùng lệnh `/tea:atdd` để viết test case *trước* khi viết code. Đảm bảo code sinh ra đáp ứng đúng nghiệp vụ.
2.  **Automate:** Dùng `/tea:automate` để mở rộng bộ test, bao phủ các case biên (edge testing).
3.  **Review:** Dùng `/tea:test-review` để chấm điểm bộ test (thang 0-100). Test code cũng cần được review như production code!

### Giai đoạn 4: Chất lượng nâng cao (Advanced Quality)
*   **/tea:nfr-assess**: Kiểm tra các yêu cầu phi chức năng (Non-Functional Requirements) như Hiệu năng (Performance), Bảo mật (Security).
*   **/tea:trace**: Truy xuất nguồn gốc (Traceability). Trả lời câu hỏi: "Feature A đã được test bởi file nào? Kết quả ra sao?".

---

## 3. Các lệnh quan trọng (Test Commands)

| Command | Chức năng | Khi nào dùng? |
| :--- | :--- | :--- |
| `/tea:test-framework` | Cài đặt Playwright/Cypress | Khi mới bắt đầu dự án. |
| `/tea:atdd` | Tạo file test (kết quả Red) | Trước khi bắt đầu code một tính năng mới. |
| `/tea:automate` | Viết code cho test script | Sau khi đã có bộ khung test case. |
| `/tea:nfr-assess` | Đánh giá hiệu năng/bảo mật | Trước khi release. |
| `/tea:trace` | Tạo ma trận bao phủ (Matrix) | Khi cần báo cáo cho khách hàng/Sếp. |

---

## 4. Tại sao nên dùng TestArch?

1.  **Chống hồi quy (Anti-Regression):** Sửa một chỗ, hỏng mười chỗ là nỗi đau muôn thuở. TestArch giúp bạn tự tin refactor code.
2.  **Tài liệu sống (Live Documentation):** Các file test BDD (Gherkin) chính là tài liệu nghiệp vụ luôn đúng với thực tế.
3.  **Tiết kiệm thời gian:** Thà tốn 1 giờ viết test automate còn hơn tốn 10 giờ fix bug production.

---

## 5. Kết luận

**TestArch** biến Testing từ một "gánh nặng" thành "vũ khí" của Developer.
Nó giúp bạn ngủ ngon hơn mỗi khi deploy ứng dụng vào ngày thứ Sáu.
