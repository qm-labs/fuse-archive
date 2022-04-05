FROM debian:bullseye as builder

RUN apt-get update && apt-get install -yqq g++ libarchive-dev libfuse-dev build-essential pkg-config

WORKDIR /project

COPY . /project

RUN g++ -O3 src/main.cc `pkg-config libarchive fuse --cflags --libs` -o fuse-archive

FROM alpine:3
COPY --from=builder /project/fuse-archive /
