FROM python:3.12.2-alpine3.19

RUN apk update && \
    apk add --no-cache bash gcc musl-dev linux-headers

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN ls -al /app

ENTRYPOINT ["./docker-local-entrypoint.sh"]

# CMD [ "python", "app.py" ]
