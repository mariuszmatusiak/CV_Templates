# CV Templates
# Copyright (C) 2026  Mariusz Matusiak <coffeedrivenengineer@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# SHELL=/bin/bash
SHELL=C:/Program Files/Git/git-bash.exe
# 1. Assign latexbin to your LaTeX executable path
#latexbin=/Library/TeX/texbin/latexmk
latexbin=latexmk
latexopts=-pdf -f -outdir=output_ -cd -interaction=nonstopmode
academic_src_files=$(wildcard academic/*.tex)
industry_src_files=$(wildcard industry/*.tex)
coverletter_src_files=$(wildcard cover_letter/*.tex)
# researchstatement_src_files=$(wildcard research_statement/*.tex)
data_src_files=$(wildcard data/*.tex)
# timestamp=`date +%Y%m%d`
timestamp=
# 2. Provide your signature as a lower case dash-separated string, like firstname_lastname.
signature=winnie_the_pooh
# 3. Provide a path to a directory where you want to have your documents copied.
cv_storage=~/CVs/${company}
# cv_storage=${OneDrive}\CV\Uploaded\${company}
# 4. Provide the company name as a lower case dash-separated string (optional), like: gmake all company=company_name_inc.
ifdef company
company_dashed="_${company}"
endif
# 5. Provide the location as a lower case dash-separated string (optional), like: gmake all location=los_angeles_ca.
ifdef location
location_dashed="_${location}"
endif
# 6. Provide the job name as a lower case dash-separated string (optional), like: gmake all job=senior_sw_engineer.
ifdef job
job_dashed="_${job}"
endif

# .ONESHELL requires at least make v3.8 (installed by brew as gmake)
.ONESHELL:

all : academic industry letter statement

.PHONY : all print_info academic industry letter statement clean

print_info :
	echo CV storage=${cv_storage}
	echo shell=${SHELL}
	mkdir -p "${cv_storage}"

academic : ${academic_src_files} ${data_src_files} print_info
	${latexbin} ${latexopts} academic/academic_cv.tex
	cp academic/output_/academic_cv.pdf ${signature}_academic_cv_${timestamp}.pdf
# 	if [[ ! -d "${cv_storage}" ]]; then mkdir "${cv_storage};" fi
# 	[[ ! -d "${cv_storage}" ]] && mkdir "${cv_storage}"
# 	if not exist "${cv_storage}" mkdir "${cv_storage}"
	cp academic/output_/academic_cv.pdf "${cv_storage}/${signature}_academic_cv${company_dashed}${location_dashed}${job_dashed}_${timestamp}.pdf"

industry : ${industry_src_files} ${data_src_files} print_info
	${latexbin} ${latexopts} industry/resume.tex
	cp industry/output_/resume.pdf ${signature}_resume_${timestamp}.pdf
	cp industry/output_/resume.pdf "${cv_storage}/${signature}_resume${company_dashed}${location_dashed}${job_dashed}_${timestamp}.pdf"

letter : ${coverletter_src_files} ${data_src_files} print_info
	${latexbin} ${latexopts} cover_letter/letter.tex
	cp cover_letter/output_/letter.pdf ${signature}_cover_letter_${timestamp}.pdf
	cp cover_letter/output_/letter.pdf "${cv_storage}/${signature}_cover_letter${company_dashed}${location_dashed}${job_dashed}_${timestamp}.pdf"

statement : ${researchstatement_src_files} ${data_src_files} print_info
	${latexbin} ${latexopts} research_statement/research_statement.tex
	cp research_statement/output_/research_statement.pdf ${signature}_research_statement_${timestamp}.pdf
	cp research_statement/output_/research_statement.pdf "${cv_storage}/${signature}_research_statement${company_dashed}${location_dashed}${job_dashed}_${timestamp}.pdf"

list_files : ${academic_src_files} ${industry_src_files} ${coverletter_src_files} ${data_src_files}
	ls -l $?

clean :
	rm -rf academic/output_
	rm -f  academic/*.pdf
	rm -rf industry/output_
	rm -f  industry/*.pdf
	rm -rf cover_letter/output_
	rm -f  cover_letter/*.pdf
	rm -rf research_statement/output_
	rm -f  research_statement/*.pdf
	rm -f ${signature}_*.pdf

