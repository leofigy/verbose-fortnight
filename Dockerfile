# Go build
FROM golang

WORKDIR /front
COPY front/ .

RUN GOARCH=wasm GOOS=js go build -o app.wasm

WORKDIR /app
COPY app/ .

RUN mkdir -p web
RUN mv /front/app.wasm /app/web/app.wasm

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# final container  
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /service
COPY --from=0 /app/app .
CMD ["./app"]