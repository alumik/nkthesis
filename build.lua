module = "nkthesis"

sourcefiledir = "source"
docfiledir = "doc"
supportdir = sourcefiledir

unpackexe = "xelatex"
typesetexe = "xelatex"
makeindexexe = "upmendex"

unpackfiles = { "nkthesis.ins" }
sourcefiles = {
  "nkthesis.dtx",
  "nkthesis-logo.dtx",
  "nkthesis.ins",
  "nkthesis.ist",
}
installfiles = { "*.cls" }
makeindexfiles = { "nkthesis.ist" }
typesetfiles = { "nkthesis.dtx" }

-- l3build copies entries in typesetdemofiles directly to build/doc/, which
-- loses the demo/ working directory needed by the \input commands.  Typeset
-- the preserved tree explicitly, then publish the resulting PDF to doc/demo/.
function typeset_demo_tasks()
  local errorlevel = typeset("demo.tex", typesetdir .. "/demo")
  if errorlevel ~= 0 then
    return errorlevel
  end
  return cp("demo.pdf", typesetdir .. "/demo", docfiledir .. "/demo")
end


docfiles = { "demo" }
demofiles = { "demo" }

-- gind.ist supplies docstrip's conventional index layout; nkthesis.ist adds
-- the Chinese collation and heading settings required by this documentation.
makeindexopts = "-s gind.ist"
indexstyle = "nkthesis.ist"
typesetopts = "-shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1"

-- Produce nkthesis.tds.zip alongside the CTAN archive.
packtdszip = true
