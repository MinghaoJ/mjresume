mjresume
========
Custom resume class for LuaLaTeX by Minghao Ji.
NOTE: This class must be compiled using LuaLaTeX, which is included in most TeX distributions.

Overview
--------
Include mjresume.cls in the same directory as any
.tex file, then write
	
	\documentclass[<options>]{mjresume}
	
to use.

Available options are:

* `sidebar` - moves the header to a vertical column on the left and adds the
	`\begin{side}...\end{side}` environment to add additional content (must
    immediately preceed `\begin{main}`
* `10pt`, `11pt`, `12pt` - change normal font size (default is `11pt`)
* `letterpaper`, `a4paper` - change paper size (default may depend on your TeX distribution)

The main body of the resume should be wrapped in a `\begin{main}...\end{main}`
environment.

Commands
--------

    \name{...}
    \title{...}
    \contactinfo{...}
    
Defines the fields used to create the resume header. `\contactinfo` should include line breaks as necessary.

    \begin{side}...\end{side}
    
Requires the `sidebar` option be enabled. Contents are typeset in the left column underneath the header.

    \begin{main}...\end{main}
    
All main body content must be typed in this environment. If `sidebar` is used, `\begin{main}` must be on the first line after `\end{side}`.

    \section{name}

Creates a new section.

    \entry{name/employer}{position}{date(s)}

Creates a formatted entry that can be used for experience, projects, or
education. Any argument may be left blank, and the formatting will
automatically update.

    \begin{bullets}
        \item content
        ...
    \end{bullets}

Use instead of `\itemize` to ensure proper spacing.
