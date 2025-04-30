$pdf_mode = 5;

$xelatex = "xelatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";
$makeindex = "zhmakeindex -s gind.ist %O -o %D %S";

$bibtex_use = 1.5;

$clean_ext = "glo gls hd";
