% ----------------------------------------------------------------------------%
%                             Стилевой файл препринта                         %
% ----------------------------------------------------------------------------%
%            copyleft   В.В.Стрижов, 2014   email: strijov@ccas.ru            %
% ----------------------------------------------------------------------------%
%
% Содержание стилевого файла Diss.sty:
%
% Подключение макропакетов
% Определение новых команд
% Подавление заголовков вложенных документов
% Определение титульной страницы
% Оформление списка литературы
%\bibliographystyle{gost71u}
%\bibliographystyle{plain}

\ProvidesClass{Diss}[2014/09/23 v0.0.0]
\def\class@name{Diss}%
\GenericInfo{}{\space
 Copyright (c) 2014 CCAS Moscow^^J
 Licensed under the LPPL:^^Jhttp://www.ctan.org/tex-archive/macros/latex/base/lppl.txt^^J
 \@gobble
}%
\LoadClassWithOptions{extreport}%{book}
\renewcommand{\baselinestretch}{1.5}
%\RequirePackage{a4wide}

\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel} % Русский язык, пакет babel.
% Используется шрифт по умолчанию
% \renewcommand{\rmdefault}{ftm} % если снять комментарий, будет использован другой шрифт семейства roman
%\RequirePackage[T2A]{fontenc}
% ----------------------------------------------------------------------------
% Подключение макропакетов
% ----------------------------------------------------------------------------
\RequirePackage{makeidx}
\RequirePackage{hhline}
% Часто используемые математические пакеты
\RequirePackage{amsmath, amstext, amsfonts, amssymb, amsthm, amscd}
\RequirePackage{pb-diagram} % Коммутативные диаграммы
\RequirePackage[normalem]{ulem} % Strike out and underline
\RequirePackage{subfig}
\RequirePackage{ecltree}
\RequirePackage{epic}
\RequirePackage{enumerate}
%\usepackage[usenames]{color}
%\usepackage{colortbl}
\usepackage{makecell}
\RequirePackage{proof} % Nice proof
\RequirePackage{rotating}
\RequirePackage[all]{xy} % xy package for diagrams
%\usepackage[noend]{algorithmic}
\usepackage{xcolor}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    linkcolor={red!70!black},
    citecolor={green!70!black},
    urlcolor={blue!70!black},
    linktoc=page
}

% Определены окружения theorem (после загрузки пакета amsthm)
\newtheorem{theorem}{Теорема}%[section]
\newtheorem{lemm}{Лемма}
\newtheorem{df}{Определение}
\newtheorem{eq}{Пример}
\newtheorem{rem}{Замечание}
\newtheorem{cor}{Следствие}
\newtheorem{st}{Утверждение}
\newtheorem{problem}{Задача}
\newtheorem{remark}{Замечание}

% Рисунки в формате PostScript
\usepackage{graphicx, epsfig}

% Определение новых команд
% ----------------------------------------------------------------------------
\newcommand{\eql}[1]{ {\label{#1}\tag{#1}} } % Print out the labels of equations.
% ----------------------------------------------------------------------------
% Разметка TODO для чернового материала
% ----------------------------------------------------------------------------
\newenvironment{TODO}%
{\begin{quote}\hrule \marginpar{$\downarrow$}}
{\hrule \marginpar{$\uparrow$}\end{quote}}
% ----------------------------------------------------------------------------
% Подавление заголовков вложенных документов (by Vokov)
% ----------------------------------------------------------------------------
\newenvironment{inputs}{
    \renewcommand{\documentclass}[2][0]{\relax}
    \renewcommand{\usepackage}[2][0]{\relax}
    \renewcommand{\title}[1]{\relax}
    \renewcommand{\author}[1]{\relax}
    \renewcommand{\maketitle}{\relax}
    \renewcommand{\makeindex}{\relax}
    \renewcommand{\printindex}{\relax}
    \renewcommand{\tableofcontents}{\relax}
    \renewcommand{\thispagestyle}[1]{\relax}
    \renewcommand{\bibliographystyle}[1]{\relax}
    \renewcommand{\bibliography}[1]{\relax}
    \renewenvironment{document}{\relax}{\relax}
    \renewenvironment{printindex}{\relax}% new addition
}{}

% Первый параграф в разделе тоже должен начинаться с новой строки
\RequirePackage{indentfirst}
% После номера раздела должна стоять точка
% UpD: в этой версии точки нет, чтобы был корректный ref. By mikethehuman
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
%\renewcommand{\thesubsubsection}{\thesubsection\alph{subsubsection}.}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
%
% Глубина содержания
\setcounter{tocdepth}{3}

% Названия разделов стоят по центру и имеют следующий стиль
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\centering\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection {subsection}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {1.5ex \@plus .2ex}%
                                   {\centering\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection {subsubsection}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {1.5ex \@plus .2ex}%
                                   {\centering\normalfont\normalsize\bfseries}}

% После номера рисунка или таблицы стоит точка.
% Название рисунки или таблицы находится по центру
\renewcommand{\@makecaption}[2]{%
    \vspace{\abovecaptionskip}%
    \centering % inserted to center the figure caption
    \sbox{\@tempboxa}{#1. #2}
    \ifdim
        \wd\@tempboxa>\hsize  #1. #2\par%
    \else
        \global\@minipagefalse
        \hbox to \hsize {\hfil #1. #2\hfil}%
    \fi%
    \vspace{\belowcaptionskip}
}

% Верхние колонтитулы, название главы и раздела
% задаются сейчас стилем book %FIXIT
\renewcommand{\@evenhead}{}
\renewcommand{\@oddhead}{}

% Переопределено оформление номеров страниц
\renewcommand{\@evenfoot}{\hfil ---~\thepage~--- \hfil}
\renewcommand{\@oddfoot}{\hfil ---~\thepage~--- \hfil}

% Page parameters
% margins
\usepackage{geometry}
\geometry{
  left=2.5cm,
  right=1cm,
  top=2cm,
  bottom=2cm}
% \textheight=24cm
% \textwidth=16cm
% \oddsidemargin=5mm
% \evensidemargin=-5mm
% \marginparwidth=36pt
% \topmargin=-1cm
% \footnotesep=3ex
% %\flushbottom
% \raggedbottom
% \tolerance 3000
% подавить эффект "висячих стpок"
\clubpenalty=10000
\widowpenalty=10000

% page number on the top
\usepackage{fancyhdr}
\fancyhf{}
\fancyhead[C]{\thepage}
\pagestyle{fancy}
\fancypagestyle{plain}
\fancyhf{} % clear all header and footer fields
\fancyhead[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}