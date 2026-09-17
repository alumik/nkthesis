# nkthesis: Nankai University Master's and Doctoral Thesis LaTeX Template (2026)

![version 2026.7.2](https://img.shields.io/badge/version-2026.7.2-blue)
![license-LPPL-1.3c](https://img.shields.io/badge/license-LPPL--1.3c-orange)

[中文](README.md) | English

`nkthesis` is a LaTeX template for master's and doctoral theses at Nankai University, conforming to the *Graduate Thesis Writing Standards (2026 Edition)*. It currently supports theses written in Chinese, English, Spanish, Japanese, German, French, Brazilian Portuguese, Italian, and Russian.

If you are new to LaTeX, it is recommended not to rush into understanding every command. First get the sample thesis to compile successfully, then gradually replace the personal information, abstract, main text, and bibliography in the sample with your own content.

> [!CAUTION]
> This template only supports TeX Live 2025 and above, and must be compiled with XeLaTeX.

> [!TIP]
> If you find this template useful, please give it a free Star ⭐ so that more people can discover this project. Thank you!

![](https://pic1.imgdb.cn/item/6a30f58d6f828650a6e61ac1.png)

## Downloading the Template

You can download the latest version from [Releases](https://github.com/alumik/nkthesis/releases/latest).

| File | Purpose |
| --- | --- |
| `nkthesis.cls` | The template class file. When writing your thesis, it must be placed together with your main `.tex` file, or in a location where TeX can find it. |
| `demo.pdf` | The compiled result of the sample thesis. |
| `nkthesis.pdf` | The complete usage instructions. |

This repository also contains the template source code `nkthesis.dtx`. If you are only writing a thesis, you do not need to understand or modify it.

## Quick Start

### 1. Prepare the Environment

Install TeX Live 2025 or a newer version. Windows, macOS, and Linux all work; online platforms such as Overleaf also work, but pay attention to font file issues.

Make sure you are using XeLaTeX. Do not compile this template with pdfLaTeX.

### 2. Download the Template

The recommended approach:

1. Download the latest `nkthesis.cls` from [Releases](https://github.com/alumik/nkthesis/releases/latest).
2. Copy all files from the `doc/demo/` directory into your thesis folder, and place `nkthesis.cls` in that directory.
3. Do not change too much at first — compile the sample file `demo.tex` directly to confirm your environment works.

If you want to generate `nkthesis.cls` from the source code, run the following command in the repository directory:

```bash
l3build unpack
```

The generated class file is located at `build/unpacked/nkthesis.cls`.

### 3. Compile the Sample

The repository already provides a `latexmkrc`, so usually you can just run the following command:

```bash
latexmk demo.tex
```

If successful, you will get `demo.pdf`.

## Font Issues

On Windows systems, the fonts used by the template are already present, so no additional font files are needed to compile this template.

If you see an error like the following on Overleaf, Linux, macOS, or other environments:

```text
Package fontspec Error:
(fontspec) The font "simsun" cannot be found
```

please create a `fonts/` folder in your thesis folder and put the required font files in it. Commonly needed files include:

| Font | Files |
| --- | --- |
| SimSun, FangSong, SimHei, KaiTi | `simsun.ttc`, `simfang.ttf`, `simhei.ttf`, `simkai.ttf` |
| Times New Roman | `times.ttf`, `timesbd.ttf`, `timesi.ttf`, `timesbi.ttf` |
| Arial | `arial.ttf`, `arialbd.ttf`, `ariali.ttf`, `arialbi.ttf` |

Most of these fonts are non-open-source fonts and are not distributed with this template. In general, these font files can be found in the `C:\Windows\Fonts` directory on a Windows system.

## What to Change When Writing Your Thesis

For first-time use, the most recommended approach is to modify `demo.tex`:

1. Fill in basic information such as the thesis title, author, supervisor, school, major, and defense date in `\nktset{...}`.
2. Specify your bibliography `.bib` file in `\addbibresource{...}`.
3. Write the abstract, keywords, preface, notation, and other front matter in `frontmatter/`.
4. Write the chapters of the main text in `mainmatter/`.
5. Write the appendix, acknowledgements, and personal résumé in `backmatter/`.

The general structure of the sample file is as follows:

```latex
\documentclass[headingmode=2]{nkthesis}

\nktset{
  论文题目（中文） = {Your Chinese Title},
  论文题目（英文） = {Your English Title},
  论文作者 = {Your Name},
  指导教师 = {Your Supervisor},
  培养单位 = {Your School},
}

\addbibresource{thesis.bib}

\begin{document}

\maintitlepage
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

The example above only shows the skeleton. For the complete set of fields and the full thesis structure, please refer to `nkthesis.pdf`.

## Template Options

```LaTeX
\documentclass[<template options>]{nkthesis}
```

This template provides the following options, which can be passed as arguments to the `\documentclass` command.

| Option | Default | Description |
| --- | --- | --- |
| `headingmode` | `2` | Chapter heading numbering mode. `headingmode=1` uses the numeric numbering mode; `headingmode=2` uses the Chinese numbering mode. |
| `uppercasehead` | `false` | When this option is present or set to true, page headers are converted to all uppercase. Otherwise, the original capitalization is preserved. |
| `openright` | `false` | When this option is present or set to true, chapters are forced to start on a right-hand page (in line with duplex printing standards). Otherwise, chapters may start on a left-hand page. |
| `frontmatterintoc` | `false` | When this option is present or set to true, the front matter (such as the abstract, preface, etc.) is added to the table of contents. Otherwise, the front matter does not appear in the table of contents. |
| `lang` | `zh` | Thesis language. Available codes: `zh` (Chinese), `en` (English), `es` (Spanish), `ja` (Japanese), `de` (German), `fr` (French), `ptbr` (Brazilian Portuguese, may also be written as `pt-BR`), `it` (Italian), `ru` (Russian). `language` is an equivalent alias. |

## Detailed Usage Instructions

The `nkthesis.pdf` file in [Releases](https://github.com/alumik/nkthesis/releases/latest) contains the detailed usage instructions for the template.

## Getting Help

- Found a code problem, formatting error, or compilation bug: please open an [Issue](https://github.com/alumik/nkthesis/issues).
- Questions about usage or suggestions: please go to [Discussions](https://github.com/alumik/nkthesis/discussions).
- Check frequently asked questions: [FAQ](https://github.com/alumik/nkthesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98%E5%8F%8A%E8%A7%A3%E7%AD%94) (in Chinese).
- Check known issues: [Known Issues or Bugs](https://github.com/alumik/nkthesis/wiki/%E5%B7%B2%E7%9F%A5%E9%97%AE%E9%A2%98%E6%88%96-BUG) (in Chinese).

## Related Projects

Other historical implementations of the Nankai University master's and doctoral thesis template:

- [NewFuture/NKThesis](https://github.com/NewFuture/NKThesis)
- [qianchd/NKU_thesis_graduate](https://github.com/qianchd/NKU_thesis_graduate)
- [MCG-NKU/NKU-Thesis](https://github.com/MCG-NKU/NKU-Thesis)
- [benhaotang/NKThesis](https://github.com/benhaotang/NKThesis)
