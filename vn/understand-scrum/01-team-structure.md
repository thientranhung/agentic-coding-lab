# Mô Hình Tổ Chức Đội Nhóm Scrum

## Sơ Đồ Tổ Chức Tổng Quan

```
                        ┌─────────────────────┐
                        │    STAKEHOLDERS      │
                        │  (Khách hàng, Ban    │
                        │   lãnh đạo, Users)   │
                        └──────────┬──────────┘
                                   │
                    ┌──────────────┼──────────────┐
                    │              │               │
                    ▼              ▼               ▼
          ┌─────────────┐ ┌──────────────┐ ┌─────────────┐
          │  Product     │ │  Project     │ │  Business   │
          │  Owner (PO)  │ │  Manager(PM) │ │  Analyst(BA)│
          │              │ │              │ │             │
          │ Owns WHAT    │ │ Manages HOW  │ │ Bridges     │
          │ to build     │ │ & WHEN       │ │ BIZ ↔ TECH  │
          └──────┬──────┘ └──────┬───────┘ └──────┬──────┘
                 │               │                │
                 │        ┌──────┴───────┐        │
                 │        │ Scrum Master │        │
                 │        │    (SM)      │        │
                 │        │              │        │
                 │        │ Facilitates  │        │
                 │        │ & Removes    │        │
                 │        │ Blockers     │        │
                 │        └──────┬───────┘        │
                 │               │                │
                 └───────────────┼────────────────┘
                                 │
                    ┌────────────┴────────────┐
                    │      SCRUM TEAM         │
                    │    (Development Team)    │
                    └────────────┬────────────┘
                                 │
            ┌────────────────────┼────────────────────┐
            │                    │                     │
            ▼                    ▼                     ▼
  ┌──────────────────┐ ┌─────────────────┐  ┌─────────────────┐
  │   ENGINEERING    │ │   QUALITY       │  │   OPERATIONS    │
  │                  │ │   ASSURANCE     │  │   & SUPPORT     │
  └────────┬─────────┘ └────────┬────────┘  └────────┬────────┘
           │                    │                     │
           ▼                    ▼                     ▼
  ┌──────────────────┐ ┌─────────────────┐  ┌─────────────────┐
  │ Tech Lead        │ │ QA Lead         │  │ DevOps Engineer │
  │   │              │ │   │             │  │ UI/UX Designer  │
  │   ├─ Sr. Dev     │ │   ├─ QA Engineer│  │ DBA             │
  │   ├─ Sr. Dev     │ │   ├─ Tester     │  │ Security Eng.   │
  │   ├─ Mid Dev     │ │   └─ Tester     │  │                 │
  │   ├─ Jr. Dev     │ │                 │  │                 │
  │   └─ Jr. Dev     │ │                 │  │                 │
  └──────────────────┘ └─────────────────┘  └─────────────────┘
```

## Chi Tiết Vai Trò (RACI Matrix)

```
┌──────────────┬───────────────────────────────────────────────────┐
│   VAI TRÒ    │              TRÁCH NHIỆM CHÍNH                   │
├──────────────┼───────────────────────────────────────────────────┤
│              │                 LEADERSHIP LAYER                  │
├──────────────┼───────────────────────────────────────────────────┤
│ PO           │ ✦ Quản lý Product Backlog                        │
│              │ ✦ Định nghĩa Vision & Roadmap sản phẩm           │
│              │ ✦ Ưu tiên hoá User Stories (ROI-driven)          │
│              │ ✦ Accept/Reject kết quả Sprint                   │
├──────────────┼───────────────────────────────────────────────────┤
│ PM           │ ✦ Quản lý timeline, budget, resources            │
│              │ ✦ Risk management & reporting                    │
│              │ ✦ Stakeholder communication                      │
│              │ ✦ Cross-team coordination                        │
├──────────────┼───────────────────────────────────────────────────┤
│ BA           │ ✦ Phân tích requirements (BRD/SRS)               │
│              │ ✦ Viết User Stories & Acceptance Criteria         │
│              │ ✦ Process modeling (AS-IS → TO-BE)               │
│              │ ✦ UAT coordination                               │
├──────────────┼───────────────────────────────────────────────────┤
│ SM           │ ✦ Facilitate Scrum ceremonies                    │
│              │ ✦ Remove impediments                             │
│              │ ✦ Coach team về Agile practices                  │
│              │ ✦ Shield team từ external disruptions            │
├──────────────┼───────────────────────────────────────────────────┤
│              │                 EXECUTION LAYER                   │
├──────────────┼───────────────────────────────────────────────────┤
│ Tech Lead    │ ✦ Architecture decisions & tech direction        │
│              │ ✦ Code review & quality standards                │
│              │ ✦ Mentoring dev team                             │
│              │ ✦ Technical debt management                      │
├──────────────┼───────────────────────────────────────────────────┤
│ Senior Dev   │ ✦ Complex feature implementation                 │
│              │ ✦ System design & code review                    │
│              │ ✦ Mentor junior members                          │
├──────────────┼───────────────────────────────────────────────────┤
│ Mid Dev      │ ✦ Feature development                            │
│              │ ✦ Bug fixing & unit testing                      │
├──────────────┼───────────────────────────────────────────────────┤
│ Junior Dev   │ ✦ Simple tasks & bug fixes                       │
│              │ ✦ Learning & pair programming                    │
├──────────────┼───────────────────────────────────────────────────┤
│ QA Lead      │ ✦ Test strategy & test plan                      │
│              │ ✦ QA process & standards                         │
├──────────────┼───────────────────────────────────────────────────┤
│ QA Engineer  │ ✦ Test automation (scripts, frameworks)          │
│              │ ✦ Performance & integration testing              │
├──────────────┼───────────────────────────────────────────────────┤
│ Tester       │ ✦ Manual testing & exploratory testing           │
│              │ ✦ Bug reporting & regression testing             │
├──────────────┼───────────────────────────────────────────────────┤
│              │            BỔ SUNG (Positions thêm)              │
├──────────────┼───────────────────────────────────────────────────┤
│ DevOps       │ ✦ CI/CD pipeline, infrastructure, deployment     │
│ UI/UX        │ ✦ Wireframe, prototype, design system            │
│ DBA          │ ✦ Database design, optimization, migration       │
│ Security Eng │ ✦ Security audit, penetration test, compliance   │
└──────────────┴───────────────────────────────────────────────────┘
```

## Mối Quan Hệ Trong Scrum Ceremonies

```
┌─────────────────────────────────────────────────────────────────┐
│                     SCRUM CEREMONIES                            │
├──────────────┬──────────────────────────────────────────────────┤
│ Sprint       │  PO → trình bày backlog items                   │
│ Planning     │  SM → facilitate                                │
│              │  Team → estimate & commit                       │
│              │  BA → clarify requirements                      │
├──────────────┼──────────────────────────────────────────────────┤
│ Daily        │  SM → facilitate (15 min)                       │
│ Standup      │  Dev + QA + DevOps → What did / Will do /       │
│              │                       Blockers                  │
├──────────────┼──────────────────────────────────────────────────┤
│ Sprint       │  PO → accept/reject deliverables                │
│ Review       │  Team → demo working software                   │
│              │  Stakeholders → feedback                        │
│              │  PM → progress report                           │
├──────────────┼──────────────────────────────────────────────────┤
│ Sprint       │  SM → facilitate                                │
│ Retrospective│  Team → What went well / Improve / Action items │
├──────────────┼──────────────────────────────────────────────────┤
│ Backlog      │  PO + BA → refine & prioritize stories          │
│ Refinement   │  Tech Lead → technical feasibility              │
│              │  Team → estimate (story points)                 │
└──────────────┴──────────────────────────────────────────────────┘
```

## Team Size Recommendation

```
Ideal Scrum Team: 7 ± 2 members (core)

Example cho 1 Scrum Team chuẩn:
──────────────────────────────
  1x PO
  1x SM
  1x BA
  1x Tech Lead
  2x Senior Dev
  2x Mid/Junior Dev
  1x QA Engineer
  1x Tester
  ──────────────
  ~10 người (hợp lý cho dự án medium)

+ Support (shared across teams):
  1x PM (có thể quản lý 2-3 scrum teams)
  1x DevOps (shared)
  1x UI/UX (shared)
```

## Các Vị Trí Tôi Đã Bổ Sung

| Vị trí | Lý do |
|---|---|
| **DevOps Engineer** | CI/CD, deployment, infrastructure - thiếu là bottleneck |
| **UI/UX Designer** | Đảm bảo UX trước khi dev, giảm rework |
| **DBA** | Cần cho hệ thống phức tạp, data-intensive |
| **Security Engineer** | Compliance, security audit (đặc biệt fintech, healthcare) |
| **QA Lead** | Phân biệt QA (strategy + automation) vs Tester (manual) |
