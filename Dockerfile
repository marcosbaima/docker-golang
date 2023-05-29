FROM golang:1.7.4-alpine3.5 as build 

WORKDIR /app 

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -o api

FROM scratch 

WORKDIR /app 

COPY --from=build /app /app 

CMD ["./api"]