isuports: test go.mod go.sum *.go cmd/isuports/*
	go build -o isuports ./cmd/isuports

test: vet fmt
	go test -v ./...

.PHONY:vet
vet:
	go vet ./...

.PHONY:fmt
fmt:
	go fmt ./...
