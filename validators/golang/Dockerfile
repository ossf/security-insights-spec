FROM golang:1.21-bullseye

WORKDIR /app

COPY . .

RUN go build

RUN ln --symbolic /app/security-insights-validator /usr/bin/si-validator 