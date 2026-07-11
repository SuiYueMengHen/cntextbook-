\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cntextbook}[2026/07/04 Chinese textbook XeLaTeX template]

\newif\ifcntb@bfive
\newif\ifcntb@draft
\DeclareOption{a4}{\cntb@bfivefalse}
\DeclareOption{b5}{\cntb@bfivetrue}
\DeclareOption{draft}{\cntb@drafttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{a4}
\ProcessOptions\relax

\LoadClass[UTF8,zihao=-4,openany,fontset=none]{ctexbook}

\RequirePackage{iftex}
\RequirePackage{xparse}
\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{microtype}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocloft}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{unicode-math}
\RequirePackage{amsthm}
\RequirePackage[most]{tcolorbox}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{zhlipsum}
\RequirePackage{hyperref}
\RequirePackage[nameinlink,noabbrev]{cleveref}

\usetikzlibrary{calc,positioning,decorations.pathmorphing,patterns,shadows.blur}

\ifXeTeX\else
  \ClassError{cntextbook}{This template must be compiled with XeLaTeX}{Please use xelatex instead of pdflatex.}
\fi

\ifcntb@bfive
  \geometry{
    paperwidth=176mm,paperheight=250mm,
    top=24mm,bottom=22mm,inner=24mm,outer=20mm,
    headheight=24pt,headsep=7mm,footskip=9mm
  }
\else
  \geometry{
    a4paper,
    top=27mm,bottom=25mm,inner=30mm,outer=24mm,
    headheight=24pt,headsep=8mm,footskip=10mm
  }
\fi

\ifcntb@draft
  \overfullrule=5pt
\fi

% Font policy: use TeX Live bundled fonts for predictable cross-platform builds.
\defaultfontfeatures{Ligatures=TeX}
\setmainfont[
  UprightFont=texgyretermes-regular.otf,
  BoldFont=texgyretermes-bold.otf,
  ItalicFont=texgyretermes-italic.otf,
  BoldItalicFont=texgyretermes-bolditalic.otf
]{TeX Gyre Termes}
\setsansfont[
  UprightFont=texgyreheros-regular.otf,
  BoldFont=texgyreheros-bold.otf,
  ItalicFont=texgyreheros-italic.otf,
  BoldItalicFont=texgyreheros-bolditalic.otf
]{TeX Gyre Heros}
\setmonofont{lmmono10-regular.otf}
\setCJKmainfont[
  UprightFont=FandolSong-Regular.otf,
  BoldFont=FandolSong-Bold.otf,
  ItalicFont=FandolKai-Regular.otf
]{FandolSong}
\setCJKsansfont[
  UprightFont=FandolHei-Regular.otf,
  BoldFont=FandolHei-Regular.otf
]{FandolHei}
\setCJKmonofont{FandolFang-Regular.otf}
\setCJKfamilyfont{song}[
  UprightFont=FandolSong-Regular.otf,
  BoldFont=FandolSong-Bold.otf,
  ItalicFont=FandolKai-Regular.otf
]{FandolSong}
\setCJKfamilyfont{hei}{FandolHei-Regular.otf}
\setCJKfamilyfont{kai}{FandolKai-Regular.otf}
\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaishu}{\CJKfamily{kai}}
\setmathfont{texgyretermes-math.otf}

\definecolor{cntbInk}{HTML}{202020}
\definecolor{cntbGray}{HTML}{666666}
\definecolor{cntbLightGray}{HTML}{E8E2D8}
\definecolor{cntbWarm}{HTML}{F7F3EC}
\definecolor{cntbRed}{HTML}{8F2F2B}
\definecolor{cntbRule}{HTML}{C9C1B3}

\hypersetup{
  colorlinks=true,
  linkcolor=cntbInk,
  citecolor=cntbInk,
  urlcolor=cntbRed,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfborder={0 0 0}
}

\linespread{1.35}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\setlist{nosep,leftmargin=2em,labelsep=.5em}
\numberwithin{equation}{chapter}
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\captionsetup{font=small,labelfont=bf,labelsep=quad}
\captionsetup[table]{position=top}

\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

\titleformat{\chapter}[display]
  {\centering\heiti\zihao{-2}\color{cntbInk}}
  {\zihao{4}第\thechapter 章}
  {1.2ex}
  {}
  [\vspace{.8ex}{\color{cntbRule}\titlerule[.6pt]}]
\titlespacing*{\chapter}{0pt}{-4pt}{28pt}

\titleformat{\section}
  {\heiti\zihao{4}\color{cntbInk}}
  {\thesection}{.8em}{}
\titlespacing*{\section}{0pt}{1.8ex plus .5ex minus .2ex}{1ex}

\titleformat{\subsection}
  {\heiti\zihao{-4}\color{cntbInk}}
  {\thesubsection}{.8em}{}
\titlespacing*{\subsection}{0pt}{1.4ex plus .4ex minus .2ex}{.8ex}

\renewcommand{\cftchapfont}{\heiti}
\renewcommand{\cftchappagefont}{\heiti}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftbeforechapskip}{6pt}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\small\thepage\quad\leftmark}
\fancyhead[RO]{\small\rightmark\quad\thepage}
\fancyhead[LO,RE]{}
\renewcommand{\headrulewidth}{.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{cntbRule}\leaders\hrule height \headrulewidth\hfill}}
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\small\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\newcommand{\booktitle}{书名}
\newcommand{\booksubtitle}{副标题}
\newcommand{\bookauthor}{作者}
\newcommand{\bookpublisher}{出版社}
\newcommand{\bookedition}{第一版}
\newcommand{\bookisbn}{ISBN 000-0-000-00000-0}
\newcommand{\bookdate}{\the\year 年}

\NewDocumentCommand{\BookInfo}{m m m m m m m}{%
  \renewcommand{\booktitle}{#1}%
  \renewcommand{\booksubtitle}{#2}%
  \renewcommand{\bookauthor}{#3}%
  \renewcommand{\bookpublisher}{#4}%
  \renewcommand{\bookedition}{#5}%
  \renewcommand{\bookisbn}{#6}%
  \renewcommand{\bookdate}{#7}%
}

\newcommand{\MakeTextbookCover}{%
  \begin{titlepage}
  \newgeometry{margin=0pt}
  \begin{tikzpicture}[remember picture,overlay]
    \fill[cntbWarm] (current page.south west) rectangle (current page.north east);
    \fill[cntbInk] (current page.south west) rectangle ($(current page.south west)+(19mm,\paperheight)$);
    \fill[cntbRed] ($(current page.north west)+(19mm,0)$) rectangle ($(current page.north west)+(23mm,-\paperheight)$);
    \fill[cntbLightGray] ($(current page.north east)+(-21mm,0)$) rectangle (current page.south east);
    \draw[cntbRule,line width=.7pt] ($(current page.north west)+(35mm,-35mm)$) rectangle ($(current page.south east)+(-34mm,35mm)$);
    \draw[cntbRule,line width=.35pt] ($(current page.north west)+(39mm,-39mm)$) rectangle ($(current page.south east)+(-38mm,39mm)$);

    \begin{scope}[shift={($(current page.center)+(30mm,7mm)$)},scale=1.08]
      \foreach \r/\op in {14/.10,24/.08,34/.06,44/.05}{
        \draw[cntbGray,opacity=\op,line width=.35pt] (0,0) circle (\r mm);
      }
      \draw[cntbInk,opacity=.68,line width=1.1pt]
        plot[smooth cycle,tension=.78] coordinates {(-2.6,1.5) (-1.2,2.2) (.4,1.8) (1.7,2.5) (2.8,1.1) (1.8,-.4) (2.3,-1.9) (.4,-1.5) (-.9,-2.3) (-2.0,-.7)};
      \draw[cntbRed,opacity=.72,line width=.65pt]
        plot[smooth,tension=.8] coordinates {(-3.6,-2.1) (-2.0,-1.3) (-1.1,.2) (.2,.7) (1.4,.5) (3.3,1.8)};
      \draw[cntbInk,opacity=.5,line width=.45pt]
        plot[smooth,tension=.8] coordinates {(-3.4,.9) (-1.9,1.2) (-.7,.4) (.6,-.2) (1.6,-1.1) (3.1,-1.3)};
      \node[anchor=center,text=cntbInk,opacity=.45,font=\kaishu\zihao{0}] at (0,0) {教};
    \end{scope}

    \node[anchor=north west,text=cntbInk,align=left] at ($(current page.north west)+(43mm,-45mm)$)
      {{\heiti\zihao{0}\booktitle}\\[9pt]{\kaishu\zihao{3}\color{cntbGray}\booksubtitle}};
    \draw[cntbRed,line width=1.2pt] ($(current page.north west)+(43mm,-92mm)$) -- ++(58mm,0);
    \node[anchor=north west,text=cntbInk,align=left,font=\zihao{4}] at ($(current page.north west)+(43mm,-103mm)$)
      {\bookauthor\ 编著};
    \node[anchor=south west,text=cntbInk,align=left,font=\small] at ($(current page.south west)+(43mm,39mm)$)
      {\bookedition\\[5pt]\bookisbn\\[5pt]\bookdate};
    \node[anchor=south east,text=cntbInk,font=\heiti\zihao{4}] at ($(current page.south east)+(-34mm,25mm)$)
      {\bookpublisher};
  \end{tikzpicture}
  \restoregeometry
  \end{titlepage}
}

\newcommand{\MakeHalfTitle}{%
  \cleardoublepage
  \thispagestyle{empty}
  \vspace*{.28\textheight}
  \begin{center}
    {\heiti\zihao{1}\booktitle\par}
    \vspace{1em}
    {\kaishu\zihao{4}\booksubtitle\par}
  \end{center}
  \cleardoublepage
}

\theoremstyle{definition}
\newtheorem{definition}{定义}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{exercise}{习题}[chapter]
\theoremstyle{plain}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{corollary}{推论}[chapter]
\theoremstyle{remark}
\newtheorem{remark}{注}[chapter]

\tcolorboxenvironment{definition}{
  enhanced,breakable,colback=cntbWarm,colframe=cntbRule,boxrule=.5pt,
  sharp corners,left=1.2em,right=1.2em,top=.7em,bottom=.7em
}
\tcolorboxenvironment{theorem}{
  enhanced,breakable,colback=white,colframe=cntbInk,boxrule=.55pt,
  sharp corners,left=1.2em,right=1.2em,top=.7em,bottom=.7em
}
\tcolorboxenvironment{example}{
  enhanced,breakable,colback=white,colframe=cntbRule,boxrule=.45pt,
  sharp corners,left=1.2em,right=1.2em,top=.7em,bottom=.7em
}

\crefname{chapter}{第}{第}
\crefname{section}{节}{节}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\crefname{definition}{定义}{定义}
\crefname{theorem}{定理}{定理}
\crefname{lemma}{引理}{引理}
\crefname{example}{例}{例}

\newcommand{\diff}{\mathop{}\!\mathrm{d}}
\newcommand{\e}{\mathrm{e}}
\newcommand{\ii}{\mathrm{i}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\inner}[2]{\left\langle #1,#2\right\rangle}
\newcommand{\norm}[1]{\left\lVert #1\right\rVert}

\endinput
