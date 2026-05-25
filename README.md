# SQL Practice — Analytics Engineer Journey
### Daily SQL problem-solving log | DataLemur · Analyst Builder · StrataScratch
### Manufacturing Domain × Analytics SQL = Interview Differentiation

![SQL](https://img.shields.io/badge/SQL-MySQL%20%7C%20PostgreSQL-blue?logo=mysql&logoColor=white)
![DataLemur](https://img.shields.io/badge/DataLemur-Interview%20Prep-orange)
![Analyst Builder](https://img.shields.io/badge/Analyst%20Builder-Course%20Drills-green)
![Problems Solved](https://img.shields.io/badge/Problems%20Solved-0-red)
![Last Commit](https://img.shields.io/github/last-commit/YOUR-USERNAME/sql-practice)
![Start Date](https://img.shields.io/badge/Started-25%20May%202026-blue)

---

## What This Repo Is

A structured, daily SQL problem-solving journal built during my
transition from **9.4 years of BIW Tooling Design** (Tata Motors,
ThyssenKrupp, COMAU) into an **Analytics Engineer** role.

Every solution includes:
- The working SQL query with inline comments
- Time taken to solve (solo, no hints)
- The SQL technique identified and named
- A **Manufacturing Parallel** — how this exact pattern applies
  to supply chain, production, or quality engineering data

This isn't a collection of correct answers.
It's proof of how an engineer thinks through data problems.

---

## Why the Manufacturing Parallel Matters

Most candidates solve the same DataLemur problems with
the same ecommerce or social media context.

I solve them — and then translate each pattern to:
- Supplier qualification pipelines
- Production OEE analysis
- Quality defect rate cohorts
- BOM (Bill of Materials) hierarchy queries
- Procurement funnel analysis

A fresher can copy a correct query.
They cannot copy 9.4 years of operational context.

---

## Repo Structure


sql-practice/
│
├── datalemur/
│   ├── easy/       → Foundation patterns (Weeks 4–8)
│   ├── medium/     → Core interview level (Weeks 9–20)
│   └── hard/       → Senior AE level (Weeks 21+)
│
├── analyst-builder/
│   └── ...         → Course drills parallel to Pauler + Alice Zhao
│
└── sql-patterns/
└── ...         → Personal reference library (1 file per technique)


---

## Progress Tracker

### DataLemur

| Difficulty | Target | Solved | Status |
|---|---|---|---|
| Easy | 30 | 0 | 🔴 Not Started |
| Medium | 40 | 0 | 🔴 Not Started |
| Hard | 20 | 0 | 🔴 Not Started |
| **Total** | **90** | **0** | |

### Analyst Builder

| Topic | Problems | Status |
|---|---|---|
| CTEs | 0 | 🔴 Not Started |
| Window Functions | 0 | 🔴 Not Started |
| Subqueries | 0 | 🔴 Not Started |
| Aggregations | 0 | 🔴 Not Started |
| Joins | 0 | 🔴 Not Started |

### SQL Patterns Library

| Pattern | File | Added |
|---|---|---|
| Window Functions | window-functions.md | ⬜ Pending |
| Recursive CTEs | recursive-cte.md | ⬜ Pending |
| Cohort Analysis | cohort-analysis.md | ⬜ Pending |
| Running Totals | running-totals.md | ⬜ Pending |
| Bucket Aggregation | bucket-aggregation.md | ⬜ Pending |

---

## SQL Techniques Covered So Far

Will be updated as problems are solved.

Phase 1 (Easy — Weeks 4–8):
☐ GROUP BY + COUNT (histogram pattern)
☐ HAVING clause filtering
☐ DATE functions (YEAR, MONTH, DATEDIFF)
☐ CASE WHEN conditional aggregation
☐ Multi-table JOINs (2–3 tables)
☐ Subqueries in FROM clause
☐ NULL handling (COALESCE, IS NULL)

Phase 2 (Medium — Weeks 9–20):
☐ Window functions (ROW_NUMBER, RANK, DENSE_RANK)
☐ LAG / LEAD (period-over-period comparison)
☐ FIRST_VALUE / LAST_VALUE
☐ CTEs (single + chained)
☐ Pivot with CASE WHEN
☐ Running totals / moving averages
☐ Cohort retention analysis

Phase 3 (Hard — Weeks 21+):
☐ Recursive CTEs (hierarchy traversal)
☐ Advanced window frames
☐ Multi-CTE pipelines
☐ Query optimization (EXPLAIN ANALYZE)
☐ Median calculations
☐ Gap and island problems

---

## How I Practice (The Method)

Read the problem on DataLemur or Analyst Builder
Attempt SOLO for 20 minutes — no Google, no Claude, no hints
If solved: note time taken, identify the technique used
If stuck after 20 min: read the hint only (not full solution)
→ Try again for 10 more minutes
Review the official solution — understand WHY mine differs
Rewrite from memory (close everything, blank file, retype)
Add Manufacturing Parallel section
Commit to GitHub

Rule: If I cannot rewrite from memory = I did not learn it yet.
That problem goes into Saturday's re-attempt list.

---

## Saturday Re-Attempt Rule

Every Saturday morning:
- Pick the 3 hardest problems from this week
- Reattempt from scratch — no looking at my own solution
- If still struggling → add technique to sql-patterns library
- This is the highest-ROI 30 minutes of the week

---

## Commit Message Convention


feat: solve [problem name] — [technique]
Example:
feat: solve histogram of tweets — bucket aggregation pattern
fix: correct join type in user transactions query
docs: add window function pattern to sql-patterns library
refactor: rewrite subquery as CTE — same result cleaner code

---

## Connection to Portfolio Projects

The SQL techniques practiced here feed directly into:

| Project | Uses These Techniques |
|---|---|
| **Supply Chain Analytics** (Project 1) | Window functions, rolling averages, ranking |
| **Business Insights 360** (Project 2) | CTEs, cohort analysis, conditional aggregation |
| **Northwind Pipeline** (Project 3) | All of the above + query optimization |

---

## About Me

Transitioning from **9.4 years of manufacturing engineering**
(BIW Tooling Design — Tata Motors, ThyssenKrupp, COMAU)
into an **Analytics Engineer** role.

Currently building:
- SQL (this repo)
- dbt Core (Coursera Specialization)
- Microsoft Fabric (DP-600 in progress)
- Power BI (PL-300 certified)
- Python for Data Engineering (Angela Yu — selective)
