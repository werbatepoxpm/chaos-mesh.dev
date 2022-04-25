FROM golang:1.18
LABEL org.opencontainers.image.source=https://github.com/STRRL/chaos-mesh.dev

RUN go install github.com/strrl/go/gopages@gopages-support-go-1.18-bypass

RUN mkdir -p /playground
WORKDIR /playground

COPY ./google-analytics-header.html /playground/google-analytics-header.html
COPY ./entry-point.sh /entry-point.sh
ENTRYPOINT ["/entry-point.sh"]
