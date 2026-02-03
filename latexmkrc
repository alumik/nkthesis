$pdf_mode = 5;

$xelatex = "xelatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";

# 使用 biber 作为 biblatex 的后端处理器
# 1.5 表示：当 .bib 文件存在时使用 biber，且在检测到引用更新时自动重新运行
$bibtex_use = 1.5;
