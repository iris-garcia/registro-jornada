# Use the alpine version of golang which is way smaller.
FROM golang:1.13

# Create the project's directory under the default GOPATH
RUN mkdir -p /go/src/github.com/iris-garcia/workday/.cache

# Use this directory as working directory
WORKDIR /go/src/github.com/iris-garcia/workday

# Copy the needed files to build the project (using .dockerignore to ignore unneeded)
COPY . /go/src/github.com/iris-garcia/workday

# Install our build tool Mage
RUN go get github.com/magefile/mage

# Run the build stage
RUN mage build

# Expose the PORT defined as environment variable
EXPOSE 8080

# Run the startapi stage
CMD ["mage", "startapi"]
