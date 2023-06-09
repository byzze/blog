---
title: Wireshark入门
date: 2023-05-24
description: "Wireshark入门"
categories:
- math
katex: true
---
# 入门记录

使用https无法抓取请求：https://blog.51cto.com/u_15672212/5383275
使用教程：https://www.cnblogs.com/mq0036/p/11187138.html
## 数据包详细信息
<!-- ![图片alt](图片链接 "图片title") -->
![数据表详细信息](images/wireshark/2013050217125736394.png)
## TCP包详细信息
![数据表详细信息](images/wireshark/2013050217125787134.png)
## Wireshark 存在两种过滤器
1）抓包过滤器
2）显示过滤器

## 使用过滤器加上过滤字段提取我们想要数据
![提取数据](images/wireshark/774327-20181216163607973-642074591.png)

TCP三次握手
![TCP三次握手](images/wireshark/2013050217125714223.png)

## icmp
互联网控制消息协议（英语：Internet Control Message Protocol，缩写：ICMP）是互联网协议族的核心协议之一。它用于网际协议（IP）中发送控制消息，提供可能发生在通信环境中的各种问题反馈。通过这些信息，使管理者可以对所发生的问题作出诊断，然后采取适当的措施解决。

ICMP [1]依靠IP来完成它的任务，它是IP的主要部分。它与传输协议（如TCP和UDP）显著不同：它一般不用于在两点间传输数据。它通常不由网络程序直接使用，除了 ping 和 traceroute 这两个特别的例子。 IPv4中的ICMP被称作ICMPv4，IPv6中的ICMP则被称作ICMPv6。
## 小结
使用抓包分析，可以了解到网络连接的详细过程