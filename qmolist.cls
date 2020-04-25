\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qmolist}
\LoadClass[11pt,a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[margin=6em]{geometry}
\RequirePackage{mdframed}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{environ}
\RequirePackage{textcomp}
\RequirePackage{asymptote}
\RequirePackage{tkz-euclide}
\RequirePackage[outline]{contour}
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\newcommand{\nl}{\medskip\\ }
\let\oldleft\left
\let\oldright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\oldleft}
\renewcommand{\right}{\aftergroup\egroup\oldright}
\renewcommand{\(}{\left(}
\renewcommand{\)}{\right)}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}

\newcounter{problem}[section]
\newcounter{solution}[problem]

\definecolor{bc}{RGB}{153,153,153}
\newtheoremstyle{obj}
	{0pt}
	{0pt}
	{}
	{}
	{\sffamily}
	{: }
	{0pt}
	{\thmname{#1}}
\theoremstyle{obj}
\newmdtheoremenv[
	topline=false,
	rightline=false,
	bottomline=false,
	innerleftmargin=7pt,
	linewidth=3pt,
	linecolor=bc
]{claim}{Claim}
\newmdtheoremenv[
	topline=false,
	rightline=false,
	bottomline=false,
	innerleftmargin=7pt,
	linewidth=3pt,
	linecolor=bc
]{lemma}{Lemma}

\newif\ifsol
\makeatletter
\NewEnviron{problem}[1]
	{\ifsol\clearpage\fi\stepcounter{problem}
	\noindent
	{\large\sffamily\bfseries\textcolor{red}{$\blacksquare$} Problem~\theproblem}
	\medskip\\
	\BODY
	\begin{flushright}\itshape Proposed by #1\end{flushright}\bigskip
	\ifsol\vspace*{-1.1\baselineskip}
	\rule{\textwidth}{.7pt}\vspace*{1.1\baselineskip}\\ \fi}

\NewEnviron{solution*}[1]
	{\ifsol
	\noindent
	{\large\sffamily\bfseries\textcolor{red}{\textsection} Solution}
	\medskip\\
	\BODY
	\begin{flushright}\itshape Solution by #1\end{flushright}
	\fi}

\NewEnviron{solution}[1]
	{\ifsol
	\stepcounter{solution}
	\noindent
	{\large\sffamily\bfseries\textcolor{red}{\textsection} Solution~\thesolution}
	\medskip\\
	\BODY
	\begin{flushright}\itshape Solution by #1\end{flushright}
	\fi}

\newenvironment{remark}
	{\noindent
	{\large\sffamily\bfseries\textcolor{red}{\textsection} Remark}
	\medskip\\ }
	{}
\makeatletter
