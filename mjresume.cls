%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom resume class written by Minghao Ji <me@minghao.ca>, January 2015.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[11pt,letterpaper,oneside]{memoir}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mjresume}[2015/01/12 Minghao's custom resume class]

%%%%%%%% Required packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontspec}
\RequirePackage[x11names]{xcolor}
\RequirePackage{polyglossia}
\RequirePackage{multicol}
\RequirePackage{fontawesome}
\RequirePackage{hyperref}
\RequirePackage{etoolbox}

%%%%%%%% Package configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\hypersetup{
	colorlinks=true,
	urlcolor=RoyalBlue4
}

\setmainfont[Ligatures=TeX]{Segoe UI}
\newfontfamily\gothic{Century Gothic}[Ligatures=TeX]
\newfontfamily\sans{Gill Sans MT}[Ligatures=TeX]

\tightlists
\setmainlanguage{english}
\setlength\parindent{0pt}

\setlrmarginsandblock{2cm}{2cm}{*}
\setulmarginsandblock{2cm}{2cm}{*}
\checkandfixthelayout

\pagestyle{empty}

%%%%%%%% Defining commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\section[1]{
	\vspace{0.3\baselineskip}\rule[0.25\baselineskip]{2cm}{2pt}\quad
	{\fontsize{14}{16.8}\gothic\strut#1}\par
}

\newcommand{\bullets}[1]{
	\vspace{-0.3\baselineskip}
	\begin{itemize}#1\end{itemize}
	\vspace{-0.3\baselineskip}
}

\newcommand{\entry}[4]{
	\vspace{0.3\baselineskip}
	{
		\fontsize{12}{14.4} \sans
		#1 \ifblank{#1}{}{\ifblank{#2}{}{|}} #2 \hfill \textit{#3}
	}\\[-0.7\baselineskip]
	\bullets{#4}\vspace{0.6\baselineskip}
}