# TestArch: BMAD's Comprehensive Test Architecture

> **Module:** Test Engineering Architecture (TEA)
> **Goal:** Ensure Quality Assurance (QA) is not just finding bugs, but preventing them from the start.
> **Philosophy:** "Shift Left" (Test as early as possible) and "Test as Code".

---

## 1. What is TestArch?

In traditional coding methods, Testing is often the final step (and often cut short). But with BMAD, Testing is elevated to an **Architecture** equal to Development.

**TestArch** (located in `_bmad/tea`) provides a suite of tools and processes to build automated, sustainable testing systems deeply integrated into CI/CD.

Special Feature: TestArch doesn't just test code, it tests **Requirements** and **Design** too.

---

## 2. Testing Process (TEA Pipeline)

TestArch divides the testing process into logical phases:

### Phase 1: Foundation & Learning
*   **/tea:teach-me-testing**: If you are new to testing, the Agent will teach you through 7 lessons of the "TEA Academy".
*   **/tea:test-design**: Risk-based testing planning. Identify what *needs* thorough testing, what *can* be skipped.

### Phase 2: Infrastructure
*   **/tea:test-framework**: Automatically build a standard Testing framework (using Playwright, Cypress, or Jest) with Page Object Model from the start.
*   **/tea:ci-setup**: Configure CI/CD pipelines (GitHub Actions) to run automated tests on every code push.

### Phase 3: Execution - ATDD Loop
This is the heart of TestArch:
1.  **ATDD (Acceptance Test Driven Development):** Use `/tea:atdd` to write test cases *before* writing code. Ensures generated code meets business needs.
2.  **Automate:** Use `/tea:automate` to expand the test suite, covering edge cases.
3.  **Review:** Use `/tea:test-review` to score the test suite (0-100 scale). Test code needs reviewing just like production code!

### Phase 4: Advanced Quality
*   **/tea:nfr-assess**: Check Non-Functional Requirements like Performance, Security.
*   **/tea:trace**: Traceability. Answers the question: "Has Feature A been tested by which file? What is the result?".

---

## 3. Key Commands

| Command | Function | When to use? |
| :--- | :--- | :--- |
| `/tea:test-framework` | Install Playwright/Cypress | At the start of a project. |
| `/tea:atdd` | Create test file (Red result) | Before starting code for a new feature. |
| `/tea:automate` | Write code for test script | After having the test case framework. |
| `/tea:nfr-assess` | Assess performance/security | Before release. |
| `/tea:trace` | Create coverage matrix | When reporting to Client/Boss. |

---

## 4. Why use TestArch?

1.  **Anti-Regression:** Fixing one thing breaking ten others is an eternal pain. TestArch gives you confidence to refactor code.
2.  **Live Documentation:** BDD test files (Gherkin) are business documents that are always true to reality.
3.  **Time Saving:** Better to spend 1 hour writing automated tests than 10 hours fixing production bugs.

---

## 5. Conclusion

**TestArch** turns Testing from a "burden" into a Developer's "weapon".
It helps you sleep better every time you deploy the app on a Friday.
