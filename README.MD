# OpenWRT 定时重拨（定时网络重拨）

Luci App ，网页端操作，带网络重启后自检

编译方式

拷贝到 ``package`` 目录

运行 make menuconfig

选择该插件

然后

``make package/luci-app-autorewan/compile V=99``

文件在bin中寻

你也可以在[Releases](https://github.com/kongfl888/luci-app-autorewan/releases) 里找到ipk文件下载并安装进你的openwrt。但你的机器不一定能用。（能装上就能用）
