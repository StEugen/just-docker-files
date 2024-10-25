FROM golang:1.20 AS builder
WORKDIR /app
RUN git clone https://github.com/OJ/gobuster.git .
RUN go mod download && go build -o /gobuster

FROM debian:bullseye-slim
COPY --from=builder /gobuster /usr/local/bin/gobuster
ENTRYPOINT ["gobuster"]
CMD ["-h"]

