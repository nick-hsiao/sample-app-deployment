FROM golang:1.18
WORKDIR /git/sample-app-deployment

COPY cli ./cli

RUN CGO_ENABLED=0 GOOS=linux go install ./cli/server

FROM alpine:latest
WORKDIR /app/

COPY --from=0 /go/bin/server ./binary

CMD ./binary