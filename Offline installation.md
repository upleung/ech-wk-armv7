## 📦 离线安装方法 / Offline Installation

如果你的玩客云/设备无法连接外网或无法拉取 Docker 镜像，可以使用离线包进行安装。

### 1. 下载离线包
在 GitHub 的 [**Releases**](https://github.com/upleung/ech-wk-armv7/releases) 页面下载 `ech-wk-armv7.tar` 文件到你的电脑。

### 2. 上传文件
使用 **WinSCP** 或 **MobaXterm** 等工具，将下载好的 `.tar` 文件上传到玩客云的 `/root/` 目录。

### 3. 加载镜像
在玩客云 SSH 终端执行以下命令导入镜像：

```bash
docker load -i /root/ech-wk-armv7.tar

```

当看到 `Loaded image: mcgtekwrt/ech-wk-armv7:latest` 字样时，说明导入成功。

### 4. 启动容器即使断网状态下，现在也可以直接启动了（注意：`-f` 参数后的域名和端口仍需正确填写）：

```bash
docker run -d \
  --name ech-wk \
  --restart always \
  --network host \
  mcgtekwrt/ech-wk-armv7:latest \
  -f "your-domain.workers.dev:443" \
  -token "your-password"
