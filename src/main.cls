%-------------------------
% LaTeX Resume
% Author : Gabriel Ong
% Website: https://www.overleaf.com/project
% License : MIT
%------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{main}[2023/01/11 v0.2 Resume class]

\LoadClass[11pt,letterpaper]{article} 

\usepackage[left=0.5in,top=0.4in,right=0.5in,bottom=0.4in]{geometry} 
\usepackage[parfill]{parskip} 

\usepackage{etoolbox}
\usepackage{keycommand}
\usepackage{xstring}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

\usepackage[scaled]{helvet} 
\renewcommand\familydefault{\sfdefault} 
\usepackage[T1]{fontenc} 
\pagestyle{empty}

% ------------ Utilities ------------

\def \separator {
    \textbf{\Large\textbullet}
}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}%
\newcommand{\profilelink}[1]{\href{https://#1}{#1}}%

\newcommand{\isA}[1]{
    \expandafter\ifstrequal\expandafter{#1}{default}{}{a}
}

\newcommand\sectionTitle[1]{%
    \begingroup
        \textbf{\MakeUppercase{#1}}
        \vspace{0.4em}
        \hrule
        \vspace{-0.3em}
    \endgroup
}%

% ------------- Header --------------

\newcommand\printNameDesc[6]{%
    \begingroup
        \begin{minipage}[t]{0.6\textwidth} 
            {\raggedright\huge\bfseries #1\par} 
            \vspace{0.3em} 
            {\raggedright\normalsize \href{https://#3}{#3}\par}
            \vspace{0.3em} 
            {\raggedright #2\par} 
        \end{minipage}%
        \begin{minipage}[t]{0.4\textwidth} 
            \raggedleft 
            #4 \par
            \href{mailto:#5}{#5} \par
            \href{https://#6}{#6}
        \end{minipage}
        \vspace{0.5em}
    \endgroup
}

\newkeycommand{\introduction}[
    fullname,
    description,
    website,
    email,
    phone,
    github
]{%
    \printNameDesc{\commandkey{fullname}}{\commandkey{description}}{\commandkey{website}}{\commandkey{phone}}{\commandkey{email}}{\commandkey{github}}
}

% ------------ Education ------------

\newenvironment{educationSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\educationItem}[
    school,
    program,
    period,
    grade
]{%
    \textbf{\commandkey{school}} \hfill \commandkey{period} \\ 
    \commandkey{program} \hfill \raggedleft\commandkey{grade} %
}

% -------------- Skills --------------

\newenvironment{skillsSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\skillItem}[
    category,
    skills
]{%
    {%
        \bf \commandkey{category}:
    } {%
        \commandkey{skills}%
    }
}%

% -------------- Experience -------------

\newenvironment{experienceSection}[1]{%
    \sectionTitle{#1}%
    \begin{list}{}{ % List for each highlight in the section
        \setlength{\leftmargin}{0em} % Margin within the section
    }%
        \item[]%
    }{%
    \end{list}%
}%

\newkeycommand{\experienceItem}[
    company,
    position,
    location,
    duration
]{%
    \textbf{%
        \commandkey{company},
        \commandkey{location}:
        \it{\commandkey{position}}
    } \hfill {%
        \commandkey{duration}%
    }
    \vspace{-0.5em}%
}%

% ----------------- Project -------------

\newenvironment{projectSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\projectItem}[
    name,
    summary
]{%
    {%
        \bf \commandkey{name}:
    } {%
        \commandkey{summary}%
    }
}%

% ----------------- Awards -------------

\newenvironment{awardSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\awardItem}[
    name,
    organisation,
    period,
]{%
    \textbf{\commandkey{name}} \hfill \commandkey{period} \\ 
    \commandkey{organisation}%
}

% ----------------- Competitions -------------

\newenvironment{competitionSection}[1]{%
    \sectionTitle{#1}%
}%

\newkeycommand{\competitionItem}[
    name,
    organisation,
    period,
]{%
    \textbf{\commandkey{name}} \hfill \commandkey{period} \\ 
    \commandkey{organisation}%
}

% ----------------------------------------
