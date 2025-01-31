FROM golang:alpine AS builder
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk update && apk --no-cache add build-base
WORKDIR /go/src/github.com/zjyl1994/livetv/
COPY . . 
RUN GOPROXY="https://goproxy.io" GO111MODULE=on go build -o livetv .

FROM alpine:latest
RUN apk --no-cache add ca-certificates python3 tzdata libc6-compat libgcc libstdc++
ADD youtube-dl /usr/bin/
ADD youtube_dl.tar.gz /usr/lib/python3.10/site-packages/
WORKDIR /root
COPY --from=builder /go/src/github.com/zjyl1994/livetv/view ./view
COPY --from=builder /go/src/github.com/zjyl1994/livetv/assert ./assert
COPY --from=builder /go/src/github.com/zjyl1994/livetv/.env .
COPY --from=builder /go/src/github.com/zjyl1994/livetv/livetv .
EXPOSE 9000
VOLUME ["/root/data"]
CMD ["./livetv"]
