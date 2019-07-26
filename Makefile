ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

BIN_DIR=$(ROOT_DIR)/build
VERSION=1.0.1
BUILD=`git rev-parse HEAD`
PLATFORMS=linux windows
ARCHITECTURES=amd64

# Setup linker flags option for build that interoperate with variable names in src code
LDFLAGS=-ldflags "-X main.Version=${VERSION} -X main.Build=${BUILD}"

default: build

all: clean build_all install

build:
	mkdir -p $(BIN_DIR)
	go build -o $(BIN_DIR)/packers pkg/packers/cmd/names-generator/main.go
	go build -o $(BIN_DIR)/docker pkg/docker/cmd/names-generator/main.go
	go build -o $(BIN_DIR)/animals pkg/animals/cmd/names-generator/main.go

build_all:
	mkdir -p $(BIN_DIR)
	$(foreach GOOS, $(PLATFORMS),\
	$(foreach GOARCH, $(ARCHITECTURES), $(shell export GOOS=$(GOOS); export GOARCH=$(GOARCH); go build -v -o $(BIN_DIR)/$(BINARY)-$(GOOS)-$(GOARCH) cmd/automotive/main.go)))

install:
	go install ${LDFLAGS}

# Remove only what we've created
clean:
	rm -rf $(BIN_DIR)

.PHONY: check clean install build_all all
