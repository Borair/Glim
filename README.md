# Glim

> 本仓库是 [yeduk3/Glim](https://github.com/yeduk3/Glim) 的个人派生版本（derivative work），并非从零原创项目。  
> This repository is a personal derivative of [yeduk3/Glim](https://github.com/yeduk3/Glim), not a project created from scratch.

Glim 是一个原生 macOS Markdown 浏览与编辑应用，基于 SwiftUI 构建，支持渲染与编辑视图、文件夹侧边栏、Quick Look 预览与离线 LaTeX 数学公式。

## Origin & attribution / 来源与署名

- **Original project / 原项目：** [yeduk3/Glim](https://github.com/yeduk3/Glim)
- **Original author / 原作者：** yeduk3
- **License / 许可证：** [MIT](LICENSE) © 2026 yeduk3

本仓库保留原项目的许可证与版权声明。若你使用、分发或继续修改此代码，请同时保留这些声明。

## Changes in this repository / 此仓库的改动

在上游 Glim v1.3.2 的基础上，本仓库目前包含以下本地改动：

- 更专注的 Markdown 写作界面（focus mode）
- 命令面板（command palette）
- HTML 导出功能

这些功能是对原项目的增量修改；核心应用架构和大部分功能仍来自上游项目。

## Upstream capabilities / 上游功能

- 原生 macOS Markdown View / Edit 模式
- 文件夹浏览、同目录标签页与 Finder Quick Look 预览
- GitHub 风格 Markdown 渲染、代码高亮与离线 KaTeX
- SwiftUI + WebKit 实现，目标系统为 macOS 14+

有关完整功能说明、上游发布版本及安装文档，请访问 [yeduk3/Glim](https://github.com/yeduk3/Glim)。

## Build locally / 本地构建

要求：macOS 14+、Xcode 15+、[XcodeGen](https://github.com/yonaskolb/XcodeGen)。

```bash
git clone https://github.com/Borair/Glim.git
cd Glim
./build.sh
```

如需安装到本机，可运行：

```bash
./install.sh
```

> 构建与安装脚本来自上游项目；请先阅读脚本内容，并按自己的开发与签名环境配置。

## Credits / 致谢

- [yeduk3/Glim](https://github.com/yeduk3/Glim) — original project and primary implementation
- [sbarex/QLMarkdown](https://github.com/sbarex/QLMarkdown) — reference for the Quick Look implementation
- [markdown-it](https://github.com/markdown-it/markdown-it), [KaTeX](https://katex.org), [highlight.js](https://highlightjs.org), and [markdown-it-texmath](https://github.com/goessner/markdown-it-texmath)

## License

This derivative repository remains available under the [MIT License](LICENSE). Copyright © 2026 yeduk3.
