\NeedsTeXFormat{LaTeX2e}
\LoadClass[letterpaper, 12pt]{article}
\ProvidesClass{notes}[2015/09/22 Class for lecture notes]

%-----------------------------------Options------------------------------------%

%----------------------------------Packages------------------------------------%
% Better fonts with accents
\RequirePackage[T1]{fontenc}

% Required for starred commands
\RequirePackage{suffix}

%\RequirePackage{tocloft}

% Math symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{centernot}

% Nice lists
\RequirePackage{enumerate}
\RequirePackage{enumitem}

% Nice images, figures, and listings
\RequirePackage{graphicx}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
\RequirePackage{listings}

% Header & Page Setup
\RequirePackage{fancyhdr}
\RequirePackage{fullpage}

% Conditionals
\RequirePackage{ifthen}

% needed for the example and dfn enviroments
\RequirePackage{thmtools}

% this is needed in this format so that the header is on the toc page. 
% http://tex.stackexchange.com/questions/111095/topline-of-fancyhdr-disappears-when-i-use-tocloft
\RequirePackage[titles]{tocloft}

% ---  new commands --- %
\newcommand{\noun}[1]{\textsc{#1}}% Original formatting of nouns



%--- toc changes -----%
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\renewcommand{\contentsname}{Table of Contents}


%-------------------------------Class & User Info------------------------------%

%Course Code
\newcommand\coursecode[1]{\renewcommand\@coursecode{#1}}
\newcommand\@coursecode{}

%Couse Name
\newcommand\coursename[1]{\renewcommand\@coursename{#1}}
\newcommand\@coursename{}

%Professor
\newcommand\professor[1]{\renewcommand\@professor{#1}}
\newcommand\@professor{}

%Term 
\newcommand\term[1]{\renewcommand\@term{#1}}
\newcommand\@term{}

%Email
\newcommand\email[1]{\renewcommand\@email{#1}}
\newcommand\@email{}
%--------------------------------Title & Header--------------------------------%
\pagestyle{fancy}

\renewcommand{\maketitle}[0]{
	
	\setlength{\headheight}{15.2pt}
	\setlength{\headsep}{0.2in}

	\lhead{\@term}
	\chead{\@coursename}
	\pagenumbering{roman}

	\begin{center}
		\textbf{\Huge{\noun{\@coursecode}}}{\Huge \par}
		\large{\noun{\@coursename}}\\ \vspace{0.1in}
		\vspace{0in}\includegraphics{logo.png}\\ 
		\noun{\@professor} \ $\bullet$ \ {\noun{\@term}} \ $\bullet$ \ {\noun {University of California, Davis}}	
	\end{center}
	
	\rule[0.5ex]{1\columnwidth}{1pt}
	Last Revision: \today

	% Put dot lines in the TOC enteries. This is not the defualt with the article class.
	%\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
	\tableofcontents\thispagestyle{fancy}
	\rule[0.5ex]{1\columnwidth}{1pt}
	\newpage{}
	\pagenumbering{arabic}
}

\declaretheorem[name=Example,
refname={example,examples},
Refname={Example,Example},
numberwithin=section]{exmp}

\declaretheorem[name=Definition,
refname={definition,definitions},
Refname={Definition,Definitions},
numberwithin=section]{defn}