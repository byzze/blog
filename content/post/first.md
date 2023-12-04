---
title: "博客网站"
date: 2022-11-11T16:20:35+08:00
---

## 第一个博客网站

## 下载hugo

- 确保已经安装了`go`语言环境
- 在终端执行命令`go install github.com/gohugoio/hugo@latest`
- 安装成功
- ![`安装成功`](images/hugo-1.png)

## 创建网站，引入主题

```text

mkdir ~/hugo
cd ~/hugo
hugo new site blog
cd blog 
git submodule add <https://github.com/WingLim/hugo-tania> themes/hugo-tania
```

## 步骤 git submodule 执行失败两点问题**

1. https请求修改为项目的git@请求
2. 在个人github创建对应仓库 blog ，初始化，push相关操作
参考地址：<https://themes.gohugo.io/themes/hugo-tania/>

## 启动服务

```text
hugo server
```

访问地址 `http://localhost:1313/`

## 部署github

<https://www.gohugo.org/>

```text
hugo 
cd public
git init
git remote add origin https://github.com/username/username.github.io.git
git add -A
git commit -m "first commit"
git push -u origin master
```

若https的github不能正常访问，改用git@github.com:username/username.github.io.git
