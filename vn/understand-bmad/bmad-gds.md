# BMAD Game Development System (GDS): Quy trình làm game chuyên nghiệp

> **Phân hệ:** Game Development System (GDS)
> **Mục tiêu:** Cung cấp quy trình phát triển Game toàn diện từ ý tưởng đến phát hành (Blueprint to Gold Master).
> **Đối tượng:** Game Developer, Game Designer, Indie Dev, Studio nhỏ.

---

## 1. Giới thiệu GDS

Nếu **BMM (Business Method Module)** là quy trình chuẩn để xây dựng ứng dụng doanh nghiệp (Web/App), thì **GDS (Game Development System)** là phiên bản được "thửa riêng" cho ngành Game.

Làm game khác với làm phần mềm thông thường:
*   Yếu tố **nghệ thuật & cốt truyện** (Art & Narrative) quan trọng ngang code.
*   Yêu cầu khắt khe về **hiệu năng** (Performance) và **trải nghiệm người chơi** (Player Experience).
*   Quy trình test phức tạp hơn (Playtest, Balance game).

GDS ra đời để giải quyết các đặc thù này, biến BMAD thành một Game Studio ảo.

---

## 2. Biệt đội Agents (GDS Roster)

GDS sở hữu một tập hợp Agent riêng, có kiến thức sâu về Unity, Unreal, Godot và Game Design:

| Role | Agent | Nhiệm vụ chính |
| :--- | :--- | :--- |
| **Sáng tạo** | `Game Designer` | Viết GDD, thiết kế luật chơi (Mechanics), cốt truyện (Narrative). |
| **Kỹ thuật** | `Game Architect` | Thiết kế kiến trúc ECS, Network, chọn Tech stack phù hợp. |
| **Sản xuất** | `Game Scrum Master` | Quản lý tiến độ (Sprint), chia nhỏ task (User Stories). |
| **Lập trình** | `Game Dev` | Code tính năng, sửa bug, tối ưu hiệu năng. |
| **Chất lượng** | `Game QA` | Viết kịch bản test, chạy auto-test, lên kế hoạch Playtest. |
| **Đa năng** | `Game Solo Dev` | Cân mọi vị trí cho các dự án nhỏ hoặc prototyping nhanh. |

---

## 3. Quy trình dòng chảy (The GDS Pipeline)

GDS chia quá trình làm game thành 5 giai đoạn chuẩn công nghiệp:

### Giai đoạn 1: Pre-production (Tiền sản xuất)
Giai đoạn "mơ mộng". Định hình game sẽ như thế nào.
*   **Brainstorming:** `/gds:brainstorm-game` (Tìm ý tưởng độc đáo).
*   **Game Brief:** `/gds:game-brief` (Tài liệu tóm tắt 1 trang để pitching).

### Giai đoạn 2: Design (Thiết kế chi tiết)
Biến ý tưởng thành tài liệu kỹ thuật để dev có thể code.
*   **Game Logic:** `/gds:gdd` (Viết Game Design Document toàn diện: Mechanics, Loop, Economy).
*   **Cốt truyện:** `/gds:narrative` (Viết kịch bản, hội thoại, xây dựng thế giới).

### Giai đoạn 3: Technical Setup (Dựng khung)
Trước khi code tính năng, cần xây móng nhà.
*   **Kiến trúc:** `/gds:game-architecture` (Quy định clean architecture, folder structure).
*   **Test Framework:** `/gds:test-framework` (Cài đặt môi trường test tự động).

### Giai đoạn 4: Production (Sản xuất)
Vòng lặp Sprint để hiện thực hóa game.
*   **Lập kế hoạch:** `/gds:sprint-planning` -> `/gds:create-story`.
*   **Code:** `/gds:dev-story` (Agent tự code theo task).
*   **Review:** `/gds:code-review`.

### Giai đoạn 5: Gametest & Tuning (Kiểm thử & Cân bằng)
*   **Playtest:** `/gds:playtest-plan` (Kế hoạch cho người dùng chơi thử).
*   **Performance:** `/gds:performance-test` (Đo FPS, Memory leak).

---

## 4. GDS vs BMM: Khi nào dùng cái nào?

| Tiêu chí | BMM (Business App) | GDS (Game) |
| :--- | :--- | :--- |
| **Trọng tâm** | Chức năng (Functionality), Data, CRUD. | Trải nghiệm (Experience), Fun factor, FPS. |
| **Tài liệu** | PRD (Product Reqruriements Doc). | GDD (Game Design Document). |
| **Testing** | Unit Test, Integration Test. | Playtest, Balancing, Performance Test. |
| **Tech Stack** | React, Node, Python, SQL... | Unity (C#), Unreal (C++), Godot, Phaser... |

Nếu bạn định làm một **Web App thương mại điện tử** → Dùng **BMM**.
Nếu bạn định làm một **Game nhập vai 2D** → Dùng **GDS**.
Nếu bạn làm **Gamified App** (App học tập có yếu tố game) → Có thể kết hợp cả hai (dùng BMM cho backend, GDS cho frontend game).

---

## 5. Bắt đầu ngay

Để bắt đầu một dự án game mới với BMAD:

1.  **Lên ý tưởng:**
    ```bash
    /gds:brainstorm-game
    ```
2.  **Viết GDD:**
    ```bash
    /gds:gdd
    ```
3.  **Dựng prototype nhanh (nếu làm 1 mình):**
    ```bash
    /gds:quick-prototype
    ```
