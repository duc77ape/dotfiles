#!/usr/bin/env perl
#参考: https://konn-san.com/prog/why-not-latexmk.html
$aux_dir = '/tmp/latex/build';
$out_dir = $aux_dir;

$latex = 'uplatex %O -synctex=1 -shell-escape -halt-on-error %S';
$lualatex = 'lualatex %O -synctex=1 -shell-escape -halt-on-error %S && cp %D .';
$xelatex = 'xelatex %O -synctex=1 -shell-escape -halt-on-error %S';
$bibtex = 'upbibtex %O %B';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$xdvipdfmx = 'xdvipdfmx %O -o %D %S && cp %D .';
$makeindex = 'upmendex %O -o %D %S';
$pdflatex = 'pdflatex -synctex=1 -shell-escape -interaction=nonstopmode';
$max_repeat = 5;
$pdf_mode = 3;

