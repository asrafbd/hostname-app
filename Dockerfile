FROM golang:1.23.0 AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

RUN go mod init hello-app
# Copy go mod and sum files
COPY *.go ./

# Download all dependencies.
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -o hello-app

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello-app hello-app
# Expose port 8088 to the outside world
EXPOSE 8088

# Command to run the executable
CMD ["/app/hello-app"]
