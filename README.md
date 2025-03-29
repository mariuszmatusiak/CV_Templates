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

You are free to add your own folder with another LaTeX template. Using commands defined in `data/*.tex` files shall speed-up filling up the new document.

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

### v1.0.1 [2025-03-09]
- Updated Makefile with additional optional arguments.
### v0.3.0 [2025-03-06]
- Added support for industry resume. 
### v0.2.0 [2025-02-28]
- Added support for cover letter. 
### v0.1.0 [2025-02-27]
- Added support for academic CV. 

## Acknowledgments

Icons provided by: "Font Awesome by Dave Gandy - http://fontawesome.io" and ported to a [LaTeX package](https://ctan.org/pkg/fontawesome5) by Marcel Krueger. Kudos to [Font Awesome Team](https://github.com/orgs/FortAwesome/people).

## License

CV Templates
Copyright (C) 2025  Mariusz Matusiak <mariusz.m.matusiak@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.