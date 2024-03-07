FROM golang:latest AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod tidy
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main ./learn

# Start from a small base image
FROM alpine:latest  
COPY --from=builder /app/main .
CMD ["./main"]