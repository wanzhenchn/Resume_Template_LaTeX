\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
\LoadClass[11pt]{article}

\usepackage{fonts/zh_CN-Adobefonts_external} % Simplified Chinese Support using external fonts (./fonts/zh_CN-Adobe/)
%\usepackage{fonts/zh_CN-Adobefonts_internal} % Simplified Chinese Support using system fonts
\usepackage{linespacing/linespacing_fix} % disable extra space before next section
\usepackage{cite}
\usepackage{graphicx}  %图片
\usepackage{tabu}      %表格
\usepackage{multirow}  %多行表格
\usepackage{multicol}  %多栏排版
\usepackage{embrac}    %在\emph, \textit, \textsl 西文字符倾斜时，使括号等保持直立
%%若部分倾斜则组合使用 \EmbracOff 和 \EmbracOn ，例如：
%\textit{[(italic)]} 
%\EmbracOff
%\textsl{[(slant)]}
%\EmbracOn

% 页码居中显示
%\usepackage{fancyhdr}
%\usepackage{lastpage}
%\pagestyle{fancy}
%\fancyhf{}
%\renewcommand{\headrulewidth}{0pt}
%\cfoot{\qquad \qquad \qquad \qquad \qquad\thepage/\pageref{LastPage}}

\usepackage{enumitem,enumerate,xcolor}
\usepackage{amssymb}
\usepackage{bm}
\usepackage{pifont,bbding}%特殊符号集锦

% disable indent globally
\setlength{\parindent}{0pt}

% some general improvements, defines the XeTeX logo
\RequirePackage{xltxtra}

% use xifthen
\RequirePackage{xifthen}

% use progress bar for skill
\RequirePackage{progressbar}

% use hyperlink for email and url
\RequirePackage{hyperref, bookmark}
\hypersetup{hidelinks, %隐藏超链接方框
	linktoc=all,
	bookmarksnumbered=true,
	bookmarksopen=true,
	bookmarksopenlevel=3,
	breaklinks=true} 

\RequirePackage{url}
\urlstyle{tt}

% use fontawesome
\RequirePackage{fonts/fontawesome}         %图标字体
% use xcolor for customizing color
%\RequirePackage[usenames,dvipsnames]{xcolor}
% loading fonts
\RequirePackage{fontspec}
% Main document font
\setmainfont[
  Path = fonts/Main/ ,
  Extension = .otf ,
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  SmallCapsFont = Fontin-SmallCaps
]{texgyretermes}

\RequirePackage[
	a4paper,
	left=1.5cm,
	right=1.5cm,
	top=0.5cm,
	bottom=0.5cm,
	nohead
]{geometry}

\RequirePackage{titlesec}
\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
%\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}
\RequirePackage[super]{nth}

\titleformat{\section}         % Customise the \section command 
  {\color{black}\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\color{black}\titlerule]               % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1.8}{*1.8}

\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*1.8}{*0.6}

\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection*{#1 \hfill #2}%
}
\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}

\newcommand{\name}[1]{
  \centerline{\Huge\scshape{#1}}
  \vspace{1.25ex}
}

% defines one's name
% usage: \name{<name>}
\newcommand{\nameTest}[1]{
  {\large\scshape{#1}}
}

% defines one's email
% usage: \email{<email>}
\newcommand{\email}[1]{\faEnvelope\ \href{mailto:#1}{#1}}

% defines one's phone
% usage: \phone{<phone>}
\newcommand{\phone}[1]{\faPhone\ {#1}}

% defines one's linkedin
% usage: \linkedin{<linkedin>}
\newcommand{\linkedin}[2][]{\faLinkedin\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
    
% defines one's GitHub
% usage: \github{<github>}
\newcommand{\github}[2][]{\faGithub\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
    
% defines one's homepage
% usage: \homepage{<homepage>}
\newcommand{\homepage}[2][]{\faLink\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
    
% defines one's address
% usage: \address{<address>}
\newcommand{\address}[2][]{\faMapMarker\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}

% defines progress bar with text
% usage: \pbar[3][width]{Text}{percentage}
\newcommand{\pbar}[3][10em]{{#2}\ 
  \progressbar[heightr=1, width=#1, borderwidth=0pt, roundnessr=0.45, filledcolor=green!40, subdivisions=1]{#3}
}

\newcommand{\basicInfo}[1]{
  \centerline{\sffamily\large{#1}}
  \vspace{1.5ex}
}

\newcommand{\role}[2]{
  {\par \textit{#1} ~ #2 \par}
  \vspace{0.85ex}
}


\newlist{coloritemize}{itemize}{1}                                    %修改item项目符号颜色
\setlist[coloritemize]{label=\textcolor{itemizecolor}{$\circ$}}       %默认点修改为圆圈\circ
\colorlet{itemizecolor}{black}% {.} Default colour for \item in itemizecolor