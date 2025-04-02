# 南开大学硕士/博士毕业（学位）论文模板（2025）

![version 1.1.2](https://img.shields.io/badge/version-1.1.2-blue)
![License LPPL 1.3c](https://img.shields.io/badge/License-LPPL%201.3c-blue?logo=latex&logoColor=white)

> [!TIP]
> 这个模板是根据规范从零开始编写的全新模板，和现有模板的实现方式大有不同，欢迎使用！

编译支持矩阵

|  | Windows | Overleaf | Ubuntu | MacOS |
|:--:|:--:|:--:|:--:|:--:|
| XeLaTeX | ✅ | ✅ | 未测试 | 未测试 |
| pdfLaTeX | ❌ | ❌ | ❌ | ❌ |
| 其他 | 未测试 | 未测试 | 未测试 | 未测试 |

模板预览和写作规范可以[从 Release 中下载](https://github.com/alumik/nkthesis/releases/latest) `main.pdf`。

## 历史来源

> [!NOTE]
> 本段文字摘录自[https://github.com/qianchd/NKU_thesis_graduate](https://github.com/qianchd/NKU_thesis_graduate)，有改动。

南开大学毕业论文模板在互联网上有非常多版本，其最早的来源应是数学院孙文昌老师制作的，可惜原始的数院个人网页已经无法访问。孙老师是早期 xeCJK 包的作者，也基本是南开数学院学生 LaTeX 语言的启蒙人，大部分数学院本科生的 LaTeX 大概是孙老师的暑期小学期课程教授的。

互联网上的大部分显存模板仓库主要修改自南开大学图书馆发布的2023年版本模板，其来源也是陈所的学长提供。[该仓库](https://github.com/qianchd/NKU_thesis_graduate)初始的第一个 commit 即为该版本。

## 本版本新特性

为了简化类定义，精简模板文件，避免重复造轮子，我**从零开始**按照规范制作了这一份新的学位论文模板。

该版本主要特色如下：

1. 真正从零开始重构模板。卸掉了许多历史包袱（当然也可能丢掉了一些好东西，欢迎提交PR😀！）
2. 符合《研究生学位论文写作规范（2025版）》。目前仅支持中文论文。
3. 添加需要的中文字体和符号字体。
4. 支持 Windows 与 Overleaf 使用 XeLaTeX 编译，其他环境未测试。
5. 避免重复造轮子，使用下列宏包实现大多数自定义功能：
    - 使用 `ctex` 宏包提供高层级的中文支持。
    - 使用 `tocloft` 宏包自定义目录样式。
    - 使用 `caption` 宏包自定义图注、表注样式。
    - 使用 `fancyhdr` 宏包自定义页眉页脚样式。
    - 使用 `enumitem` 宏包自定义列表样式。
    - 使用 `hyperref` 宏包自定义超链接样式。
    - 使用 `biblatex` 宏包及其自带的 `gb7714-2015` 样式自定义参考文献样式
    - 使用 `subcaption` 宏包自定义子图样式。
    - 使用 `tikz` 宏包绘制矢量版的南开大学文字 Logo。
6. 实现了中文和数字两种标题编号样式，可以通过 `headingmode=1` 或 `headingmode=2` 切换编号模式，添加了标题编号深度。
7. 无论哪种编号模式，对小节的交叉引用可以如下进行：
   
> [!NOTE]
> 标签内容可自定义，`chap:`、`sec:` 等标签前缀仅为了理解方便。

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

## 待办

以下待办欢迎PR。

1. 编写完善的使用文档。
2. 精细化调整元素间距，更好地模仿 Microsoft Word 模板样式。注意，由于实现方式不同，LaTeX 并不能完全复刻 Microsoft Word 文档的样式，追求100%的相同是无意义的。目前的模板有细微偏差。
3. 解决《非公开学位论文标注说明》表格中论文题目的自动填充问题。
4. 在更多环境下测试模板兼容性。
5. 找一位毕业生实测模板是否能通过审查🤣。
6. 添加英文论文支持。
