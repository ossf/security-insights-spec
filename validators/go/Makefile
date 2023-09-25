# Ref: https://www.digitalocean.com/community/tutorials/using-ldflags-to-set-version-information-for-go-applications
PROJECT=si-validator
BUILD_FLAGS=-X 'main.GitCommitHash=`git rev-parse --short HEAD`' -X 'main.BuiltAt=`date +%FT%T%z`' -X 'main.Version=`git describe --tags`'
BUILD_WIN=@env GOOS=windows GOARCH=amd64 go build -o $(PROJECT).exe
BUILD_LINUX=@env GOOS=linux GOARCH=amd64 go build -o $(PROJECT)
BUILD_MAC=@env GOOS=darwin GOARCH=amd64 go build -o $(PROJECT)-darwin

binary: go-tidy go-test go-build
quick: go-build
testcov: go-test go-test-cov
release: go-tidy go-test release-nix release-win release-mac

go-build:
	@echo "  >  Building binary ..."
	go build -o $(PROJECT) -ldflags="$(BUILD_FLAGS)"

go-test:
	@echo "  >  Validating code ..."
	@go vet ./...
	@go test ./...

go-tidy:
	@echo "  >  Tidying go.mod ..."
	@go mod tidy

go-test-cov:
	@echo "Running tests and generating coverage output ..."
	@go test ./... -coverprofile coverage.out -covermode count
	@sleep 2 # Sleeping to allow for coverage.out file to get generated
	@echo "Current test coverage : $(shell go tool cover -func=coverage.out | grep total | grep -Eo '[0-9]+\.[0-9]+') %"

release-candidate: go-tidy go-test
	@echo "  >  Building release candidate for Linux..."
	$(BUILD_LINUX) -ldflags="$(BUILD_FLAGS) -X 'main.VersionPostfix=nix-rc'"
	@echo "  >  Building release candidate for Windows..."
	$(BUILD_WIN) -ldflags="$(BUILD_FLAGS) -X 'main.VersionPostfix=win-rc'"
	@echo "  >  Building release for Darwin..."
	$(BUILD_MAC) -ldflags="$(BUILD_FLAGS) -X 'main.VersionPostfix=darwin'"

release-nix:
	@echo "  >  Building release for Linux..."
	$(BUILD_LINUX) -ldflags="$(BUILD_FLAGS) -X 'main.VersionPostfix=linux'"

release-win:
	@echo "  >  Building release for Windows..."
	$(BUILD_WIN) -ldflags="$(BUILD_FLAGS) -X 'main.VersionPostfix=windows'"

release-mac:
	@echo "  >  Building release for Darwin..."
	$(BUILD_MAC) -ldflags="$(BUILD_FLAGS) -X 'main.VersionPostfix=darwin'"

todo:
	@read -p "Write your todo here: " TODO; \
	echo "- [ ] $$TODO" >> TODO.md