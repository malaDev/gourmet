FROM golang:1.13

RUN apt-get update \
    && apt-get install -y libpcap-dev

ADD . /go/src/gourmet
WORKDIR /go/src/gourmet

COPY example_configs/minimal.yml config.yml
RUN make build

ENTRYPOINT ["./bin/gourmet"]
