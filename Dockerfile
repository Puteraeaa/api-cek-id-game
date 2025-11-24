FROM python:3.11-slim

# 1. Workdir
WORKDIR /app

# 2. Copy requirements & install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 3. Copy semua source code
COPY . .

# 4. Set PYTHONPATH seperti di vercel.json
ENV PYTHONPATH=/app/example_web_apps

# 5. Expose port
EXPOSE 8000

# 6. Jalankan server
# Asumsi di example_web_apps/server.py ada variable FastAPI/Starlette bernama "app"
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
