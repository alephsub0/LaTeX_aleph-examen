%%
%% This is file `aleph-examen.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% aleph-examen.dtx  (with options: `aleph-examen')
%% 
%% This is a generated file.
%% LaTeX class for typesetting exams
%% 
%% Copyright (C) 2020 by Andres Merino <mat.andresmerino@gmail.com>
%% 
%% Para un mejor uso y entendimiento de la actual clase,
%% consultar la documentación.
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Identificación
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{aleph-examen}[2020/08/15 v1.0]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Inicialización
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Primero definimos una serie de comandos auxiliares para las opciones
\newcommand\@tipo{examen}
\RequirePackage{ifthen}
\newboolean{resp}\setboolean{resp}{false}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Opciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Opciones de tamaño de letra.
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}
%%  Opciones de tamaño de página.
\DeclareOption{a4}{\PassOptionsToPackage{
    a4paper,left=1.5cm,right=1.5cm,top=1cm,bottom=1cm,includefoot}{geometry}
    }
\DeclareOption{a5}{\PassOptionsToPackage{
    a5paper,left=1cm,right=1cm,top=0.5cm,bottom=0.5cm,includefoot}{geometry}
    }
\DeclareOption{compacto}{\PassOptionsToPackage{
    paperwidth=160mm,paperheight=240mm,
    left=1cm,right=1cm,top=0.5cm,bottom=0.5cm,includefoot}{geometry}
    }
%%  Opción para desplegar respuestas
\DeclareOption{respuestas}{\setboolean{resp}{true}}
%%  Opciones predeterminadas son |a4| y |11pt|.
\ExecuteOptions{a4,11pt}
\ProcessOptions\relax
\LoadClass{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Paquetes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Son necesarios los siguientes paquetes para dar formato al documento.
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish, es-noitemize]{babel}
\RequirePackage{enumitem}
\RequirePackage{ifthen}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage{comment}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{calc}
\RequirePackage{array}
\RequirePackage{multido}
\RequirePackage{etex}
\RequirePackage{mathpazo}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{lastpage}
\RequirePackage{titlesec}
\RequirePackage{pgffor,etoolbox}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Variables internas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  La siguiente es la lista de las variables internas utilizadas para el formato.
\newcommand\@universidad{Escuela de Ciencias Físicas y Matemática}
\newcommand\@firma{\hspace{0pt}}
\newcommand\@notapie{\hspace{0pt}}
\newcommand\@longtitulo{0.75\linewidth}
\newcommand\@Npreguntas{5}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Colores predeterminados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Los siguientes son los colores predefinidos de la clase.
\definecolor{colortext}{RGB}{5,1,100}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Definición de comandos de datos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Universidad
\newcommand{\universidad}[1]%
    {\renewcommand\@universidad{#1}}
%%  Hoja
\newcommand{\hoja}[1]%
    {\newcommand\@hoja{#1}}
%%  Materia
\newcommand{\materia}[1]%
    {\newcommand\@materia{#1}}
%%  Autor
\newcommand{\autor}[1]%
    {\newcommand\@autor{#1}}
%%  Examen
\newcommand{\examen}[1]%
    {\newcommand\@examen{#1}}
%%  Carrera
\newcommand{\carrera}[1]%
    {\newcommand\@carrera{ #1}}
%%  Tema
\newcommand{\tema}[1]%
    {\newcommand\@tema{ #1}}
%%  Fecha
\newcommand{\fecha}[1]%
    {\newcommand\@fecha{#1}}
%%  Firma
\newcommand{\notapie}[1]%
    {\renewcommand\@notapie{#1}}
%%  Firma
\newcommand{\firma}[1]%
    {\renewcommand\@firma{#1}}
%%  Logo uno
\newcommand{\logouno}[2][0.1\linewidth]%
    {\newcommand\@logouno{#2}
    \newcommand\@longlogouno{#1}}
%%  Logo dos
\newcommand{\logodos}[2][0.1\linewidth]%
    {\newcommand\@logodos{#2}
    \newcommand\@longlogodos{#1}}
%%  Longitud del título
\newcommand{\longtitulo}[1]%
    {\renewcommand\@longtitulo{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Espaciado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Espacio interlineado
\setlength{\parskip}{0.2\baselineskip}
\renewcommand{\baselinestretch}{1.1}
%%  Espacio entre modo desplegado
\AtBeginDocument{
    \addtolength{\abovedisplayskip}{-1.5mm}
    \addtolength{\belowdisplayskip}{-1.5mm}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Encabezado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Comando para generar el título
\newcommand\@titulo{
    \large\textbf{\textsc{\@universidad\\
    \ifthenelse{\isundefined{\@hoja}}{}{\@hoja\\}
    \normalsize
    \ifthenelse{\isundefined{\@carrera}}{}{\normalsize\textsc{\@carrera}\\}
    \@materia\ \ $\bullet$\ \
    \@examen}}\\
    \ifthenelse{\isundefined{\@tema}}{}{\normalsize\textsc{\@tema}\\}
    }
\newcommand\@inlogouno{
    \parbox{\@longlogouno}
    {\centering
    \ifthenelse{\isundefined{\@logouno}}{\hspace{0pt}}
        {\includegraphics[width=0.95\linewidth]{\@logouno}}}
    }
\newcommand\@inlogodos{
    \parbox{\@longlogodos}
    {\centering
    \ifthenelse{\isundefined{\@logodos}}{\hspace{0pt}}
        {\includegraphics[width=0.95\linewidth]{\@logodos}}}
    }
%%  Comando para generar el encabezado
\newcommand{\encabezado}{
    \hrule
    \vspace{-2mm}
    \begin{center}
    \ifthenelse{\isundefined{\@logodos}}
        {\ifthenelse{\isundefined{\@logouno}}
            {\@titulo}
            {
                \@inlogouno
                \parbox{\@longtitulo}{\centering \@titulo}
            }
        }
        {
            \@inlogouno
            \parbox{\@longtitulo}{\centering \@titulo}
            \@inlogodos
        }
    \end{center}
    \vspace{0mm}
    \noindent
    \@fecha\hspace{\fill}
    \@autor\\[-3mm]
    \noindent
    \hrule
    \ifthenelse{\boolean{resp}}{\color{colortext}}{}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Comando en examen y en respuestas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Para material que solo aparece en examen
\newcommand{\EnExamen}[1]{\ifthenelse{\boolean{resp}}{}{#1}}
%% Para material que solo aparece en respuesta
\newcommand{\EnRespuesta}[1]{\ifthenelse{\boolean{resp}}{#1}{}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Comando para linea de datos del estudiante
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Para estudiantes de Formación Básica
\newcommand{\datosF}{\EnExamen{
    \vspace{5mm}
    \noindent
    Nombres: \hrulefill\
    Grupo CP: \rule{2cm}{0.4pt}\
    Grupo CD: \rule{2cm}{0.4pt}}}
%%  Para estudiantes de Nivelación
\newcommand{\datosN}{\EnExamen{
    \vspace{5mm}
    \noindent
    Nombres: \hrulefill\
    Firma: \rule{3cm}{0.4pt}\\[3mm]
    Profesor: \hrulefill\
    No. Lista: \rule{2cm}{0.4pt}\
    Paralelo: \rule{2cm}{0.4pt}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Preguntas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Ambiente para preguntas
\newenvironment{preguntas}[1][]
    {\begin{enumerate}[leftmargin=*,listparindent=\parindent,#1]}
    {\end{enumerate}}
%%  Al final de las preguntas
\newcommand{\final}{\noindent\hrule\@notapie\hspace{\fill}\@firma}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Indicaciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Ambiente para indicaciones
\newenvironment{indicaciones}
    {\section*{Indicaciones}\begingroup\small
    \begin{itemize}[leftmargin=*,listparindent=\parindent]}
    {\end{itemize}\endgroup}
%%  Comando para indicaciones para la hoja de datos
\newcommand{\indicacionesHD}[1]
    {\newcommand\@indicaciones{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Respuestas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Ambiente para respuestas
\ifthenelse{\boolean{resp}}{
   \newenvironment{respuesta}[1][Solución]
      {\begingroup\color{black}\begin{proof}[#1]\hspace{0pt}\relax}
      {\end{proof}\endgroup}
   }
   {\excludecomment{respuesta}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Respuesta de opción múltiple
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Comando para opción múltiple
\newcommand{\opciones}[4]
    {\vspace{-1mm}
    \begin{enumerate}[leftmargin=*,label=\textit{\alph*)}]
    \item #1 \item #2 \item #3 \item #4
    \end{enumerate}
    }
%%  Comando para opción múltiple en linea
\newcommand{\opcionesl}[4]
    {\par\noindent
    \textit{a)} \ #1 \hfill
    \textit{b)} \ #2 \hfill
    \textit{c)} \ #3 \hfill
    \textit{d)} \ #4
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Puntaje
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Comando para puntaje
\newcommand{\puntaje}[1]{
    \hspace{\fill}{\footnotesize(#1pt)}
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Estilo página
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Encabezado y pie de página
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Estilo secciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Formato secciones
\titleformat{\section}
    {\normalfont\large\bfseries\scshape}{\thesection}{1em}{}
\titlespacing*{\section}{0pt}{2ex}{0.1ex}
%%  Formato subsecciones
\titleformat{\subsection}
    {\normalfontnormalsize\bfseries\scshape}{\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{2ex}{0.1ex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Hoja de datos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Comando de códigos
\newcommand{\Npreguntas}[1]
    {\renewcommand\@Npreguntas{#1}}
\newcommand*\mytablecontentsUpper{}
\newcommand*\mytablecontentsLower{}
%%  Comando de cuadro preguntas
\newcommand{\CuadroPreguntas}[1]{
    \renewcommand*\mytablecontentsUpper{}
    \renewcommand*\mytablecontentsLower{}
    \foreach \X in {1,...,#1}{
        {\xappto\mytablecontentsUpper{ & P-\X}
        \xappto\mytablecontentsLower{ & }
        }
    }
    \begin{tabular}{|c|*{#1}{c|}}\hline
         \mytablecontentsUpper \\
        \hline
        Entrega (sí/no) \mytablecontentsLower \\
        \hline
        No. de hojas \mytablecontentsLower \\
        \hline
    \end{tabular}
    }
%%  Comando de códigos
\newcommand{\codigo}[5]
    {\thispagestyle{empty}
    \encabezado
    \begin{indicaciones}
    \@indicaciones
    \end{indicaciones}
    \noindent \hrule \large
    \begin{center}
        \textbf{\textsc{Datos}}

        Nombre: #1

        Código: #2
        \hspace{1.5cm}
        Grupo CD: #3
        \hspace{1.5cm}
        Grupo CP: #4
    \end{center}
    \noindent \hrule
    \begin{center}
        \textbf{\textsc{Preguntas entregadas}}

        \CuadroPreguntas{\@Npreguntas}

        \vspace{2.5cm}
        \begin{tabular}{p{5cm}}
             \hline\centering Firma
        \end{tabular}
    \end{center}
    \newpage
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Hoja de respuestas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Comando para cuadro
\newcommand{\cuadro}[1][Aj]
    {\fbox{\textcolor{white}{\LARGE #1}}}
%%  Comando de hoja de respuesta
\newcommand{\HojaRespuesta}[1][]
    {
    \thispagestyle{empty}
    \hrule
    \vspace{-2mm}
    \begin{center}
    \large\textbf{\textsc{Hoja de respuestas}}
    \end{center}

    \vspace{-2mm}
    \noindent
    Código: \cuadro\cuadro\cuadro\cuadro\hspace{\fill}
    Número de pregunta: \cuadro\hspace{\fill}
    Hoja (de esta pregunta): \cuadro\ de \cuadro%
    \ifthenelse{\equal{#1}{}}{\\}
        {\\[2mm] #1\\}
    \noindent \hrule
    }
%%  Y ¡se acabó!
\endinput
%%
%% End of file `aleph-examen.cls'.
