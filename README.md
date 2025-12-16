# 🐳 ECH-Workers for ARMv7 (OneCloud/玩客云)

![Docker Image Size](https://img.shields.io/docker/image-size/mcgtekwrt/ech-wk-armv7/latest)
![Architecture](https://img.shields.io/badge/arch-armv7--32bit-blue)
![Docker Pulls](https://img.shields.io/docker/pulls/mcgtekwrt/ech-wk-armv7)

专为 **玩客云 (OneCloud)** 及其他 **ARMv7 (32位)** 架构设备编译的 [ECH-Workers](https://github.com/byJoey/ech-wk) Docker 镜像。
让闲置的电视盒子或老旧开发板变身网络加速节点。

---

## ✅ 适用设备 / Supported Devices

本镜像采用静态编译，理论上支持所有 **Linux ARMv7l (32-bit)** 系统：

* 🔌 **玩客云 (OneCloud)** - (推荐刷入 Armbian 系统)
* 🍓 **树莓派 (Raspberry Pi)** - 2B / 3B / 3B+ / 4B (运行 32位 系统时)
* 📺 **电视盒子/机顶盒** - 如斐讯 N1 (32位系统), 移动 R3300L 等 Amlogic S905/S805 设备
* 🍌 **其他开发板** - Orange Pi (香橙派), Banana Pi, ASUS Tinker Board 等

---

## ⬇️ 拉取镜像 / Installation

在你的 SSH 终端执行以下命令拉取最新镜像：

```bash
docker pull mcgtekwrt/ech-wk-armv7:latest

```

---

## 🚀 启动命令 / Usage建议使用 `host` 网络模式，以获得最佳性能并避免端口映射的麻烦。

### 🖥️ CLI 命令行启动请将下方的 `你的域名` 和 `你的密码` 替换为你实际的 Cloudflare Workers 信息：

```bash
docker run -d \
  --name ech-wk \
  --restart always \
  --network host \
  mcgtekwrt/ech-wk-armv7:latest \
  -f "your-domain.workers.dev:443" \
  -token "your-password"

```

### ⚙️ 参数说明| 参数 | 说明 | 示例 |
| --- | --- | --- |
| `-f` | **(必填)** 你的 Workers 域名，建议加上端口 | `abc.test.workers.dev:443` |
| `-token` | **(选填)** 如果脚本设置了密码，请填写 | `mypassword123` |
| `-l` | **(可选)** 监听地址和端口，默认为 `0.0.0.0:30000` | `0.0.0.0:1080` |

---

## 📱 客户端连接教程 / Client Setup启动成功后，该程序本质上是一个 **SOCKS5 代理**。
假设你的玩客云/盒子 IP 地址是 `192.168.1.100`，默认端口是 `30000`。

### 💻 Windows / Mac 电脑使用推荐使用 **v2rayN** (Win) 或 **v2rayU** (Mac)：

1. 添加服务器 -> 选择 **Socks** 类型。
2. **地址(address)**: 填入盒子的 IP (如 `192.168.1.100`)。
3. **端口(port)**: 填入 `30000` (如果你没改过的话)。
4. **用户/密码**: 留空 (除非你在启动参数里另有设置)。

### 📱 Android / iOS 手机使用推荐使用 **v2rayNG** (安卓) 或 **Shadowrocket / Stash** (iOS)：

1. 添加节点 -> 类型选择 **Socks5**。
2. **服务器**: 填入盒子的局域网 IP (如 `192.168.1.100`)。
3. **端口**: `30000`。
4. 保存并选中该节点，开启开关即可。

> **提示**：手机和盒子必须连接在同一个路由器的 WiFi (局域网) 下才能连接。

---

## 🔗 鸣谢 / Credits* 核心代码来源: [byJoey/ech-wk](https://github.com/byJoey/ech-wk)
* OpenWrt 插件支持: [SunshineList/luci-app-ech-workers](https://github.com/SunshineList/luci-app-ech-workers)
