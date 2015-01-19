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
	\renewcommand\@makeheader{
		{\fontsize{23pt}{27.6pt}\gothic \@name}\\[6pt]
		{\fontsize{12pt}{14.4pt}\gothic \@title}\par
		\onehalfspacing\fontsize{10pt}{12pt}\selectfont\fontspec{Segoe UI}\@contactinfo\par
	}

	\newenvironment{side}{
		\renewcommand\section[1]{
			{\fontsize{14}{16.8}\selectfont\gothic\strut##1}\\
		}
		\begin{adjustbox}{valign=t}\begin{minipage}{0.25\textwidth}
		\setlength{\parskip}{\baselineskip}\raggedleft
		\@makeheader
	}{
		\end{minipage}\end{adjustbox}\hfill
	}
	
	\renewenvironment{main}{
		\renewcommand\section[1]{
			\vspace{0.3\baselineskip}
			\rule[0.25\baselineskip]{2cm}{2pt}\quad
			{\fontsize{14}{16.8}\gothic\strut##1}\par
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

\setmainfont[Ligatures=TeX]{Segoe UI}
\newfontfamily\gothic{Century Gothic}[Ligatures=TeX]
\newfontfamily\sans{Gill Sans MT}[Ligatures=TeX]

\setmainlanguage{english}
\setlength\parindent{0pt}

\pagestyle{empty}

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

\renewcommand\section[1]{
	\ClassWarning{mjresume}{\protect\section must be used in the 'main' or 'side' environments}
}

\newenvironment{bullets}{
		\vspace{-0.7\baselineskip}
	\begin{itemize} \itemsep1pt \parskip0pt \parsep0pt
}{
	\end{itemize}
	\vspace{-0.4\baselineskip}
}

\newcommand{\entry}[3]{
	\vspace{0.3\baselineskip}
	{
		\fontsize{12}{14.4} \sans
		#1 \ifblank{#1}{}{\ifblank{#2}{}{|}} #2 \hfill \textit{#3}
	}\\[-0.7\baselineskip]
}

\newcommand\@makeheader{
	\parbox{2.5in}{\raggedright
		{\fontsize{30pt}{36pt}\gothic \@name}\\
		{\fontsize{15pt}{18pt}\gothic \@title}
	}\hfill
	\parbox{2.5in}{\raggedleft\onehalfspacing
		\@contactinfo
	}\\[\baselineskip]
}

\newenvironment{side}{
	\ClassWarning{mjresume}{'side' environment requires 'sidebar' option}
}{}

\newenvironment{main}{
	\renewcommand\section[1]{
		\vspace{0.3\baselineskip}
		\rule[0.25\baselineskip]{2cm}{2pt}\quad
		{\fontsize{14}{16.8}\gothic\strut##1}\par
	}
	\@makeheader
}{}