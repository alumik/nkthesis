% (The MIT License)
%
% Copyright (c) 2025 Zhenyu Zhong
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the 'Software'), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nkthesis-graduate}[2025/03/30 0.0.1 Template for Master's and Doctoral Graduation (Degree) Thesis of Nankai University]

\RequirePackage{xfp}

\PassOptionsToPackage{AutoFakeBold=true}{xeCJK}  % 自动伪粗体
\LoadClass[
    openany,  % 双面打印时允许章节开始于偶数页
    zihao=-4,  % 默认字号小四
    UTF8,
    linespread=\fpeval{20 / 12 / 1.2},  % 固定20磅行间距（20bp / 12bp / 1.2）
]{ctexbook}

% ============================================================
% 载入宏包
% ============================================================
\RequirePackage[a4paper]{geometry}
\RequirePackage[titles]{tocloft}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{kvoptions}
\RequirePackage{xfp}
\RequirePackage{fontspec}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage{setspace}
\RequirePackage[
    backend=biber,
    style=gb7714-2015,
    url=false,
    gbpub=true,
]{biblatex}
\RequirePackage{subcaption}

% ============================================================
% 页边距
% ============================================================
\setlength{\textwidth}{14.6cm}
\setlength{\textheight}{22.1cm}
\setlength{\footskip}{0.53cm}
\setlength{\headsep}{0.5cm}
\setlength{\topskip}{0pt}
\setlength{\topmargin}{\dimexpr 3cm-1in\relax}
\setlength{\headheight}{14.8bp}
\setlength{\oddsidemargin}{\dimexpr 3.2cm-1in\relax}
\setlength{\evensidemargin}{\oddsidemargin}

% ============================================================
% 模板参数
% ============================================================
\SetupKeyvalOptions{
    prefix=nkthesis@
}
\DeclareStringOption[2]{headingmode}  % 可填1或者2，表示使用模式1或者模式2，默认为2
\ProcessKeyvalOptions*

% ============================================================
% 通用设置
% ============================================================
\setcounter{secnumdepth}{3}  % 允许三级标题（subsubsection）编号
\raggedbottom  % 允许页面底部不齐
\setmainfont{Times New Roman}
\newfontfamily{\arial}{Arial}
\newfontfamily{\segoeui}{Segoe UI Symbol}

% ============================================================
% 自定义宏
% ============================================================
\newcommand{\mslinespread}[1]{\linespread{\fpeval{#1 * 1.296875 / 1.2}}}  % 模仿 Word 多倍行距
\newcommand{\mslinespreadbp}[2]{\linespread{\fpeval{#1 / #2 / 1.2}}}  % 模仿 Word 固定行距（bp 单位）
\renewcommand{\frontmatter}{%
    \pagenumbering{Roman}%
    \setcounter{page}{1}%
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{3}\bfseries\heiti\centering},
        },
    }%
}
\renewcommand{\mainmatter}{%
    \clearpage%
    \pagenumbering{arabic}%
    \setcounter{page}{1}%
    \ifnum\strcmp{\nkthesis@headingmode}{1}=0%
        \ctexset{
            chapter={
                format = {\mslinespread{1}\zihao{3}\bfseries\heiti},
            },
        }%
    \fi%
}
\renewcommand{\backmatter}{%
    \clearpage%
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{3}\bfseries\heiti\centering},
        },
    }%
}
% ------------------------------------------------------------
% 智能交叉引用
% ------------------------------------------------------------
\labelformat{figure}{\figurename\thefigure}
\labelformat{subfigure}{\figurename\thefigure（\alph{subfigure}）}
\labelformat{table}{\tablename\thetable}
\labelformat{equation}{式（\arabic{chapter}.\arabic{equation}）}
\unless\ifnum\strcmp{\nkthesis@headingmode}{1}=0
    \labelformat{chapter}{\CTEXthechapter}
    \labelformat{section}{\CTEXthechapter{}\CTEXthesection}
    \labelformat{subsection}{\CTEXthechapter{}\CTEXthesection{}第\chinese{subsection}小节}
    \labelformat{subsubsection}{\CTEXthechapter{}\CTEXthesection{}第\chinese{subsection}小节（\chinese{subsubsection}）}
\fi

% ============================================================
% 页眉页脚
% ============================================================
\pagestyle{fancy}
\fancyhfoffset{1.428571pt} 
\renewcommand{\headrulewidth}{0.7bp}
\fancyhf{}
\fancyhead[C]{\mslinespread{1}\zihao{5}\songti\leftmark}
\fancyfoot[C]{\mslinespread{1}\zihao{5}\songti\thepage}

% ============================================================
% 目录
% ============================================================
% ------------------------------------------------------------
% 通用
% ------------------------------------------------------------
\tocloftpagestyle{fancy}  % 目录页使用 fancy 页眉页脚
\renewcommand{\cftdotsep}{1}  % 点间距
% ------------------------------------------------------------
% 章标题
% ------------------------------------------------------------
\setlength{\cftbeforechapskip}{2bp}  % 段前间距（设置为2磅以匹配6磅在Word中的样式）
\renewcommand{\cftchapfont}{\zihao{4}\songti}  % 字体
\renewcommand{\cftchappagefont}{\cftchapfont}  % 页码字体
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}  % 点线
% ------------------------------------------------------------
% 节标题
% ------------------------------------------------------------
\setlength{\cftbeforesecskip}{2bp}  % 段前间距（设置为2磅以匹配6磅在Word中的样式）
\setlength{\cftsecindent}{\ccwd}  % 缩进
\renewcommand{\cftsecfont}{\zihao{-4}\songti}  % 字体
\renewcommand{\cftsecpagefont}{\cftsecfont}  % 页码字体
% ------------------------------------------------------------
% 小节标题
% ------------------------------------------------------------
\setlength{\cftbeforesubsecskip}{2bp}  % 段前间距（设置为2磅以匹配6磅在Word中的样式）
\setlength{\cftsubsecindent}{2\ccwd}  % 缩进
\renewcommand{\cftsubsecfont}{\zihao{5}\songti}  % 字体
\renewcommand{\cftsubsecpagefont}{\cftsubsecfont}  % 页码字体
% ------------------------------------------------------------
% 图表标题
% ------------------------------------------------------------
\setlength{\cftbeforefigskip}{2bp}  % 图段前间距（设置为2磅以匹配6磅在Word中的样式）
\setlength{\cftbeforetabskip}{2bp}  % 表段前间距（设置为2磅以匹配6磅在Word中的样式）
\renewcommand{\cftfigfont}{\zihao{-4}\songti}  % 图字体
\renewcommand{\cfttabfont}{\zihao{-4}\songti}  % 表字体
\renewcommand{\cftfigpresnum}{\zihao{-4}\songti\figurename}  % 图序号前缀
\renewcommand{\cfttabpresnum}{\zihao{-4}\songti\tablename}  % 表序号前缀
\setlength{\cftfignumwidth}{3.5\ccwd}  % 图序号宽度
\setlength{\cfttabnumwidth}{3.5\ccwd}  % 表序号宽度
\setlength{\cftfigindent}{0pt}  % 图缩进
\setlength{\cfttabindent}{0pt}  % 表缩进

% ============================================================
% CTeX
% ============================================================
\ctexset{
    listfigurename = 插图清单,
    listtablename = 附表清单,
    chapter={
        beforeskip = 24bp,
        afterskip = 18bp,
        aftername = \hspace{\ccwd},
        pagestyle = fancy,
        tocline = \CTEXifname{\protect{\csname CTEXthe#1\endcsname\hspace{\ccwd}}}{}#2,
    },
    section = {
        beforeskip = 24bp,
        afterskip = 6bp,
        aftername = \hspace{\ccwd},
        tocline = \CTEXifname{\protect{\csname CTEXthe#1\endcsname\hspace{\ccwd}}}{}#2,
    },
    subsection = {
        format = {\mslinespread{1}\heiti\fontsize{13bp}{15.6bp}\selectfont},
        beforeskip = 12bp,
        afterskip = 6bp,
        aftername = {},
        tocline = \CTEXifname{\protect{\csname CTEXthe#1\endcsname}}{}#2,
    },
    subsubsection = {
        format = {\mslinespread{1}\zihao{-4}\heiti},
        beforeskip = 12bp,
        afterskip = 6bp,
        aftername = {},
    },
}
\ifnum\strcmp{\nkthesis@headingmode}{1}=0
    \ctexset{
        chapter = {
            name = {},
            number = \arabic{chapter},
            format = {\mslinespread{1}\zihao{3}\bfseries\heiti},
        },
        section = {
            number = \arabic{chapter}.\arabic{section},
            format = {\mslinespread{1}\zihao{4}\bfseries\heiti},
        },
        subsection = {
            number = \arabic{chapter}.\arabic{section}.\arabic{subsection},
        },
        subsubsection = {
            number = \arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection},
        },
    }
\else
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{3}\bfseries\heiti\centering},
        },
        section = {
            name = {第,节},
            number = \chinese{section},
            format = {\mslinespread{1}\zihao{4}\bfseries\heiti\centering},
        },
        subsection = {
            name = {,、},
            number = \chinese{subsection},
            indent = \parindent,
        },
        subsubsection = {
            name = {（,）},
            number = \chinese{subsection},
            indent = \parindent,
        },
    }
\fi

% ============================================================
% 图注、表注
% ============================================================
\DeclareCaptionLabelFormat{nkthesis}{#1#2}
\DeclareCaptionLabelFormat{nkthesis-subcaption}{（#2）}
\DeclareCaptionLabelSeparator{nkthesis}{\hspace{\ccwd}}
\DeclareCaptionFont{nkthesis}{\mslinespread{1}\zihao{5}\songti}
\captionsetup{
    labelsep=nkthesis,
    labelformat=nkthesis,
    font=nkthesis,
    skip=6bp,
}
\subcaptionsetup{
    labelsep=none,
    labelformat=nkthesis-subcaption,
    font=nkthesis,
    skip=6bp,
}
\setlength{\textfloatsep}{12bp}
\setlength{\floatsep}{12bp}
\setlength{\intextsep}{12bp}

% ============================================================
% 公式
% ============================================================
\makeatletter
\renewcommand\tagform@[1]{\maketag@@@{\ignorespaces\mslinespread{1}\zihao{5}（#1）\unskip\@@italiccorr}}  % 标签格式
\makeatother
\let\oldequation\equation
\let\endoldequation\endequation
\renewenvironment{equation}{\singlespace\oldequation}{\endoldequation}  % 行距

% ============================================================
% 列表
% ============================================================
\setlist[enumerate]{noitemsep, nolistsep, wide}
\setlist[itemize]{noitemsep, nolistsep, wide}

% ============================================================
% 附录
% ============================================================

% ============================================================
% 参考文献
% ============================================================
\AtBeginBibliography{\mslinespreadbp{16}{10.5}\zihao{5}\songti}

% ============================================================
% 自定义环境
% ============================================================
\newcommand{\enabstractname}{Abstract}
\newcommand{\prefacename}{前言}
\newcommand{\symbolsandabbreviationsname}{符号和缩略语说明}
\newcommand{\acknowledgementsname}{致谢}
\newcommand{\resumename}{个人简历、在学期间发表的学术论文及研究成果}
% ------------------------------------------------------------
% 摘要
% ------------------------------------------------------------
\newenvironment{abstract}{%
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{-2}\bfseries\heiti\centering},
        },
    }%
    \chapter*{\abstractname}%
    \markboth{\abstractname}{\abstractname}%
}{}
\newenvironment{enabstract}{%
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{-2}\bfseries\centering},
        },
    }%
    \chapter*{\arial{}\enabstractname}%
    \markboth{\enabstractname}{\enabstractname}%
}{}
\newenvironment{keywords}{\songti\textbf{关键词：}}{}
\newenvironment{enkeywords}{\textbf{Keywords:}}{}
% ------------------------------------------------------------
% 前言
% ------------------------------------------------------------
\newenvironment{preface}{%
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{3}\bfseries\heiti\centering},
        },
    }%
    \chapter*{\prefacename}%
    \markboth{\prefacename}{\prefacename}%
}{}
% ------------------------------------------------------------
% 符号与缩略语
% ------------------------------------------------------------
\newenvironment{symbolsandabbreviations}{%
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{3}\bfseries\heiti\centering},
        },
    }%
    \chapter*{\symbolsandabbreviationsname}%
    \markboth{\symbolsandabbreviationsname}{\symbolsandabbreviationsname}%
    \mslinespreadbp{16}{10.5}\zihao{5}\songti%
}{}
% ------------------------------------------------------------
% 致谢
% ------------------------------------------------------------
\newenvironment{acknowledgements}{%
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{3}\bfseries\heiti\centering},
        },
    }%
    \chapter*{\acknowledgementsname}%
    \markboth{\acknowledgementsname}{\acknowledgementsname}%
    \mslinespreadbp{16}{12}\zihao{-4}\songti%
    \addcontentsline{toc}{chapter}{\acknowledgementsname}%
}{}
% ------------------------------------------------------------
% 个人简历、在学期间发表的学术论文及研究成果
% ------------------------------------------------------------
\newenvironment{resume}{%
    \ctexset{
        chapter={
            format = {\mslinespread{1}\zihao{3}\bfseries\heiti\centering},
        },
    }%
    \chapter*{\resumename}%
    \markboth{\resumename}{\resumename}%
    \mslinespreadbp{16}{10.5}\zihao{5}\songti%
    \addcontentsline{toc}{chapter}{\resumename}%
}{}

\newcommand{\coverpage}{
  \clearpage
  \bgroup
  \parindent 0em
  \thispagestyle{empty}
  \zihao{5}
  \def\arraystretch{1.5}
  \begin{tabular}{rlrl}
  中图分类号:&\hbox to 75mm{12\hfil} &学校代码:&12\\
  UDC:&12&密级: &12
  \end{tabular}

  \vskip 10mm
%   \hskip 53mm\hbox{\includegraphics[viewport=0 0 2984 969,width=40mm]{nankaidaxue.pdf}}
%   \vskip -10mm
%   \begin{center}
%   {\def\CJKglue{\hskip 0.5em}\zihaoer\jiacu 
%      \ifx\NKT@key@lunwenleibie\NKT@string@boshi 
%        博士学位论文%
%      \else
%        硕士学位论文%
%      \fi}

%   \vskip 15mm
%   \zihaosan
%   \baselineskip 30pt
%   \vbox to 70mm{
%   \NKT@keyvalue{lunwentimuzh}

%   \NKT@keyvalue{fubiaoti}

%   \NKT@keyvalue{lunwentimuy}
%   \vss}

%   \vskip 10mm
%   \zihaosi
%   \def\arraystretch{2}
%   \tabcolsep 0.1em
%   \begin{tabular}{lcl}
%   \NKT@tp@item{论文作者}{lunwenzuozhe}  & \hbox to 10mm{} & \NKT@tpa@item{指导教师}{zhidaojiaoshi} \\
%   \NKT@tp@item{申请学位}{shenqingxuewei}&                 & \NKT@tp@item{培养单位}{peiyangdanwei}  \\
%   \NKT@tp@item{学科专业}{xuekezhuanye}  &                 & \NKT@tp@item{研究方向}{yanjiufangxiang}\\
%   \NKT@tpb@item{答辩委员会主席}{lukailing} & &\NKT@tpc@item{评阅人} {pingyueren}     
%  \end{tabular}

%   \vskip 10mm
%   \zihaosi\baselineskip 2.2em

%   南开大学研究生院

%   \NKT@keyvalue{lunwenwanchengshijian}
%   \end{center}
  \egroup}
