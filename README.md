# chronocat-docker

## 使用

```sh
docker run --rm -it -p 16530:16530 -p 6080:80 -p 5901:5901 -e VNC_PASSWD=password he0119/chronocat-docker
```

或使用 docker compose

```sh
docker compose up
```

## 登录

### 使用浏览器连接

在浏览器中打开 [`http://localhost:6080`](http://localhost:6080) 然后输入密码 `password` 登录。

### 使用 VNC Viewer 连接

```sh
vncviewer :1 # 会连接到 127.0.0.1:5901
```

## 调试

启动 QQ 并进入容器：

```sh
docker run --rm -it -p 16530:16530 -p 6080:80 -p 5901:5901 -e VNC_PASSWD=password he0119/chronocat-docker /sbin/my_init -- bash -l
```

只进入容器：

```sh
docker run --rm -it -p 16530:16530 -p 6080:80 -p 5901:5901 -e VNC_PASSWD=password he0119/chronocat-docker bash
```

## 安全

### VNC

VNC 协议本身并不安全，所以不要将容器端口暴露在公网。

## :warning: 免责声明 :warning

本项目仅供学习研究使用。
