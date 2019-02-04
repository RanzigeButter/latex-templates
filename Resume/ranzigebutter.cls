% ==============================================================================
%  ____                 _            ____        _   _
% |  _ \ __ _ _ __  ___(_) __ _  ___| __ ) _   _| |_| |_ ___ _ __
% | |_) / _` | '_ \|_  / |/ _` |/ _ \  _ \| | | | __| __/ _ \ '__|
% |  _ < (_| | | | |/ /| | (_| |  __/ |_) | |_| | |_| ||  __/ |
% |_| \_\__,_|_| |_/___|_|\__, |\___|____/ \__,_|\__|\__\___|_|
%                         |___/
% ==============================================================================
\ProvidesClass{ranzigebutter}[RanzigeButter Resume]
\LoadClass{scrartcl}
\NeedsTeXFormat{LaTeX2e}
% ==============================================================================

% Table of Contens
% 1. General
% 2. Layout
% 3. Fonts
% 4. Colors
% 5. Styles
% 6. Other Packages
% 7. Commands

% ==============================================================================
% 1. General
% ==============================================================================

\RequirePackage[hidelinks, unicode]{hyperref}
\hypersetup {
    pdfstartview = {FitV},
    pdfview = {FitH},
    pdffitwindow = {true}
    pdftitle = {Tim Schneider - Resume},
    pdfauthor = {Tim Schneider}
}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}

% ==============================================================================
% 2. Layout
% ==============================================================================

\RequirePackage[
    top=1.5cm,
    bottom=2cm,
    left=2cm,
    right=2cm,
    nohead,
    footskip=0.5cm
]{geometry} % Set Page Margins.

\RequirePackage{parskip}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{} % Clear Header & Footer.
\renewcommand{\headrulewidth}{0pt} % Remove Header Rule.

% ==============================================================================
% 3. Fonts
% ==============================================================================

% ==================================================
% Font - Packages
% ==================================================

\RequirePackage[default]{opensans}
\RequirePackage{merriweather}
\RequirePackage{fontawesome}

% ==================================================
% Font - Aliases
% ==================================================

\newcommand*{\fontHeading}{\merriweather}

% ==============================================================================
% 4. Colors
% ==============================================================================

% ==================================================
% Colors - Packages
% ==================================================

\RequirePackage{xcolor}                               % Package for setting Colors.
\RequirePackage{pagecolor}                            % Package for setting Page Colors.

% ==================================================
% Colors - Definition
% ==================================================

\definecolor{color__background}{HTML}{0f1218}         % Backgroundcolor.
\definecolor{color__background--second}{HTML}{282f35} % Second Background Color.
\definecolor{color__font}{HTML}{f8f8f8}               % Font Color.
\definecolor{color__font--second}{HTML}{818181}       % Second Font Color.
\definecolor{color__accent}{HTML}{cf4235}             % Accent Color.

% ==================================================
% Colors - Set
% ==================================================

\pagecolor{color__background}                         % Set Page Background Color.
\color{color__font}                                   % Set Page Font Color.

% ==============================================================================
% 5. Styles
% ==============================================================================

% ==================================================
% Style - Name
% ==================================================

\newcommand*{\resumeStyleName}[1]{
    \fontHeading
    \fontsize{28pt}{1em}
    \color{color__accent}
    \textbf{#1}
}

% ==================================================
% Style - Personal Informations
% ==================================================

\newcommand*{\resumeStyleData}[2]{
    {\leavevmode\color{color__font--second}#1}
    &
    {#2}\\
}

% ==================================================
% Style - Section
% ==================================================

\renewcommand*{\section}[1]{
    {
        \vspace{20pt}
        \fontHeading
        \fontsize{18pt}{1em}
        \color{color__accent}
        \textbf{#1}
        \vhrulefill{2pt}
    }
}

% ==================================================
% Style - Entry
% ==================================================

\setlength{\tabcolsep}{10pt}
\renewcommand*{\arraystretch}{2}

\newcommand*{\resumeStyleEntry}[2]{
    \parbox[b]{\hsize}{\raggedleft\color{color__font--second}#1}
    &
    \parbox[t]{\hsize}{#2}\\
}

% ==================================================
% Style - Footer
% ==================================================

\newcommand*{\resumeStyleFooter}[1]{
    {
        \fontsize{10pt}{1em}
        \selectfont
        \color{color__background--second}
        #1
    }
}

% ==============================================================================
% 6. Other Packages
% ==============================================================================

% ==================================================
% Images
% ==================================================

\RequirePackage{tikz}

% ==================================================
% Tables
% ==================================================

\RequirePackage{tabularx}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}} % Left-aligned with width specification.
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}   % Centered with width specification.
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}  % Right-aligned with width specification.

% ==================================================
% Utility
% ==================================================

\RequirePackage{xifthen} % For If-Statments.

\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@} % Horizontal line with specific thickness.

% ==============================================================================
% 7. Commands
% ==============================================================================

% ==================================================
% Commands - Personal Informations
% ==================================================

\newcommand*{\resumePicture}[1]{\renewcommand{\resumePicture}{#1}}
\newcommand*{\resumeName}[1]{\renewcommand{\resumeName}{#1}}
\newcommand*{\resumeBirthdate}[1]{\renewcommand{\resumeBirthdate}{#1}}
\newcommand*{\resumeAdress}[1]{\renewcommand{\resumeAdress}{#1}}
\newcommand*{\resumePhone}[1]{\renewcommand{\resumePhone}{#1}}
\newcommand*{\resumeEMail}[1]{\renewcommand{\resumeEMail}{#1}}
\newcommand*{\resumeWebsite}[1]{\renewcommand{\resumeWebsite}{#1}}

% ==================================================
% Commands - Header
% ==================================================

\newcommand*{\makeHeader}{

    % ==================================================
    % Commands - Header - Name
    % ==================================================

    \newcommand*{\makeName}{
        {\resumeStyleName\resumeName}
        \vspace{20pt}
    }

    % ==================================================
    % Commands - Header - Personal Informations
    % ==================================================

    \newcommand*{\makeData}{
        \setlength{\tabcolsep}{5pt}
        \renewcommand*{\arraystretch}{1.5}

        \begin{tabularx}{\linewidth}{R{0.5cm}X}
            % Date of Birth.
            \ifthenelse{\equal{\resumeBirthdate}{}}
                {}
                {\resumeStyleData{\faBirthdayCake}{\resumeBirthdate}}
            % Adress.
            \ifthenelse{\equal{\resumeAdress}{}}
                {}
                {\resumeStyleData{\faHome}{\resumeAdress}}
            % Phone.
            \ifthenelse{\equal{\resumePhone}{}}
                {}
                {\resumeStyleData{\faPhone}{\resumePhone}}
            % E-Mail.
            \ifthenelse{\equal{\resumeEMail}{}}
                {}
                {\resumeStyleData{\faEnvelope}{\href{mailto:\resumeEMail}{\resumeEMail}}}
            % Personal Website.
            \ifthenelse{\equal{\resumeWebsite}{}}
                {}
                {\resumeStyleData{\faGlobe}{\href{https://\resumeWebsite}{\resumeWebsite}}}
        \end{tabularx}
    }

    % ==================================================
    % Commands - Header - Picture
    % ==================================================

    \newlength\resumeWidthPicture
    \pgfmathsetlength{\resumeWidthPicture}{5.5cm}

    \newcommand*{\makePicture}{
        \raggedleft\begin{tikzpicture}
            \color{color__background--second}\draw (0, 0) circle (\resumeWidthPicture/2+0.3cm);
            \clip (0, 0) circle (\resumeWidthPicture/2);
            \node[
                anchor=north west,
                inner sep=0pt,
                outer sep=0pt
            ] at (-\resumeWidthPicture/2, \resumeWidthPicture/2) {
                \includegraphics[width=\resumeWidthPicture]{\resumePicture}
            };
        \end{tikzpicture}
    }

    % ==================================================
    % Commands - Header - Layout
    % ==================================================

    \begin{minipage}[c]{0.6\linewidth}
        \makeName
        \makeData
    \end{minipage}
    \begin{minipage}[c]{0.39\linewidth}
        \makePicture
    \end{minipage}

}

% ==================================================
% Commands - Entry
% ==================================================

\newcommand*{\resumeEntry}{\resumeStyleEntry}

% ==================================================
% Commands - Footer
% ==================================================

\newcommand*{\makeFooter}[3]{
    \fancyfoot[L]{\resumeStyleFooter{#1}}
    \fancyfoot[C]{\resumeStyleFooter{#2}}
    \fancyfoot[R]{\resumeStyleFooter{#3}}
}
