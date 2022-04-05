docker buildx build --push --platform linux/arm64/v8,linux/amd64,linux/arm/v7 -t qmachines/fuse-archive:$(cat VERSION) .
