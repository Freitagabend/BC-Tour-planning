FROM python:3.10-slim

WORKDIR /workspace/backend

COPY backend/requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
