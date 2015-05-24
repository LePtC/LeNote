%--------------------------------------------------
% LePtC 双语彩色笔记模版 - 笔记
% filename  = leptc.sty
% author = LePtC
% version = 2015.05
% email = alileptc@gmail.com
% available on GitHub: https://github.com/LePtC/LeNote
%--------------------------------------------------
% 本模版用于 xelatex+xeCJK 方案，编译命令为：
% xelatex --quiet --synctex=1 -interaction=nonstopmode $(NAME_PART).tex
% 文档前加入 \documentclass{leptc} 即可
%--------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{leptc}

\LoadClass[12pt]{article} % [UTF8,noindent]{ctexart}
% 其它 pt 用 \LoadClass[14pt]{extarticle}
% 最后各科笔记合并时改为 book



%--------------------------------------------------
% 页面设置
\RequirePackage[a4paper, top=30pt, bottom=25pt, left=30pt, right=30pt]{geometry}
%--------------------------------------------------


\setlength{\parindent}{0pt} % 不要首行缩进
\linespread{1.2} % 行间距放大，否则对于表格太紧了

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



%--------------------------------------------------
% 字体设置
% \RequirePackage{CJK} % 旧版 dvipdfmx 解决方案
\RequirePackage[no-math]{fontspec}
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


\setmainfont{Times New Roman}
% \setCJKmainfont[BoldFont=Adobe Heiti Std, ItalicFont=Adobe Kaiti Std]{Adobe Fangsong Std}
% \setCJKfamilyfont{hei}{Adobe Heiti Std}
\setCJKmainfont{Adobe Fangsong Std}
\setCJKfamilyfont{hei}{方正准圆_GBK}
\newcommand{\hei}{\CJKfamily{hei}}
% \setCJKfamilyfont{kai}{Adobe Kaiti Std}
% \newcommand{\kai}{\CJKfamily{kai}}

% 自动把 l 全部换成 \ell
% \mathcode`l="8000
% \begingroup
% \makeatletter
% \lccode`\~=`\l
% \DeclareMathSymbol{\lsb@l}{\mathalpha}{letters}{`l}
% \lowercase{\gdef~{\ifnum\the\mathgroup=\m@ne \ell \else \lsb@l \fi}}%
% \endgroup




%--------------------------------------------------
% LePtC 双语词条
\RequirePackage{ruby}
%--------------------------------------------------


\renewcommand{\rubysize}{0.7}
\renewcommand{\rubysep}{-0.1ex}
% 英文为 Verdana 体
\newcommand{\eng}[2][]{\ruby{#2}{\textnormal{\fontspec{Verdana}#1}}}
% 英文注在右侧
\newcommand{\engr}[2][]{#2\ \textnormal{\small\fontspec{Verdana}#1}}

\setlength\fboxsep{1pt} % 设框的偏移
\setlength\fboxrule{0.5pt} % 设框宽 \fcolorbox{b}{b}{text}

\newcommand{\entc}[2][]{{\color{b}\textnormal{
	\hei
	\ruby{{\fcolorbox{b}{w}{{\color{b}#2}}}}
	{\fontspec{Verdana}#1}
}}}

% \ruby 默认居中对齐，没有左对齐的选项，用 box 重新计算左对齐的宽度...
\RequirePackage{calc}
\newcommand{\ent}[2][]{{\textnormal{
	\hei
	\ruby{{\hspace{-3pt}\fcolorbox{b}{w}{{\color{b}#2}}\hspace{-3pt}}}
	{{\hspace{3pt}\color{b}\makebox[\widthof{#2}+\widthof{#2}/2][l]{\fontspec{Verdana}#1}}
	}
}}}

% label, 用于"例","定理","推论"等
\newcommand{\enl}[1]{{\colorbox{b}{{\hei\color{w}#1}}}}

% 带圈数字序号
\def\N#1{{\color{b}\scalebox{1.2}{\raisebox{.5pt}{\textcircled{\scalebox{0.8}{\raisebox{-.4pt}{$\mathbf{#1}$}}}}}}}

% 首字母缩写
\renewcommand{\B}[1]{{\textbf{#1}}}



%--------------------------------------------------
% LePtC 彩色条目
\RequirePackage{titlesec}
%--------------------------------------------------


% 章标题 ---------------

% \titleformat{\section}{\centering\large\hei\color{w}}{\Large{\color{p}\fontspec{Adobe Heiti Std}\thesection}}{5pt}{\colorbox{r}}
% no number
\titleformat{\section}{\centering\large\hei\color{w}}{}{5pt}{\colorbox{p}}

\newcommand{\chap}[1]{\vspace{10pt}\begin{minipage}{\textwidth}\vspace{10pt}{\color{p}\line(1,0){540}}\vspace{-38.5pt}\section{#1}\label{#1}\end{minipage}}






\RequirePackage{leptc}

\endinput
