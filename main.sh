## set properties ####################
CUR_DIR="$PWD"
DST_DIR="$PWD/build"
SRC_NAM="main"

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
	# フォントマップをHaranoAji Extraに固定
    kanji-config-updmap-sys haranoaji-extra

	# build latex
	platex $2.tex
	bibtex $2.aux
	platex $2.tex
	platex $2.tex
	%dvipdfmx main.dvi

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