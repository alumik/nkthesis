# nkthesis：南开大学硕士/博士毕业（学位）论文模板（2026）

![version 3.0.0](https://img.shields.io/badge/version-3.0.0-blue)
![license-LPPL-1.3c](https://img.shields.io/github/license/alumik/nkthesis)

> [!CAUTION]
> 本模板仅支持 TeX Live 2025 及以上版本。

> [!TIP]
> 如果您觉得本模板好用，请点一个免费的 Star ⭐，让更多的人看到本项目，谢谢！

nkthesis 是一个全新编写的南开大学硕士/博士毕业（学位）论文 LaTeX 模板，符合《研究生学位论文写作规范（2026 版）》要求，支持 XeLaTeX 编译。

本模板主要特点如下：

1. 使用 LaTeX3 接口编写。
2. 符合《研究生学位论文写作规范（2026版）》。目前仅支持中文论文。
3. 支持本地与在线（Overleaf 等）编译。仅支持使用 XeLaTeX 编译。
4. 可按需添加需要的字体，保证不同平台编译结果的一致性。
5. 实现了中文和数字两种标题编号样式。
6. 提供了完善的中英文摘要、关键词、前言、符号说明、致谢和个人简历等环境，以及题名页、匿名评阅封面、原创性声明、使用授权书和参考文献等特殊页面。

📦[Release](https://github.com/alumik/nkthesis/releases/latest) 中可下载最新版本的模板类文件和使用说明：

- `nkthesis.cls`：导出完毕的模板类文件，可直接使用。
- `nkthesis-sample.pdf`：由 `nkthesis-sample.tex` 生成的 PDF 文件，包含模板预览和写作规范。
- `nkthesis.pdf`：由 `nkthesis.dtx` 生成的 PDF 文件，包含详细的模板使用说明。

如果发现了代码 BUG，格式错误等问题，请创建 🎯[Issue](https://github.com/alumik/nkthesis/issues)。

如果想咨询使用方法，提出改进建议等，请到 💬[Discussions](https://github.com/alumik/nkthesis/discussions) 中创建新的讨论。

常见问题及解答可在 ❓[常见问题](https://github.com/alumik/nkthesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98) 中查看。

![](https://pic1.imgdb.cn/item/697b4b34bb08ad63f9c7b02e.png)

## 01 简明教程

### 1.1 下载并安装 `nkthesis`

1. 将本模板所有文件克隆/下载到本地。
2. 获取 `nkthesis.cls` 文件。
    以下两种方法可任选**其一**：
    - 方法一：从 [Release](https://github.com/alumik/nkthesis/releases/latest) 中下载最新版本的 `nkthesis.cls` 文件，放入论文文件夹中。
    - 方法二：从 `nkthesis.dtx` 文件中提取 `nkthesis.cls` 文件。

      ```
      l3build unpack
      ```

      该命令会在 `build/unpacked` 目录下生成 `nkthesis.cls` 文件。可将该文件拷贝到论文文件夹中。

3. 使用 XeLaTeX 编译 `nkthesis-sample.tex` 文件。
   本模板已经提供了 `latexmkrc` 配置文件，使用 `latexmk` 命令编译时会自动调用 XeLaTeX。

    ```
    latexmk nkthesis-sample.tex
    ```

    如果编译时出现如下所示的缺少字体错误，请参考下一节解决。

    ```
    Package fontspec Error:
    (fontspec) The font "simsun" cannot be found; this may be but
    (fontspec) usually is not a fontspec bug. Either there is a
    (fontspec) typo in the font name/file, the font is not
    (fontspec) installed (correctly), or there is a bug in the
    (fontspec) underlying font loading engine (XeTeX/luaotfload).
    ```

### 1.2 可选步骤：放置字体文件

本模板使用的“宋体”、“仿宋”、“楷书”、“黑体”字体文件为 Microsoft Windows 系统自带的中易字体。
此外，还使用了 Times New Roman 和 Arial 等非开源字体。
在 Windows 系统中，由于这些字体文件已经存在，因此不需要额外放置字体文件就可以直接编译本模板。
但在 Overleaf 等其他非 Windows 环境下，可能会缺少这些字体文件。

本模板不附带非开源字体。
缺少字体文件时，用户需要手动将以下字体文件放置在论文文件夹下的 `fonts/` 文件夹中。

> [!NOTE]
> 需要先创建 `fonts/` 文件夹（本模板的 `.gitignore` 已配置忽略此文件夹，以避免提交非开源字体）。

- 中易字体：`simsun.ttc`、`simfang.ttf`、`simhei.ttf`、`simkai.ttf`
- Times New Roman 字体：`times.ttf`、`timesbd.ttf`、`timesi.ttf`、`timesbi.ttf`
- Arial 字体：`arial.ttf`、`arialbd.ttf`、`ariali.ttf`、`arialbi.ttf`

一般情况下，这些字体文件可以在 Windows 系统的 `C:\Windows\Fonts` 目录下找到。

### 1.3 可选步骤：构建说明文档

如果你想构建本模板的说明文档，可以参照以下步骤：

1. 将本仓库所有文件克隆/下载到本地。
2. 确保本地有 `zhmakeindex` 可执行文件。
   可以从[这里](https://github.com/leo-liu/zhmakeindex/releases/latest)下载，并放置于模板文件夹或系统 `Path` 环境变量中。
3. 在模板文件夹下执行

    ```
    l3build doc
    ```

    即可在目录下生成 `nkthesis.pdf` 与 `nkthesis-sample.pdf` 文件，即模板的说明文档与示例文档。

## 02 详细使用说明

### 2.1 使用 nkthesis 文档类

```LaTeX
\documentclass[<文档类选项>]{nkthesis}
```

本模板提供了以下文档类选项，可以作为可选参数传入 `\documentclass` 命令中。

| 参数            | 默认值 | 说明                                                                                                    |
| --------------- | ------ | ------------------------------------------------------------------------------------------------------- |
| `headingmode`   | 2      | 标题编号模式（数字/中文）。`headingmode=1` 表示使用数字编号模式，`headingmode=2` 表示使用中文编号模式。 |
| `uppercasehead` |        | 当该选项存在时，将章节页眉转换为全大写。否则，保留原始大小写。                                          |
| `openright`     |        | 当该选项存在时，强制章节从右页开始。否则，允许章节从左页开始。                                          |

### 2.2 设置和读取论文基本信息

#### 2.2.1 设置论文基本信息

`\nktset {⟨键值列表⟩}` 用来设置论文基本信息。
`\nktset` 的参数是一组由逗号分隔的选项列表，以通用的接口完成各项设置。
列表中的选项通常是一个 `⟨key⟩=⟨value⟩` 格式的定义。
如果值内部含有逗号，需要使用大括号包裹逗号。

`\nktset` 采用 LaTeX3 风格的键值设置，支持不同类型的选项与层次化的选项设置。
可配置的论文基本信息条目如下：

```LaTeX
\nktset{
    中图分类号 = {},
    学校代码 = 10055,
    UDC = {},
    题名页/密级 = {},
    题名页/论文类别 = 硕士,  % 可选项：硕士/博士/硕士专业/博士专业
    作者信息/论文类别 = 硕士,  % 可选项：学术博士/专业学位博士/学术硕士/专业学位硕士/同等学力硕士
    题名页/论文题目字号 = 2,  % 字号默认为2，可根据标题长度适当调整（数值越大字号越小，最大支持二号字）
    论文题目（中文） = {},
    论文副标题 = {},
    论文题目（英文） = {},
    论文作者 = {},
    指导教师 = {},
    指导教师职称 = {},
    申请学位 = {},
    培养单位 = {},
    一级学科 = {},
    二级学科 = {},
    研究方向 = {},
    答辩委员会主席 = {},
    评阅人 = {},
    论文完成时间 = {},
    论文编号 = {},
    非公开论文/申请密级 = 公开,  % 申请密级（可选项：公开/限制/秘密/机密）
    非公开论文/保密期限/起始日期 = {},
    非公开论文/保密期限/结束日期 = {},
    非公开论文/审批表编号 = {},
    非公开论文/批准日期 = {},
    原创性声明/签字日期 = {},
    授权书/签字日期 = {},
    学号 = {},
    答辩日期 = {},  % 格式为\textbf{20}~XX\textbf{年}XX\textbf{月}XX\textbf{日}，注意其中的空格和字体加粗
    联系电话 = {},
    电子邮箱 = {},
    通讯地址 = {},
    作者信息/备注 = {},
}
```

#### 2.2.2 获取论文基本信息

`\nktget {⟨键名⟩}` 用来获取论文基本信息。
以下是获取学校代码的示例：

```LaTeX
\nktget{学校代码}
```

### 2.3 论文结构

本文档类提供了多个自定义环境和自定义页面。

#### 2.3.1 模板提供的自定义环境

自定义环境可以通过以下方式使用，以在文中插入相应页面。

```LaTeX
\begin{环境名称}
    % 环境内容
\end{环境名称}
```

| 环境名称           | 用途                                                   |
| ------------------ | ------------------------------------------------------ |
| `abstract`         | 中文摘要                                               |
| `enabstract`       | 英文摘要                                               |
| `keywords`         | 中文关键词                                             |
| `enkeywords`       | 英文关键词                                             |
| `preface`          | 前言                                                   |
| `symabbr`          | 符号和缩略语说明                                       |
| `acknowledgements` | 致谢                                                   |
| `resume`           | 个人简历、在学期间发表的学术论文及研究成果             |
| `resume*`          | 在学期间发表的学术论文及研究成果（用于匿名评阅版论文） |

#### 2.3.2 模板提供的自定义页面

使用以下命令可以在文中插入相应页面。

| 命令                  | 用途                                       |
| --------------------- | ------------------------------------------ |
| `\titlepage`          | 题名页                                     |
| `\anonymoustitlepage` | 匿名评阅封面                               |
| `\declarationpage`    | 学位论文原创性声明和非公开学位论文标注说明 |
| `\authorizationpage`  | 学位论文使用授权书                         |
| `\bibliographypage`   | 参考文献                                   |

#### 2.3.3 整体结构

论文结构可以参考 `nkthesis-sample.tex` 文件中的内容。
论文可以分为四个部分，即封面材料、前置部分（frontmatter）、主体部分（mainmatter）和后置部分（backmatter）。
推荐的整体结构如下：

```LaTeX
\begin{document}

% 以下页面可根据需要（匿名/非匿名等）选择使用
\titlepage % （非匿名）题名页
\anonymoustitlepage % 匿名评阅封面
\declarationpage
\authorizationpage

\frontmatter

\begin{abstract}
    中文摘要。
\end{abstract}

\begin{keywords}
    中文关键词。
\end{keywords}

\begin{enabstract}
    英文摘要。
\end{enabstract}

\begin{enkeywords}
    英文关键词。
\end{enkeywords}

\begin{preface}
    序言或前言。
\end{preface}

\tableofcontents
\listoffigures
\listoftables

\begin{symabbr}
    符号、标志、缩略语等的注释表。
\end{symabbr}

\mainmatter

\chapter{章标题}
章内容。
\section{节标题}
节内容。
\subsection{小节标题}
小节内容。
\subsubsection{小小节标题}
小小节内容。

\backmatter

\bibliographypage

\appendix

\chapter{附录标题}
附录内容。

\begin{acknowledgements}
    致谢。
\end{acknowledgements}

% 以下页面可根据需要（匿名/非匿名等）选择使用
\begin{resume}
    个人简历。
\end{resume}

\begin{resume*}
    （匿名）个人简历。
\end{resume*}

\end{document}
```

### 2.4 排版格式设定

#### 2.4.1 字体字号

正文中文默认使用小四号宋体，英文默认使用12磅 Times New Roman。

本模板还支持以下字体：

| 字体        | 命令          |
| ----------- | ------------- |
| 宋体        | `\songti`     |
| 黑体        | `\heiti`      |
| 仿宋        | `\fangsong`   |
| 楷书        | `\kaishu`     |
| Arial       | `\arial`      |
| DejaVu Sans | `\dejavusans` |

切换字体字号命令的使用示例如下。最外侧的大括号可以限制字体设置的作用范围。

```LaTeX
{\heiti{}\zihao{3}这是黑体三号字}
{\songti{}\zihao{-4}这是宋体小四号字}
{\fangsong{}\zihao{12}这是仿宋12磅字}
{\kaishu{}\zihao{5}这是楷书五号字}
```

#### 2.4.2 行间距

模板提供以下两个命令调整行间距。
在命令后均需要加上 `\selectfont` 命令来生效。

- `\mslinespread`：模仿 Microsoft Word 中的“多倍行距”设置行间距。
- `\mslinespreadbp`：模仿 Microsoft Word 中的“固定行距”（单位：磅）设置行间距。
    文档类正文行间距默认为固定20磅。

例如：

```LaTeX
{
    \mslinespread{1.5}\selectfont  % 设置1.5倍行距
    这是正文内容
    \par  % 如果文字在大括号中，结尾需要加上 \par 行距设置才会生效
}
```

#### 2.4.3 标题名称

本模板提供了一些命令存储模板元素的名称。
这些名称已经按照写作规范设置好，一般情况下不需要改动。
如有必要，可以使用相应命令重新定义这些名称。

只能使用 `\renewcommand*` 命令重新定义的标题名称如下：

| 命令                    | 默认值                                     |
| ----------------------- | ------------------------------------------ |
| `\enabstractname`       | Abstract                                   |
| `\prefacename`          | 前言                                       |
| `\symabbrname`          | 符号和缩略语说明                           |
| `\acknowledgementsname` | 致谢                                       |
| `\resumename`           | 个人简历、在学期间发表的学术论文及研究成果 |
| `\anonymousresumename`  | 在学期间发表的学术论文及研究成果           |

例如：

```LaTeX
\renewcommand*{\enabstractname}{Abstract}
```

只能使用 `\ctexset` 命令重新定义的标题名称如下：

| 名称             | 默认值   |
| ---------------- | -------- |
| `contentsname`   | 目录     |
| `figurename`     | 图       |
| `tablename`      | 表       |
| `listfigurename` | 插图清单 |
| `listtablename`  | 附表清单 |
| `abstractname`   | 摘要     |
| `appendixname`   | 附录     |
| `bibname`        | 参考文献 |

例如：

```LaTeX
\ctexset{contentsname = 目录}
```

### 2.5 写作实用工具

#### 2.5.1 交叉引用

无论哪种编号模式，对小节的交叉引用可以如下进行。
其中，`chap:`、`sec:` 等标签前缀仅为了理解方便，不是必要格式。
标签内容可自定义。

##### 2.5.1.1 方式一：使用 `\ref` 命令引用

| 引用对象 | 引用方式 | 引用样式（模式一，数字） | 引用样式（模式二，中文） |
| ------- | ------- | -------- | -------- |
| chapter | `\ref{chap:a}` | 1 | 第一章 |
| section | `\ref{sec:a}` | 1.1 | 第一章第一节 |
| subsection | `\ref{subsec:a}` | 1.1.1 | 第一章第一节第一小节 |
| subsubsection | `\ref{subsubsec:a}` | 1.1.1.1 | 第一章第一节第一小节（一） |
| figure | `\ref{fig:a}` | 图1.1 | 图1.1 |
| subfigure | `\ref{subfig:a}` | 图1.1（a） | 图1.1（a） |
| table | `\ref{tab:a}` | 表1.1 | 表1.1 |
| equation | `\ref{eqn:a}` | 式（1.1） | 式（1.1） |

##### 2.5.1.2 方式二：使用 `\simpleref` 命令引用

`\simpleref` 命令也可以输出格式化后的引用，但是对于章、节标题仅输出当前章、节编号，方
便在文中使用类似“本章第二节”这样的表达。

| 引用对象 | 引用方式 | 引用样式（模式一，数字） | 引用样式（模式二，中文） |
| ------- | ------- | -------- | -------- |
| chapter | `\simpleref{chap:a}` | 1 | 第一章 |
| section | `\simpleref{sec:a}` | 1.1 | 第一节 |
| subsection | `\simpleref{subsec:a}` | 1.1.1 | 第一小节 |
| subsubsection | `\simpleref{subsubsec:a}` | 1.1.1.1 | （一） |
| figure | `\simpleref{fig:a}` | 图1.1 | 图1.1 |
| subfigure | `\simpleref{subfig:a}` | 图1.1（a） | 图1.1（a） |
| table | `\simpleref{tab:a}` | 表1.1 | 表1.1 |
| equation | `\simpleref{eqn:a}` | 式（1.1） | 式（1.1） |

#### 2.5.2 插入图片

推荐使用以下方式插入单张图片：

```LaTeX
\begin{figure}
    \centering
    \includegraphics[width=0.6\textwidth]{example-image-a}
    \caption{这是图片的标题}
    \label{fig:example}
\end{figure}
```

推荐使用以下方式插入含子图的图片：

```LaTeX
\begin{figure}
    \centering
    \begin{subfigure}{0.45\textwidth}
        \centering
        \includegraphics[width=\textwidth]{example-image-a}
        \caption{子图1}
        \label{subfig:example-a}
    \end{subfigure}
    \quad
    \begin{subfigure}{0.45\textwidth}
        \centering
        \includegraphics[width=\textwidth]{example-image-b}
        \caption{子图2}
        \label{subfig:example-b}
    \end{subfigure}
    \caption{这是图片的标题}
    \label{fig:example}
\end{figure}
```

#### 2.5.3 行内列表

由于 `enumitem` 宏包的一个[已知问题](https://tex.stackexchange.com/questions/533118/enumitem-get-rid-of-extra-space-between-label-and-content-in-inline-list/533137#533137)，在本模板中无法使用 `itemize*` 和 `enumerate*` 环境创建行内列表。
请使用以下替换命令：

```LaTeX
\begin{inlineitemize}
    \item 这是列表项1
    \item 这是列表项2
\end{inlineitemize}
```

```LaTeX
\begin{inlineenumerate}
    \item 这是列表项1
    \item 这是列表项2
\end{inlineenumerate}
```

## 03 待办

### 3.1 计划中的修改

暂无。

### 3.2 待确认的问题

1. 附录标题是否要和附录编号在同一行？附录标题是否要和附录编号一起出现在目录中？

## 04 已知问题

1. 生成出的 PDF 在使用 Microsoft Edge 浏览时会出现字体重影等错误（疑似 Microsoft Edge 端的问题），请尽量使用 Adobe Acrobat 或其他软件打开 PDF 文件。

## 05 相关链接

南开大学硕博毕业论文模板的其他历史实现：

- [https://github.com/NewFuture/NKThesis](https://github.com/NewFuture/NKThesis)
- [https://github.com/qianchd/NKU_thesis_graduate](https://github.com/qianchd/NKU_thesis_graduate)
- [https://github.com/MCG-NKU/NKU-Thesis](https://github.com/MCG-NKU/NKU-Thesis)
- [https://github.com/benhaotang/NKThesis](https://github.com/benhaotang/NKThesis)
