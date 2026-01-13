module = "nkthesis"

typesetexe = "xelatex"
unpackexe = "xelatex"
makeindexexe = "zhmakeindex"

typesetopts = "-shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1"

docfiles = {
  "frontmatter",
  "mainmatter",
  "backmatter",
  "nkthesis-sample.bib",
  "nkthesis-sample.tex",
}
typesetfiles = {
  "nkthesis.dtx",
  "nkthesis-sample.tex",
}

checkengines = {
  "xetex",
}
checkruns = 3
