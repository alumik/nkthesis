$pdf_mode = 5;

$xelatex = "xelatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";
$makeindex = "zhmakeindex -s gind.ist %O -o %D %S";

$bibtex_use = 1.5;

$clean_ext = "hd";

add_cus_dep('glo', 'gls', 0, 'glo2gls');
sub glo2gls {
    system("zhmakeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
push @generated_exts, 'glo', 'gls';
