FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# (옵션) 안정적인 종료 신호 처리
RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*

# 여기에서만 pip 사용 (GitHub Actions 내부)
RUN python -m pip install --upgrade pip && \
    pip install pandas psycopg[binary]

WORKDIR /app
ENTRYPOINT ["/usr/bin/tini","--"]
CMD ["python","-c","import pandas as pd; print('pandas', pd.__version__)"]
