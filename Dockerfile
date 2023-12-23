# Etapa de compilação
FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Etapa final
FROM scratch
COPY --from=builder /app/main .
CMD ["./main"]
