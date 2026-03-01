## set properties ####################
CUR_DIR="$PWD"
DST_DIR="$PWD/build"
SRC_NAM="main"

## exit immediately on error ##########
set -e

## error handler ######################
function on_error () {
	echo ""
	echo "===== BUILD FAILED ====="
	echo "An error occurred at step: $BASH_COMMAND"
	if [ -f "$SRC_NAM.log" ]; then
		echo ""
		echo "--- LaTeX error log (last 30 lines) ---"
		tail -n 30 "$SRC_NAM.log"
		echo "---------------------------------------"
	fi
	exit 1
}
trap 'on_error' ERR

## create a build directory ##########
echo "CUR_DIR=$CUR_DIR"
echo "DST_DIR=$DST_DIR"
if [ ! -d $DST_DIR ]; then
	mkdir $DST_DIR
	echo "$DST_DIR created"
else
	echo "$DST_DIR exists"
fi

## generate a pdf file ###############
function gen_pdf () {

	# build latex
	platex $2.tex
	bibtex $2.aux
	platex $2.tex
	platex $2.tex

	# embed fonts
	dvipdfmx -f $2.map $2.dvi
	pdffonts $2.pdf

	# compress PDF
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$2_min.pdf $2.pdf

	# move pdf files to the destination directory
	mv $2.pdf $1/$2.pdf
	mv $2_min.pdf $1/$2_min.pdf

	# remove intermediate files
	rm $2.aux
	rm $2.bbl
	rm $2.blg
	rm $2.dvi
	rm $2.out
	rm $2.log
	rm $2.toc
	rm $2.aux
	rm $2.ps
}

## generate pdf files ###############
gen_pdf $DST_DIR $SRC_NAM