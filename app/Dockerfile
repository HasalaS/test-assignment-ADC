FROM python:3.11-slim

WORKDIR /app

COPY adc.py .
COPY gandalf.jpg .
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD ["uvicorn", "adc:app", "--host", "0.0.0.0", "--port", "80"]
