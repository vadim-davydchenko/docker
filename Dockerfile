FROM golang:alpine as build
WORKDIR /go/bin
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build

FROM scratch
COPY --from=build /go/bin/docker-demo-2 ./
EXPOSE 9000
ENTRYPOINT [ "./docker-demo-2" ]