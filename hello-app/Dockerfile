FROM golang:1.23.4

# Set destination for COPY
WORKDIR /app

COPY *.go ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build 

EXPOSE 8080
