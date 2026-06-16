# nkthesis：南开大学硕士博士毕业论文 LaTeX 模板（2026）

![version 2026.6.0](https://img.shields.io/badge/version-2026.6.0-blue)
![license-LPPL-1.3c](https://img.shields.io/github/license/alumik/nkthesis)

`nkthesis` 是南开大学硕士、博士学位论文 LaTeX 模板，符合《研究生学位论文写作规范（2026版）》，目前支持中文论文。

如果你刚开始接触 LaTeX，建议先不要急着理解所有命令。先让示例论文成功编译，再把示例中的个人信息、摘要、正文和参考文献逐步替换成自己的内容。

> [!CAUTION]
> 本模板仅支持 TeX Live 2025 及以上版本，且需要使用 XeLaTeX 编译。

> [!TIP]
> 如果您觉得本模板好用，请点一个免费的 Star ⭐，让更多的人看到本项目，谢谢！

![](https://pic1.imgdb.cn/item/6a30f58d6f828650a6e61ac1.png)

## 模板下载

可以从 [Release](https://github.com/alumik/nkthesis/releases/latest) 下载最新版。

| 文件 | 用途 |
| --- | --- |
| `nkthesis.cls` | 模板类文件。写论文时必须和主 `.tex` 文件放在一起，或放在 TeX 能找到的位置。 |
| `nkthesis-sample.pdf` | 示例论文编译后的效果。 |
| `nkthesis.pdf` | 完整使用说明。 |

本仓库还包含模板源码 `nkthesis.dtx`。如果你只是写论文，不需要理解或修改它。

## 快速开始

### 1. 准备环境

安装 TeX Live 2025 或更新版本。Windows、macOS、Linux 都可以使用；在线平台如 Overleaf 也可以使用，但需要注意字体文件问题。

确认使用的是 XeLaTeX。不要用 pdfLaTeX 编译本模板。

### 2. 下载模板

推荐做法：

1. 到 [Release](https://github.com/alumik/nkthesis/releases/latest) 下载最新版 `nkthesis.cls`。
2. 把 `nkthesis.cls` 和仓库中的所有文件放到论文文件夹。
3. 先不要改太多内容，直接编译示例文件 `nkthesis-sample.tex`，确认环境没有问题。

如果想从源码生成 `nkthesis.cls`，可以在仓库目录运行：

```bash
l3build unpack
```

生成的类文件位于 `build/unpacked/nkthesis.cls`。

### 3. 编译示例

仓库已经提供 `latexmkrc`，所以通常运行下面这条命令即可：

```bash
latexmk nkthesis-sample.tex
```

成功后会得到 `nkthesis-sample.pdf`。

## 字体问题

在 Windows 系统中，由于模板使用的字体文件已经存在，因此不需要额外放置字体文件就可以直接编译本模板。

如果在 Overleaf、Linux、macOS 或其他环境中看到类似下面的错误：

```text
Package fontspec Error:
(fontspec) The font "simsun" cannot be found
```

请在论文文件夹下创建 `fonts/` 文件夹，并放入需要的字体文件。常见需要的文件包括：

| 字体 | 文件 |
| --- | --- |
| 中易宋体、仿宋、黑体、楷体 | `simsun.ttc`、`simfang.ttf`、`simhei.ttf`、`simkai.ttf` |
| Times New Roman | `times.ttf`、`timesbd.ttf`、`timesi.ttf`、`timesbi.ttf` |
| Arial | `arial.ttf`、`arialbd.ttf`、`ariali.ttf`、`arialbi.ttf` |

这些字体多为非开源字体，本模板不附带。一般情况下，这些字体文件可以在 Windows 系统的 `C:\Windows\Fonts` 目录下找到。

## 写论文时该改哪里

第一次使用时，最推荐的路线是修改 `nkthesis-sample.tex`：

1. 在 `\nktset{...}` 中填写论文题目、作者、导师、学院、专业、答辩日期等基本信息。
2. 在 `\addbibresource{...}` 中指定你的参考文献 `.bib` 文件。
3. 在 `frontmatter/` 中写摘要、关键词、前言、符号说明等前置内容。
4. 在 `mainmatter/` 中写正文各章。
5. 在 `backmatter/` 中写附录、致谢和个人简历。

示例文件的大致结构如下：

```latex
\documentclass[headingmode=2]{nkthesis}

\nktset{
  论文题目（中文） = {你的中文题目},
  论文题目（英文） = {Your English Title},
  论文作者 = {你的姓名},
  指导教师 = {导师姓名},
  培养单位 = {你的学院},
}

\addbibresource{thesis.bib}

\begin{document}

\titlepage
\declarationpage
\authorizationpage

\frontmatter
\input{frontmatter/abstract}
\tableofcontents

\mainmatter
\input{mainmatter/chapter1}

\backmatter
\bibliographypage
\input{backmatter/acknowledgements}

\end{document}
```

上面的例子只展示了骨架。完整字段和完整论文结构请参考 `nkthesis.pdf`。

## 模板选项

```LaTeX
\documentclass[<模板选项>]{nkthesis}
```

本模板提供了以下选项，可以作为参数传入 `\documentclass` 命令中。

| 参数 | 默认值 | 说明 |
| --- | --- | --- |
| `headingmode` | `2` | 章节标题编号模式。`headingmode=1` 表示使用数字编号模式，`headingmode=2` 表示使用中文编号模式。 |
| `uppercasehead` | `false` | 当该选项存在或设置为真时，将页眉转换为全大写。否则，保留原始大小写。 |
| `openright` | `false` | 当该选项存在或设置为真时，强制章节从右页开始（符合双面打印规范）。否则，允许章节从左页开始。 |
| `frontmatterintoc` | `false` | 当该选项存在或设置为真时，前置部分（如摘要、前言等）会被添加到目录中。否则，前置部分不会出现在目录中。 |

## 详细使用说明

[Release](https://github.com/alumik/nkthesis/releases/latest) 中的 `nkthesis.pdf` 文件包含了模板的详细使用说明。

## 获取帮助

- 发现代码问题、格式错误或编译 BUG：请创建 [Issue](https://github.com/alumik/nkthesis/issues)。
- 咨询使用方法或提出建议：请到 [Discussions](https://github.com/alumik/nkthesis/discussions)。
- 查看常见问题：[常见问题及解答](https://github.com/alumik/nkthesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98%E5%8F%8A%E8%A7%A3%E7%AD%94)。
- 查看已知问题：[已知问题或 BUG](https://github.com/alumik/nkthesis/wiki/%E5%B7%B2%E7%9F%A5%E9%97%AE%E9%A2%98%E6%88%96-BUG)。

## 相关项目

南开大学硕博毕业论文模板的其他历史实现：

- [NewFuture/NKThesis](https://github.com/NewFuture/NKThesis)
- [qianchd/NKU_thesis_graduate](https://github.com/qianchd/NKU_thesis_graduate)
- [MCG-NKU/NKU-Thesis](https://github.com/MCG-NKU/NKU-Thesis)
- [benhaotang/NKThesis](https://github.com/benhaotang/NKThesis)
