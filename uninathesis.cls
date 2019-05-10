% uninathesis document class
% by Luigi Libero Lucio Starace
%
% Options:
% [uninadraft] enables draft mode.
% [colorlinks] enables hyperlink color setup.
% [libertine] Linux Libertine / Biolinum / Bera Mono 
% [palatino] Palatino
% [mathpazo] Mathpazo + Eulervm
% [tgschola] TeX Gyre Schola + Libertinus math
% [tgscholamathpazo] TeX Gyre Schola + Mathpazo
% [alegreya] Alegreya typeface
%
% Commands
% \Chaptername
% \Sectionname
% \Subsectionname
% \Subsubsectionname
%
% Environments
% \expanded

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uninathesis}[2018/07/24 UniNA Thesis Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions*\relax
\LoadClass{book}

%% Packages
\RequirePackage[top=3cm,bottom=3cm,left=3cm,right=3cm,bindingoffset=0.5cm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage[pagestyles,clearempty]{titlesec}
\RequirePackage{blindtext}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage[inline]{enumitem}

% Lineno for draft mode
\RequirePackage[pagewise,mathlines]{lineno}

% Xspace for custom commands spacing
\RequirePackage{xspace}

% Frontespizio custom package
\RequirePackage{uninafrontespizio}

% Flags, default to false
\newif\ifdraft  % Draft flag
\newif\if@libertinetypeface  % Libertine Typeface flag
\newif\if@palatinotypeface   % Palatino Typeface flag
\newif\if@mathpazotypeface   % Mathpazo Typeface flag
\newif\if@tgscholatypeface   % TeX Gyre Schola Typeface flag
\newif\if@tgscholamathpazotypeface  % Tex Gyre Schola with mathpazo Typeface flag
\newif\if@alegreyatypeface  % Alegreya Typeface flag

% Counters
\newcounter{@numberOfTypefacesLoaded}

% Sizes
\AtBeginDocument{
    \newlength{\leftexpandedoffset}
    \setlength{\leftexpandedoffset}{-1cm}
    \newlength{\rightexpandedoffset}
    \setlength{\rightexpandedoffset}{-1cm}
    \newlength{\expandedtextwidth}
    \setlength{\expandedtextwidth}{\linewidth-\leftexpandedoffset-\rightexpandedoffset}
}

% Handling options

\DeclareOption{uninadraft}{%
    \drafttrue % set draft flag
    \renewcommand\linenumberfont{\normalfont\small}% customize line numbers size
    \linenumbers % enable line numbers (check out lineno's documentation)
}
\DeclareOption{colorlinks}{
    \hypersetup{
        colorlinks,
        linkcolor={red!50!black},
        citecolor={blue!50!black},
        urlcolor={green!50!black}
    }
}
\DeclareOption{blacklinks}{
    \hypersetup{
        colorlinks,
        linkcolor={black},
        citecolor={black},
        urlcolor={black}
    }
}
\DeclareOption{libertine}{
    \@libertinetypefacetrue
    \stepcounter{@numberOfTypefacesLoaded}
}
\DeclareOption{palatino}{
    \@palatinotypefacetrue
    \stepcounter{@numberOfTypefacesLoaded}
}
\DeclareOption{mathpazo}{
    \@mathpazotypefacetrue
    \stepcounter{@numberOfTypefacesLoaded}
}
\DeclareOption{tgscholamathpazo}{
    \@tgscholamathpazotypefacetrue
    \stepcounter{@numberOfTypefacesLoaded}    
}
\DeclareOption{tgschola}{
    \@tgscholatypefacetrue
    \stepcounter{@numberOfTypefacesLoaded}    
}
\DeclareOption{alegreya}{
    \@alegreyatypefacetrue
    \stepcounter{@numberOfTypefacesLoaded}
}
\ProcessOptions\relax

% Throw warning if more than one typeface option is given
\ifnum\value{@numberOfTypefacesLoaded}>1
    \@latex@warning@no@line{Class UniNA Thesis: you have enabled more than one 
    typeface option. You shouldn't do this!}
\fi

% Handle typeface flags 

\if@libertinetypeface
    \usepackage{lmodern}     %mono?
    
    %\RequirePackage[llscaled=1.08,mono=false]{libertine}
    \RequirePackage[mono=false]{libertine}
    
    %\usepackage[scale=.875]{GoMono}
    %\RequirePackage{libertine}
    
    %\makeatletter
    %\newcommand*{\LinuxLibertine@scale}{1.08}
    %\makeatother
    
    %\RequirePackage{libertinust1math}
    
    %\RequirePackage[scaled=1.08,libertine]{newtxmath}
    \RequirePackage[libertine]{newtxmath}
    
    \usepackage{textcomp}
    %\usepackage[varqu,varl]{zi4}% inconsolata for mono, not LibertineMono
    %\RequirePackage[scaled=.875]{beramono}
    %\RequirePackage[libertine]{newtxmath} %with pdflatex
\fi

\if@palatinotypeface
    \RequirePackage{palatino}
\fi

\if@mathpazotypeface
    \RequirePackage{mathpazo}
    \RequirePackage{eulervm}
\fi

\if@tgscholamathpazotypeface
    \RequirePackage{tgschola}
    \let\temp\rmdefault
    \RequirePackage{mathpazo}
    \let\rmdefault\temp
\fi

\if@tgscholatypeface
    \usepackage{fouriernc}
    \RequirePackage{tgschola}
    %\RequirePackage{libertinust1math}
\fi

\if@alegreyatypeface
    \RequirePackage[scaled=1.05]{Alegreya} %% Option 'black' gives heavier bold face 
    \RequirePackage{AlegreyaSans}
    \RequirePackage{libertinust1math}
    %\usepackage{eulervm}
    %\usepackage{eulerpx}
    \renewcommand*\oldstylenums[1]{{\AlegreyaOsF #1}}
    %\AlegreyaMedium
    %\AlegreyaSansLight
\fi

% define pagestyles
\newpagestyle{main}[\small]{
    \setheadrule{.55pt}%
    \sethead[]%       even-left
            []%       even-center
            []%       even-right
            {\emph{\chaptername~\oldstylenums{\thechapter} - \chaptertitle}}% odd-left
            {}%                                                             odd-center
            {\thepage}%                                                     odd-right
}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}


\newpagestyle{backmatter}[\small]{
    \setheadrule{.55pt}%
    \sethead[]%       even-left
            []%       even-center
            []%       even-right
            {\emph{\chaptertitle}}% odd-left
            {}%                                                             odd-center
            {\thepage}%                                                     odd-right
}

\newpagestyle{conclusions}[\small]{
    \setheadrule{.55pt}%
    \sethead[]%       even-left
            []%       even-center
            []%       even-right
            {\emph{Conclusions}}% odd-left
            {}%                                                             odd-center
            {\thepage}%                                                     odd-right
}

\newpagestyle{introduction}[\small]{
    \setheadrule{.55pt}%
    \sethead[]%       even-left
            []%       even-center
            []%       even-right
            {\emph{Introduction}}% odd-left
            {}%                                                             odd-center
            {\thepage}%                                                     odd-right
}

\newpagestyle{appendices}[\small]{
    \setheadrule{.55pt}%
    \sethead[]%       even-left
            []%       even-center
            []%       even-right
            {\emph{Appendix~\oldstylenums{\thechapter} - \chaptertitle}}% odd-left
            {}%                                                             odd-center
            {\thepage}%                                                     odd-right
}

% Chapters/Sections heading customization
%\titleformat{command}[shape]{format}{label}{sep}{before-code}[after-code]
\titleformat{\chapter}[block]{\Huge\bfseries}{\fontsize{40}{50}\selectfont\centering--{\thechapter}--\\}{1ex}{\sffamily\centering\huge\bfseries}
\titleformat{name=\chapter,numberless}[block]{\Huge\bfseries}{}{1ex}{\sffamily\centering\huge\bfseries}
\titleformat*{\section}{\Large\sffamily\bfseries}
\titleformat*{\subsection}{\large\sffamily\bfseries}
\titleformat*{\subsubsection}{\sffamily\bfseries}
%\titleformat*{\paragraph}{\sffamily\bfseries}


% Uniforming algorithm, booktabs, listings

% Algorithms and Listings
\RequirePackage{algorithm}
\RequirePackage{algpseudocode} %algorithmicxs
%\RequirePackage{algorithm2e}
\RequirePackage{listings}
\RequirePackage{lstautogobble}

\newlength{\listinglength}
\setlength{\listinglength}{\textwidth+2cm}

\RequirePackage{caption}
\RequirePackage{printlen}

%\DeclareCaptionFormat{mylst}{\rule{\textwidth}{.8pt}\\[-.5ex]#1#2#3\vspace{-1.6ex}\rule{\textwidth}{.4pt}}
\DeclareCaptionFormat{booktabslst}{\vspace{-.7em}\hrule height\heavyrulewidth depth0pt \kern\belowrulesep#1#2#3\kern\aboverulesep\hrule height\lightrulewidth\vspace{-.3em}}
%\DeclareCaptionFormat{mylstwide}{\rule{\listinglength}{.8pt}\\[-.5ex]#1#2#3\vspace{-1.6ex}\rule{\listinglength}{.4pt}}
\captionsetup[lstlisting]{format=booktabslst,labelfont=bf,singlelinecheck=off,labelsep=space}
%\captionsetup[lstlisting]{format=listing,labelfont=white,textfont=white}

\renewcommand*\thelstnumber{\arabic{lstnumber}:}% add ':' after number

\RequirePackage{changepage}
\RequirePackage{fullwidth}
\RequirePackage{printlen}

\lstdefinestyle{uninathesis}{
    basicstyle=\ttfamily\footnotesize,
    frame=b,framerule=0.93979pt,numbers=left,
    numbersep=4pt,numberstyle=\footnotesize,
    xleftmargin=20pt,framexleftmargin=22pt,autogobble=true,showstringspaces=false,
    escapeinside={(*}{*)},belowskip=-0.8 \baselineskip,
    framextopmargin=.2ex,tabsize=2%,literate={\ \ }{{\ }}1
}

\lstset{style=uninathesis}

% define environments
\newenvironment{expanded}
{\begin{fullwidth}[width=\expandedtextwidth,leftmargin=\leftexpandedoffset,rightmargin=\rightexpandedoffset]}
{\end{fullwidth}}

\AtBeginDocument{
    \makeatletter
        \newcommand\fs@booktabsruled{%
            \def\@fs@cfont{\bfseries\strut}\let\@fs@capt\floatc@ruled
            \def\@fs@pre{\hrule height\heavyrulewidth depth0pt \kern\belowrulesep}%
            \def\@fs@mid{\kern\aboverulesep\hrule height\lightrulewidth\kern\belowrulesep}%
            \def\@fs@post{\kern\aboverulesep\hrule height\heavyrulewidth\relax}%
            \let\@fs@iftopcapt\iftrue
        }
    \makeatother
    \captionsetup[algorithm]{labelfont=bf,singlelinecheck=off,labelsep=space}

    \floatstyle{booktabsruled}
    \restylefloat{algorithm}
}

%\RequirePackage{tocloft}
\RequirePackage{etoc}


\newcommand{\inlineminitoc}{
    \begingroup
        %\small
        %\scriptsize
        \footnotesize
        \etocsetnexttocdepth{2}
        %\etocsettocstyle{\subsubsection*{Local contents}}{}
        \etocsettocstyle{}{}
        \etocsetstyle{section} %name of sectional unit
            {\etocskipfirstprefix\leftskip=1em\textsc{Contents: }} %what do when first encountered
            {} %prefix
            {\bfseries \etocnumber{}~\etocname{}. } %contents
            {\vspace{1cm}} %when returning to higher unit
        \etocsetstyle{subsection}
            {\etocskipfirstprefix}
            { -- }
            {\mdseries \etocnumber{}~\etocname{}}
            {. }
        \localtableofcontents
    \endgroup
}


%%UTILITY COMMANDS

%todos
\RequirePackage[colorinlistoftodos,prependcaption,textsize=tiny]{todonotes}
\newcommand{\uninatodo}[1]{\todo[linecolor=red!50!black,backgroundcolor=white,bordercolor=red!50!black]{#1}}

%new command for unnumbered sections
\newcommand\unnumberedchapter[1]{%
    \chapter*{#1}\addcontentsline{toc}{chapter}{#1}
}
\newcommand\unnumberedsection[1]{%
    \addcontentsline{toc}{section}{#1}
    \section*{#1}
}