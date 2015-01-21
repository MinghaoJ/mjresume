%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% mjresume.cls
%% Copyright 2015 Minghao Ji <me@minghao.ca>
%
% This work may be distributed and/or modified under the conditions of the LaTeX
% Project Public License, either version 1.3 of this license or (at your option)
% any later version.
% The latest version of this license is in http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX version
% 2005/12/01 or later.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mjresume}[2015/01/18 Minghao's custom resume class]

%%%%%%%% Class Options %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{sidebar}{
	\newcommand\@makeheader{
		{\fontsize{23pt}{27.6pt}\@headingfontfamily \@name}\\[0.2\baselineskip]
		{\fontsize{12pt}{14.4pt}\@headingfontfamily \@title}\par
		\onehalfspacing\fontsize{10pt}{12pt}\selectfont\fontspec{Segoe UI}\@contactinfo\par
	}

	\newenvironment{side}{
		\renewcommand\section[1]{
			{\fontsize{14}{16.8}\selectfont\@headingfontfamily\strut##1}\\
		}
		\begin{adjustbox}{valign=t}\begin{minipage}{0.25\textwidth}
		\setlength{\parskip}{\baselineskip}\raggedleft
		\@makeheader
	}{
		\end{minipage}\end{adjustbox}\hfill
	}
	
	\newenvironment{main}{
		\renewcommand\section[1]{
			\vspace{0.3\baselineskip}
			\rule[0.25\baselineskip]{2cm}{2pt}\quad
			{\fontsize{14}{16.8}\@headingfontfamily\strut##1}\par
		}
		\begin{adjustbox}{valign=t}\begin{minipage}{0.7\textwidth}
	}{
		\end{minipage}\end{adjustbox}
	}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%%%%%%% Required Resources %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass{article}

\RequirePackage{etoolbox}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\RequirePackage{fontawesome}
\RequirePackage{setspace}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{adjustbox}
\RequirePackage[unicode]{hyperref}

%%%%%%%% Class Definition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\hypersetup{
	colorlinks=true,
	urlcolor=Blue
}

\def\@mainfont{Segoe UI}
\def\@entryfont{Gill Sans MT}
\def\@headingfont{Century Gothic}

\defaultfontfeatures{Ligatures=TeX}
\setmainfont{\@mainfont}
\newfontfamily\@headingfontfamily{\@headingfont}
\newfontfamily\@entryfontfamily{\@entryfont}

\setmainlanguage{english}
\setlength\parindent{0pt}

\pagestyle{empty}

\def\provideenvironment{\@star@or@long\provide@environment}
\def\provide@environment#1{%
        \@ifundefined{#1}%
                {\def\reserved@a{\newenvironment{#1}}}%
                {\def\reserved@a{\renewenvironment{dummy@environ}}}%
        \reserved@a
}
\def\dummy@environ{}

%%%%%%%% Defining commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\name#1{
	\def\@name{#1}
}

\def\title#1{
	\def\@title{#1}
}

\def\contactinfo#1{
	\def\@contactinfo{#1}
}

\def\mainfont#1{
	\def\@mainfont{#1}
}

\def\entryfont#1{
	\def\@entryfont{#1}
}

\def\headingfont#1{
	\def\@headingfont{#1}
}

\newenvironment{bullets}{
		\vspace{-0.55\baselineskip}
	\begin{itemize} \itemsep1pt \parskip0pt \parsep0pt
}{
	\end{itemize}
	\vspace{-0.4\baselineskip}
}

\newcommand{\entry}[3]{
	\vspace{0.1\baselineskip}
	{
		\fontsize{12}{14.4} \@entryfontfamily
		#1 \ifblank{#1}{}{\ifblank{#2}{}{|}} #2 \hfill \textit{#3}
	}\\[-0.8\baselineskip]
}

\providecommand\@makeheader{
		\parbox{2.5in}{\raggedright
			{\fontsize{30pt}{36pt}\selectfont\@headingfontfamily \@name}\\[0.2\baselineskip]
			{\fontsize{15pt}{18pt}\selectfont\@headingfontfamily \@title}
		}\hfill
		\parbox{2.5in}{\raggedleft\onehalfspacing
			\@contactinfo
		}\\[\baselineskip]
	}

\provideenvironment{side}{
	\ClassWarning{mjresume}{'side' environment requires 'sidebar' option}
}{}

\provideenvironment{main}{
	\renewcommand\section[1]{
		\vspace{0.3\baselineskip}
		\rule[0.25\baselineskip]{2cm}{2pt}\quad
		{\fontsize{14}{16.8}\@headingfontfamily\strut##1}\par
	}
	\@makeheader
}{}
