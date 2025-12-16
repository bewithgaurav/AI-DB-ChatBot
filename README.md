# 🤖 AI Database Chatbot Demo

> Presented at **Azure SQL User Group Meetup** - December 2024

A demo showcasing **mssql-python** (Microsoft's native Python driver for SQL Server) combined with **Azure OpenAI** to build an AI-powered database chatbot.

---

## 📁 Demo Materials

| File | Description |
|------|-------------|
| `ARCHITECTURE.md` | Visual architecture diagram and workflow explanation |
| `ai_chatbot_demo.ipynb` | Interactive notebook: Natural Language → SQL using GPT-4 |
| `mssql_python_basics.ipynb` | Getting started with mssql-python - native Python objects |
| `setup_demo_data.sql` | SQL script to set up sample data in Azure SQL |

---

## 🎯 What This Demo Shows

### 5-Step AI Chatbot Workflow

```
Question → Schema → SQL → Results → Answer
    │         │       │       │        │
   YOU    DATABASE   AI   DATABASE    AI
```

1. **User asks a question** - "Who are my top customers?"
2. **Get database schema** - mssql-python fetches table/column info
3. **AI generates SQL** - GPT-4 writes the query with schema context
4. **Execute query** - mssql-python runs it and returns results
5. **AI explains results** - GPT-4 formats a friendly response

---

## 💡 Key Highlights

- ✅ **Native Python types** - mssql-python returns `datetime`, `Decimal`, `UUID` directly
- ✅ **No ODBC required** - Pure Python driver using TDS protocol
- ✅ **Fast performance** - See `performance_benchmark.ipynb` for comparisons
- ✅ **Azure SQL ready** - Works seamlessly with Azure SQL Database

---

## 🚀 Quick Start

```bash
# 1. Create virtual environment
python -m venv venv
source venv/bin/activate  # macOS/Linux
# or: venv\Scripts\activate  # Windows

# 2. Install dependencies
pip install mssql-python openai python-dotenv

# 3. Create .env file with your credentials
cat > .env << 'ENVEOF'
AZURE_OPENAI_KEY=your-azure-openai-key
AZURE_OPENAI_ENDPOINT=https://your-resource.openai.azure.com/
SQL_PASSWORD=your-sql-password
ENVEOF

# 4. Launch Jupyter
jupyter notebook
```

---

## 🧩 Components Used

| Component | Purpose |
|-----------|---------|
| **[mssql-python](https://github.com/microsoft/mssql-python)** | Native Python driver for SQL Server |
| **Azure OpenAI (GPT-4)** | Natural language → SQL translation |
| **Azure SQL Database** | Cloud database with sample data |

---

## 📚 Learn More

- [mssql-python GitHub](https://github.com/microsoft/mssql-python)
- [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/)
- [Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/)

---

## 🔑 One-Liner Summary

```
🧠 AI does the THINKING (SQL generation + explanation)
⚡ mssql-python does the SPEED (fast database access)

Together = Magic! ✨
```

---

*Built for Azure SQL User Group Demo - December 2024*
