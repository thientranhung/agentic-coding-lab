# CIS (Creative Innovation Suite): Bộ Não Sáng Tạo và Nghiên cứu Của BMAD

> **Phân hệ:** Creative Innovation Suite (CIS)
> **Vai trò:** Nghiên cứu (Research), Sáng tạo (Creativity), và Định hướng chiến lược (Strategy).
> **Đối tượng sử dụng:** Founder, Product Manager, Creative Director, hoặc Solo-Dev ở giai đoạn ý tưởng.

---

## 1. Bản chất của CIS trong hệ sinh thái BMAD

Nhiều người lầm tưởng BMAD chỉ là công cụ để viết code nhanh (Coding Agent). Tuy nhiên, nếu chỉ viết code mà không biết viết *cái gì* và *tại sao*, dự án vẫn sẽ thất bại.

**CIS (Creative Innovation Suite)** được thiết kế để trở thành "Bán cầu não phải" của hệ thống BMAD.
- Nếu **Core/BMM/GDS** là cơ bắp và tay chân để thực thi (How to build).
- Thì **CIS** là bộ não để tư duy, nghiên cứu và định hướng (What to build & Why).

CIS biến BMAD từ một "Cỗ máy lập trình" thành một **Studio khởi nghiệp toàn diện**, nơi ý tưởng được nuôi dưỡng từ trứng nước.

---

## 2. Các năng lực cốt lõi (Core Capabilities)

Dựa trên cấu trúc thư mục `.claude/commands/bmad*` và các Agent chuyên biệt, CIS cung cấp 4 trụ cột sức mạnh:

### 2.1. Nghiên cứu & Chiến lược (Research & Strategy)
Trước khi bắt đầu bất kỳ dự án nào, bạn cần hiểu thị trường.
- **Agent:** `Innovation Strategist`
- **Chức năng:** Phân tích xu hướng, nghiên cứu đối thủ, định hình chiến lược sản phẩm (Product Strategy).
- **Lệnh tương tác:** `/cis:innovation-strategy`, `/cis:problem-solving`.

### 2.2. Tư duy thiết kế (Design Thinking)
Giúp giải quyết các vấn đề phức tạp (Wicked Problems) bằng cách đặt người dùng làm trung tâm.
- **Agent:** `Design Thinking Coach`
- **Chức năng:** Hướng dẫn Empathy Map, Customer Journey, và Brainstorming tìm giải pháp đột phá.
- **Lệnh tương tác:** `/cis:design-thinking`.

### 2.3. Sáng tạo nội dung & Kể chuyện (Storytelling)
Sản phẩm tốt cần một câu chuyện hay. Code tốt cần tài liệu dễ hiểu.
- **Agent:** `Storyteller`, `Presentation Master`
- **Chức năng:** Biến các thông số kỹ thuật khô khan thành câu chuyện truyền cảm hứng (Pitch Deck, Landing Page content, User Stories).
- **Lệnh tương tác:** `/cis:storytelling`.

### 2.4. Phá băng sáng tạo (Creative Unblocking)
Khi bạn bí ý tưởng, CIS đóng vai trò là người huấn luyện viên (Coach).
- **Agent:** `Creative Problem Solver`
- **Chức năng:** Sử dụng các kỹ thuật như SCAMPER, Six Thinking Hats để mở khóa tư duy.

---

## 3. Quy trình tích hợp (Workflow)

CIS không hoạt động tách biệt mà là bước đệm (Pre-game) cho quá trình phát triển phần mềm.

1.  **Giai đoạn 1: CIS - Khám phá (Discovery)**
    *   Dùng `/cis:innovation-strategy` để chốt ý tưởng.
    *   Dùng `/cis:storytelling` để viết Vision Statement.

2.  **Giai đoạn 2: Party Mode - Hội tụ (Convergence)**
    *   Triệu tập cuộc họp `/core:party-mode`.
    *   Mời `Innovation Strategist` (từ CIS) ngồi cùng `Architect` (từ BMM).
    *   Master Agent sẽ điều phối để ý tưởng sáng tạo (CIS) khả thi về mặt kỹ thuật (BMM).

3.  **Giai đoạn 3: BMM/GDS - Thực thi (Execution)**
    *   Chuyển giao tài liệu từ CIS thành PRD, User Stories và bắt đầu code.

---

## 4. Tại sao cần tách riêng Module Nghiên cứu?

Trong BMAD v6, mặc dù tính năng họp (Party Mode) đã được chuyển về Core, nhưng **Bộ thư viện tri thức và kỹ năng (Skills & Agents)** của CIS vẫn được giữ riêng. Lý do là:

- **Tư duy khác biệt:** Agent làm code cần chính xác, logic (`temperature` thấp). Agent làm CIS cần bay bổng, liên kết đa chiều (`temperature` cao).
- **Sự tập trung:** Khi bạn đang trong chế độ Research, bạn không muốn bị làm phiền bởi các lỗi cú pháp (Syntax Error). Bạn cần một không gian thuần túy cho ý tưởng.

## 5. Kết luận

**Bmad CIS** là minh chứng cho triết lý: *"Công nghệ chỉ là công cụ, Tư duy mới là đích đến"*.
Hãy sử dụng CIS để đảm bảo rằng bạn không chỉ xây dựng sự việc đúng cách (Build the thing right), mà là đang xây dựng đúng thứ cần thiết (Build the right thing).
