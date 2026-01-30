# Nghiên cứu: BMAD Excalidraw Generators

> **Phân hệ:** Business Methodology Module (BMM) - Visualization
> **Trạng thái:** Active (v6.0.0)
> **Mục tiêu:** Tự động hóa việc tạo diagram, wireframe và sơ đồ kiến trúc từ mô tả văn bản.

---

## 1. Tổng quan

BMAD tích hợp khả năng sinh file `.excalidraw` trực tiếp thông qua các workflow trong thư mục `_bmad/bmm/workflows/excalidraw-diagrams/`. Điều này giải quyết vấn đề "ngại vẽ" của developer và giúp tài liệu hóa dự án trực quan hơn.

### Các loại biểu đồ hỗ trợ:
1.  **Wireframe:** Tạo giao diện UI (Low-fidelity).
2.  **Database Diagram (ERD):** Thiết kế cấu trúc bảng.
3.  **Flowchart:** Vẽ luồng nghiệp vụ.
4.  **Architecture:** Vẽ kiến trúc hệ thống (Cloud, Microservices).

---

## 2. Cơ chế hoạt động

Khác với việc gen ảnh (pixel), BMAD sinh ra **JSON structured data** tuân thủ định dạng file của Excalidraw. Điều này có nghĩa là:
*   **Có thể chỉnh sửa:** Bạn mở file kết quả lên Excalidraw.com hoặc plugin VSCode và kéo thả, sửa text bình thường.
*   **Dùng thư viện:** AI sử dụng bộ thư viện (Library) chuẩn của Excalidraw (hình chữ nhật, mũi tên, icon database...) để lắp ghép.

---

## 3. Case Study: Thiết kế màn hình Dashboard

**Bối cảnh:** Cần phác thảo nhanh bố cục trang Dashboard quản trị cho Product Manager duyệt.

### Bước 1: Gọi lệnh
```bash
/bmm:create-excalidraw-wireframe
```

### Bước 2: Mô tả yêu cầu (Prompting)
User nhập: *"Tạo một Dashboard Admin gồm 3 phần: Sidebar bên trái menu đen. Header ở trên có Avatar và Search. Phần chính gồm 4 Card thống kê (User, Revenue, Orders) và một biểu đồ Line chart to ở dưới."*

### Bước 3: AI xử lý
AI sẽ load `excalidraw-helpers.md` để hiểu cú pháp JSON của các element (Rectangle, Text, Line). Nó tính toán tọa độ (x, y) để các khối không đè lên nhau.

### Bước 4: Đầu ra
AI tạo file: `docs/wireframes/admin-dashboard.excalidraw`.

**Nội dung bên trong (mô phỏng JSON):**
```json
{
  "type": "excalidraw",
  "elements": [
    { "type": "rectangle", "x": 0, "y": 0, "width": 200, "backgroundColor": "#000000" }, // Sidebar
    { "type": "text", "text": "Dashboard", "x": 20, "y": 20, "strokeColor": "#ffffff" }, // Menu Item
    { "type": "rectangle", "x": 220, "y": 100, "width": 200, "label": "Revenue: $500k" } // Card 1
    ...
  ]
}
```

### Bước 5: Tinh chỉnh
User mở file bằng Extension Excalidraw trong Cursor/VSCode. Thấy cái Line Chart hơi nhỏ, user kéo to ra bằng chuột trong 2 giây. Xong!

---

## 4. Lợi ích
*   **Nhanh gấp 10 lần:** Không cần hì hục vẽ từng ô vuông.
*   **Chuẩn hóa:** Các diagram dùng chung một bộ style (font, màu sắc) quy định trong `excalidraw-templates.yaml`.
*   **Editable:** Không phải là ảnh chết (PNG/JPG), có thể sửa đổi khi yêu cầu thay đổi.
