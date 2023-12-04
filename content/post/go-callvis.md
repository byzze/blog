---
author: "Byzze"
title: "Go-callvis Go代码调用链路可视化工具"
date: "2023-05-04"
description: "Go-callvis工具使用教程"
tags:
- markdown
- text
---
[go-callvis](https://github.com/ofabry/go-callvis)
与链路追踪（Tracing）不同，Tracing主要关注复杂的是分布式环境中各个服务节点间的调用关系，主要用于服务治理。而我们本次探索的代码调用链路则是代码方法级别的调用关系，主要用于代码设计。
可视化工具可以将代码间的调用关系通过图表的方式展示出来，如下图:
**来自go-callvis工具**
![](images/go-callvis/command-line.png)
## 示例
```Go
package main

import (
	"flag"
	"log"
	"math/rand"
	"os"
	"runtime/pprof"
)

var cpuprofile = flag.Bool("cpu", false, "write cpu profile to file")
var memprofile = flag.Bool("mem", false, "write cpu profile to file")

func main() {
	flag.Parse()
	// 创建cpu分析文件
	if *cpuprofile {
		f, err := os.Create("./main-cpu.prof")
		if err != nil {
			log.Fatal(err)
		}
		pprof.StartCPUProfile(f)
		defer pprof.StopCPUProfile()
	}

	SimulationAlloc()
	// 创建内存分析文件,放在后面才能采集到内存分配信息
	if *memprofile {
		f, err := os.Create("./main-mem.prof")
		if err != nil {
			log.Fatal(err)
		}
		pprof.WriteHeapProfile(f)
		f.Close()
	}
}

// SimulationAlloc 模拟分配内存
func SimulationAlloc() string {
	s := ""
	for i := 0; i < 100; i++ {
		for j := 0; j < 10; j++ {
			s += randomString(1000)
		}
	}
	return s
}

const letterBytes = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

func randomString(n int) string {
	b := make([]byte, n)
	for i := range b {
		b[i] = letterBytes[rand.Intn(len(letterBytes))]
	}
	return string(b)
}
```
```
执行命令会出现host地址,浏览器打开即可显示
go-callvis main.go 
不显示标准库
go-callvis -nostb main.go 
指定package
go-callvis /pacpage 
指定test package
go-callvis -tests /pacpage 
```
## Options
```
Usage of go-callvis:
  -debug
        开启详细日志
    	Enable verbose log.
  -file string
        输出文件名，省略使用服务模型
    	output filename - omit to use server mode
  -cacheDir string
        启用缓存以避免不必要的重现
    	Enable caching to avoid unnecessary re-rendering.
  -focus string
        使用指定报名或导入路径 (默认 "main")
    	Focus specific package using name or import path. (default "main")
  -format string
        输出文件格式[svg | png | jpg | ...] (默认 "svg")
    	output file format [svg | png | jpg | ...] (default "svg")
  -graphviz
        使用Graphviz dot 程序渲染图片
    	Use Graphviz's dot program to render images.
  -group string
        按包和/或类型 [pkg, type] 对函数进行分组（以逗号分隔）（默认为 "pkg"）
    	Grouping functions by packages and/or types [pkg, type] (separated by comma) (default "pkg")
  -http string
        HTTP 服务地址 （默认 ":7878"）
    	HTTP service address. (default ":7878")
  -ignore string
        忽略包含给定前缀的包路径（以逗号分隔）
    	Ignore package paths containing given prefixes (separated by comma)
  -include string
        包含具有给定前缀的包路径（以逗号分隔）
    	Include package paths with given prefixes (separated by comma)
  -limit string
        将包路径限制为给定前缀（以逗号分隔）
    	Limit package paths to given prefixes (separated by comma)
  -minlen uint
        最小边缘长度（用于更宽的输出）。(默认 2)
    	Minimum edge length (for wider output). (default 2)
  -nodesep float
        同一等级中两个相邻节点之间的最小空间（用于更高的输出）。
    	Minimum space between two adjacent nodes in the same rank (for taller output). (default 0.35)
  -nointer
        省略对未导出函数的调用。
    	Omit calls to unexported functions.
  -nostd
        省略对标准库中包的调用/来自包的调用。
    	Omit calls to/from packages in standard library.
  -rankdir
        图形布局的方向 [LR | RL | TB | BT] (默认 "LR")
        Direction of graph layout [LR | RL | TB | BT] (default "LR")
  -skipbrowser
        跳过打开浏览器。
    	Skip opening browser.
  -tags build tags
        在构建过程中考虑满足的构建标签列表。有关构建标签的更多信息，请参阅 go/build 包文档中构建约束的描述
    	a list of build tags to consider satisfied during the build. For more information about build tags, see the description of build constraints in the documentation for the go/build package
  -tests
        包括测试代码。
    	Include test code.
  -version
        显示版本并退出。
    	Show version and exit.
```
