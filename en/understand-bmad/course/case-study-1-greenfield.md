# Case Study 1: Developing New Feature (Greenfield)

**Scenario**: You want to build a "Video Comment Sentiment Analysis" feature for your system.

## Step 1: Discovery & Definition
Instead of writing PRD yourself, summon the Analyst Assistant.

**Command**: `/bmm:create-product-brief`
- **Agent**: Mary (Analyst) will appear.
- **Action**: Mary will ask you about goals, target users, and core features.
- **Result**: A `Product-Brief.md` file containing general direction.

## Step 2: Write Detailed Spec (PRD)
Now turn Brief into technical requirements.

**Command**: `/bmm:prd`
- **Agent**: PM (John) will take Brief file as context.
- **Action**: John builds User Stories, Acceptance Criteria (AC), and specifies constraints.
- **Result**: `docs/prd/` directory with full spec files.

## Step 3: System Design (Architecture)
Before coding, must know which Tech stack to use.

**Command**: `/bmm:create-architecture`
- **Agent**: Winston (Architect) will read PRD.
- **Action**: Winston proposes model (Example: use Python for AI, Nodejs for API), analyzes database schema.
- **Result**: `Architecture.md` document or `docs/architecture/` directory.
- *Parameter*: You can pass another `requirements` file if you don't want to use default `prd.md`.

## Step 4: Break Down Tasks (Epics & Stories)
Don't make AI code the whole project at once. Break it down.

**Command**: `/bmm:create-epics-and-stories`
- **Result**: Epic files (Ex: `Epic-1-Backend-Integration.md`) containing User stories doable in a day.

## Step 5: Code Execution (Implementation)
Start pouring foundation and building the house.

**Command**: `/bmm:dev-story`
- **Advanced Parameters**:
    - `story_file`: Specific path (Ex: `epics/epic-1/stories/story-1-login.md`) to skip selection step.
    - `yolo_mode`: `true` (Auto execute without asking).
- **Action**: Agent Amelia (Dev) will read Story #1 -> Write Test -> Write Code -> Run Test.
- **Note**: If lazy, add `#yolo` to command for Amelia to auto-run all sub-tasks.

---

### Summary Diagram of Greenfield Flow:

```mermaid
graph LR
    A[Idea] -->|/bmm:create-product-brief| B(Brief)
    B -->|/bmm:prd| C(PRD)
    C -->|/bmm:create-architecture| D(Architecture)
    D -->|/bmm:create-epics-and-stories| E(Epics & Stories)
    E -->|/bmm:dev-story| F[Finished Feature]
```

---
**Next Lesson:** [Case Study 2: Mastering Legacy Project (Brownfield)](./case-study-2-brownfield.md)
