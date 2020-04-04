\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qmo}
\LoadClass[11pt,a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[margin=7em,includefoot]{geometry}
\RequirePackage{mdframed}
\RequirePackage{amsthm}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}

\definecolor{bc}{RGB}{153,153,153}
\pagenumbering{gobble}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\newtheoremstyle{qmoprob}
	{0pt}
	{0pt}
	{}
	{}
	{\bfseries\sffamily}
	{\medskip\\}
	{0pt}
	{}
\theoremstyle{qmoprob}
\newmdtheoremenv[
	topline=false,
	rightline=false,
	bottomline=false,
	skipabove=1.5\baselineskip,
	skipbelow=1.5\baselineskip,
	linewidth=5pt,
	linecolor=bc
]{problem}{Problem}

\makeatletter
\let\@day\@empty
\newcommand{\level}[1]{\gdef\@level{#1}}
\renewcommand{\day}[1]{\gdef\@day{#1}}
\renewcommand{\time}[1]{\gdef\@time{#1}}
\lfoot{\itshape\@date}
\rfoot{\itshape Time: \@time}
\renewcommand{\maketitle}
	{\noindent
	\def\svgwidth{145pt}
	\input{qmologo.pdf_tex}
	\begin{flushright}
		\Large\scshape\framebox{\@level}\ifx\@day\@empty\else\smallskip\\
		\framebox{Day \@day}\fi
	\end{flushright}
	\ifx\@day\@empty\else\vspace*{-0.2\baselineskip}\fi
	\rule{\textwidth}{.7pt}
	\vspace*{0.5\baselineskip}
	}
\makeatother
