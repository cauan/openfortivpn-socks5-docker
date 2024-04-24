FROM alpine as builder

WORKDIR /src

RUN apk update
RUN apk add alpine-sdk openssl-dev git automake autoconf

RUN git clone --depth 1 https://github.com/adrienverge/openfortivpn

WORKDIR /src/openfortivpn

RUN ./autogen.sh

RUN ./configure && make


FROM alpine

COPY --from=builder /src/openfortivpn/openfortivpn /usr/bin/

RUN apk update && apk add ppp openssh-server openssh-client

# Test tool
RUN apk add curl bind-tools

WORKDIR /
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
