# 阶段一：构建环境 (使用 Go 编译源码)
FROM golang:alpine AS builder

# 设置工作目录
WORKDIR /app

# 安装 git
RUN apk add --no-cache git

# 拉取源码
# 如果你在国内网络环境构建失败，可能需要配置 GOPROXY，下面这行被注释的是备用：
# ENV GOPROXY=https://goproxy.cn,direct
RUN git clone https://github.com/byJoey/ech-wk.git .

# 初始化依赖
RUN go mod init ech-wk 2>/dev/null || true
RUN go mod tidy

# 核心步骤：交叉编译设置
# 强制告诉编译器我们要生成的是 linux/arm/v7 (玩客云架构) 的程序
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=arm
ENV GOARM=7

# 编译
RUN go build -ldflags="-s -w" -o ech-workers ech-workers.go

# 阶段二：最终镜像 (Alpine)
FROM alpine:latest

WORKDIR /app
RUN apk add --no-cache ca-certificates tzdata

# 从第一阶段复制编译好的文件
COPY --from=builder /app/ech-workers .

# 赋予执行权限
RUN chmod +x ech-workers

# 端口和启动命令
EXPOSE 30000
ENTRYPOINT ["./ech-workers"]
CMD ["-l", "0.0.0.0:30000"]
