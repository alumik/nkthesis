# nkthesis：南开大学硕士/博士毕业（学位）论文模板（2025）

![version 2.0.1](https://img.shields.io/badge/version-2.0.1-blue)
![license-LPPL-1.3c](https://img.shields.io/github/license/alumik/nkthesis)

> [!TIP]
> 这个模板是根据规范从零开始编写的全新模板，和现有模板的实现方式大有不同，欢迎使用！

> [!WARNING]
> 生成出的 PDF 在使用 Microsoft Edge 浏览时会出现字体重影等错误，请尽量使用 Adobe Acrobat 或其他软件打开 PDF 文件。

nkthesis 是一个全新编写的南开大学硕士/博士毕业（学位）论文LaTeX 模板，符合《研究生学位论文写作规范（2025版）》要求，支持 Windows 和 Overleaf 平台使用 XeLaTeX 编译。
该模板摒弃了现有模板的历史包袱，精简了类定义，同时保证了编译结果的一致性和规范性。
它提供了中文和数字两种标题编号样式选择，内置了必要的中文字体和符号字体，利用多个宏包协同工作实现定制化功能。
本模板提供了完善的中英文摘要、关键词、前言、符号说明、勘误表、致谢和个人简历等环境，以及题名页、匿名评阅封面、原创性声明、使用授权书和参考文献等特殊页面。
使用者可通过简单的命令设置和获取论文基本信息，调整字体字号和行间距，实现交叉引用和插入图片。
本模板代码开源，在 GitHub 上提供完整使用说明和持续更新，为南开大学研究生提供了便捷高效的学位论文排版工具。

[Release](https://github.com/alumik/nkthesis/releases/latest) 中可下载最新版本的模板类文件和使用说明：

- `nkthesis.cls`：导出完毕的模板类文件，可直接使用。
- `main.pdf`：由 `main.tex` 生成的 PDF 文件，包含模板预览和写作规范。
- `documentation.pdf`：由 `nkthesis.dtx` 生成的 PDF 文件，包含详细的模板使用说明。

## 使用方法

1. 将本仓库所有文件克隆/下载到本地。
2. 获取 `nkthesis.cls` 文件。
   以下两种方法可任选其一：
    - 方法一：从 [Release](https://github.com/alumik/nkthesis/releases/latest) 中下载最新版本的 `nkthesis.cls` 文件，放入模板文件夹中。
    - 方法二：使用以下命令从 `nkthesis.dtx` 文件中提取 `nkthesis.cls` 文件。
      ```
      xelatex nkthesis.ins
      ```
3. 使用 XeLaTeX 编译器编译 `main.tex` 文件。
   本模板已经提供了 `latexmk` 配置文件，使用 `latexmk` 命令编译时会自动调用 XeLaTeX 编译器。
    ```
    latexmk main.tex
    ```

## 构建说明文档

如果你想构建本模板的说明文档，可以参照以下步骤：

1. 将本仓库所有文件克隆/下载到本地。
2. 确保本地有 `zhmakeindex` 可执行文件。
   可以从[这里](https://github.com/leo-liu/zhmakeindex/releases/latest)下载，并放置于模板文件夹或系统 `Path` 环境变量中。
3. 在模板文件夹下执行

    ```
    latexmk nkthesis.dtx
    ```
    
    即可在目录下生成 `nkthesis.pdf` 文件，即模板的说明文档。

## 有问题？

如果是代码 BUG，格式错误等问题，请创建 [Issue](https://github.com/alumik/nkthesis/issues)。

如果是使用方法咨询，改进建议等，请到 [Discussions](https://github.com/alumik/nkthesis/discussions) 中创建新的讨论。

## 历史

> [!NOTE]
> 本段文字摘录自[https://github.com/qianchd/NKU_thesis_graduate](https://github.com/qianchd/NKU_thesis_graduate)，有改动。

南开大学毕业论文模板在互联网上有非常多版本，其最早的来源应是数学院孙文昌老师制作的，可惜原始的数院个人网页已经无法访问。
孙老师是早期 xeCJK 包的作者，也基本是南开数学院学生 LaTeX 语言的启蒙人，大部分数学院本科生的 LaTeX 大概是孙老师的暑期小学期课程教授的。
互联网上的大部分现存模板仓库主要修改自[南开大学图书馆发布的2023年版本模板](https://libpaper.nankai.edu.cn/newlist.action?encid=58)。
[该仓库](https://github.com/qianchd/NKU_thesis_graduate)的第一个 commit 即为该版本。

## 本模板特点

为了简化类定义，精简模板文件，避免重复造轮子，本模板作者从零开始按照规范制作了这一份新的学位论文模板。

本模板主要特点如下：

1. 使用 LaTeX3 接口编写模板。卸掉了许多历史包袱（当然也可能丢掉了一些好东西）。
2. 符合《研究生学位论文写作规范（2025版）》。目前仅支持中文论文。
3. 添加需要的中文字体和符号字体，保证不同平台编译结果的一致性。
4. 支持 Windows（TeX Live 2025）与 Overleaf 使用 XeLaTeX 编译，其他环境未测试。
5. 实现了中文和数字两种标题编号样式。
6. 使用下列宏包实现大多数自定义功能：
    - 使用 CTeX 提供高阶中文支持。
    - 使用 `geometry` 自定义纸张大小。
    - 使用 `tocloft` 自定义目录样式。
    - 使用 `caption` 自定义图注、表注样式。
    - 使用 `fancyhdr` 自定义页眉页脚样式。
    - 使用 `fontspec` 设置自定义字体。
    - 使用 `enumitem` 自定义列表样式。
    - 使用 `hyperref` 自定义超链接样式。
    - 使用 `bibLaTeX` 及其自带的 `gb7714-2015` 样式自定义参考文献样式。
    - 使用 `subcaption` 自定义子图样式。
    - 使用 `tikz` 绘制矢量版的南开大学文字 Logo。
    - 使用 `array` 自定义表格样式。


## 使用 nkthesis 文档类

```LaTeX
\documentclass[<文档类选项>]{nkthesis}
```

本模板提供了以下文档类选项，可以作为可选参数传入 `\documentclass` 命令中。

| 参数            | 默认值 | 说明                                                                                                    |
| --------------- | ------ | ------------------------------------------------------------------------------------------------------- |
| `headingmode`   | 2      | 标题编号模式（数字/中文）。`headingmode=1` 表示使用数字编号模式，`headingmode=2` 表示使用中文编号模式。 |
| `uppercasehead` |        | 当该选项存在时，将章节页眉转换为全大写。否则，保留原始大小写。                                          |


## 设置和读取论文基本信息

### 设置论文基本信息

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
    作者信息/论文类别 = 硕士,  % 可选项：博士/学历硕士/专业学位硕士/同等学力硕士
    题名页/论文题目字号 = 2,  % 字号最大为2，可根据标题长度适当缩小标题字号
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
    授权书/签字日期 = {},
    学号 = {},
    答辩日期 = {},
    联系电话 = {},
    电子邮箱 = {},
    通讯地址 = {},
    作者信息/备注 = {},
}
```

### 获取论文基本信息

`\nktget {⟨键名⟩}` 用来获取论文基本信息。
以下是获取学校代码的示例：

```LaTeX
\nktget{学校代码}
```

## 排版格式设定

### 字体字号

正文中文默认使用小四号宋体，英文默认使用12磅 Times New Roman。

本模板还支持以下字体：

| 字体            | 命令        |
| --------------- | ----------- |
| 宋体            | `\songti`   |
| 黑体            | `\heiti`    |
| 仿宋            | `\fangsong` |
| 楷书            | `\kaishu`   |
| Arial           | `\arial`    |
| Segoe UI Symbol | `\segoeui`  |

切换字体字号命令的使用示例如下。最外侧的大括号可以限制字体设置的作用范围。

```LaTeX
{\heiti{}\zihao{3}这是黑体三号字}
{\songti{}\zihao{-4}这是宋体小四号字}
{\fangsong{}\zihao{12}这是仿宋12磅字}
{\kaishu{}\zihao{5}这是楷书五号字}
```

有以下几种特殊情况：

- 由于宋体没有原生粗体，使用 `\textbf` 或 `\bfseries` 命令得到的会是黑体。
- 如果想得到宋体的**伪粗体**，可以使用 `\songti\textbf` 命令。
- 由于宋体本身没有斜体，使用 `\textit` 或 `\itshape` 命令得到的会是楷书。
- 如果想得到宋体的*伪斜体*，可以使用 `\songti\textit` 命令。

### 行间距

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

### 标题名称

本模板提供了一些命令存储模板元素的名称。
这些名称已经按照写作规范设置好，一般情况下不需要改动。
如有必要，可以使用相应命令重新定义这些名称。

只能使用 `\renewcommand*` 命令重新定义的标题名称如下：

| 命令                    | 默认值                                     |
| ----------------------- | ------------------------------------------ |
| `\enabstractname`       | Abstract                                   |
| `\prefacename`          | 前言                                       |
| `\symabbrname`          | 符号和缩略语说明                           |
| `\errataname`           | 勘误表                                     |
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

## 写作实用工具

### 交叉引用

无论哪种编号模式，对小节的交叉引用可以如下进行。
其中，`chap:`、`sec:` 等标签前缀仅为了理解方便，不是必要格式。
标签内容可自定义。

#### 方式一：使用 `\ref` 命令引用

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

#### 方式一：使用 `\simpleref` 命令引用

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

### 插入图片

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

### 行内列表

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

## 模板提供的自定义环境

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
| `errata`           | 勘误表                                                 |
| `acknowledgements` | 致谢                                                   |
| `resume`           | 个人简历、在学期间发表的学术论文及研究成果             |
| `resume*`          | 在学期间发表的学术论文及研究成果（用于匿名评阅版论文） |

## 模板提供的自定义页面

使用以下命令可以在文中插入相应页面。

| 命令                  | 用途                                       |
| --------------------- | ------------------------------------------ |
| `\titlepage`          | 题名页                                     |
| `\anonymoustitlepage` | 匿名评阅封面                               |
| `\declarationpage`    | 学位论文原创性声明和非公开学位论文标注说明 |
| `\authorizationpage`  | 学位论文使用授权书                         |
| `\bibliographypage`   | 参考文献                                   |

## 待办

### 功能完善

1. 精细化调整元素间距，更好地模仿 Microsoft Word 模板样式。注意，由于实现方式不同，LaTeX 并不能完全复刻 Microsoft Word 文档的样式，追求100%的相同是无意义的。
2. 添加英文论文支持。

### 待确认的问题

1. 附录标题是否要和附录编号在同一行？附录标题是否要和附录编号一起出现在目录中？
