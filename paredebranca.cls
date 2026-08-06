%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parede Branca
% Classe LaTeX do livro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paredebranca}[2026/08/06 Classe editorial do livro Parede Branca]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Caminho dos módulos
%
% Mantém os arquivos de estilo auxiliares concentrados em styles/ sem exigir que
% o documento principal conheça essa estrutura interna.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\def\input@path{{./styles/}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classe-base
%
% O memoir concentra a infraestrutura editorial do livro: tamanho do papel,
% abertura de capítulos à direita, margens, capítulos e sumário.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[12pt,openright,a5paper]{memoir}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Layout da página
%
% Margens preservadas do projeto original. A chamada final recalcula o bloco de
% texto do memoir sem alterar os comandos públicos da classe.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlrmarginsandblock{23mm}{17mm}{*} % {Interna}{Externa}
\setulmarginsandblock{20mm}{20mm}{*} % {Superior}{Inferior}
\checkandfixthelayout

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dependências compartilhadas
%
% xcolor é carregado aqui porque as cores fazem parte da infraestrutura comum da
% classe e são usadas pelos módulos visuais.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Módulos editoriais
%
% A ordem abaixo preserva as dependências internas: primeiro fontes, depois capa
% e, por fim, capítulos. Os comandos públicos continuam definidos nos módulos.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{pb-fonts}
\RequirePackage{pb-cover}
\RequirePackage{pb-chapter}
