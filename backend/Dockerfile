FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o backend .

FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/backend .
EXPOSE 9000
CMD ["./backend"]
