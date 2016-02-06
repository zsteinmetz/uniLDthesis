%*******************************************************************************
%
% uniLDthesis.cls
% 
% LaTeX document class for English project reports and theses at the
% University of Koblenz–Landau, Campus Landau
%
% by Zacharias Steinmetz (steinmetz-z@uni-landau.de)
%
% License:
% This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
% International License (CC BY-SA 4.0, http://creativecommons.org/licenses/by-sa/4.0/)
%
% This template is roughly based on different templates provided by the
% Faculty of Computer Science, Campus Koblenz, University Koblenz–Landau
% as well as on a thesis submitted at the University of Duisburg-Essen.
%
% Thanks to Detlev Droege and Matthias Biedermann
% 
%*******************************************************************************

%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniLDthesis}[2016/02/06 v1.0]

%--- Initial code --------------------------------------------------------------

\RequirePackage{etoolbox}
\newbool{isDraft}
\newbool{isReview}
\newbool{isColor}

%--- Declaration of options ----------------------------------------------------

\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{book}}
\DeclareOption{draft}{
	\PassOptionsToClass{draft}{book}
	\booltrue{isDraft}}
\DeclareOption{review}{\booltrue{isReview}}
\DeclareOption{color}{\booltrue{isColor}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}

%--- Execution of options ------------------------------------------------------

\ProcessOptions

%--- Package loading -----------------------------------------------------------

\LoadClass[a4paper,titlepage]{book}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[ngerman,english]{babel}
\RequirePackage[round,colon]{natbib}\citeindextrue
\RequirePackage[nottoc]{tocbibind}
\RequirePackage[hidelinks,breaklinks,unicode]{hyperref}
\RequirePackage{ifthen}
\RequirePackage{setspace}
\RequirePackage{microtype}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage[labelfont=bf,textformat=period,tableposition=top]{caption}
\RequirePackage[acronym,toc,nopostdot,nonumberlist]{glossaries}
\RequirePackage{lineno}

%--- Code ----------------------------------------------------------------------

\def\@thesis{}
\newcommand{\thesis}{\def\@thesis}
\def\@fulfillment{}
\newcommand{\fulfillment}{\def\@fulfillment}
\def\@supervisors{}
\newcommand{\supervisors}{\def\@supervisors}
\def\@department{}
\newcommand{\department}{\def\@department}
\def\@secondlogo{}
\newcommand{\secondlogo}[2]{\def\@secondlogo{\includegraphics[{#1}]{{#2}}}}
\def\@seconddesc{}
\newcommand{\seconddesc}{\def\@seconddesc}
\def\@location{}
\newcommand{\location}{\def\@location}

\ifboolexpr{bool {isDraft} or bool {isReview}}
	{\linenumbers}
	{}

\ifboolexpr{bool {isColor}}
	{\def\@unilogo{logos/unilogo-col}}
	{\def\@unilogo{logos/unilogo-bw}}

%%% Save original offsets
\newlength{\voffsetBackup}
\setlength{\voffsetBackup}{\voffset}

\newlength{\hoffsetBackup}
\setlength{\hoffsetBackup}{\hoffset}

\setlength{\parskip}{0.25\baselineskip}

%%% Title page
\renewcommand{\maketitle}{
	
	\begin{titlepage}
		\ifthenelse{\boolean{@twoside}}{
		      	\setcounter{page}{-1}
		}{
		\setcounter{page}{0}
		}
			
		% Logos		
		\noindent
		\parbox{\textwidth}{
			\includegraphics[height=1cm]{\@unilogo}
			\hfill
			\@secondlogo
		}
		\\[0.4em]
		\parbox{\textwidth}{
			\footnotesize\fontfamily{phv}\selectfont
			\hspace{1.515cm}\parbox{0.5\linewidth}{\@department}
			\hfill
			\parbox{0.35\linewidth}{\raggedleft\@seconddesc}
		}
				
		\normalsize
		\vspace*{1.5cm}
		      
		\begin{center}
			\doublespacing
			{\huge\bfseries\@title}\\[1.25cm]
			\singlespacing 
			\huge \@thesis\\[.25cm]
			\large \@fulfillment\\[1cm]
			by\\[1ex]\@author\\[2.5cm]
			
			\textbf{Supervisors}
			
			\@supervisors
			
			\vspace{\fill}
			
			\normalsize
			\@location, \@date 
		\end{center}
		
	\end{titlepage}
	
	\thispagestyle{empty}
	\setlength{\voffset}{\voffsetBackup}
	\setlength{\hoffset}{\hoffsetBackup}
}

%%% Custom styling
% Don't show 'Chapter'
\titleformat{\chapter}[hang]{\bfseries\LARGE}{\thechapter}{2pc}{}
\pagestyle{plain}
% Define minimum emergency stretch to avoid overfull hboxes
\setlength{\emergencystretch}{0.5em}
% Set line spacing
\onehalfspacing
% Remove extra space after periods
\frenchspacing
% Add spacing to table captions
\captionsetup[table]{belowskip=10pt}
