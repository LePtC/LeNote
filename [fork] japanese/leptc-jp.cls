%--------------------------------------------------
% LePtC 双语彩色笔记模版 - 日语
% filename  = leptc-jp.cls
% author = LePtC
% version = 2015.07
% email = alileptc@gmail.com
% available on GitHub: https://github.com/LePtC/LeNote
%--------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{leptc}

\LoadClass[12pt]{article} % [UTF8,noindent]{ctexart}
% 其它 pt 用 \LoadClass[14pt]{extarticle}
% 最后各科笔记合并时改为 book



%--------------------------------------------------
% 页面设置
\RequirePackage{marginnote}
\RequirePackage[a4paper, top=30pt, bottom=30pt, left=30pt, right=330pt, outer=300pt, marginparwidth=250pt, marginparsep=10pt]{geometry}
%--------------------------------------------------


\setlength{\parindent}{0pt} % 不要首行缩进
\linespread{1.4} % 行间距放大，否则对于表格太紧了

% 公式设置 ---------------

\setlength{\thickmuskip}{1 mu} % 等号两边空太大
\setlength{\medmuskip}{1 mu}
\setlength{\thinmuskip}{2 mu} % 会缩小 \, 的距离

% 中括号大括号有特殊含义，公式中多层括号尽量都用圆括号
\delimitershortfall-1sp % 嵌套括号尺寸总是递增

% 环境设置 ---------------

\RequirePackage{enumitem} % 罗列功能，好像没啥用？
\setlist[enumerate]{itemsep=0pt}

\RequirePackage{tabularx}
\RequirePackage{multirow}
\setlength{\extrarowheight}{2pt} % 表格上下还是太紧
\renewcommand{\arraystretch}{1.0} % 后面矩阵会单独处理
\setlength{\tabcolsep}{5pt} % 表格列间距又太多...

\RequirePackage{subcaption}
\RequirePackage[skip=0pt,labelsep=none]{caption}
% \setlength{\abovecaptionskip}{0pt} % 图表都另外做标题
% \setlength{\belowcaptionskip}{0pt}
% \setlength{\intextsep}{2pt}

% \newcommand{\ski}{\vspace{3pt}} % 手动小间距

\setlength{\footskip}{20pt} % 页码位置
\renewcommand{\thepage}{- \arabic{page} -} % 页码样式 arabic,roman,alph


%--------------------------------------------------
% 字体设置
% \RequirePackage{CJK} % 旧版 dvipdfmx 解决方案
\RequirePackage{fontspec}
% \RequirePackage{mathptmx} % 这个不好看！
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
% 解决 math 和 text 里逗号不一样的问题
\RequirePackage[adobe-fangsong]{mathdesign}
\RequirePackage{mathrsfs} % \emf
% \RequirePackage{unicode-math} % 不兼容！
\RequirePackage{dtklogos} % 提供 \LaTeX \XeTeX 等
\RequirePackage{xeCJK} % 顺序必须放最后 ...
%--------------------------------------------------


\setmainfont{Gen Jyuu Gothic P Regular}
\setCJKmainfont{Gen Jyuu Gothic P Regular}
\setCJKfamilyfont{hei}{锐字云字库准圆体GBK}
\newcommand{\hei}{\CJKfamily{hei}}

% 自动把 l 全部换成 \ell
% \mathcode`l="8000
% \begingroup
% \makeatletter
% \lccode`\~=`\l
% \DeclareMathSymbol{\lsb@l}{\mathalpha}{letters}{`l}
% \lowercase{\gdef~{\ifnum\the\mathgroup=\m@ne \ell \else \lsb@l \fi}}%
% \endgroup




%--------------------------------------------------
% LePtC 彩色条目
\RequirePackage{titlesec}
%--------------------------------------------------


% 章标题 ---------------

% \titleformat{\section}{\centering\large\hei\color{w}}{\Large{\color{p}\fontspec{Adobe Heiti Std}\thesection}}{5pt}{\colorbox{r}}
% no number
\titleformat{\section}{\centering\large\color{w}}{}{5pt}{\colorbox{p}}

\newcommand{\chap}[2]{\vspace{10pt}
\begin{minipage}{\textwidth}
\vspace{10pt}{\color{p}\line(1,0){540}}
\vspace{-56pt}\section{#1}\label{#1}
\vspace{-10pt}
\begin{flushright}#2\end{flushright}
\vspace{4pt}
\end{minipage}}





% 右侧注释 ---------------

\newcommand{\mg}[1]{{\marginpar{\linespread{1}\footnotesize #1}}}

\newcommand{\cn}[1]{{\color{g}\hei #1}}


\newcommand{\ru}[2]{{\color{b}\ruby{#1}{#2}}}

\RequirePackage{leptc}

\renewcommand\rubysep{-0.5em}
\renewcommand{\rubysize}{0.6}

\newcommand{\notetime}{
\ \\

\begin{minipage}{\textwidth}
編者：\ \href{mailto:alileptc@gmail.com}{\LePtC}
\quad
\url{http://leptc.github.io/lenote }

\compiled
\end{minipage}
}

\endinput
