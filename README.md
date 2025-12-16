# 🐳 ECH-Workers for ARMv7 (OneCloud/玩客云)

![Docker Image Size](https://img.shields.io/docker/image-size/mcgtekwrt/ech-wk-armv7/latest)
![Architecture](https://img.shields.io/badge/arch-armv7--32bit-blue)
![Docker Pulls](https://img.shields.io/docker/pulls/mcgtekwrt/ech-wk-armv7)
<br>

专为 **玩客云 (OneCloud)** 及其他 **ARMv7 (32位)** 架构设备编译的 [ECH-Workers](https://github.com/byJoey/ech-wk) Docker 镜像。
<br>
让闲置的电视盒子或老旧开发板变身网络神器。

---

## ✅ 适用设备 / Supported Devices

本镜像采用静态编译，理论上支持所有 **Linux ARMv7l (32-bit)** 系统：

* 🔌 **玩客云 (OneCloud)** - (推荐刷入 Armbian 系统)
* 🍓 **树莓派 (Raspberry Pi)** - 2B / 3B / 3B+ / 4B (运行 32位 系统时)
* 📺 **电视盒子/机顶盒** - 如斐讯 N1 (32位系统), 移动 R3300L 等 Amlogic S905/S805 设备
* 🍌 **其他开发板** - Orange Pi (香橙派), Banana Pi, ASUS Tinker Board 等

<br>

---

## ⬇️ 拉取镜像 / Installation

在你的 SSH 终端执行以下命令拉取最新镜像：

```bash
docker pull mcgtekwrt/ech-wk-armv7:latest

```

---

## 🚀 启动命令 / Advanced Usage

可自定义优选 IP、分流模式，请使用以下完整命令：

### 🖥️ 完整参数启动 (Full Options)

```bash
docker run -d \
  --name ech-wk \
  --restart always \
  --network host \
  mcgtekwrt/ech-wk-armv7:latest \
  -f "your-domain.workers.dev:443"   # 填写你的workers域名和端口
  -token "your-token"                 # 你设置的token
  -ech "cloudflare-ech.com"           # ech查询域名，一般保持默认
  -ip "visa.com"                      # 优选IP或域名
  -l "0.0.0.0:30000"                  # Socks5服务器的IP和端口，0.0.0.0为全局监听
  -routing "global"                # 分流模式，global=全局代理 bypass_cn=绕过大陆

```

### ⚙️ 详细参数说明

|**参数**|**说明**|**默认值**|**示例**|
|---|---|---|---|
|`-f`|**(必填)** Workers 域名 (建议加:443)|-|`abc.workers.dev:443`|
|`-token`|**(必填)** 认证 Token/密码|空|`password123`|
|`-l`|**(选填)** 本地监听地址|`0.0.0.0:30000`|`0.0.0.0:1080`|
|`-ip`|**(选填)** 优选 IP 或域名 (CF CDN)|空|`visa.com` 或 `104.16.x.x`|
|`-routing`|**(选填)** 分流模式 (`global` / `bypass_cn`)|`global`|`bypass_cn`|
|`-ech`|**(选填)** ECH 查询域名|`cloudflare-ech.com`|-|

---

<br>

## 📱 客户端连接教程 / Client Setup
启动成功后，该程序本质上是一个 **SOCKS5 代理**。
假设你的玩客云/盒子 IP 地址是 `192.168.1.100`，默认端口是 `30000`。

<br>

### 💻 Windows / Mac 电脑使用
推荐使用 **v2rayN** (Win) 或 **v2rayU** (Mac)：

1. 添加服务器 -> 选择 **Socks** 类型。
2. **地址(address)**: 填入盒子的 IP (如 `192.168.1.100`)。
3. **端口(port)**: 填入 `30000` (如果你没改过的话)。
4. **用户/密码**: 留空 (除非你在启动参数里另有设置)。

<br>

### 📱 Android / iOS 手机使用
推荐使用 **v2rayNG** (安卓) 或 **Shadowrocket / Stash** (iOS)：

1. 添加节点 -> 类型选择 **Socks5**。
2. **服务器**: 填入盒子的局域网 IP (如 `192.168.1.100`)。
3. **端口**: `30000`。
4. 保存并选中该节点，开启开关即可。

> **提示**：手机和盒子必须连接在同一个路由器的 WiFi (局域网) 下才能连接。

---

## 📦 离线安装方法 / [**Offline Installation**](https://github.com/upleung/ech-wk-armv7/blob/main/Offline%20installation.md)

如果你的玩客云/设备无法连接外网或无法拉取 Docker 镜像，可以使用离线包进行安装。

## 🔗 鸣谢 / Credits
* 核心代码来源: [byJoey/ech-wk](https://github.com/byJoey/ech-wk)
* OpenWrt 插件支持: [SunshineList/luci-app-ech-workers](https://github.com/SunshineList/luci-app-ech-workers)
