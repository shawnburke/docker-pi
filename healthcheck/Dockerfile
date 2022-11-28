FROM golang:1.19-alpine

WORKDIR /app

COPY *.go .
EXPOSE 8080

ENTRYPOINT ["go", "run", "/app/main.go"]


