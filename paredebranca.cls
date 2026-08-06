\NeedsTeXFormat{LaTeX2e}
\makeatletter
\def\input@path{{./styles/}}
\makeatother
\ProvidesClass{paredebranca}

\LoadClass[12pt,openright,a5paper]{memoir}
\setlrmarginsandblock{23mm}{17mm}{*} % {Interna}{Externa}
\setulmarginsandblock{20mm}{20mm}{*} % {Superior}{Inferior}
\checkandfixthelayout

\RequirePackage{pb-fonts}
\RequirePackage{pb-cover}
\RequirePackage{pb-chapter}
%\RequirePackage{styles/pb-layout}

\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{xcolor}
\RequirePackage{emptypage}