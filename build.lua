module = "nkthesis"

typesetexe = "xelatex"
typesetopts = "-shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1"

function typeset_special(name, path)
  local errorlevel = 0
  errorlevel = run(path, "zhmakeindex -s gind.ist " .. name .. ".idx")
  if errorlevel ~= 0 then return errorlevel end
  errorlevel = run(path, "zhmakeindex -s gglo.ist -o " .. name .. ".gls " .. name .. ".glo")
  return errorlevel
end

cleanfiles = {"*.hd", "*.glo", "*.gls", "*.idx", "*.ind", "*.ilg"}

typesetcmds = typesetcmds or "" 

sourcefiles = {"nkthesis.dtx", "nkthesis.ins"}

unpackfiles = {"nkthesis.ins"}

docfiles = {
  "frontmatter",
  "mainmatter",
  "backmatter",
  "nkthesis-sample.bib",
  "nkthesis-sample.tex",
}

typesetfiles = {"nkthesis.dtx", "nkthesis-sample.tex"}

biberexe = "biber"

checkengines = { "xetex" }
