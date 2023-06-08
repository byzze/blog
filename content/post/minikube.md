---
title: Minikube 安装过程
date: 2023-01-13
description: "记录安装过程"
categories:
- math
katex: true
---
## 安装kubectl

[在 Linux 系统中安装并设置 kubectl | Kubernetes](https://kubernetes.io/zh-cn/docs/tasks/tools/install-kubectl-linux/)

## 安装minikube

官方教程:[minikube start | minikube (k8s.io)](https://minikube.sigs.k8s.io/docs/start/)
简书教程：`https://www.jianshu.com/p/2eb952ffe89b`
使用国内镜像:[Minikube 一键开启国内镜像加速 (xintech.co)](https://blog.xintech.co/minikube-yi-jian-kai-qi-guo-nei-jing-xiang-jia-su/)

启动命令

```text
minikube start --driver=docker --container-runtime=containerd --image-mirror-country=cn

# 国外服务器
minikube start

# 使用阿里云版本时，指定国内源
minikube start --image-mirror-country=cn

# 使用阿里云版本时，指定镜像源
minikube start --image-mirror=registry.cn-hangzhou.aliyuncs.com/google_containers
```

```text
Minikube 一键开启国内镜像加速:https://blog.xintech.co/minikube-yi-jian-kai-qi-guo-nei-jing-xiang-jia-su/
Minikube didnt start:https://github.com/kubernetes/minikube/issues/14477
minikube轻松搭建一个:https://colobu.com/2022/06/02/setup-a-k8s-cluster-with-minikube/
```

创建镜像使用阿里云，官方教程拉取会失败
Kubernetes 环境搭建：<https://www.cnblogs.com/cjsblog/p/11877014.html>
指定镜像启动pod：`kubectl create deployment hello-minikube --image=registry.cn-hangzhou.aliyuncs.com/google_containers/echoserver:1.10`
查看插件：`minikube addons list`
使用某个插件：`minikube addons enable ingress`

## 安装docker

官网安装：<https://docs.docker.com/engine/install/ubuntu/>
[Install Docker Desktop on Ubuntu | Docker Documentation](https://docs.docker.com/desktop/install/ubuntu/)

[如何在Ubuntu上安装使用Docker - 腾讯云开发者社区-腾讯云 (tencent.com)](https://cloud.tencent.com/developer/article/1167995#:~:text=%E5%A6%82%E4%BD%95%E5%9C%A8Ubuntu%E4%B8%8A%E5%AE%89%E8%A3%85%E4%BD%BF%E7%94%A8Docker%201%20%E4%BB%8B%E7%BB%8D%202%20%E5%87%86%E5%A4%87%203%20%E7%AC%AC1%E6%AD%A5%20-,7%20%E7%AC%AC5%E6%AD%A5%20-%20%E8%BF%90%E8%A1%8CDocker%E5%AE%B9%E5%99%A8.%E6%88%91%E4%BB%AC%E5%AE%89%E8%A3%85Node....%208%20%E7%AC%AC6%E6%AD%A5%20-%20%E7%AE%A1%E7%90%86Docker%E5%AE%B9%E5%99%A8.)

wsl 启动命令`sudo service docker start`
