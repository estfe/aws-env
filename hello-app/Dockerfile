FROM golang:1.23.4

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod ./
RUN go mod download

COPY . .

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o hello main.go

EXPOSE 8080

# Run the binary
CMD ["./hello"]
