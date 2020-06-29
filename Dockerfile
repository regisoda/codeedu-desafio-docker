FROM golang:1.14.4-alpine as build
WORKDIR /app
COPY hello.go app/
RUN go build -o ./app/main ./app/hello.go

FROM scratch
COPY --from=build /app .
CMD [ "/app/main"]
