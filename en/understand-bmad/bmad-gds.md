# BMAD Game Development System (GDS): Professional Game Dev Workflow

> **Module:** Game Development System (GDS)
> **Goal:** Provide a comprehensive Game development process from idea to release (Blueprint to Gold Master).
> **Audience:** Game Developers, Game Designers, Indie Devs, Small Studios.

---

## 1. Introduction to GDS

If **BMM (Business Method Module)** is the standard process for building enterprise applications (Web/App), then **GDS (Game Development System)** is the version "tailor-made" for the Game industry.

Making games is different from making regular software:
*   **Art & Narrative** elements are as important as code.
*   Strict requirements for **Performance** and **Player Experience**.
*   More complex testing processes (Playtest, Game Balancing).

GDS was born to address these specifics, turning BMAD into a Virtual Game Studio.

---

## 2. Agent Squad (GDS Roster)

GDS possesses a separate set of Agents with deep knowledge of Unity, Unreal, Godot, and Game Design:

| Role | Agent | Main Duty |
| :--- | :--- | :--- |
| **Creative** | `Game Designer` | Write GDD, design mechanics, narrative. |
| **Technical** | `Game Architect` | Design ECS architecture, Network, select Tech stack. |
| **Production** | `Game Scrum Master` | Manage progress (Sprint), break down tasks (User Stories). |
| **Coding** | `Game Dev` | Code features, fix bugs, optimize performance. |
| **Quality** | `Game QA` | Write test scripts, run auto-tests, plan Playtests. |
| **Versatile** | `Game Solo Dev` | Handle all positions for small projects or quick prototyping. |

---

## 3. The GDS Pipeline

GDS divides the game making process into 5 industry-standard phases:

### Phase 1: Pre-production
The "dreaming" phase. Defining what the game will be.
*   **Brainstorming:** `/gds:brainstorm-game` (Find unique ideas).
*   **Game Brief:** `/gds:game-brief` (1-page summary document for pitching).

### Phase 2: Design
Turn ideas into technical documents so devs can code.
*   **Game Logic:** `/gds:gdd` (Write comprehensive Game Design Document: Mechanics, Loop, Economy).
*   **Narrative:** `/gds:narrative` (Write scripts, dialogue, world-building).

### Phase 3: Technical Setup
Before coding features, build the foundation.
*   **Architecture:** `/gds:game-architecture` (Define clean architecture, folder structure).
*   **Test Framework:** `/gds:test-framework` (Setup automated test environment).

### Phase 4: Production
Sprint loops to realize the game.
*   **Planning:** `/gds:sprint-planning` -> `/gds:create-story`.
*   **Code:** `/gds:dev-story` (Agent codes tasks automatically).
*   **Review:** `/gds:code-review`.

### Phase 5: Gametest & Tuning (Testing & Balancing)
*   **Playtest:** `/gds:playtest-plan` (Plan for user testing).
*   **Performance:** `/gds:performance-test` (Measure FPS, Memory leaks).

---

## 4. GDS vs BMM: Which to use?

| Criteria | BMM (Business App) | GDS (Game) |
| :--- | :--- | :--- |
| **Focus** | Functionality, Data, CRUD. | Experience, Fun factor, FPS. |
| **Docs** | PRD (Product Requirements Doc). | GDD (Game Design Document). |
| **Testing** | Unit Test, Integration Test. | Playtest, Balancing, Performance Test. |
| **Tech Stack** | React, Node, Python, SQL... | Unity (C#), Unreal (C++), Godot, Phaser... |

If you plan to build an **E-commerce Web App** → Use **BMM**.
If you plan to build a **2D RPG Game** → Use **GDS**.
If you are building a **Gamified App** (Learning app with game elements) → You can combine both (use BMM for backend, GDS for frontend game).

---

## 5. Start Now

To start a new game project with BMAD:

1.  **Ideation:**
    ```bash
    /gds:brainstorm-game
    ```
2.  **Write GDD:**
    ```bash
    /gds:gdd
    ```
3.  **Quick Prototype (if solo):**
    ```bash
    /gds:quick-prototype
    ```
