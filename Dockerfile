FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Set PYTHONPATH
ENV PYTHONPATH=/app/example_web_apps

EXPOSE 8000

# Jalankan Flask pakai Gunicorn (WSGI)
CMD ["gunicorn", "example_web_apps.server:app", "-b", "0.0.0.0:8000"]

