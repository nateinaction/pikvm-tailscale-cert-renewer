GOLANGCI_LINT_VERSION := v1.59

.PHONY: lint
lint:
	docker run --rm -t \
		-v $(shell pwd):/app \
		-v ~/.cache/golangci-lint/$(GOLANGCI_LINT_VERSION):/root/.cache \
		-w /app \
		golangci/golangci-lint:$(GOLANGCI_LINT_VERSION) golangci-lint run

.PHONY: fmt
fmt:
	docker run --rm -t \
		-v $(shell pwd):/app \
		-v ~/.cache/golangci-lint/$(GOLANGCI_LINT_VERSION):/root/.cache \
		-w /app \
		golangci/golangci-lint:$(GOLANGCI_LINT_VERSION) golangci-lint run --fix
