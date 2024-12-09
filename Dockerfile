FROM python:3.12-slim

WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir flask==2.2.2
EXPOSE 5000

CMD [ "python", "app.py" ]
