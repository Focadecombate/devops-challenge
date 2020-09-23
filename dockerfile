FROM ubuntu:latest

WORKDIR /

VOLUME [ ".data:/data" ]

COPY ./ ./

ENTRYPOINT [ "bash", "shutdown.sh" ]


