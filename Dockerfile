# Dockerfile
FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# 파이썬 패키지 설치: pandas, pyarrow, psycopg (binary)
RUN python -m pip install --upgrade pip \
 && pip install "pandas" "pyarrow" "psycopg[binary]" "paramiko"

# 앱 파일 복사 (필요한 파일만)
WORKDIR /app
# 예: 위 3개 스텝 파일을 이미지에 포함하려면 아래처럼 복사
# COPY gen.py add.py load_postgres.py /app/

# 비루트 권장
RUN useradd -ms /bin/bash appuser
USER appuser

CMD ["python", "-c", "print('image ready: import gen, add, load_postgres and call handle(evt)')"]
