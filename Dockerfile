FROM python:2.7

RUN mkdir -p /app

WORKDIR /app
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt

COPY server.py /app

EXPOSE 8002

CMD ["python", "server.py"]
