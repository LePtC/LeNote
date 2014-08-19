%--------------------------------------------------
% LePtC 双语彩色笔记模版
% filename  = leptc.sty
% author = LePtC
% version = 2014.08
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
% 最后各科笔记合并时改为 book



%--------------------------------------------------
% 页面设置
\RequirePackage[a4paper, top=10pt, bottom=15pt, left=20pt, right=20pt]{geometry}
%--------------------------------------------------


\setlength{\parindent}{0pt} % 不要首行缩进
\linespread{1.1} % 行间距放大，否则对于表格太紧了

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
\setlength{\tabcolsep}{2pt} % 表格列间距又太多...

\RequirePackage{subcaption}
\RequirePackage[skip=0pt,labelsep=none]{caption}
% \setlength{\abovecaptionskip}{0pt} % 图表都另外做标题
% \setlength{\belowcaptionskip}{0pt}
% \setlength{\intextsep}{2pt}



%--------------------------------------------------
% 字体设置
% \RequirePackage{CJK} % 旧版 dvipdfmx 解决方案
\RequirePackage[no-math]{fontspec}
% \RequirePackage{mathptmx} % 这个不好看！
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{dtklogos} % 提供 \LaTeX \XeTeX 等
\RequirePackage{xeCJK} % 顺序必须放最后 ...
%--------------------------------------------------


\setmainfont{Times New Roman}
\setCJKmainfont[BoldFont=Adobe Heiti Std, ItalicFont=Adobe Kaiti Std]{Adobe Fangsong Std}
\setCJKfamilyfont{hei}{Adobe Heiti Std}
\newcommand{\hei}{\CJKfamily{hei}} 



%--------------------------------------------------
% 定义颜色
\RequirePackage{color}
%--------------------------------------------------


\definecolor{r}{RGB}{208,18,27} % InDesign 红色
\definecolor{g}{RGB}{42,167,56} % InDesign 绿色
\definecolor{b}{RGB}{12,51,136} % InDesign 蓝色

\definecolor{o}{RGB}{255,128,0} % 高亮橙
\definecolor{p}{RGB}{128,0,128} % 清华紫

\definecolor{y}{RGB}{150,150,150} % 灰，仿铅笔
\definecolor{w}{RGB}{255,255,255} % 白，用于反色



%--------------------------------------------------
% 函数名的自动高亮，包括三角函数等，不包括大型运算符类函数
\RequirePackage{letltxmacro} % 替换原有的 command
\RequirePackage{ifthen}
\RequirePackage{xifthen} % \ifthenelse
%--------------------------------------------------


% 函数名称高亮橙色 ---------------

\LetLtxMacro{\oldlog}{\log}
\renewcommand{\log}{{\color{o}\,\oldlog\,}}
\LetLtxMacro{\oldlg}{\lg}
\renewcommand{\lg}{{\color{o}\,\oldlg\,}}
\LetLtxMacro{\oldln}{\ln}
\renewcommand{\ln}{{\color{o}\,\oldln\,}}

% 自然对数正体，元电荷量斜体
\newcommand{\e}{{\color{o}\mathrm{e}}} 
\renewcommand{\exp}[1][]{
	{\color{o}\mathrm{exp}}
	\ifthenelse{\equal{#1}{}}{}{
	\ensuremath{\left( #1 \right)}
}}

\LetLtxMacro{\oldsin}{\sin}
\renewcommand{\sin}{{\color{o}\,\oldsin\,}}
\LetLtxMacro{\oldcos}{\cos}
\renewcommand{\cos}{{\color{o}\,\oldcos\,}}
\LetLtxMacro{\oldtan}{\tan}
\renewcommand{\tan}{{\color{o}\,\oldtan\,}}
\LetLtxMacro{\oldcot}{\cot}
\renewcommand{\cot}{{\color{o}\,\oldcot\,}}

\LetLtxMacro{\oldarcsin}{\arcsin}
\renewcommand{\arcsin}{{\color{o}\,\oldarcsin\,}}
\LetLtxMacro{\oldarccos}{\arccos}
\renewcommand{\arccos}{{\color{o}\,\oldarccos\,}}
\LetLtxMacro{\oldarctan}{\arctan}
\renewcommand{\arctan}{{\color{o}\,\oldarctan\,}}

\newcommand{\sinc}{{\color{o}\,\mathrm{sinc}\,}}

\renewcommand{\H}{{\color{o}\,\mathrm{H}\,}} % 厄米函数
\renewcommand{\L}{{\color{o}\,\mathrm{L}\,}} % 拉盖尔函数

\renewcommand{\Re}[1]{{{\color{o}\text{Re}}\left[#1\right]}}

% 粗体被注册为群，双线被注册为数域，花体泛函
% 字母形的算符高亮绿色
\newcommand{\Fo}[1]{{\ensuremath{{\color{g}\mathcal{F}}\left[#1\right]}}}

% \lim \sum \max \min 之类不作处理
% 图画符号（\prime，根号）即使是算符不上色,因为有麻烦 ...
% TODO: \mathcal 表示范畴或者描述渐进行为的大O记号，\mathfrak表示李群对应的李代数  \mathfrak{g}, \mathfrak{h}



%--------------------------------------------------
% commath 包的进一步扩展，包括导数、偏导数
% \RequirePackage{commath} 这个包实现的不好 →_→
%--------------------------------------------------


% 单个字母 ---------------

% 微分算符正体，带指数的用法 \dif[2]
\newcommand{\dif}[1][]{{\color{g}\,\ensuremath{\mathrm{d^{#1}}}}} 
% TODO: \ensuremath{\,\mathrm{d}#1\@ifnextchar\dif{\,}{}}

% 协变导数
\newcommand{\Dif}{{\color{g}\mathrm{D}}} 

% 偏导数
\LetLtxMacro{\oldpartial}{\partial}
\renewcommand{\partial}[1][]{{\color{g}\,\ensuremath{\oldpartial^{#1}}}}

% 矢量微分算符，可作梯度、散度、旋度、拉普拉斯算符
\LetLtxMacro{\oldnabla}{\nabla}
\renewcommand{\nabla}{{\color{g}\oldnabla}}
\newcommand{\nablad}{{\color{g}\oldnabla\cdot}}
\newcommand{\nablat}{{\color{g}\oldnabla\times}}
\newcommand{\nablas}{{\color{g}\oldnabla^2}}

\LetLtxMacro{\olddelta}{\delta}
\renewcommand{\delta}{{\color{g}\olddelta}}
% 拉普拉斯算符正体，表示相差用斜体
\LetLtxMacro{\oldDelta}{\Delta}
% \renewcommand{\Delta}{{\color{g}\oldDelta}}
\renewcommand{\Delta}{{\color{g}\varDelta}}

% 其它默认斜体
\LetLtxMacro{\oldPhi}{\Phi}
\renewcommand{\Phi}{\varPhi}

% 常微分分式 ---------------

\newcommand{\od}[3][]{\frac{\dif[#1] #2}{\dif #3^{#1}}}
% \left. \right| 不好看
% \mathchoice: display, text, script and scriptscript
\newcommand{\odat}[4][]{ \mathchoice
	{\od[#1]{#2}{#3}\Big|_{#4}} 
	{\od[#1]{#2}{#3}\big|_{#4}} 
	{\od[#1]{#2}{#3}|_{#4}} 
	{\od[#1]{#2}{#3}|_{#4}} 
}

% 偏微分分式  ---------------

\newcommand{\pd}[3][]{\frac{\partial[#1] #2}{\partial #3^{#1}}}
\newcommand{\pdat}[4][]{ \mathchoice
	{\Big(\pd[#1]{#2}{#3}\Big)_{#4}}
	{\big(\pd[#1]{#2}{#3}\big)_{#4}}
	{(\pd[#1]{#2}{#3})_{#4}}
	{(\pd[#1]{#2}{#3})_{#4}}
}
\newcommand{\md}[6]{\frac{\partial[#2] #1}{\partial{#3^{#4}}\partial{#5^{#6}}}}
\newcommand{\mdat}[7]{ \mathchoice
	{\left(\dmd{#1}{#2}{#3}{#4}{#5}{#6}\right)_{#7}}
	{(\tmd{#1}{#2}{#3}{#4}{#5}{#6})_{#7}}
	{(\md{#1}{#2}{#3}{#4}{#5}{#6})_{#7}}
	{(\md{#1}{#2}{#3}{#4}{#5}{#6})_{#7}}
}



%--------------------------------------------------
% esvect 包的进一步扩展，包括矢量、矢量导数、双矢量
\RequirePackage[b]{esvect} %（esvect 能不能出鱼叉选项啊 ...）
% \RequirePackage{harpoon}
%--------------------------------------------------


% 手写风格的矢量记号  ---------------

% \RequirePackage{accents} % 和 hyperref 冲突！
\newcommand{\tightoverset}[2]{
	\mathop{#2}\limits^{\vbox to -.5ex{\kern-0.8ex\hbox{$#1$}\vss}}}

% 矢量与导数  ---------------

\renewcommand{\vec}[1]{\vv{#1}}
% \renewcommand{\vec}[1]{\overrightharp{#1}}
\newcommand{\vecd}[1]{\dot{\vec{#1}}}
\newcommand{\vecdd}[1]{\ddot{\vec{#1}}}

% 方便单位矢量
\newcommand{\ve}[1]{\,\vec{e_{#1}}} 
\newcommand{\ved}[1]{\,\vecd{e_{#1}}} 
\newcommand{\vedd}[1]{\,\vecdd{e_{#1}}} 

% 发明一种新的记号区分对t求导和对s求导（待议） ---------------

% \newcommand{\vecp}[1]{\accentset{\prime}{\vv{#1}}}
% \newcommand{\vecpp}[1]{\accentset{\prime\prime}{\vv{#1}}}
% \newcommand{\ap}[1]{\accentset{\prime}{#1}}

% 双矢量  ---------------

\newcommand{\dvec}[1]{\overset{ }{\tightoverset{\fldr\joinrel\fldr}{#1}}}
\newcommand{\dvecd}[1]{\dot{\dvec{#1}}}
\newcommand{\dvecdd}[1]{\ddot{\dvec{#1}}}



%--------------------------------------------------
% 方便矩阵，包括方括号矩阵、行列式

%--------------------------------------------------


% 默认矩阵还是方括号好看 ---------------

% 自定义缩放 \mat[.7]{x\\y\\z}
\newcommand{\mat}[2][1.0]{
	\scalebox{#1}{
		\renewcommand{\arraystretch}{.8}
		\hspace{-10pt}
		$\begin{bmatrix}#2\end{bmatrix}$
		\hspace{-8pt}
	}
} 

% 行列式包直线 ---------------

\newcommand{\dmat}[2][1.0]{
	\scalebox{#1}{
		\renewcommand{\arraystretch}{.8}
		\hspace{-10pt}
		$ \left| \begin{matrix}#2\end{matrix} \right| $
		\hspace{-8pt}
	}
}

% nothing ---------------

\newcommand{\nmat}[2][1.0]{
	\scalebox{#1}{
		\renewcommand{\arraystretch}{.8}
		\hspace{-10pt}
		$\begin{matrix}#2\end{matrix}$
		\hspace{-8pt}
	}
}



%--------------------------------------------------
% 方便贴图，包括并排插图、右侧贴图
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{stfloats}
%--------------------------------------------------


\graphicspath{{figure/}} % 图片都放在 figure 文件夹下

% 普通插图 ---------------

% \figin[相对宽度]{图片文件名}
\newcommand{\figin}[2][1.0]{ 
	\includegraphics[width=#1\textwidth]{#2}
}
\newcommand{\fig}[2][1.0]{ 
	\begin{figure}[!htb]\centering
		\figin[#1]{#2}
	\end{figure}
}

% 并排插图 ---------------

\newcommand{\figg}[6]{ 
	\begin{figure}[!htb]\centering
		\begin{subfigure}[!htb]{#2\textwidth}\vspace{#3 pt}
			\includegraphics[width=\textwidth]{#1}
		\end{subfigure}
		\begin{subfigure}[!htb]{#5\textwidth}\vspace{#6 pt}
			\includegraphics[width=\textwidth]{#4}
		\end{subfigure}
	\end{figure}
}
\newcommand{\figgg}[9]{
	\begin{figure}[!htb]\centering
		\begin{subfigure}[!htb]{#2\textwidth}\vspace{#3 pt}
			\includegraphics[width=\textwidth]{#1}
		\end{subfigure}
		\begin{subfigure}[!htb]{#5\textwidth}\vspace{#6 pt}
			\includegraphics[width=\textwidth]{#4}
		\end{subfigure}
		\begin{subfigure}[!htb]{#8\textwidth}\vspace{#9 pt}
			\includegraphics[width=\textwidth]{#7}
		\end{subfigure}
	\end{figure}
}

% \RequirePackage{wrapfig} 放弃，文字环绕各种乱跑
% 手动用表格实现混排 ---------------

\def\imagetop#1{\vtop{\null\hbox{#1}}}
\newcommand{\figr}[3]{
	{\setlength{\tabcolsep}{2pt}
	\begin{tabular}{@{}p{{\textwidth-#2\textwidth}}p{#2\textwidth}@{}}
	\vspace{-14 pt}
		{#3}
		&{\raisebox{-\totalheight+\baselineskip}{\includegraphics[width=#2\textwidth]{#1}}}
	\end{tabular}}
}



%--------------------------------------------------
% 方便贴源代码
\RequirePackage{listings}  
%--------------------------------------------------


% \newcommand{\code}[1]{{\fontspec{Consolas}%
% \begin{lstlisting}[language={[LaTeX]TeX}] %
	% #1%
% \end{lstlisting}%
% }}

% \newcommand{\codev}[1]{{\colorbox{y}{\color{white}\verb|#1|}}}
\newcommand{\code}[1]{\colorbox{y}{\lstinline[basicstyle=\ttfamily\color{w}]|#1|}}

\newcommand{\file}[1]{{\fcolorbox{y}{w}{\ttfamily{#1}}}}



%--------------------------------------------------
% LePtC 双语词条
\RequirePackage{ruby}
%--------------------------------------------------


\renewcommand{\rubysize}{0.7}
\renewcommand{\rubysep}{-0.1ex} 
% 英文为 Verdana 体
\newcommand{\eng}[2][]{\ruby{#2}{\textnormal{\fontspec{Verdana}#1}}} 
% 英文注在右侧
\newcommand{\engs}[2][]{#2\ \textnormal{\small\fontspec{Verdana}#1}} 

\setlength\fboxsep{1pt} % 设框的偏移 
\setlength\fboxrule{1pt} % 设框宽 \fcolorbox{b}{b}{text}

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



%--------------------------------------------------
% LePtC 彩色条目
\RequirePackage{titlesec}
%--------------------------------------------------


% 章标题 ---------------

\titleformat{\section}{\centering\large\hei\color{w}}{\Large{\color{r}\fontspec{Adobe Heiti Std}\thesection}}{5pt}{\colorbox{r}}
\newcommand{\chap}[1]{\vspace{10pt}\begin{minipage}{\textwidth}\vspace{10pt}{\color{r}\line(1,0){550}}\vspace{-37.6pt}\section{#1}\label{#1}\end{minipage}}

% 其它环境 ---------------
 
% 灰色代表注释笔记
\newcommand{\com}[1]{{\color{y}\,(#1)}} 
% 中括号代表证明
\newcommand{\prv}[1]{{\color{y}{[#1]}}} 
% \newcommand{\prv}[1]{{\color{y}{\ensuremath{\left[\text{#1}\right]}}}}
% 红色尖括号代表链接
\newcommand{\link}[2][]{{\color{r}{$\langle$#1$-$\nameref{#2}$\rangle$}}} 



%--------------------------------------------------
% 补充特殊格式
% （物理单位、函数正体，变量、粒子符号斜体）
%--------------------------------------------------


% 方便括号配对，整篇文档不需要出现 $
\newcommand{\eq}[1]{\,$ #1 $\,}
\newcommand{\eqd}[1]{\,$\displaystyle #1 $\,}

% 物理单位高亮紫色 ---------------

% 虚数单位正体
% \RequirePackage{bbm} % Mathematica 狂人可设 e i 双线体 \mathbbm{i}
\newcommand{\ii}{{\color{p}\mathrm{i}}} 

% \RequirePackage{siunitx} % 物理单位紫色，用法\SI{134.976}{MeV} 
% 改用下面这种方案了
\newcommand{\uni}[1]{{\ensuremath{\color{p}\ \mathrm{#1}}}} 

\renewcommand{\le}{\leqslant}
\renewcommand{\ge}{\geqslant}

% 字母大型运算符加粗
\LetLtxMacro{\oldmax}{\max}
\renewcommand{\max}{\mathop{\boldsymbol\oldmax}}
\LetLtxMacro{\oldmin}{\min}
\renewcommand{\min}{\mathop{\boldsymbol\oldmin}}

% spacing ---------------

\LetLtxMacro{\oldrightarrow}{\rightarrow}
\renewcommand{\rightarrow}{\ \oldrightarrow\ }
\LetLtxMacro{\oldLeftrightarrow}{\Leftrightarrow}
\renewcommand{\Leftrightarrow}{\ \oldLeftrightarrow\ }



%--------------------------------------------------
% 补充特殊符号
\RequirePackage{braket} % 提供量子力学常用
\RequirePackage{wasysym} % 提供 \apprge \apprle
\RequirePackage{esint} % 提供 \varoiint，要 overide 掉 amsmath
%--------------------------------------------------


\newcommand{\LePtC}{L\hspace{-3pt}\raisebox{3pt}{e}P\hspace{-1pt}\raisebox{-2pt}{\scalebox{0.7}{t}}C}

% text 中打 $\sim$
\newcommand{\tld}{{\raise.17ex\hbox{$\scriptstyle\mathtt{\sim}$}}}

% 区分一撇 comma 和求导 slash，会覆盖掉 accent commands
\newcommand{\co}{{^{\raisebox{3pt}{,}}}}
% \renewcommand{\b}{^{\backprime}}

%\RequirePackage{mhchem} % 化学公式
\newcommand{\ce}[1]{$\mathrm{#1}$}

% 等号上面写东西
\newcommand{\onequal}[1]{\overset{\text{#1}}{=\joinrel=}}

\newcommand{\abs}[1]{\left|#1\right|}

\newcommand{\E}[1]{\times10^{#1}} % 方便数量级

\newcommand{\con}{{\text{常数}}} % 中文不好使？...
% \newcommand{\con}{Const.}
\newcommand{\cc}{\text{c.c.}} % 复共轭
% \newcommand{\~}{$\sim$} % text 模式用

% 垂直 \perp 平行 \parallel 但这个平行是竖线，我想要斜的
\newcommand{\para}{\mathbin{\,/\mkern-5mu/\,}}

% 理论力学，内力外力 ---------------

\newcommand{\inter}{^{(\mathrm{i})}}
\newcommand{\exter}{^{(\mathrm{e})}}

% 热学 ---------------

\newcommand{\kb}{k_\mathrm{B}}
\newcommand{\NA}{N_\mathrm{A}}

% 角度，温度 ---------------

\renewcommand{\deg}{^\circ} % text 模式用 \textsuperscript{}

\newcommand{\oC}{{\ensuremath{\color{p}\,^{\circ}{\mathrm C}}}}
\newcommand{\oF}{{\ensuremath{\color{p}\,^{\circ}{\mathrm F}}}}

% 光学 ---------------
% \renewcommand{\o}{\mathrm{o}} % 非寻常光？...

% bar ---------------

\def\dbar{{{\color{g}\mathchar'26\mkern-12mu \mathrm{d}}}}

\makeatletter
\newcommand{\lambdabar}{{\mathchoice
	{\smash@bar\textfont\displaystyle{0.25}{1.2}\lambda}
	{\smash@bar\textfont\textstyle{0.25}{1.2}\lambda}
	{\smash@bar\scriptfont\scriptstyle{0.25}{1.2}\lambda}
	{\smash@bar\scriptscriptfont\scriptscriptstyle{0.25}{1.2}\lambda}
}}
\newcommand{\smash@bar}[4]{%
	\smash{\rlap{\raisebox{-#3\fontdimen5#10}{$\m@th#2\mkern#4mu\mathchar'26$}}}%
}
\makeatother



%--------------------------------------------------
% 其它常用包

%--------------------------------------------------


% TEMPLATE ---------------

\RequirePackage[xetex,colorlinks,unicode,pdfencoding=auto]{hyperref} 
% 超链接包，unicode 和 \chap 有冲突？
% \hypersetup{linkcolor=\color{r}, citecolor = \color{r}}

% \RequirePackage[sort&compress]{natbib} % 参考文献包
% \setlength{\bibsep}{0pt}
% \RequirePackage{hypernat}

\RequirePackage{datetime} % 当前时间
\settimeformat{hhmmsstime}

\RequirePackage{soul} % 高亮工具 \hl{...}

% http://tex.stackexchange.com/questions/48706/feynmf-doesnt-produce-feynman-diagram-at-all-in-txc
% \RequirePackage{feynmp} % 用法：记得给整个文档包上
% \begin{fmffile}{feynman}
% \end{fmffile}











\endinput
