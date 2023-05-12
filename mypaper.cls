% 
% This is a simple LaTeX template for my paper.
% 


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mypaper}

\LoadClass{article}


% 英文默认字体
% fontspec 需在 ctex 宏包前面加载
\RequirePackage[no-math]{fontspec}
\setmainfont{Times New Roman}


% 引入中文环境宏包
% 第一个参数可避免修改章节标题时报错
\RequirePackage[heading=true,fontset=windows]{ctex}


% 
% 页面布局

\RequirePackage{geometry,fancyhdr,lastpage}

\geometry{
  paper       = a4paper,
  vmargin     = 2.50cm,
  hmargin     = 2.00cm,
  headheight  = 0.75cm,
  headsep     = 0.30cm,
  footskip    = 0.75cm,
}


% 
% 定义字体字号
\def\@titlefont{\rmfamily\bfseries\fontsize{14bp}{16.8bp}\selectfont}
\def\@infofont{\rmfamily\mdseries\fontsize{10.5bp}{12.6bp}\selectfont}

\def\@abstractfont{\rmfamily\mdseries\fontsize{9bp}{10.8bp}\selectfont}
\def\@sectionfont{\rmfamily\bfseries\fontsize{12bp}{14.4bp}\selectfont}
\def\@subsectionfont{\rmfamily\bfseries\fontsize{11bp}{13.2bp}\selectfont}

\def\@headerfont{\rmfamily\mdseries\fontsize{9bp}{10.8bp}\selectfont}

\def\@mainfont{\rmfamily\mdseries\fontsize{10.5bp}{12.6bp}\selectfont}
\def\@captionfont{\rmfamily\bfseries\fontsize{10.5bp}{12.6bp}\selectfont}
\def\@captiontextfont{\rmfamily\mdseries\fontsize{10.5bp}{12.6bp}\selectfont}
\def\@bibfont{\rmfamily\mdseries\fontsize{10.5bp}{12.6bp}\selectfont}


% 
% 定义页面样式

\fancypagestyle{titlestyle}{
  \fancyhf{}
  \fancyhead[c]{\@headerfont\@title}
  \fancyfoot[c]{\thepage}
}
\fancypagestyle{mainstyle}{
  \fancyhf{}
  \fancyhead[c]{\@headerfont\@title}
  \fancyfoot[c]{\thepage}
}


% 
% 标题

\renewenvironment{titlepage}{%
  \thispagestyle{titlestyle}
}{}
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \begin{center}
      \begin{tabular}{c}
        ~                  \\
        \@titlefont\@title \\
        ~                  \\
        \@infofont\@author \\
        \@infofont\@date   \\
        ~                  \\
      \end{tabular}
    \end{center}
  \end{titlepage}
}


% 
% 摘要

\renewcommand{\abstractname}{Abstract}
\renewenvironment{abstract}{%
  \@abstractfont
  \begin{center}
    \textbf{\abstractname}\vspace{-.5em}\vspace{\z@}%
  \end{center}
  \quotation
}{\endquotation}
\newcommand{\keywords}[1]{\par\textbf{Key Words:} #1}


% 
% 正文版面

\newcommand{\mainmatter}{%
  \pagestyle{mainstyle}
  \@mainfont
}


% 
% 章节段落

\ctexset{
  section = {
    format      = \raggedright\@sectionfont,
    aftername   = \hspace{1em},
    beforeskip  = 24bp,
    afterskip   = 6bp,
   },
  subsection = {
      format      = \raggedright\@subsectionfont,
      aftername   = \hspace{1em},
      beforeskip  = 12bp,
      afterskip   = 6bp,
    }
}


% 
% 图表

\RequirePackage{array,multirow,booktabs,tabularx}
\RequirePackage{graphicx,subfigure,caption}
% - \pkg{array}       调整表格整列修饰格式
% - \pkg{booktabs}    排版三线表
% - \pkg{multirow}    提供多行合并命令
% - \pkg{tabularx}    生成能够调整列宽的命令
% - \pkg{caption}     修改图标格式

% 默认图片存储路径
\graphicspath{{figures/}}

\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}

% 图表字体格式
\DeclareCaptionFont{captiontextfont}{\@captiontextfont}
\DeclareCaptionFont{captionfont}{\@captionfont}

% refer: https://latex-tutorial.com/caption-customization-latex/
\captionsetup{
  font           = captionfont,
  textfont       = captiontextfont,
  labelsep       = colon,
  skip           = 3bp,           % 图表名与图表或图表与图表标注之间距离 3bp
  figureposition = bottom,
  tableposition  = top,
}

% 图表标注 
\newcommand{\note}[1]{%
  \begingroup
  \captionsetup{
    % 内容缩进距离
    margin        = 2em,
    position      = bottom,
  }%
  \caption*{{\rmfamily\bfseries Note:}#1}%
  \endgroup
}


% 
% 列表

% 有序列表
\RequirePackage{enumerate}
% 调整列表格式
\RequirePackage{enumitem}
% 取消列表item间多余的空隙
\setlist{
  nosep
}


% 
% 数学环境

% 数学相关宏包

\RequirePackage{amsmath,amstext}

% \RequirePackage{unicode-math}
% \RequirePackage{amssymb}

% 数学字体
\RequirePackage[notext]{stix}

% 国际单位
\RequirePackage{siunitx}
% \newcommand{\si}[1]{\mathrm{#1}}

% 所有公式按行间格式显示
\everymath{\displaystyle}

\renewcommand{\eqref}[1]{Eq.(\ref{#1})}
\newcommand{\figref}[1]{Fig.\ref{#1}}
\newcommand{\tabref}[1]{Tab.\ref{#1}}


% 
% 算法环境

\RequirePackage[ruled,vlined,linesnumbered]{algorithm2e}



% 
% 参考文献

\RequirePackage[sort]{natbib}
\RequirePackage{gbt7714}

% 参考文献格式
% refer: https://github.com/zepinglee/gbt7714-bibtex-style
\bibliographystyle{gbt7714-numerical}

\renewcommand{\refname}{References}

% 参考文献列表格式：续行缩进两字，左对齐
\renewcommand{\bibfont}{\@bibfont}
\setlength{\bibsep}{0\p@ \@plus.2\p@}
\renewcommand\@biblabel[1]{[#1]\hfill}
\setlength{\bibhang}{2em}

% 正文结尾用 \bibliography{`bib-name'} 即可罗列正文用 \cite{`key'} 引用的文献
% 用 \nocite{*} 可罗列 bib 中全部文献


% 
% 生成 PDF 书签

% 为防止报错, 该宏包需最后加载
\RequirePackage{hyperref}

\hypersetup{
  bookmarksnumbered  = true,    % 书签是否带章节编号，默认false
  bookmarksopen      = false,   % 是否展开书签，默认false
  bookmarksopenlevel = 1,
  linktoc            = all,
  unicode            = true,
  psdextra           = true,
  colorlinks         = true,
  allcolors          = blue,
}



% 
% 自定义命令

% 微分符号
\DeclareMathOperator\dif{d\!}

% 矢量设置为黑体
\renewcommand{\vec}[1]{\boldsymbol{#1}}

% derivative
% 可选参数为导数的阶数，默认为 1 阶
\newcommand{\der}[3][]{\frac{\mathrm{d}^{#1} #2}{\mathrm{d} {#3}^{#1}}}
% partial derivative
\newcommand{\pder}[2]{\frac{\partial #1}{\partial #2}}
% conditional partial derivative
\newcommand{\cpder}[3]{\left(\frac{\partial #1}{\partial #2}\right)_{#3}}
% variance derivative
\newcommand{\vder}[3][]{\frac{\delta^{#1} #2}{\delta {#3}^{#1}}}

% 定义 \dbar
\newcommand{\dbar}{\mathrm{d}\!\bar{}}

% 自然指数
\newcommand{\e}[1][]{\mathrm{e}^{#1}}

% 虚数
\newcommand{\im}{\mathrm{i}}
\renewcommand{\Re}{\operatorname{Re}}
\renewcommand{\Im}{\operatorname{Im}}

% 迹
\newcommand{\tr}[1]{\,\mathrm{tr}\,{#1}}

% 行列式
\newenvironment{determinant}{%
  \left|%
  \begin{matrix}}{%
  \end{matrix}
  \right|%
}


\def\@author{Author}
\def\@title{Title}

\ctexset{today=old}

