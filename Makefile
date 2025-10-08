# Set up environment
setup:
	@lefthook install
	@echo "✅ Environment ready"

# Generate Go code from Protocol Buffer files
gen-proto:
	protoc --go_out=. --go-grpc_out=. pkg/pb/order.proto

# CI Build discarding artefacts
check-build:
	@echo ⏳ "Building..."
	@go build -v -o /dev/null ./...
	@echo "✅ Building complete"

.PHONY: setup gen-proto check-build