latexbin=latexmk
latexopts=-pdf -outdir=output_ -silent
academic_src_files=$(wildcard academic/*.tex)
coverletter_src_files=$(wildcard cover_letter/*.tex)
data_src_files=$(wildcard data/*.tex)
signature=winnie_the_pooh
cv_storage=~/OneDrive/CV/Uploaded
timestamp=`date +%Y%m%d`

# .ONESHELL requires at least make v3.8 (installed by brew as gmake)
.ONESHELL: 

all : academic letter

.PHONY : all academic letter clean

academic : ${academic_src_files} ${data_src_files}
	cd academic
	${latexbin} ${latexopts} academic_cv.tex
	cp output_/academic_cv.pdf ../${signature}_academic_cv_${timestamp}.pdf
	mkdir -p ${cv_storage}/"${lccompany}"
	cp output_/academic_cv.pdf ${cv_storage}/"${lccompany}"/${signature}_academic_cv_${lccompany}_${lclocation}_${lcjob}_${timestamp}.pdf
	cd ..

letter : ${coverletter_src_files} ${data_src_files}
	cd cover_letter
	${latexbin} ${latexopts} letter.tex
	cp output_/letter.pdf ../${signature}_cover_letter_${timestamp}.pdf
	mkdir -p ${cv_storage}/"${lccompany}"
	cp output_/letter.pdf ${cv_storage}/"${lccompany}"/${signature}_cover_letter_${lccompany}_${lclocation}_${lcjob}_${timestamp}.pdf
	cd ..

list_files : ${academic_src_files} ${coverletter_src_files} ${data_src_files}
	ls -l $?

clean :
	rm -rf academic/output_
	rm academic/*.pdf
	rm -rf cover_letter/output_
	rm cover_letter/*.pdf
	rm *.pdf