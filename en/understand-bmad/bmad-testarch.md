# Research: BMAD Test Architecture (TestArch) - Comprehensive

> **Module:** Business Methodology Module (BMM) - Quality Assurance
> **Status:** Active (v6.0.0)
> **Philosophy:** "Shift Left" - Test right from design, don't wait until code is done.

---

## 1. TestArch Ecosystem

You might only know **ATDD**, but that is just 1 of the 7 infinity stones of the QA system in BMAD. Here is the full picture:

| Workflow | Full Name | Role (Persona) | Main Goal |
| :--- | :--- | :--- | :--- |
| **`atdd`** | Acceptance Test-Driven | Developer | Write Fail tests before Code (TDD). |
| **`test-design`** | Test Design Strategy | QA Lead / Architect | Develop test strategy, risk assessment, and prioritize (P0, P1...). |
| **`nfr-assess`** | Non-Functional Req | Performance Eng | Check non-functional: Speed, Security, Reliability. |
| **`automate`** | Test Automation | SDET | Automatically generate mass test code for features (E2E, API, Unit). |
| **`trace`** | Traceability Matrix | Product Owner | Trace: Does this requirement have a test? What is the % coverage? |
| **`ci`** | CI/CD Pipeline | DevOps | Create config files for GitHub Actions/GitLab CI to run automated tests. |
| **`test-review`** | Test Quality Review | Sr. QA | Review test code quality (avoid flaky tests, meaningless tests). |

---

## 2. Detail & Case Studies Per Workflow

### A. Strategy & Design (`test-design`)

Before writing any line of test, we need to know what to test and why.

*   **Input:** Epic/Story, PRD.
*   **Action:** Risk Scoring and selecting test layers (Unit vs E2E).

#### 🧪 Case Study: "E-Wallet Payment" Feature
1.  **Run command:** `/bmm:testarch-test-design`
2.  **Risk Assessment:**
    *   AI detects risk: "Network loss while deducting money".
    *   Evaluation: Impact (high) x Probability (medium) = **High Risk**.
    *   Conclusion: Need thorough testing of this case at Integration (API) layer.
3.  **Output:** File `test-design-epic-X.md` defining:
    *   **P0 (Critical):** Test successful payment flow (E2E).
    *   **P1 (High):** Test timeout/network loss handling (API Mock).
    *   **P2 (Medium):** Test dark mode interface (Component).

---

### B. Mass Automation (`automate`)

If ATDD is "writing tests one by one", then Automate is "industrial test production".

*   **Input:** Coded Source code, Story.
*   **Action:** AI scans code, finds all branches/edge cases not yet tested and auto-generates test code.

#### 🧪 Case Study: Complex Registration Form
1.  **Context:** Dev finished coding a registration form with 20 complex validation fields.
2.  **Run command:** `/bmm:testarch-automate`
3.  **Magic:**
    *   AI analyzes React/Vue code.
    *   Auto-creates `tests/e2e/registration.spec.ts`.
    *   Auto-generates 50 test cases covering every scenario: Wrong Email, Weak Password, Duplicate Username, Missing required fields...
    *   Auto-creates **Data Factory** (using Faker library) to generate random test data.

---

### C. System Quality Assessment (`nfr-assess`)

Functional testing (running correctly) is not enough. The system must run fast and securely.

*   **Criteria:**
    *   **Performance:** API response < 200ms?
    *   **Security:** Any basic security flaws (OWASP)?
    *   **Reliability:** Can it handle 1000 users?

#### 🧪 Case Study: Hunting Slow APIs
1.  **Run command:** `/bmm:testarch-nfr`
2.  **AI Audit:**
    *   AI reads logs or load test results (k6/JMeter).
    *   Detects: API `/api/get-orders` takes 2.5s to respond.
3.  **Report:**
    *   Status: **FAIL** ❌ (Threshold set at 500ms).
    *   Recommendation: "Missing index on Orders table, user_id column".
    *   Action: Block release until fixed.

---

### D. Traceability & Coverage Management (`trace`)

The classic PM question: "Is this feature tested enough?". `trace` answers with data, not feelings.

*   **Logic:** Create mapping matrix: `Requirement` <-> `Test Case`.

#### 🧪 Case Study: Pre-Release Report
1.  **Run command:** `/bmm:testarch-trace`
2.  **Result:**
    *   Requirement AC-01 (Login): ✅ 3 Unit Tests, 1 E2E Test (Enough).
    *   Requirement AC-02 (Forgot Password): ⚠️ Only Unit test, missing E2E.
    *   Requirement AC-03 (Lock Account): ❌ No tests yet.
3.  **Decision:** Gate status = **FAIL**. Cannot deploy to Production.

---

### E. AI/CD Automation (`ci`)

*   **Goal:** Put all above processes into an automated pipeline (GitHub Actions).
*   **Special Feature:** **"Burn-in"**.
    *   Run tests repeatedly 10 times to detect "Flaky tests" (sometimes green, sometimes red).
    *   Only tests that pass the burn-in furnace are merged.

---

## 3. Summary: The Flow

A standard QA lifecycle in BMAD runs as follows:

1.  **Plan:** Run `test-design` to define P0/P1 test strategy.
2.  **Develop:** Dev runs `atdd` to write red tests, then codes to make them green.
3.  **Expand:** After coding feature, run `automate` for AI to write 20 extra test cases to cover 100% logic.
4.  **Verify:** Run `nfr-assess` to ensure code doesn't slow down the system.
5.  **Audit:** Run `trace` for PM to check if testing is sufficient.
6.  **Merge:** Pipeline `ci` runs one last time, burn-in to ensure absolute stability.
