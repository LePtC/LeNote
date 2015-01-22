%--------------------------------------------------
% LePtC 双语彩色笔记模版 - 中文报告
% filename  = leptc.sty
% author = LePtC
% version = 2014.12
% email = alileptc@gmail.com
% available on GitHub: https://github.com/LePtC/LeNote
%--------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{leptc}


\LoadClass[11pt, onecolumn]{article} % [UTF8]
% 其它 pt 用 \LoadClass[14pt]{extarticle}
% 最后各科笔记合并时改为 book

\newcommand{\HUGE}{\fontsize{29pt}{29pt}\selectfont}


%--------------------------------------------------
% 页面设置
\RequirePackage[a4paper, top=50pt, bottom=50pt, left=50pt, right=50pt]{geometry}
%--------------------------------------------------

% \RequirePackage{indentfirst}
\setlength{\parindent}{0em} % 要首行缩进
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
\renewcommand{\arraystretch}{1.2} % 后面矩阵会单独处理
\setlength{\tabcolsep}{5pt} % 表格列间距又太多...

\RequirePackage{subfigure}

\RequirePackage{caption}
% \RequirePackage{subcaption}
\setlength{\abovecaptionskip}{0pt} % 图表都另外做标题
\setlength{\belowcaptionskip}{2pt}
\setlength{\intextsep}{2pt}

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
\setCJKmainfont[BoldFont=Adobe Heiti Std, ItalicFont=Adobe Kaiti Std]{Adobe Fangsong Std}
\setCJKfamilyfont{hei}{Adobe Heiti Std}
\newcommand{\hei}{\CJKfamily{hei}} 
\setCJKfamilyfont{kai}{Adobe Kaiti Std}
\newcommand{\kai}{\CJKfamily{kai}} 

% 自动把 l 全部换成 \ell
\mathcode`l="8000
\begingroup
\makeatletter
\lccode`\~=`\l
\DeclareMathSymbol{\lsb@l}{\mathalpha}{letters}{`l}
\lowercase{\gdef~{\ifnum\the\mathgroup=\m@ne \ell \else \lsb@l \fi}}%
\endgroup




%--------------------------------------------------
% LePtC 彩色条目
\RequirePackage{titlesec}
%--------------------------------------------------


% 章标题 ---------------

\titleformat{\section}{\Large\hei}{\Large\hei{\thesection}}{15pt}{}
% no number
% \titleformat{\section}{\centering\large\hei\color{w}}{}{5pt}{\colorbox{p}}

% \newcommand{\chap}[1]{\vspace{10pt}\begin{minipage}{\textwidth}\vspace{10pt}{\color{p}\line(1,0){540}}\vspace{-38.5pt}\section{#1}\label{#1}\end{minipage}}



\RequirePackage{leptc}


%--------------------------------------------------
% 其它常用包

%--------------------------------------------------


% TEMPLATE ---------------

\RequirePackage[xetex,colorlinks,unicode,pdfencoding=auto]{hyperref} 
% 超链接包，unicode 和 \chap 有冲突？
% \hypersetup{linkcolor=\color{o}, citecolor = \color{o}}


\def\thudot{\unskip.}
\bibliographystyle{thubib} % 参考文献格式
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}


\RequirePackage{datetime} % 当前时间
%设置日期格式
\renewcommand{\today}{\number\year 年 \number\month 月 \number\day 日}

\RequirePackage{ulem} % 删除线 \sout{...}
\RequirePackage{soul} % 高亮工具 \hl{...} \st{...}

% http://tex.stackexchange.com/questions/48706/feynmf-doesnt-produce-feynman-diagram-at-all-in-txc
% \RequirePackage{feynmp} % 用法：记得给整个文档包上
% \begin{fmffile}{feynman}
% \end{fmffile}


\newenvironment{cabstract}{
    \par {\hei 摘要：}}{
    \par {\hei 关键词：}
}

\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\RequirePackage{afterpage}
\newcommand\blankpage{%
\null
\thispagestyle{empty}%
\addtocounter{page}{-1}%
\newpage}




\endinput
