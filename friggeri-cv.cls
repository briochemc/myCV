%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{black}{RGB}{0,0,0}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{darkgray}
\colorlet{headercolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage{fontspec}
\RequirePackage{unicode-math}

% phone symbol
\RequirePackage{fontawesome}

\renewcommand*\familydefault{\sfdefault}
%newfontfamily\bodyfont[]{libertine}
\RequirePackage{libertine}
\newfontfamily\bodyfont[
  Color=textcolor,
  Ligatures=TeX,
  BoldFont=LinLibertine_RB.otf,
  ItalicFont=LinLibertine_RI.otf,
  BoldItalicFont=LinLibertine_RBI.otf
]{LinLibertine_R.otf}

\newfontfamily\thinfont[]{Lato-Light.ttf}
\newfontfamily\headingfont[]{texgyreheros-bold.otf}


\setmainfont[
  Color=textcolor,
  Ligatures=TeX,
  BoldFont=LinLibertine_RB.otf,
  ItalicFont=LinLibertine_RI.otf,
  BoldItalicFont=LinLibertine_RBI.otf
]{LinLibertine_R.otf}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{30pt}{62pt}\color{header}%
      %{\thinfont #1}~{\headingfont #2}
      {\thinfont #1~#2}
    };
%    \node [anchor=north] at (name.south) {%
%      \fontsize{14pt}{24pt}\color{pblue}%
%      \bodyfont #3%
%    };
  \end{tikzpicture}
  \vspace{0.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

% color change in section headers:
%\newcounter{colorCounter}
%\def\@sectioncolor#1#2#3{%
%  {%
%    \color{%
%      \ifcase\value{colorCounter}%
%        blue\or%
%        red\or%
%        orange\or%
%       green\or%
%        purple\else%
%        headercolor\fi%
%    } #1#2#3%
%  }%
%  \stepcounter{colorCounter}%
%}

%\newcounter{colorCounter}
%\def\@sectioncolor#1#2#3{%
%  {%
%    \color{%
%      \ifcase\value{colorCounter}%
%        pblue\or%
%        pblue\or%
%        pblue\or%
%        pblue\or%
%        pblue\else%
%        pblue\fi%
%    } #1#2#3%
%  }%
%  \stepcounter{colorCounter}%
%}

% Section command
\renewcommand{\section}[1]{
  \par\vspace{.5\parskip}
  {\LARGE\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}
}

% subsection command
\renewcommand{\subsection}[1]{
  \par\vspace{.25\parskip}
  {\large\headingfont\color{headercolor} #1}
  \par\vspace{.15\parskip}
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{3pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}rl}
}{
  \end{tabular*}
}
%\newcommand{\bfseriesfoo}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  {\thinfont\color{headercolor} #1} & \parbox[t]{.85\textwidth}{%
    \hspace{0pt}{\headingfont\color{headercolor}{#2}}%
    \hfill%
    {\thinfont\color{headercolor} #3}\\%
    {\color{textcolor}#4}\vspace{\parsep}%
  }\\
}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

%\RequirePackage[absolute,overlay]{textpos}
%\setlength{\TPHorizModule}{1cm}
%\setlength{\TPVertModule}{1cm}
%\newenvironment{aside}{%
%  \let\oldsection\section
%  \renewcommand{\section}[1]{
%    \par\vspace{\baselineskip}{\Large\headingfont\color{pblue} ##1}
%  }
%  \begin{textblock}{3.6}(1.1, 0.55)
%  \begin{flushright}
%  \obeycr
%}{%
%  \restorecr
%  \end{flushright}
%  \end{textblock}
%  \let\section\oldsection
%}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

%\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}
%
%\DeclareFieldFormat[article]{title}{#1\par}
%\DeclareFieldFormat[inproceedings]{title}{#1\par}
%\DeclareFieldFormat[misc]{title}{#1\par}
%\DeclareFieldFormat[report]{title}{#1\par}
%
%\DeclareBibliographyDriver{article}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \usebibmacro{journal+issuetitle}%
%    \setunit{\space}%
%    \printfield{pages}%
%   \newunit%
%    \printlist{publisher}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{inproceedings}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}%
%    \printfield{booktitle}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{misc}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{booktitle}%
%    \setunit*{\addcomma\space}%
%    \printfield{note}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{report}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{type}%
%    \setunit{\space}%
%    \printfield{number}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareNameFormat{author}{%
%  \small\addfontfeature{Color=lightgray}%
%  \ifblank{#3}{}{#3\space}#1%
%  \ifthenelse{\value{listcount}<\value{liststop}}
%    {\addcomma\space}
%    {}%
%}
%
%\newcommand{\printbibsection}[2]{
%  \begin{refsection}
%    \nocite{*}
%    \printbibliography[sorting=chronological, type={#1}, title={#2}, %heading=subbibliography]
%  \end{refsection}
%}
%
%\DeclareSortingScheme{chronological}{
%  \sort[direction=descending]{\field{year}}
%  \sort[direction=descending]{\field{month}}
%}
%
%
%
%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=2cm,top=3cm,right=2cm,bottom=2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}