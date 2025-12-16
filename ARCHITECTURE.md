# 🤖 AI Database Chatbot - Architecture

## Overview
A simple AI-powered chatbot that converts natural language questions into SQL queries using **mssql-python** and **Azure OpenAI**.

---

## 🏗️ Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         AI DATABASE CHATBOT                                 │
└─────────────────────────────────────────────────────────────────────────────┘

  👤 USER                    🐍 PYTHON APP                    ☁️ CLOUD
  ──────                    ─────────────                    ─────────

     ❓                                                   ┌──────────────┐
    "Who are                                              │  AZURE SQL   │
     my top              ┌─────────────────┐              │   DATABASE   │
     customers?"         │                 │              └──────┬───────┘
         │               │   YOUR CODE     │                     │
         │               │                 │                     │
         ▼               │   5 Steps:      │                     │
    ┌─────────┐          │                 │                     │
    │ STEP 1  │─────────►│  ① Get Question │                     │
    └─────────┘          │       │         │                     │
                         │       ▼         │     mssql-python    │
                         │  ② Get Schema   │◄────────────────────┤
                         │       │         │                     │
                         │       ▼         │              ┌──────┴───────┐
                         │  ③ Ask AI for   │─────────────►│ AZURE OPENAI │
                         │     SQL Query   │◄─────────────│    (GPT-4)   │
                         │       │         │              └──────┬───────┘
                         │       ▼         │                     │
                         │  ④ Run Query    │◄────────────────────┤
                         │       │         │     mssql-python    │
                         │       ▼         │                     │
                         │  ⑤ Ask AI to    │─────────────────────►
    ┌─────────┐          │     Explain     │◄────────────────────┘
    │ ANSWER  │◄─────────│                 │
    └─────────┘          │                 │
         │               └─────────────────┘
         ▼
    💬 "Your top
    customers are
    Acme Corp..."
```

---

## 📋 The 5 Steps Explained

| Step | What Happens | Who Does It | Tool Used |
|------|--------------|-------------|-----------|
| **①** | User asks a question | User → Python | `input()` |
| **②** | Get database schema (tables, columns) | Python → Database | `mssql-python` |
| **③** | AI generates SQL query | Python → AI | `Azure OpenAI` |
| **④** | Execute the SQL query | Python → Database | `mssql-python` |
| **⑤** | AI formats a friendly response | Python → AI | `Azure OpenAI` |

---

## 🔑 Why Schema Context Matters

```
WITHOUT SCHEMA:                    WITH SCHEMA:
─────────────────                  ──────────────────
AI: "I'll guess the               AI: "I can see you have:
table is 'customers'               - Customers (id, name, email)
with column 'sales'..."            - Orders (id, customer_id, total)
                                   
Result: ❌ May fail                Result: ✅ Accurate SQL!"
```

---

## 🧩 Components Used

| Component | Purpose | Why? |
|-----------|---------|------|
| **mssql-python** | Database connectivity | Fast, native Python driver for Azure SQL |
| **Azure OpenAI** | AI/LLM capabilities | GPT-4 for natural language → SQL |
| **Azure SQL** | Data storage | Cloud database with sample data |

---

## 🚀 Quick Start

```bash
# 1. Activate virtual environment
source venv/bin/activate

# 2. Set your credentials in the notebook

# 3. Run the notebook step by step!
```

---

## 📁 Files in This Demo

```
AzureUGDemo/
├── ARCHITECTURE.md      ← You are here!
├── ai_chatbot_demo.ipynb ← The interactive demo notebook
├── venv/                 ← Python virtual environment
└── requirements.txt      ← Dependencies (optional)
```

---

## 🎯 One-Liner Summary

```
Question → Schema → SQL → Results → Answer
    │         │       │       │        │
   YOU    DATABASE   AI   DATABASE    AI
```

---

## 💡 Key Insight

```
   🧠 AI does the THINKING (SQL generation + explanation)
   ⚡ mssql-python does the SPEED (fast database access)
   
   Together = Magic! ✨
```

---

## 📚 Learn More

- [mssql-python GitHub](https://github.com/microsoft/mssql-python)
- [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/)
- [Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/)

---

*Built for Azure User Group Demo - December 2025*
