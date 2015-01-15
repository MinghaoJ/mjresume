mjresume
========

Custom resume class for LaTeX. Include mjresume.cls in the same directory as any .tex file to use.

Commands
--------

    \section{name}

Creates a new section.

    \entry{name/employer}{position}{date(s)}{
        \item content
        ...
    }

Creates a formatted entry that can be used for experience, projects, or education. The second argument may be left blank, and the formatting will automatically take this into account.

    \bullets{
        \item content
        ...
    }

Use this command instead of the \itemize environment to ensure proper spacing.
