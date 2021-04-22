FROM golang:1.16.3-alpine3.13 as build

WORKDIR /src/
COPY /hello_world/ /src/
RUN CGO_ENABLED=0 go build -o /bin/hello_world

FROM scratch
COPY --from=build /bin/hello_world /bin/hello_world
ENTRYPOINT [ "/bin/hello_world" ]