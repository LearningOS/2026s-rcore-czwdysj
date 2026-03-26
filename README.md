# rCore-Tutorial-Code
# rCore 教程代码

## Code
## 代码

- [Soure Code of labs](https://github.com/LearningOS/rCore-Tutorial-Code)
- [实验源码](https://github.com/LearningOS/rCore-Tutorial-Code)

## Documents
## 文档

- Concise Manual: [rCore-Tutorial-Guide](https://LearningOS.github.io/rCore-Tutorial-Guide/)
- 简明手册：[rCore 教程指南](https://LearningOS.github.io/rCore-Tutorial-Guide/)

- Detail Book [rCore-Tutorial-Book-v3](https://rcore-os.github.io/rCore-Tutorial-Book-v3/)
- 详细书籍 [rCore 教程第三版](https://rcore-os.github.io/rCore-Tutorial-Book-v3/)

## OS API docs of rCore Tutorial Code
## rCore 教程代码的 OS API 文档

- [OS API docs of ch1](https://learningos.github.io/rCore-Tutorial-Code/ch1/os/index.html)
  AND [OS API docs of ch2](https://learningos.github.io/rCore-Tutorial-Code/ch2/os/index.html)
- [第一章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch1/os/index.html)
  以及 [第二章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch2/os/index.html)
- [OS API docs of ch3](https://learningos.github.io/rCore-Tutorial-Code/ch3/os/index.html)
  AND [OS API docs of ch4](https://learningos.github.io/rCore-Tutorial-Code/ch4/os/index.html)
- [第三章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch3/os/index.html)
  以及 [第四章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch4/os/index.html)
- [OS API docs of ch5](https://learningos.github.io/rCore-Tutorial-Code/ch5/os/index.html)
  AND [OS API docs of ch6](https://learningos.github.io/rCore-Tutorial-Code/ch6/os/index.html)
- [第五章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch5/os/index.html)
  以及 [第六章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch6/os/index.html)
- [OS API docs of ch7](https://learningos.github.io/rCore-Tutorial-Code/ch7/os/index.html)
  AND [OS API docs of ch8](https://learningos.github.io/rCore-Tutorial-Code/ch8/os/index.html)
- [第七章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch7/os/index.html)
  以及 [第八章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch8/os/index.html)
- [OS API docs of ch9](https://learningos.github.io/rCore-Tutorial-Code/ch9/os/index.html)
- [第九章 OS API 文档](https://learningos.github.io/rCore-Tutorial-Code/ch9/os/index.html)

## Related Resources
## 相关资源

- [Learning Resource](https://github.com/LearningOS/rust-based-os-comp2025/blob/main/relatedinfo.md)
- [学习资源](https://github.com/LearningOS/rust-based-os-comp2025/blob/main/relatedinfo.md)

## Setup
## 环境搭建

```bash
$ git clone https://github.com/LearningOS/2026s-rcore-[YOUR_USER_NAME].git
$ cd 2026s-rcore-[YOUR_USER_NAME]
```

## Build & Run
## 编译与运行

```bash
# setup build&run environment first
# 首先搭建编译与运行环境
$ git clone https://github.com/LearningOS/rCore-Tutorial-Test.git user
$ git checkout ch$ID
$ cd os
# run OS in ch$ID
# 在第 $ID 章运行 OS
$ make run
```

If you want to use docker to build and run, you can use the following command:
如果你想使用 Docker 进行编译和运行，可以使用以下命令：
```bash
# After clone the `rCore-Tutorial-Test` repository to your local machine, you can use the following command to build and run:
# 在将 `rCore-Tutorial-Test` 仓库克隆到本地机器后，可以使用以下命令进行编译和运行：
$ make build_docker
$ make docker
```

If you experience network issues when accessing foreign resources such as GitHub in Docker, you can follow the following suggestions according to your stage:
如果你在 Docker 中访问 GitHub 等国外资源时遇到网络问题，可以根据你所处的阶段参考以下建议：

- Docker pull:
- Docker 拉取镜像：
  1. use proxy: https://docs.docker.com/reference/cli/docker/image/pull/#proxy-configuration
  1. 使用代理：https://docs.docker.com/reference/cli/docker/image/pull/#proxy-configuration

  2. use available domestic source (self-search)
  2. 使用可用的国内镜像源（自行搜索）

- Docker build: use proxy https://docs.docker.com/engine/cli/proxy/#build-with-a-proxy-configuration
- Docker 构建：使用代理 https://docs.docker.com/engine/cli/proxy/#build-with-a-proxy-configuration

- Docker run: use proxy option, related operations are similar to `Docker build`, can refer to the relevant materials by yourself
- Docker 运行：使用代理选项，相关操作与 `Docker build` 类似，可以自行参考相关资料


Notice: $ID is from [1-9]
注意：$ID 的范围是 [1-9]

## Grading
## 评分

```bash
# setup build&run environment first
# 首先搭建编译与运行环境
$ rm -rf ci-user
$ git clone https://github.com/LearningOS/rCore-Tutorial-Checker.git ci-user
$ git clone https://github.com/LearningOS/rCore-Tutorial-Test.git ci-user/user
$ git checkout ch$ID
# check&grade OS in ch$ID with more tests
# 在第 $ID 章通过更多测试来检查和评分 OS
$ cd ci-user && make test CHAPTER=$ID
```

Notice: $ID is from [3,4,5,6,8]
注意：$ID 的范围是 [3,4,5,6,8]
