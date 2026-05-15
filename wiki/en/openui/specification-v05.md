---
title: "OpenUI Lang Specification v0.5"
aliases: ["openui-spec", "openui-lang-spec", "openui-specification"]
tags: [openui, openui-lang, spec, specification, v0.5]
category: reference
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, architecture, system-prompts]
status: active
---

# OpenUI Lang Specification v0.5

> The latest official language spec for OpenUI Lang. Includes reactive state, data fetching, and actions.

**Official Docs**: [https://www.openui.com/docs/openui-lang/specification-v05](https://www.openui.com/docs/openui-lang/specification-v05)
**Official Spec Mirror**: [https://openuispec.org/spec](https://openuispec.org/spec)

---

## Overview

OpenUI Lang v0.5 extends v0.1 with features for **interactive, data-driven apps**. Where v0.1 focused on static UI generation, v0.5 adds reactive state and server data integration.

---

## Basic Syntax

### Assignment Statements

Every statement is a single assignment of the form `identifier = Expression`.

```
# Basic component assignment
title = Text("Hello, World!", "h1")
container = Stack([title, content], "column", "m")
```

### Positional Arguments

Component props are passed as positional arguments following the Zod schema key order.

```
# Stack(children, direction, gap) — Zod schema order
stack = Stack([child1, child2], "row", "l")

# Input(label, type, required)
email = Input("Email", "email", true)
```

---

## Core Features

### State (Reactive State)

Declare reactive state variables with the `$variable` prefix.

```
$selectedCategory = "All"
$searchQuery = ""

# State variables can be used directly in components
filter = Select($selectedCategory, ["All", "Tech", "Business"])
search = Input($searchQuery, "search")
```

When a state value changes, connected queries **automatically re-execute**.

### Data (Data Fetching)

Integrate server data with queries and mutations.

**Query (read)**:
```
# Query filtered by category and search term
posts = @Query("getPosts", { category: $selectedCategory, q: $searchQuery })
postList = List(posts.data, PostCard)
```

**Mutation (write)**:
```
# Only executes when @Run(mutation) is triggered inside an Action
createPost = @Mutation("createPost")
```

Mutation characteristics:
- Does not execute automatically on load
- Only executes when triggered by `@Run(mutation)`
- Remaining Action steps are skipped on failure

### Actions

Sequences of behaviors reacting to user events.

```
submitAction = @Action([
  @Set($isLoading, true),
  @Run(createPost, { title: $title, content: $content }),
  @Set($isLoading, false),
  @Navigate("/posts"),
])

submitButton = Button("Publish", submitAction, $isLoading)
```

---

## Example

Reactive search interface:

```
# State declarations
$query = ""
$results = []

# UI composition
searchBox = Input($query, "search", false)
resultList = List(@Query("search", { q: $query }).data, ResultCard)

# search query auto-re-executes whenever $query changes
layout = Stack([searchBox, resultList], "column", "l")
```

---

## v0.1 → v0.5 Key Changes

| Feature | v0.1 | v0.5 |
|---------|------|------|
| State management | None | `$variable` reactive state |
| Data fetching | None | `@Query`, `@Mutation` |
| Event handling | None | `@Action`, `@Run`, `@Set`, `@Navigate` |
| UI interactivity | Static | Fully interactive |

---

## Links & Integration

- [[OpenUI Overview]] — The pipeline that uses this spec
- [[OpenUI Architecture]] — How the Parser parses this spec
- [System Prompts](system-prompts.md) — How spec content is included in prompts

---

## References

- [Official Docs: v0.5 Specification](https://www.openui.com/docs/openui-lang/specification-v05) (2026-05-15)
- [Official Spec Mirror: openuispec.org](https://openuispec.org/spec) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
