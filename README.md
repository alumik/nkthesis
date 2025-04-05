# 南开大学硕士/博士毕业（学位）论文模板（2025）

![version 1.3.2](https://img.shields.io/badge/version-1.3.2-blue)
![License LPPL 1.3c](https://img.shields.io/badge/License-LPPL%201.3c-blue?logo=latex&logoColor=white)

> [!TIP]
> 这个模板是根据规范从零开始编写的全新模板，和现有模板的实现方式大有不同，欢迎使用！

> [!WARNING]
> 生成出的 PDF 在使用 Microsoft Edge 浏览时会出现字体重影等错误，请尽量使用 Adobe Acrobat 或其他软件打开 PDF 文件。

编译环境与支持情况表：

|  | Windows | Overleaf | Ubuntu | MacOS |
|:--:|:--:|:--:|:--:|:--:|
| XeLaTeX | ✅ | ✅ | 未测试 | 未测试 |
| pdfLaTeX | ❌ | ❌ | ❌ | ❌ |
| 其他 | 未测试 | 未测试 | 未测试 | 未测试 |

模板预览和写作规范可以从 [Release](https://github.com/alumik/nkthesis/releases/latest) 中下载 `main.pdf`。

## 有问题？

如果是代码 BUG，格式错误等问题，请创建 [Issue](https://github.com/alumik/nkthesis/issues)。

如果是使用方法咨询，改进建议等，请到 [Discussions](https://github.com/alumik/nkthesis/discussions) 中创建新的讨论。

## 历史来源

> [!NOTE]
> 本段文字摘录自[https://github.com/qianchd/NKU_thesis_graduate](https://github.com/qianchd/NKU_thesis_graduate)，有改动。

南开大学毕业论文模板在互联网上有非常多版本，其最早的来源应是数学院孙文昌老师制作的，可惜原始的数院个人网页已经无法访问。孙老师是早期 xeCJK 包的作者，也基本是南开数学院学生 LaTeX 语言的启蒙人，大部分数学院本科生的 LaTeX 大概是孙老师的暑期小学期课程教授的。

互联网上的大部分显存模板仓库主要修改自[南开大学图书馆发布的2023年版本模板](https://libpaper.nankai.edu.cn/newlist.action?encid=58)。[该仓库](https://github.com/qianchd/NKU_thesis_graduate)的第一个 commit 即为该版本。

## 本模板新特性

为了简化类定义，精简模板文件，避免重复造轮子，我**从零开始**按照规范制作了这一份新的学位论文模板。

该版本主要特点如下：

1. 真正从零开始重构模板。卸掉了许多历史包袱（当然也可能丢掉了一些好东西，欢迎提交PR😀！）
2. 符合《研究生学位论文写作规范（2025版）》。目前仅支持中文论文。
3. 添加需要的中文字体和符号字体。
4. 支持 Windows 与 Overleaf 使用 XeLaTeX 编译，其他环境未测试。
5. 实现了中文和数字两种标题编号样式。
6. 避免重复造轮子，使用下列宏包实现大多数自定义功能：
    - 使用 `pgfkeys` 红包管理模板参数。
    - 使用 `ctex` 宏包提供高阶中文支持。
    - 使用 `tocloft` 宏包自定义目录样式。
    - 使用 `caption` 宏包自定义图注、表注样式。
    - 使用 `fancyhdr` 宏包自定义页眉页脚样式。
    - 使用 `enumitem` 宏包自定义列表样式。
    - 使用 `hyperref` 宏包自定义超链接样式。
    - 使用 `biblatex` 宏包及其自带的 `gb7714-2015` 样式自定义参考文献样式
    - 使用 `subcaption` 宏包自定义子图样式。
    - 使用 `tikz` 宏包绘制矢量版的南开大学文字 Logo。

## 使用说明

### 引入模板

```latex
\documentclass[headingmode=2]{nkthesis}
```

`headingmode=1` 表示使用数字编号模式，`headingmode=2` 表示使用中文编号模式。

### 设置和读取模板参数

使用 `\nktset` 命令设置模板参数，参数名称和参数值之间用 `=` 连接，多个参数用逗号分隔。如果参数值内部含有逗号，需要使用大括号包裹，例如 `参数名 = 参数值前半部分{,}参数值后半部分,`。

可选参数如下：

```latex
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

可以使用 `\nktget` 命令获取参数值。例如：

```latex
\nktget{学校代码}
```

### 设置字体字号

根据写作规范，正文默认为宋体小四号字，行距为20磅。

本模板支持以下字体：

| 字体 | 命令 |
| ------- | ------- |
| 宋体 | `\songti` |
| 黑体 | `\heiti` |
| 仿宋 | `\fangsong` |
| 楷书 | `\kaishu` |
| Arial | `\arial` |
| Segoe UI Symbol | `\segoeui` |

切换字体字号方式示例如下。最外侧的大括号可以限制字体设置的作用范围。

```latex
{\heiti{}\zihao{3}这是黑体三号字}
{\songti{}\zihao{-4}这是宋体小四号字}
{\fangsong{}\zihao{12}这是仿宋12磅字}
{\kaishu{}\zihao{5}这是楷书五号字}
```

有以下几种特殊情况：

- 由于宋体没有原生粗体，使用 `\textbf` 命令加粗，得到的会是黑体。
- 如果想得到宋体的**伪**粗体，可以使用 `\songti\textbf` 命令。
- 由于宋体本身没有斜体，使用 `\textit` 得到的会是楷书。
- 如果想得到宋体的**伪**斜体，可以使用 `\songti\textit` 命令。

### 设置行间距

模板提供以下两个命令调整行间距：

| 命令 | 用途 |
| ------- | ------- |
| `\mslinespread` | 设置 Microsoft Word 中的“多倍行距” |
| `\mslinespreadbp` | 设置 Microsoft Word 中的“固定行距”（单位：磅） |

例如：

```latex
{
    \mslinespread{1.5}\selectfont  % 设置1.5倍行距
    这是正文内容
    \par  % <- 如果文字在大括号中，结尾需要加上 \par 行距设置才会生效
}
```

### 标题名称

本模板提供了一些命令存储预定义的标题名称。这些名称已经按照写作规范设置好，一般情况下不需要改动。如果需要，可以使用相应命令重新定义这些名称。

####  可以使用 `\renewcommand*` 命令重新定义的标题名称

| 命令 | 默认值 |
| ------- | ------- |
| `\enabstractname` | Abstract |
| `\prefacename` | 前言 |
| `\symbolsandabbreviationsname` | 符号和缩略语说明 |
| `\errataname` | 勘误表 |
| `\acknowledgementsname` | 致谢 |
| `\resumename` | 个人简历、在学期间发表的学术论文及研究成果 |
| `\anonymousresumename` | 在学期间发表的学术论文及研究成果 |

例如：

```latex
\renewcommand*{\enabstractname}{English Abstract}
```

#### 可以使用 `\ctexset` 命令重新定义的标题名称

| 名称 | 默认值 |
| ------- | ------- |
| `contentsname` | 目录 |
| `figurename` | 图 |
| `tablename` | 表 |
| `listfigurename` | 插图清单 |
| `listtablename` | 附表清单 |
| `abstractname` | 摘要 |
| `appendixname` | 附录 |
| `bibname` | 参考文献 |

例如：

```latex
\ctexset{contentsname = 目录}
```

### 交叉引用

无论哪种编号模式，对小节的交叉引用可以如下进行：
   
> [!NOTE]
> 标签内容可自定义，`chap:`、`sec:` 等标签前缀仅为了理解方便。

#### 方式一：使用 `\ref` 命令引用

`\ref` 命令可以输出格式化后的引用。

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

#### 方式二：使用 `\simpleref` 命令引用

`\simpleref` 命令也可以输出格式化后的引用，但是对于章、节标题仅输出当前章、节编号。这样，方便在文中使用类似“本章第二节”这样的表达。

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

#### 插入单张图片

```latex
\begin{figure}
    \centering
    \includegraphics[width=0.6\textwidth]{example-image-a}
    \caption{这是图片的标题}
    \label{fig:example}
\end{figure}
```

#### 插入含子图的图片

```latex
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

### 模板提供的自定义环境

自定义环境可以通过以下方式使用，以在文中插入相应页面。

```latex
\begin{环境名称}
    % 环境内容
\end{环境名称}
```

| 环境名称 | 用途 |
| ------- | ------- |
| `abstract` | 中文摘要 |
| `enabstract` | 英文摘要 |
| `keywords` | 中文关键词 |
| `enkeywords` | 英文关键词 |
| `preface` | 前言 |
| `symbolsandabbreviations` | 符号和缩略语说明 |
| `errata` | 勘误表 |
| `acknowledgements` | 致谢 |
| `resume` | 个人简历、在学期间发表的学术论文及研究成果 |
| `resume*` | 在学期间发表的学术论文及研究成果（用于匿名评阅版论文） |

### 模板提供的自定义页面

使用以下命令可以在文中插入相应页面。

| 命令 | 用途 |
| ------- | ------- |
| `\titlepage` | 题名页 |
| `\anonymoustitlepage` | 匿名评阅封面 |
| `\declarationpage` | 学位论文原创性声明和非公开学位论文标注说明 |
| `\authorizationpage` | 学位论文使用授权书 |
| `\bibliographypage` | 参考文献 |

## 待办

以下待办欢迎PR。

### 功能完善

1. 编写完善的使用文档。如有可能，构建 `.dtx` 和 `.ins` 文件。
2. 精细化调整元素间距，更好地模仿 Microsoft Word 模板样式。注意，由于实现方式不同，LaTeX 并不能完全复刻 Microsoft Word 文档的样式，追求100%的相同是无意义的。目前的模板有细微偏差。
3. 在更多环境下测试模板兼容性。
4. 添加英文论文支持。

### 已知 BUG

1. 《非公开学位论文标注说明》表格中论文题目不能自动填充。

### 待确认的问题

1. 找一位毕业生实测模板是否能通过审查🤣。
2. 附录标题是否要和附录编号在同一行？附录标题是否要和附录编号一起出现在目录中？
