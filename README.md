# Templates for industry resumes, academic CVs and cover letters.

To be used for creating resumes, academic CVs and cover letters (so-called ATS-friendly) with sharing and updating the same data among all the documents.

Copyright (c) 2025 Mariusz Matusiak <mariusz.m.matusiak@gmail.com>

I'm a coffee-driven being who combines the power of neurons and caffeine in order to develop new technologies and solutions.
If you like my work, you can support its future by sending me an [espresso injection](https://paypal.me/MMatk).

## Content

- `academic/` - a directory with a root academic_cv.tex file including smaller section-specific .tex files to create an academic CV,
- `industry/` - a directory with a root resume.tex file including smaller section-specific .tex files to create an industry resume,
- `cover_letter/` - a directory with a root letter.tex file including smaller section-specific .tex files to create a cover letter,
- `data/` - a directory with section-specific .tex files containing common shared data of an Applicant, including:
    - `bibliography/` - a directory with BibLaTeX bibliography files,
    - `img/` - a directory to store Applicant's photos (optional, check hiring preferences in your field and location)
- `.vscode/` - a directory with handy VS Code configuration files.

## Prerequisites

- installed LaTeX distribution
- shell terminal with the GNU MAKE >= v3.8 support

## Setup

1. Edit Makefile and provide:
    - a path to your LaTeX executable -> `latexbin`
    - your signature (recommended lowercase) -> `signature`
    - a path where your output files shall be moved -> `cv_storage`
2. Edit content of the `data/` directory files.
3. Run:
```shell
make (all)
```
to create all documents at once.

4. Run:
```shell
make academic
``` 
to create the academic CV (long).

4. Run:
```shell
make industry
``` 
to create the industry resume (short).

5. Run:
```shell
make letter
``` 
to create the cover letter.

6. Run:
```shell
make clean
```
to delete all generated files and output_/ directories.

## Changelog

### v0.3.0 [2025-03-06]
- Added support for industry resume. 
### v0.2.0 [2025-02-28]
- Added support for cover letter. 
### v0.1.0 [2025-02-27]
- Added support for academic CV. 

## Acknowledgments

Icons provided by: "Font Awesome by Dave Gandy - http://fontawesome.io" and ported to a [LaTeX package](https://ctan.org/pkg/fontawesome5) by Marcel Krueger. Kudos to [Font Awesome Team](https://github.com/orgs/FortAwesome/people).