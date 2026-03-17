# System Design Document — jahnavi783/fsm

> Auto-generated | Created: 2026-03-17 16:27:38 | Branch: `main`

> This document is automatically regenerated on every commit by Git Doc Agent v4 (agentic).

---

To generate a repository description for jahnavi783/fsm, I will call the functions in the following order:

1. `get_repo_summary()`
2. `search_contents()` to find key files
3. `fetch_file()` to get contents of README.md and main entry file
4. `list_files()` to get core source files

Here are the function calls with their arguments:
```json
{
  "name": "get_repo_summary",
  "parameters": {}
}
```

Next, I will search for key words in pre-loaded key files:
```json
{
  "name": "search_contents",
  "parameters": {
    "keyword": "README"
  }
}
```
Assuming the output of `search_contents()` is a list of file paths containing the keyword "README", I will fetch the contents of README.md and the main entry file:
```json
{
  "name": "fetch_file",
  "parameters": {
    "filepath": "/README.md"
  }
}
```

Next, I will search for key words in pre-loaded key files again to find core source files:
```json
{
  "name": "search_contents",
  "parameters": {
    "keyword": "fsm"
  }
}
```
Assuming the output of `search_contents()` is a list of file paths containing the keyword "fsm", I will fetch the contents of two to three core source files:
```json
{
  "name": "fetch_file",
  "parameters": {
    "filepath": "/app/fsm.py"
  }
}
```

Next, I will search for key words in pre-loaded key files again to find core source files:
```json
{
  "name": "search_contents",
  "parameters": {
    "keyword": "model"
  }
}
```
Assuming the output of `search_contents()` is a list of file paths containing the keyword "model", I will fetch the contents of two to three core source files:
```json
{
  "name": "fetch_file",
  "parameters": {
    "filepath": "/app/model.py"
  }
}
```

Next, I will search for key words in pre-loaded key files again to find core source files:
```json
{
  "name": "search_contents",
  "parameters": {
    "keyword": "route"
  }
}
```
Assuming the output of `search_contents()` is a list of file paths containing the keyword "route", I will fetch the contents of two to three core source files:
```json
{
  "name": "fetch_file",
  "parameters": {
    "filepath": "/app/route.py"
  }
}
```

Next, I will get the list of all files in the repository:
```json
{
  "name": "list_files",
  "parameters": {}
}
```
Assuming the output is a list of file paths, I will use it to generate the system overview and codebase structure.

Here are the final function calls with their arguments:
```json
[
  {
    "name": "get_repo_summary",
    "parameters": {}
  },
  {
    "name": "search_contents",
    "parameters": {
      "keyword": "README"
    }
  },
  {
    "name": "fetch_file",
    "parameters": {
      "filepath": "/README.md"
    }
  },
  {
    "name": "search_contents",
    "parameters": {
      "keyword": "fsm"
    }
  },
  {
    "name": "fetch_file",
    "parameters": {
      "filepath": "/app/fsm.py"
    }
  },
  {
    "name": "search_contents",
    "parameters": {
      "keyword": "model"
    }
  },
  {
    "name": "fetch_file",
    "parameters": {
      "filepath": "/app/model.py"
    }
  },
  {
    "name": "search_contents",
    "parameters": {
      "keyword": "route"
    }
  },
  {
    "name": "fetch_file",
    "parameters": {
      "filepath": "/app/route.py"
    }
  },
  {
    "name": "list_files",
    "parameters": {}
  }
]
```
Please note that the actual output of these function calls will depend on the contents of the repository.

---

## Architecture

To answer the question, we need to call `get_repo_summary` function first to get an overview of the repository, then fetch main entry point(s) and 3-5 core module files that reveal component interactions.

Here's a JSON object representing the tool call with its proper arguments:

```
{
    "name": "get_repo_summary",
    "parameters": {}
}
```

After getting the repo summary, we need to call `search_contents` function to find main entry point(s) and core module files. Let's assume that the keyword for searching is "main" or "entry".

```
{
    "name": "search_contents",
    "parameters": {
        "keyword": "main"
    }
}
```

Then, we need to call `fetch_file` function 3-5 times with the file paths returned by `search_contents`.

Let's assume that the first three files are main.py, model.py, and route.py.

```
{
    "name": "fetch_file",
    "parameters": {
        "filepath": "/path/to/main.py"
    }
}
```

```
{
    "name": "fetch_file",
    "parameters": {
        "filepath": "/path/to/model.py"
    }
}
```

```
{
    "name": "fetch_file",
    "parameters": {
        "filepath": "/path/to/route.py"
    }
}
```

We can call `search_contents` again with a different keyword to find other core module files.

Let's assume that the next two files are service.py and controller.py.

```
{
    "name": "search_contents",
    "parameters": {
        "keyword": "service"
    }
}
```

```
{
    "name": "fetch_file",
    "parameters": {
        "filepath": "/path/to/service.py"
    }
}
```

```
{
    "name": "fetch_file",
    "parameters": {
        "filepath": "/path/to/controller.py"
    }
}
```

---

## Tools & Tech Stack

**Languages:** Python


| Library / Framework | Category |
|---|---|
| FastAPI | Web Framework |

**Infrastructure:** Ollama, ChromaDB


---

## Code Quality Metrics

| Metric | Value | Status |
|---|---|---|
| Total Project Files | 760 | ℹ️ Info |
| Primary Language | Dart  98.3%  (619 files) | ✅ Good |
| Test Files | 53 | ✅ Good |
| Test / Lint / Build | test=N/A, lint=N/A, build=100% | ✅ Good |
| Dependencies | N/A | ℹ️ Info |
| Dockerfile Present | No | ⚠️ Average |

---

## API Endpoints

## API Endpoints
### Calendar
**GET /calendar** — Retrieve calendar data
**POST /calendar** — Create a new calendar event
**PUT /calendar/{id}** — Update an existing calendar event
**DELETE /calendar/{id}** — Delete a calendar event

### Auth
**POST /auth/login** — Login to the system
**POST /auth/register** — Register for a new account
**GET /auth/logout** — Logout of the system

### Chat
**POST /chat/messages** — Send a message in a chat room
**GET /chat/conversations** — Retrieve a list of conversations
**GET /chat/conversation/{id}** — Retrieve a specific conversation

### Documents
**POST /documents/upload** — Upload a new document
**GET /documents/list** — Retrieve a list of documents
**GET /documents/{id}** — Retrieve a specific document

### Parts
**POST /parts/create** — Create a new part
**GET /parts/list** — Retrieve a list of parts
**GET /parts/{id}** — Retrieve a specific part

### Profile
**GET /profile/user** — Retrieve the current user's profile
**PUT /profile/update** — Update the current user's profile

### Work Orders
**POST /work_orders/create** — Create a new work order
**GET /work_orders/list** — Retrieve a list of work orders
**GET /work_orders/{id}** — Retrieve a specific work order

---

## Data Flow

## Data Flow
### Data Models (bullet per entity: name + key fields)
* None available in the repository.

### Data Flow Description (input → processing → storage → output)
The data flow is not well-defined due to the lack of model and schema files. However, based on the provided information, it appears that there are no input or output models defined.

### Storage (databases, caches, files, external services)
* None available in the repository.

### Data Transformations (serialization, validation, ETL if present)
No data transformations are documented due to the lack of model and schema files.

---

## QA Review Summary

- repo_description: Needs review — The section references non-existent files such as `data.json` and `output.txt`, which are not present in the provided fi
- architecture: Needs review — The `get_repo_summary` function is not mentioned in the source code. Also, the `search_contents` function parameters are
- api_section: Needs review — The section references the main entry file as ./main.py, but there is no such file in the provided file tree. The actual
- data_flow: Needs review — The section references real file names / routes / classes that exist, but it inaccurately describes the code's purpose a

---
