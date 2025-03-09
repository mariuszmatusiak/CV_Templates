# 1. Assign latexbin to your LaTeX executable path
latexbin=latexmk
latexopts=-pdf -outdir=output_ -silent -cd
academic_src_files=$(wildcard academic/*.tex)
industry_src_files=$(wildcard industry/*.tex)
coverletter_src_files=$(wildcard cover_letter/*.tex)
data_src_files=$(wildcard data/*.tex)
timestamp=`date +%Y%m%d`
# 2. Provide your signature as a lower case dash-separated string, like firstname_lastname.
signature=winnie_the_pooh
# 3. Provide a path to a directory where you want to have your documents copied.
cv_storage=CVs
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

all : academic industry letter

.PHONY : all academic industry letter clean

academic : ${academic_src_files} ${data_src_files}
	${latexbin} ${latexopts} academic/academic_cv.tex
	cp academic/output_/academic_cv.pdf ${signature}_academic_cv_${timestamp}.pdf
	mkdir -p ${cv_storage}/"${company}"
	cp academic/output_/academic_cv.pdf ${cv_storage}/"${company}"/${signature}_academic_cv${company_dashed}${location_dashed}${job_dashed}_${timestamp}.pdf

industry : ${industry_src_files} ${data_src_files}
	${latexbin} ${latexopts} industry/resume.tex
	cp industry/output_/resume.pdf ${signature}_resume_${timestamp}.pdf
	mkdir -p ${cv_storage}/"${company}"
	cp industry/output_/resume.pdf ${cv_storage}/"${company}"/${signature}_resume${company_dashed}${location_dashed}${job_dashed}_${timestamp}.pdf

letter : ${coverletter_src_files} ${data_src_files}
	${latexbin} ${latexopts} cover_letter/letter.tex
	cp cover_letter/output_/letter.pdf ${signature}_cover_letter_${timestamp}.pdf
	mkdir -p ${cv_storage}/"${company}"
	cp cover_letter/output_/letter.pdf ${cv_storage}/"${company}"/${signature}_cover_letter${company_dashed}${location_dashed}${job_dashed}_${timestamp}.pdf

list_files : ${academic_src_files} ${industry_src_files} ${coverletter_src_files} ${data_src_files}
	ls -l $?

clean :
	rm -r academic/output_
	rm academic/*.pdf
	rm -r industry/output_
	rm industry/*.pdf
	rm -r cover_letter/output_
	rm cover_letter/*.pdf
	rm *.pdf