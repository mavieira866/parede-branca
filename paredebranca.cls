\NeedsTeXFormat{LaTeX2e}
\usepackage{wasysym}
\ProvidesClass{paredebranca}[2026/08/03]
\LoadClass[12pt,openright]{book}
\RequirePackage[a5paper,top=2.5cm,bottom=2.5cm,inner=3cm,outer=2cm]{geometry}
\RequirePackage{fontspec}
\setmainfont{EB Garamond}
\newfontfamily\titlefont{Cormorant Garamond}
\RequirePackage{titlesec,fancyhdr,setspace,xcolor,emptypage}
\onehalfspacing
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[LE,RO]{\thepage}
\fancyhead[LE]{\small\itshape Parede Branca}
\fancyhead[RO]{\small\itshape\leftmark}
\newcommand{\PBchapter}[1]{\cleardoublepage\thispagestyle{empty}\vspace*{0.30\textheight}\begin{center}{\titlefont\Huge Capítulo}\\[1cm]{\titlefont\LARGE #1}\end{center}\clearpage\chapter*{#1}\markboth{#1}{#1}\addcontentsline{toc}{chapter}{#1}}
\newcommand{\PByear}[1]{\vspace{1cm}\begin{center}{\Large\color{gray}#1}\end{center}\vspace{0.5cm}}
\newcommand{\PBreflection}[1]{\vspace{0.5cm}\begin{quote}\itshape #1\end{quote}\vspace{0.5cm}}
\newcommand{\PBmusic}[3]{

    % \cleardoublepage
    % \thispagestyle{empty}
    \vspace*{\fill}
    \begin{center}
        {\Huge\eighthnote}
        
        \vspace{0.5cm}
        {\titlefont\Large\bfseries #1\par}
        
        \vspace{0.4cm}
        
        {\large #2\par}
        
        \vspace{0.5cm}
        
        \begin{minipage}{0.72\textwidth}
            \centering
            \itshape
            #3
        \end{minipage}
    \end{center}
    \vspace*{\fill}

    % \cleardoublepage
    % \thispagestyle{empty}
    % \null
    % \cleardoublepage
}