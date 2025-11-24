FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Flask butuh WSGI, bukan ASGI
EXPOSE 8000

ENV PYTHONPATH=/app/example_web_apps

CMD ["gunicorn", "example_web_apps.server:app", "-b", "0.0.0.0:8000"]
