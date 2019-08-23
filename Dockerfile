FROM library/golang:1.12.5-alpine as build

ENV GO111MODULE on

WORKDIR /src
COPY main.go ./.

RUN apk add --no-cache git \
  && go mod init caddy \
  && go get github.com/caddyserver/caddy \
  && go build \
  && mkdir /out \
  && ./caddy -version \
  && cp caddy /out/caddy

FROM library/alpine:3.7 as main

RUN apk add --no-cache --update ca-certificates

COPY --from=build /out/caddy /usr/local/bin/caddy

EXPOSE 80 443 2015
ENTRYPOINT ["/usr/local/bin/caddy"]
CMD ["-agree", "-conf", "/var/lib/caddy/Caddyfile"]

