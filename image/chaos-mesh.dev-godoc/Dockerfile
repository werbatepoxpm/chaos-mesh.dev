# syntax=docker/dockerfile:1
FROM golang:1.17 AS gopages-builder
RUN git clone https://github.com/strrl/go && \
        cd go/gopages && \
        go build -o /gopages main.go 

FROM golang:1.17
LABEL org.opencontainers.image.source=https://github.com/STRRL/chaos-mesh.dev

# RUN go install github.com/johnstarich/go/gopages@v0.1.8
COPY --from=gopages-builder /gopages /usr/bin/gopages
# RUN go install golang.org/x/tools/...@latest

RUN mkdir -p /playground
WORKDIR /playground

COPY ./entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
