\NeedsTeXFormat{LaTeX2e}
\LoadClass[letterpaper, 12pt]{report}
\ProvidesClass{homework}[2015/07/18 Class for HW Assignment]

%-----------------------------------Options------------------------------------%


%----------------------------------Packages------------------------------------%
% Better fonts with accents
\RequirePackage[T1]{fontenc}

% Required for starred commands
\RequirePackage{suffix}

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

% Links
\RequirePackage{hyperref}

% Conditionals
\RequirePackage{ifthen}

%------------------------------Questions Block---------------------------------%
\newcounter{ProblemNum}
\newcounter{SubProblemNum}[ProblemNum]

% Macros that call the counter variables
\renewcommand{\theProblemNum}{\arabic{ProblemNum}}
\renewcommand{\theSubProblemNum}{\alph{SubProblemNum}}

% Macro that is called multiple times
\newcommand*{\anyproblem}[1]{\newpage\subsection*{#1}}


\providecommand{\question}{}
% Problems with or without  unique name
% If empty string passed problem has no name otherwise problem
% gets the name that is passed to macro
\newcommand*{\problem}[1]{	\stepcounter{ProblemNum} %
							\anyproblem{Problem \theProblemNum. \; #1}}

%-------------------------------Solution Block---------------------------------%

\newcommand*{\soln}[1]{\subsubsection*{#1}}

\newcommand*{\solution}{\soln{Solution}}

%-------------------------Question & Solution Parts----------------------------%
\newenvironment{alphaparts}[0]{%
  \begin{enumerate}[label=\textbf{(\alph*)}]%
}{\end{enumerate}}

\newenvironment{arabicparts}[0]{%
  \begin{enumerate}[label=\textbf{\arabic*})]%
}{\end{enumerate}}

\newcommand{\questionpart}[0]{\item}

%----------------------------Induction Environment-----------------------------%

\newenvironment{induction}[0]{%
  \begin{description}
}{\end{description}}

\newcommand{\basecase}{\item[Base Case]\mbox{}\\}
\newcommand{\indhyp}{\item[Induction Hypothesis]\mbox{}\\}
\newcommand{\indstep}{\item[Induction Step]\mbox{}\\}

%----------------------------------Answer Box----------------------------------%

\newcommand{\answerbox}[1]{
\begin{framed}
\vspace{#1}
\end{framed}}

%-----------------------------------Page Setup---------------------------------%

% Use block style paragraphs
\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

%----------------------------------User Info-----------------------------------%

% Email
\newcommand\email[1]{\renewcommand\@email{#1}}
\newcommand\@email{}

% Class Name
\newcommand\class[1]{\renewcommand\@class{#1}}
\newcommand\@class{}

% Student ID
\newcommand\studentid[1]{\renewcommand\@studentid{#1}}
\newcommand\@studentid{}

% Homework Number
\newcommand\hwnum[1]{\renewcommand\@hwnum{#1}}
\newcommand\@hwnum{}

% Type: String can be assignment, homework, etc ...
\newcommand\type[1]{\renewcommand\@type{#1}}
\newcommand\@type{}

% Class Section
\newcommand\clsection[1]{\renewcommand\@clsection{#1}}
\newcommand\@clsection{}

% Due Date
\newcommand\duedate[1]{\renewcommand\@duedate{#1}}
\newcommand\@duedate{}

%--------------------------------Title & Header--------------------------------%
\pagestyle{empty}
\pagestyle{fancy}


\renewcommand{\maketitle}[0]{
	% Setup header for all pages except title page
	\setlength{\headheight}{15.2pt}
	\setlength{\headsep}{0.2in}

	% Whether or not a class section is given
	\ifthenelse{\equal{\@clsection}{}}
	{
		\lhead{\@class}
	}{
		\lhead{\@class: Section: \@clsection}
	}
	
	\ifthenelse{\equal{\@studentid}{}}
	{
		\chead{\@author}
	}{
		\chead{\@author (\@studentid)}
	}

	
	\rhead{\@type: \@hwnum}


	% Setup hrule in header
	\renewcommand{\headrulewidth}{0pt}
	\headrule{}

	% Don't put header on first page
	\thispagestyle{plain}

	\begin{center}
	{\Large \@class{} \\ \@type{} \@hwnum}

		% Whether or not a student email is given
		\ifthenelse{\equal{\@email}{}}
		{
			\@author
		}{
			\@author (\@email)
		}
		
		% Whether or not a student ID is given 
		\ifthenelse{\equal{\@studentid}{}}
		{

		}{
			Student ID: \@studentid
		}

		% Whether or not a student ID is given 
		\ifthenelse{\equal{\@duedate}{}}
		{

		}{
			Due: \@duedate	
		}

	\end{center}
	\renewcommand{\headrulewidth}{0.4pt}

}

%---------------------------------End Of File----------------------------------%