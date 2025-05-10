# Dockerfile

# 1) Base image: Python + pip included
FROM python:3.11-slim

# 2) System deps for audio/ML
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg gcc libsndfile1 && \
    rm -rf /var/lib/apt/lists/*

# 3) Set working dir
WORKDIR /app

# 4) Install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5) Copy app code
COPY . .

# 6) Expose port & run with Gunicorn
EXPOSE 8000
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]
