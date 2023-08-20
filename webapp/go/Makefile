isuports: test go.mod go.sum *.go cmd/isuports/*
	go build -o isuports ./cmd/isuports

test: tidy fmt vet
	go test -v ./...

.PHONY:vet
vet:
	go vet ./...

.PHONY:fmt
fmt:
	go fmt ./...

.PHONY:tidy
tidy:
	go mod tidy
