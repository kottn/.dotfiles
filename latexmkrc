#!/usr/bin/env perl
#$latex = 'uplatex %O -synctex=1 -interaction=nonstopmode %S';
#$pdflatex = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
#$bibtex = 'upbibtex %O %B';
$latex = 'platex ';
$pdflatex = 'platex ';
$bibtex = 'pbibtex %O %B';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$makeindex = 'upmendex %O -o %D %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf %O %S %D';
$pdf_mode = 3;
$pdf_update_method = 2;

if (-f '/mnt/c/Program Files/SumatraPDF/SumatraPDF.exe') {
  # WSL
  $pdf_previewer = '"/mnt/c/Program Files/SumatraPDF/SumatraPDF.exe" -reuse-instance';
} elsif (-f '/mnt/c/Program Files (x86)/SumatraPDF/SumatraPDF.exe') {
  # WSL
  $pdf_previewer = '"/mnt/c/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance';
} else {
  # Linux
  $pdf_previewer = 'mupdf';
}
