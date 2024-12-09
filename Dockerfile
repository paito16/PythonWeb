FROM python:3.12-slim

WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir flask==2.2.2 werkzeug==2.2.3
EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
